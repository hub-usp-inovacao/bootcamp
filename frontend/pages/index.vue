<template>

<v-container>
  <v-card
    class="mx-auto"
    max-width="1000"
    flat
  >
    <Forms
      @inputName="name=$event"
      @inputCpf="cpf=$event"
      @inputEmail="email=$event"
    />
    <Display
      :name=name
      :cpf=cpf
      :email=email
    />
  </v-card>

   

</v-container>
</template>

<script>

import Forms from "@/components/Forms.vue"
import Display from "@/components/Display.vue"

export default {
  components: {
    Forms,
    Display,
  },

  data: () => ({
      name: '',
      cpf: '',
      email: '',
    }),

};
</script>