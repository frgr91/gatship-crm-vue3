<template>
<div>
    <div v-for="kontaktperson in kontaktpersoner" :key="kontaktperson.id" class="content-item">
        <h2>{{ kontaktperson.etternavn }}, {{kontaktperson.fornavn}} </h2>
        <p>Tittel: {{ kontaktperson.tittel }}</p>
        <p>Epost: {{ kontaktperson.epost }}</p>
        <p>Mobil: {{ kontaktperson.mobilNr }}</p>
    </div>
</div>
</template>

<script>
import ApiService from "@/services/ApiService.js";

export default {
    created() {
        ApiService.getKontaktpersoner()
      .then(response => {
        this.kontaktpersoner = response.data;
      })
      .catch(error => {
        console.log("There was an error:", error.response);
      });
    },
    data() {
        return {
            kontaktpersoner: {}
        }
    }
}
</script>

<style lang="scss" scoped>
    .content-item {
        margin: 15px;
    }
</style>