# 🚀 Desafio Teste API

Este projeto é uma aplicação full-stack que utiliza Django no backend e um frontend moderno (Vue) servido via Nginx. Tudo é containerizado com Docker para fácil execução.

## Documentação no Postman

Acesse a documentação completa da API através do link abaixo:

[Visualizar Documentação no Postman](https://documenter.getpostman.com/view/29574069/2sB2cPkRRj)

## 📋 Pré-requisitos

- Docker (v20.10+)
- Docker Compose (v2.0+)

## 🛠️ Como Executar

### Passo 1: Execute os containers
```bash
docker-compose up --build
```

### Passo 2: O que acontece? ✨
O comando irá:
1. 🏗️ Construir imagens Docker para todos os serviços
2. 🐋 Iniciar 3 containers:
   - **PostgreSQL 15** (Banco de dados relacional)
   - **Django REST API** (Disponível na porta 8000)
   - **Vue.js + Nginx** (Interface web na porta 80)
3. 📦 Executar automaticamente:
   - Migrações de banco de dados
   - Importação de dados do arquivo `Relatorio_cadop.csv`

---

## 🌐 Endpoints Principais

| Serviço       | URL                              | Método | Descrição                     |
|---------------|----------------------------------|--------|-------------------------------|
| Listagem      | /api/operadoras/                 | GET    | Lista todas operadoras        |
| Filtro        | /api/operadoras/?search={termo}  | GET    | Busca por CNPJ ou razão social|
| Admin Django  | /admin/                          | -      | Painel administrativo         |
