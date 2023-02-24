<template>
	<ul>
		<li v-for="(value, field) in fields" :key="field">
			<b>{{ label(field) }}</b>: {{ value }}
		</li>
	</ul>
</template>

<script>
	export default {
		props: {
			fields: {
				type: Object,
				required: true
			}
		},
		methods: {
			label(field) {
				switch (field) {
					case 'name':
						return 'Nome'
					case 'email':
						return 'E-mail'
					case 'cpf':
						return 'CPF'
					default:
						return field
				}
			},
		},
	}
</script>

<style>
</style>
