from rest_framework import serializers
from .models import Supplier, Warehouse, StorageLocation, ProductCategory, Product


class SupplierSerializer(serializers.ModelSerializer):
    class Meta:
        model = Supplier
        fields = '__all__'


class WarehouseSerializer(serializers.ModelSerializer):
    class Meta:
        model = Warehouse
        fields = '__all__'


class StorageLocationSerializer(serializers.ModelSerializer):
    # read_only=True 表示这个字段只在返回给前端时展示，前端提交时不要求传这个字段
    warehouse_name = serializers.CharField(source='warehouse.name', read_only=True)

    class Meta:
        model = StorageLocation
        fields = '__all__'


class ProductCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = ProductCategory
        fields = '__all__'


class ProductSerializer(serializers.ModelSerializer):
    category_name = serializers.CharField(source='category.name', read_only=True)
    supplier_name = serializers.CharField(source='supplier.name', read_only=True)

    class Meta:
        model = Product
        fields = '__all__'