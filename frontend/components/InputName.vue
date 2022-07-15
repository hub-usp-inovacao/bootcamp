<template>
    <v-text-field
        v-model="name"
        label="Name"
    ></v-text-field>
</template>

<script>
export default {
    data: () => ({
        name: '',
    }),

    watch: {
        name: function() {
            this.$emit("input", this.name)
        }
    }
}
</script>