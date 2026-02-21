from rest_framework_simplejwt.views import TokenObtainPairView
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated
from .models import Supplier, Warehouse, StorageLocation, ProductCategory, Product
from .serializers import (
    SupplierSerializer, WarehouseSerializer, StorageLocationSerializer,
    ProductCategorySerializer, ProductSerializer
)

class CustomTokenObtainPairSerializer(TokenObtainPairSerializer):
    def validate(self, attrs):
        data = super().validate(attrs)
        data['username'] = self.user.username
        data['role'] = self.user.role
        return data

class LoginView(TokenObtainPairView):
    serializer_class = CustomTokenObtainPairSerializer

# ================= 基础档案管理 API 视图集 =================

class SupplierViewSet(viewsets.ModelViewSet):
    """供应商 CRUD 接口"""
    queryset = Supplier.objects.all().order_by('-create_time')
    serializer_class = SupplierSerializer
    permission_classes = [IsAuthenticated] # 必须登录带 Token 才能访问

class WarehouseViewSet(viewsets.ModelViewSet):
    """仓库 CRUD 接口"""
    queryset = Warehouse.objects.all()
    serializer_class = WarehouseSerializer
    permission_classes = [IsAuthenticated]

class StorageLocationViewSet(viewsets.ModelViewSet):
    """储位 CRUD 接口"""
    queryset = StorageLocation.objects.all()
    serializer_class = StorageLocationSerializer
    permission_classes = [IsAuthenticated]

class ProductCategoryViewSet(viewsets.ModelViewSet):
    """商品分类 CRUD 接口"""
    queryset = ProductCategory.objects.all()
    serializer_class = ProductCategorySerializer
    permission_classes = [IsAuthenticated]

class ProductViewSet(viewsets.ModelViewSet):
    """商品基础档案 CRUD 接口"""
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
    permission_classes = [IsAuthenticated]