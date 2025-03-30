from django.db import models

class Operadora(models.Model):
    registro_ans = models.IntegerField(primary_key=True)
    cnpj = models.CharField(max_length=20, unique=True, null=False)
    razao_social = models.CharField(max_length=255, null=False)
    nome_fantasia = models.CharField(max_length=255, blank=True, null=True)
    modalidade = models.CharField(max_length=100, blank=True, null=True)
    logradouro = models.CharField(max_length=255, blank=True, null=True)
    numero = models.CharField(max_length=255, blank=True, null=True)
    complemento = models.CharField(max_length=255, blank=True, null=True)
    bairro = models.CharField(max_length=100, blank=True, null=True)
    cidade = models.CharField(max_length=100, blank=True, null=True)
    uf = models.CharField(max_length=2, blank=True, null=True)
    cep = models.CharField(max_length=10, blank=True, null=True)
    ddd = models.CharField(max_length=5, blank=True, null=True)
    telefone = models.CharField(max_length=200, blank=True, null=True)
    fax = models.CharField(max_length=200, blank=True, null=True)
    endereco_eletronico = models.CharField(max_length=255, blank=True, null=True)
    representante = models.CharField(max_length=255, blank=True, null=True)
    cargo_representante = models.CharField(max_length=100, blank=True, null=True)
    regiao_de_comercializacao = models.IntegerField(blank=True, null=True)
    data_registro_ans = models.DateField(blank=True, null=True)

    def __str__(self):
        return f"{self.razao_social} ({self.cnpj})"
