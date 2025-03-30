import csv
from django.core.management.base import BaseCommand, CommandError
from core.models import Operadora 
from datetime import datetime

class Command(BaseCommand):
    help = 'Importa dados de um arquivo CSV para a tabela Operadoras'

    def add_arguments(self, parser):
        parser.add_argument('csv_file', type=str, help='Caminho para o arquivo CSV')

    def handle(self, *args, **kwargs):
        csv_file = kwargs['csv_file']

        try:
            with open(csv_file, newline='', encoding='utf-8-sig') as file:
                reader = csv.DictReader(file, delimiter=';')
                count = 0
                for row in reader:
                    # Conversão do campo Data_Registro_ANS para data
                    data_registro = row.get('Data_Registro_ANS')
                    if data_registro:
                        try:
                            data_registro = datetime.strptime(data_registro, '%Y-%m-%d').date()
                        except ValueError:
                            data_registro = None
                    else:
                        data_registro = None

                    # Conversão do campo Regiao_de_Comercializacao para inteiro ou None
                    regiao = row.get('Regiao_de_Comercializacao', None)
                    if regiao == '' or regiao is None:
                        regiao = None
                    else:
                        try:
                            regiao = int(regiao)
                        except ValueError:
                            regiao = None

                    obj, created = Operadora.objects.update_or_create(
                        registro_ans=row['Registro_ANS'],
                        defaults={
                            'cnpj': row['CNPJ'],
                            'razao_social': row['Razao_Social'],
                            'nome_fantasia': row.get('Nome_Fantasia', ''),
                            'modalidade': row.get('Modalidade', ''),
                            'logradouro': row.get('Logradouro', ''),
                            'numero': row.get('Numero', ''),
                            'complemento': row.get('Complemento', ''),
                            'bairro': row.get('Bairro', ''),
                            'cidade': row.get('Cidade', ''),
                            'uf': row.get('UF', ''),
                            'cep': row.get('CEP', ''),
                            'ddd': row.get('DDD', ''),
                            'telefone': row.get('Telefone', ''),
                            'fax': row.get('Fax', ''),
                            'endereco_eletronico': row.get('Endereco_eletronico', ''),
                            'representante': row.get('Representante', ''),
                            'cargo_representante': row.get('Cargo_Representante', ''),
                            'regiao_de_comercializacao': regiao,
                            'data_registro_ans': data_registro,
                        }
                    )
                    count += 1
                self.stdout.write(self.style.SUCCESS(f'{count} registros importados com sucesso!'))
        except FileNotFoundError:
            raise CommandError(f'Arquivo "{csv_file}" não encontrado.')
