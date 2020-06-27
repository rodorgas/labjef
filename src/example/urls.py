from django.urls import path
from .views import index, query1, query2, sofisticado


urlpatterns = [
    path('', index, name='index'),
    path('query1', query1, name='query1'),
    path('query2', query2, name='query2'),
]
