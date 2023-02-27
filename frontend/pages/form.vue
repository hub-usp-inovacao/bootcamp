<template>
	<v-sheet width="300" class="mx-auto">
		<v-form ref="form">

			<InputText :field="inputs" />
		
			<v-text-field
				v-model="inputs.cpf"
				label="CPF"
				:rules="[v => !!v || 'O CPF é obrigatório']"
				required
			></v-text-field> 
			
			<InputEmail :field="inputs" />
			
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
	import InputText from '../components/InputText.vue'
	import InputEmail from '../components/InputEmail.vue'

	export default {
		components: {
			DisplayFields,
			InputText,
			InputEmail
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
