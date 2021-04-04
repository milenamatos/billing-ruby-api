# Billing API com Ruby On Rails

## Dependências de sistema
  - Ruby (>= 2.7.0)
  - Rails
  - PostgreSQL

  OU

  - Docker 


## Banco de dados
Execute o comando abaixo para criar o banco.
``` 
rails db:create
```

## Rodando o projeto

Com Docker:

1. Clone o repositório.
2. Execute os seguintes comandos: 
 - Build das imagens: `docker-compose build`
 - Criação e migração do banco: `docker-compose run web rake db:create db:migrate`
3. Para subir a API: `docker-compose up`

Sem Docker:

1. Clone o repositório.
2. Execute os seguintes comandos: 
 - Instalação de dependências: `bundle install`
 - Criação e migração do banco: `rails db:create db:migrate`
3. No arquivo "database.yml" altere o host para: `localhost`
3. Para subir a API localmente rode o comando: `rails s`

Pronto! A API estará rodando em: http://localhost:3000

## Endpoints

Todos os endpoints estão sob o domínio /api/v1/. Segue abaixo a lista e descrição das rotas.

Exemplo: `http://localhost:3000/api/v1/institutions`

1. Instituições

- Listar todas as instituições

  `GET institutions`

- Listar por ID da instituição

  `GET institutions\id`

- Criar uma nova instituição

  `POST institutions`

  Objeto JSON esperado: 
```
  {
      "name": "UNIFESP",
      "document": "87107579000174",
      "institution_type": "Universidade"
  }
```

2. Alunos
- Listar todos alunos

  `GET students`

- Listar por ID do aluno

  `GET students\id`

- Criar um novo aluno

  `POST students`

  Objeto JSON esperado: 
```
  {
      "name": "Milena",
      "document": "54636199057",
      "gender": "F",
      "payment": "Boleto",
      "birth_date": "26/08/1999"
  }
```

3. Matrículas
- Listar todas as matrículas

  `GET registrations`

- Listar por ID da matrícula

  `GET registrations\id`

- Criar uma nova matrícula e suas respectivas faturas

  `POST registrations`

  Objeto JSON esperado (a instituição e aluno devem ser previamente cadastrados):
```
  {
      "total_price": 100.00,
      "bill_quantity": 2,
      "due_date": 10,
      "course_name": "Computação",
      "student_id": 1,
      "institution_id": 1
  }
```

4. Faturas
- Listar todas as faturas

  `GET bills`

- Listar por ID da matrícula

  `GET bills\id`
