from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import (
    User, Supplier, Warehouse, StorageLocation, ProductCategory,
    Product, Inventory, Order, OrderItem, AuditLog
)

@admin.register(User)
class CustomUserAdmin(UserAdmin):
    fieldsets = UserAdmin.fieldsets + (
        ('WMS 角色与信息', {'fields': ('role', 'real_name')}),
    )
    list_display = ('username', 'real_name', 'role', 'email', 'is_staff')

@admin.register(Supplier)
class SupplierAdmin(admin.ModelAdmin):
    list_display = ('name', 'contact_name', 'phone', 'create_time')
    search_fields = ('name', 'contact_name')

@admin.register(Warehouse)
class WarehouseAdmin(admin.ModelAdmin):
    list_display = ('name', 'location')

@admin.register(StorageLocation)
class StorageLocationAdmin(admin.ModelAdmin):
    list_display = ('code', 'warehouse', 'description')
    list_filter = ('warehouse',)

@admin.register(ProductCategory)
class ProductCategoryAdmin(admin.ModelAdmin):
    list_display = ('name', 'description')

@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ('code', 'name', 'category', 'supplier', 'min_stock', 'max_stock', 'price')
    list_filter = ('category', 'supplier')
    search_fields = ('code', 'name')

@admin.register(Inventory)
class InventoryAdmin(admin.ModelAdmin):
    list_display = ('product', 'storage_location', 'quantity', 'last_update')
    list_filter = ('storage_location__warehouse', 'product__category')
    search_fields = ('product__name', 'storage_location__code')

class OrderItemInline(admin.TabularInline):
    model = OrderItem
    extra = 1

@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    list_display = ('order_no', 'order_type', 'status', 'operator', 'create_time')
    list_filter = ('order_type', 'status')
    inlines = [OrderItemInline]

@admin.register(AuditLog)
class AuditLogAdmin(admin.ModelAdmin):
    list_display = ('user', 'module', 'action', 'ip_address', 'create_time')
    list_filter = ('module', 'create_time')