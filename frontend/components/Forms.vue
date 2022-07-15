<template>
    <div>
        <v-card-title>
            Formulário
        </v-card-title>
        <v-card-text>
            <v-form>
                <InputName @input="name=$event"/>
                <InputCpf @input="cpf=$event"/>         
                <InputEmail @input="email=$event"/>
            </v-form>
        </v-card-text>
    </div>
</template>

<script>

import InputName from "@/components/InputName.vue"
import InputCpf from "@/components/InputCpf.vue"
import InputEmail from "@/components/InputEmail.vue"

export default {
    components: {
        InputName,
        InputCpf,
        InputEmail,
    },

    data: () => ({
      name: '',
      cpf: '',
      email: '',
    }),

    watch: {
        name: function() {
            this.$emit("inputName", this.name)
        },
        cpf: function() {
            this.$emit("inputCpf", this.cpf)
        },
        email: function() {
            this.$emit("inputEmail", this.email)
        },
    },

}



</script>