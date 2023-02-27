<template>
    <v-text-field
		v-model="field.name"
		label="Nome"
		:rules="[v => !!v || 'O nome é obrigatório']"
		required
	></v-text-field>
</template>

<script>
    export default {
        props: {
            field: {
                type: Object,
                required: true
            }
        }
    }
</script>