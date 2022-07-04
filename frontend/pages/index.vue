<template>
  <main>
    <div>
      <label for="name">Nome</label>
      <input id="name" type="text" v-model="name" />

      <label for="email">Email</label>
      <input id="email" type="email" v-model="email" />

      <label for="cpf">CPF</label>
      <input id="cpf" type="text" v-model="cpf" />
    </div>

    <hr />

    <div>
      <ul>
        <li>Nome: {{ name }}</li>
        <li>Email: {{ email }}</li>
        <li>CPF: {{ cpf }}</li>
      </ul>
    </div>
  </main>
</template>


<script>
export default {
  data: () => ({
    name: "",
    email: "",
    cpf: "",
  }),
};
</script>