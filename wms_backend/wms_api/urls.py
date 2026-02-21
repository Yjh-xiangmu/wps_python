from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import (
    SupplierViewSet, WarehouseViewSet, StorageLocationViewSet,
    ProductCategoryViewSet, ProductViewSet
)

# 使用 DRF 的默认路由器，它会自动为 ModelViewSet 生成标准的 RESTful 路由
router = DefaultRouter()
router.register(r'suppliers', SupplierViewSet)
router.register(r'warehouses', WarehouseViewSet)
router.register(r'locations', StorageLocationViewSet)
router.register(r'categories', ProductCategoryViewSet)
router.register(r'products', ProductViewSet)

urlpatterns = [
    # 将 router 自动生成的 URL 包含进来
    path('', include(router.urls)),
]