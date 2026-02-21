from django.contrib import admin
from django.urls import path, include
from wms_api.views import LoginView

urlpatterns = [
    path('admin/', admin.site.urls),  # Django自带的后台管理
    path('api/login/', LoginView.as_view(), name='login'),  # 真实登录接口

    # 将 wms_api 里的业务路由引入，统一加上 api/ 前缀
    path('api/', include('wms_api.urls')),
]