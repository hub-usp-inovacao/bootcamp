<template>
    <v-card-text>
      <v-list-item>
        {{ name }}
      </v-list-item>

       <v-list-item>
        {{ cpf }}
      </v-list-item>

       <v-list-item>
        {{ email }}
      </v-list-item>
    </v-card-text>
</template>

<script>
export default {
    props: {
        name: {
            type: String,
            required: true,
        },
        cpf: {
            type: String,
            required: true,
        },
        email: {
            type: String,
            required: true,
        },
    }

    
}
</script>