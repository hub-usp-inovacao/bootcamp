<template>
    <div>
        <v-text-field
            v-model="cpf"
            label="CPF"
            @blur="validateCPF"
        ></v-text-field>
        <p v-if="cpfError.length"> {{ cpfError }} </p>
    </div>
</template>

<script>
export default {
    data: () => ({
        cpf: '',
        cpfError: '',
    }),

    watch: {
        cpf: function() {
            this.$emit("input", this.cpf)
        }
    },

    methods: {
        validateCPF: function () {
        let cleanedCpf = this.cpf.replaceAll(/\D/g, '')
        if (cleanedCpf.length != 11)
            this.cpfError = "CPF inválido"
        else
            this.cpfError = ""
        },
    }
}
</script>