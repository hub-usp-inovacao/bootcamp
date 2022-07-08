<template>

<v-container>
  <v-card
    class="mx-auto"
    max-width="1000"
    flat
  >
    <v-card-title>
      Formulário
    </v-card-title>
    <v-card-text>
      <v-form>
        <v-text-field
            v-model="name"
            label="Name"
          ></v-text-field>
  
          <v-text-field
            v-model="cpf"
            label="CPF"
          ></v-text-field>
  
          <v-text-field
            v-model="email"
            label="Email"
          ></v-text-field>
      </v-form>

      <v-list-item>
        {{ name }}
      </v-list-item>

       <v-list-item>
        {{ cpf }}
      </v-list-item>

       <v-list-item>
        {{ email }}
      </v-list-item>

    </v-card-text>
  </v-card>

   

</v-container>
</template>

<script>
export default {
  data: () => ({
      name: '',
      cpf: '',
      email: '',
    }),
};
</script>