<template>
	<v-sheet width="300" class="mx-auto">
		<Form :inputs="inputs" @submitted="setSent" />
    <div style="margin-top: 16px;" v-if="sent">
      <DisplayFields :fields="inputs" />
    </div>
	</v-sheet>
</template>

<script>
	import DisplayFields from '../components/DisplayFields.vue'
	import InputText from '../components/InputText.vue'
	import InputEmail from '../components/InputEmail.vue'
  import Form from '../components/Form.vue'

	export default {
		components: {
			DisplayFields,
			InputText,
			InputEmail,
      Form
		},
		data: () => ({
      sent: false,
			inputs: {
				name: '',
				email: '',
				cpf: '',
			},
		}),
    methods: {
      setSent() {
        this.sent = true
      }
    }
	}
</script>

<style>
.send {
	background-color: #4caf50 !important;
	color: #fff !important;
}
</style>
