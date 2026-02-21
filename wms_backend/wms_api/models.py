from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils import timezone

class User(AbstractUser):
    """
    自定义用户模型，继承 Django 自带的用户体系，外加角色区分
    """
    ROLE_CHOICES = (
        ('admin', '系统管理员'),
        ('supervisor', '仓库主管'),
        ('operator', '普通操作员'),
    )

    role = models.CharField(max_length=20, choices=ROLE_CHOICES, default='operator', verbose_name='系统角色')
    real_name = models.CharField(max_length=50, blank=True, null=True, verbose_name='真实姓名')

    class Meta:
        db_table = 'wms_user'
        verbose_name = '系统用户'
        verbose_name_plural = verbose_name

    def __str__(self):
        return f"{self.username} ({self.get_role_display()})"


class Supplier(models.Model):
    """供应商档案"""
    name = models.CharField(max_length=100, unique=True, verbose_name='供应商名称')
    contact_name = models.CharField(max_length=50, blank=True, null=True, verbose_name='联系人')
    phone = models.CharField(max_length=20, blank=True, null=True, verbose_name='联系电话')
    address = models.CharField(max_length=200, blank=True, null=True, verbose_name='地址')
    create_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')

    class Meta:
        db_table = 'wms_supplier'
        verbose_name = '供应商'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class Warehouse(models.Model):
    """仓库档案"""
    name = models.CharField(max_length=100, unique=True, verbose_name='仓库名称')
    location = models.CharField(max_length=200, blank=True, null=True, verbose_name='仓库位置')

    class Meta:
        db_table = 'wms_warehouse'
        verbose_name = '仓库'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class StorageLocation(models.Model):
    """储位信息"""
    warehouse = models.ForeignKey(Warehouse, on_delete=models.CASCADE, related_name='locations', verbose_name='所属仓库')
    code = models.CharField(max_length=50, unique=True, verbose_name='储位编码')
    description = models.CharField(max_length=100, blank=True, null=True, verbose_name='储位描述')

    class Meta:
        db_table = 'wms_storage_location'
        verbose_name = '储位'
        verbose_name_plural = verbose_name

    def __str__(self):
        return f"{self.warehouse.name} - {self.code}"


class ProductCategory(models.Model):
    """商品分类"""
    name = models.CharField(max_length=50, unique=True, verbose_name='分类名称')
    description = models.CharField(max_length=200, blank=True, null=True, verbose_name='分类描述')

    class Meta:
        db_table = 'wms_category'
        verbose_name = '商品分类'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class Product(models.Model):
    """商品基础档案与预警"""
    code = models.CharField(max_length=50, unique=True, verbose_name='商品编码')
    name = models.CharField(max_length=100, verbose_name='商品名称')
    category = models.ForeignKey(ProductCategory, on_delete=models.SET_NULL, null=True, verbose_name='商品分类')
    supplier = models.ForeignKey(Supplier, on_delete=models.SET_NULL, null=True, verbose_name='默认供应商')
    unit = models.CharField(max_length=20, default='个', verbose_name='计量单位')
    min_stock = models.IntegerField(default=10, verbose_name='预警下限')
    max_stock = models.IntegerField(default=1000, verbose_name='预警上限')
    price = models.DecimalField(max_digits=10, decimal_places=2, default=0.00, verbose_name='单价')

    class Meta:
        db_table = 'wms_product'
        verbose_name = '商品'
        verbose_name_plural = verbose_name

    def __str__(self):
        return f"[{self.code}] {self.name}"


class Inventory(models.Model):
    """全局库存表"""
    product = models.ForeignKey(Product, on_delete=models.CASCADE, verbose_name='商品')
    storage_location = models.ForeignKey(StorageLocation, on_delete=models.CASCADE, verbose_name='储位')
    quantity = models.IntegerField(default=0, verbose_name='库存数量')
    last_update = models.DateTimeField(auto_now=True, verbose_name='最后更新时间')

    class Meta:
        db_table = 'wms_inventory'
        verbose_name = '库存'
        verbose_name_plural = verbose_name
        unique_together = ('product', 'storage_location') # 同一个储位的同一种商品只能有一条库存记录

    def __str__(self):
        return f"{self.product.name} @ {self.storage_location.code}: {self.quantity}"


class Order(models.Model):
    """出入库单据主表"""
    ORDER_TYPES = (
        ('in', '入库单'),
        ('out', '出库单'),
    )
    STATUS_CHOICES = (
        ('pending', '待处理'),
        ('completed', '已完成'),
        ('cancelled', '已取消'),
    )
    order_no = models.CharField(max_length=50, unique=True, verbose_name='单据编号')
    order_type = models.CharField(max_length=10, choices=ORDER_TYPES, verbose_name='单据类型')
    operator = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, verbose_name='操作员')
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='pending', verbose_name='状态')
    remark = models.CharField(max_length=255, blank=True, null=True, verbose_name='备注')
    create_time = models.DateTimeField(default=timezone.now, verbose_name='创建时间')
    finish_time = models.DateTimeField(blank=True, null=True, verbose_name='完成时间')

    class Meta:
        db_table = 'wms_order'
        verbose_name = '出入库单据'
        verbose_name_plural = verbose_name

    def __str__(self):
        return f"{self.get_order_type_display()} - {self.order_no}"


class OrderItem(models.Model):
    """单据明细表"""
    order = models.ForeignKey(Order, on_delete=models.CASCADE, related_name='items', verbose_name='所属单据')
    product = models.ForeignKey(Product, on_delete=models.CASCADE, verbose_name='商品')
    storage_location = models.ForeignKey(StorageLocation, on_delete=models.CASCADE, verbose_name='目标/源储位')
    quantity = models.IntegerField(verbose_name='数量')

    class Meta:
        db_table = 'wms_order_item'
        verbose_name = '单据明细'
        verbose_name_plural = verbose_name

    def __str__(self):
        return f"{self.order.order_no} - {self.product.name} x {self.quantity}"


class AuditLog(models.Model):
    """系统安全审计日志"""
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, verbose_name='操作人')
    action = models.CharField(max_length=100, verbose_name='操作动作')
    module = models.CharField(max_length=50, verbose_name='操作模块')
    ip_address = models.GenericIPAddressField(blank=True, null=True, verbose_name='IP地址')
    create_time = models.DateTimeField(auto_now_add=True, verbose_name='操作时间')

    class Meta:
        db_table = 'wms_audit_log'
        verbose_name = '审计日志'
        verbose_name_plural = verbose_name

    def __str__(self):
        return f"{self.user} - {self.action} at {self.create_time}"