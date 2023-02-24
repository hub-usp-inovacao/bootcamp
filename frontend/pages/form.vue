<template>
	<v-sheet width="300" class="mx-auto">
		<v-form ref="form">
			<v-text-field
				v-model="inputs.name"
				label="Nome"
				:rules="[v => !!v || 'O nome é obrigatório']"
				required
			></v-text-field>
		 
			<v-text-field
				v-model="inputs.cpf"
				label="CPF"
				:rules="[v => !!v || 'O CPF é obrigatório']"
				required
			></v-text-field>

			<v-text-field
				v-model="inputs.email"
				label="E-mail"
				:rules="[v => !!v || 'O e-mail é obrigatório']"
				required
			></v-text-field>

			<div class="d-flex flex-column">
				<v-btn
				  class="send mt-4"
				  block
				  @click="send"
				>
				  Enviar
				</v-btn>
			</div>

			<div style="margin-top: 16px;" v-if="sent">
				<DisplayFields :fields="inputs" />
			</div>
		</v-form>
	</v-sheet>
</template>

<script>
	import DisplayFields from '../components/DisplayFields.vue'
	export default {
		components: {
			DisplayFields
		},
		data: () => ({
			sent: false,
			valid: false,
			inputs: {
				name: '',
				email: '',
				cpf: ''
			},
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
				}
			},
		},
	}
</script>

<style>
.send {
	background-color: #4caf50 !important;
	color: #fff !important;
}
</style>
