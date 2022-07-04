# Bootcamp - Hub


## Executando

Este repositório é um clone da estrutura do [projeto do Hub][hub].

Tem o propósito de servir como playground para explorar com as ferramentas legadas do projeto: [Ruby on Rails][ror] para o backend, e [Nuxt.js][nuxt] para o frontend.

Para executar o sistema, primeiro certifique-se de que você tem os seguintes arquivos

```plain
- frontend/config/master.key
- frontend/.env
- backend/.env
```

> No caso dos `.env`, no diretório haverá um `.env.sample` apresentando a estrutura básica.

Na sequência, garanta a instalação do [docker-compose][dcomp] e execute

```bash
# constrói as imagens necessárias
docker-compose --profile local build

# executa os contêineres em background
docker-compose --profile local up -d
```

## Cenários interessantes

Você é livre para explorar como preferir, porém aqui seguem alguns cenários básicos que podem guiar suas atividades.

> Para evitar preocupações com estilização, você pode simplesmente ignorá-la ou mesmo utilizar os componentes do [Vuetify][vtfy] que seguem instalados no frontend

> Cada um dos cenários abaixo estão implementados como exemplo em branches neste repositório, caso você queira se inspirar ou tirar uma dúvida -- neste caso, procure a branch `cenario-x` onde `x` é o número de acordo com a listagem abaixo.


### 1) Página de usuário

> front-only

Crie uma página que coleta dados de usuário (nome, CPF e email) por um formulário e, logo abaixo, as exibe no formato de lista `<ul>`.

Neste primeiro momento, não é necessário se preocupar com divisão de componentes, você pode focar apenas em um único arquivo `.vue`.


### 2) Extração de componentes

> front-only

Recrie o cenário **(1)**, porém agora o foco será em criar componentes:

- _input_ de texto curto
- _input_ de CPF (validação¹ e mensagem de erro)
- _input_ de email (validação² e mensagem de erro)
- componente do formulário
- componente de exibição das informações


> ¹ CPF pode conter dígitos e separadores (`.` e `-`) ou apenas os dígitos, e deve seguir a [validação tradicional][cpf]

> ² email pode ser alfanumérico e deve seguir os modelos `exemplo@mail.com` ou `exemplo@mail.com.br`


### 3) Cadastro de usuário

> back-only

Implemente a funcionalidade para cadastrar um usuário e para lê-lo, tudo via API JSON.

As requisições atendidas devem ser como as seguintes:

- `GET /users/42` para ler o usuário de id=42
- `POST /users` para criar um novo usuário e ter a seguinte estrutura de corpo

```json
{
  "user": {
    "name": "João",
    "email": "joao@mail.com",
    "cpf": "123.456.789-0"
  }
}
```


### 4) Validação de dados da API

> back-only

Recrie o cenário **(3)**, porém adicionando validações de dados de acordo com as regras explicadas no cenário (2), e adicione a regra: não pode haver dois usuários com o mesmo `email`, nem com o mesmo `cpf`.




[hub]: https://github.com/hub-usp-inovacao/platform
[ror]: https://rubyonrails.org
[nuxt]: https://nuxtjs.org
[dcomp]: https://docs.docker.com/compose/
[vtfy]: https://vuetifyjs.com/en/
[cpf]: https://www.macoratti.net/alg_cpf.htm#:~:text=O%20algoritmo%20de%20valida%C3%A7%C3%A3o%20do,:%20111.444.777-05.