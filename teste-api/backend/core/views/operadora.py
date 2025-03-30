from rest_framework import viewsets, filters
from core.models import Operadora
from core.serializers import OperadoraSerializer

class OperadoraViewSet(viewsets.ModelViewSet):
    queryset = Operadora.objects.all()
    serializer_class = OperadoraSerializer
    filter_backends = [filters.SearchFilter]
    search_fields = ['razao_social', 'nome_fantasia', 'CNPJ', 'modalidade']
