<template>
    <div>
        <v-text-field
            v-model="email"
            label="email"
            @blur="validateEmail"
        ></v-text-field>
        <p v-if="emailError.length"> {{ emailError }} </p>
    </div>
</template>

<script>
export default {
    data: () => ({
        email: '',
        emailError: '',
    }),

    watch: {
        email: function() {
            this.$emit("input", this.email)
        }
    },

    methods: {
        validateEmail: function () {
            if (this.email.includes('@'))
                this.emailError = ""
            else
                this.emailError = "Email inválido"
        }
    }
}
</script>