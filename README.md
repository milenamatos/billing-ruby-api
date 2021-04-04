# Billing API com Ruby On Rails

## Resumo

Este projeto tem como objetivo simular uma API de gerenciamento das mensalidades pagas pelos alunos à instituição de ensino que ele estuda.

## Funcionalidades

- Listagem e criação de Instituição de Ensino;
- Listagem e criação de Alunos;
- Listagem e criação de Matrículas;
- Listagem de Faturas

## Dependências de sistema
  - Docker

## Rodando o projeto

Com Docker:

1. Clone o repositório.
2. Execute os seguintes comandos: 
 - Build das imagens: `docker-compose build`
 - Criação e migração do banco: `docker-compose run web rake db:create db:setup`
3. Para subir a API: `docker-compose up`

PS: Se estiver rodando em uma máquina Linux, rode os comandos acima com Sudo.

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

## Execução de testes unitários

- Para executar todos os testes: 

  `docker-compose run web rails test`
- Para escolher o diretório a ser testado:

  `docker-compose run web rails test test/models`
  
  ou 
  
  `docker-compose run web rails test test/controllers`

- Para testar apenas um arquivo basta especificar no comando, exemplo:

  `docker-compose run web rails test test/models/institution_test.rb`
  
PS: Se estiver rodando em uma máquina Linux, rode os comandos acima com Sudo.
