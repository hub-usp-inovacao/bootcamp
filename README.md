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

Os cenários são propostas de focar em uma atividade específica, que exercita um conteúdo ou uma técnica em particular. Em alguns casos, vários cenários são compostos em uma Saga, na qual cada cenário complementa os anteriores.

### Saga de Usuário


#### 1) Página de usuário

> front-only

Crie uma página que coleta dados de usuário (nome, CPF e email) por um formulário e, logo abaixo, as exibe no formato de lista `<ul>`.

Neste primeiro momento, não é necessário se preocupar com divisão de componentes, você pode focar apenas em um único arquivo `.vue`.


#### 2) Extração de componentes

> front-only

Refatore o cenário **(1)**; agora o foco será em criar componentes:

- _input_ de texto curto
- _input_ de CPF (validação¹ e mensagem de erro)
- _input_ de email (validação² e mensagem de erro)
- componente do formulário
- componente de exibição das informações


> ¹ CPF pode conter dígitos e separadores (`.` e `-`) ou apenas os dígitos, e deve seguir a [validação tradicional][cpf]

> ² email pode ser alfanumérico e deve seguir os modelos `exemplo@mail.com` ou `exemplo@mail.com.br`


#### 3) Cadastro de usuário

> back-only

Implemente a funcionalidade para cadastrar e ler um usuário, tudo via API JSON.

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


#### 4) Validação de dados da API

> back-only

Refatore o cenário **(3)** adicionando validações de dados de acordo com as regras explicadas no cenário (2), e adicione a regra: não pode haver dois usuários com o mesmo `email`, nem com o mesmo `cpf`.


#### 5) Juntando as partes

> front & back

Integre o frontend desenvolvido nos cenários (1) e (2) com o backend de (3) e (4). Ao clicar em um botão (possivelmente novo), você fará seu formulário enviar os dados para o backend cadastrá-lo de modo persistente. Além disso, a exibição no frontend deverá acontecer mediante o clique em um botão "carregar", que fará a solicitação dos dados de um usuário específico para o backend.

Para isso, você pode utilizar o Axios de duas formas, que fica a seu critério pois ambas estão disponíveis:

1. como [biblioteca][axios]

```html
<template>
  <!-- estrutura HTML do componente -->
</template>

<script>
import axios from 'axios';

export default {
  beforeMount() {
    // ...
    axios.get(url)
  }
}
</script>
```

2. como [plugin do Nuxt][axiosnuxt] (dentro de algum componente, por exemplo no _hook_ `beforeMount`)

```html
<template>
  <!-- estrutura HTML do componente -->
</template>

<script>
export default {
  beforeMount() {
    // ...
    this.$axios.$get(url)
  }
}
</script>
```


#### 6) Padrão Adapter

> front-only

Não é desejável que o código do componente fique atrelado ao modo como é feita a integração com o backend. Então, refatore o componente que faz as requisições para _extrair um adaptador_ para um arquivo separado, possivelmente um [plugin do Nuxt][nuxtplugins] -- mais sobre o [padrão Adapter][adapter].



[hub]: https://github.com/hub-usp-inovacao/platform
[ror]: https://rubyonrails.org
[nuxt]: https://nuxtjs.org
[dcomp]: https://docs.docker.com/compose/
[vtfy]: https://vuetifyjs.com/en/
[cpf]: https://www.macoratti.net/alg_cpf.htm#:~:text=O%20algoritmo%20de%20valida%C3%A7%C3%A3o%20do,:%20111.444.777-05.
[axios]: https://axios-http.com/ptbr/docs/intro
[axiosnuxt]: https://axios.nuxtjs.org
[nuxtplugins]: https://nuxtjs.org/docs/directory-structure/plugins/
[adapter]: https://refactoring.guru/pt-br/design-patterns/adapter