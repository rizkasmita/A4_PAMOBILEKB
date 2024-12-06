from django.urls import path
from . import views

urlpatterns = [
    # path('predict/', views.predict_image_view, name='predict_image'),
    path('predict-image/', views.predict_image_view, name='predict_image'),
    path('get-csrf-token/', views.get_csrf_token, name='get_csrf'),
    path('serve-image/<str:filename>/', views.serve_image, name='serve_image'),
]
