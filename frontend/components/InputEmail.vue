<template>
    <v-text-field
		v-model="field.email"
		label="E-mail"
		:rules="emailRules"
		required
	></v-text-field>
</template>

<script>
    export default {
        data: () => ({
            emailRules: [
                v => !!v || 'O e-mail é obrigatório',
                v => /.+@.+\..+/.test(v) || 'E-mail inválido',
            ],
        }),

        props: {
            field: {
                type: Object,
                required: true
            }
        },
    }
</script>