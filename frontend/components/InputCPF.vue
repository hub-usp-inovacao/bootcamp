<template>
    <v-text-field
		v-model="field.cpf"
		label="CPF"
		:rules="cpfRules"
		required
	></v-text-field>
</template>

<script>
  export default {
    data: () => ({
      cpfRules: [
        v => !!v || 'O CPF é obrigatório',
        v => /^([0-9]{3}[.]?[0-9]{3}[.]?[0-9]{3}[-]?[0-9]{2})$/.test(v) || 'CPF inválido',
        v => mathCpf(v) || 'CPF inválido'
      ],
    }),
    props: {
      field: {
        type: Object,
        required: true
      }
    },
  }
  function mathCpf(cpf) {
    cpf = cpf.replace(/[^0-9]/g, '')

    if (cpf.length != 11) {
      return false;
    }

    var cpf_first = cpf.slice(0, -2)
    var cpf_last = cpf.slice(-2)

    for (var k = 0; k < 2; k++) {
      var sum = 0;
      for (var i = 8 + k, j = 2; i >= 0; i--, j++) {
        sum += cpf_first[i] * j;
      }

      var rest = sum % 11;
      var digit = rest < 2 ? 0 : 11 - rest;

      if (digit != cpf_last[k]) {
        return false;
      }
      cpf_first += digit;
    }
    return true;
  }
</script>
