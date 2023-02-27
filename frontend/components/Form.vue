<template>
  <v-form @submit.prevent="send" ref="form">
    <InputText :field="inputs" />

    <InputCPF :field="inputs" />

    <InputEmail :field="inputs" />

    <div class="d-flex flex-column">
      <v-btn
        class="send mt-4"
        type="submit"
        block
      >
        Enviar
      </v-btn>
    </div>
  </v-form>
</template>

<script>
  import InputText from '../components/InputText.vue'
  import InputEmail from '../components/InputEmail.vue'
  import InputCPF from '../components/InputCPF.vue'

  export default {
    components: {
      InputText,
      InputEmail,
      InputCPF,
    },
    props: {
      inputs: {
        type: Object,
        required: true,
      },
    },
    data: () => ({
      valid: false,
      sent: false,
    }),
    methods: {
      async validate() {
        const valid = await this.$refs.form.validate()
        this.valid = valid
      },
      async send() {
        await this.validate()
        if (this.valid && !this.sent) {
          this.sent = true
          this.$emit('submitted')
        }
      },
    }
  }
</script>
