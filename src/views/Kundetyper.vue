<template>
<div>
    <div v-for="kundetype in kundetyper" :key="kundetype.id" class="content-item">
        <h2>{{ kundetype.kundeTypeNavn }}</h2>
        <p>{{ kundetype.beskrivelse }}</p>
    </div>
</div>
</template>

<script>
import ApiService from "@/services/ApiService.js";

export default {
    created() {
        ApiService.getKundetyper()
      .then(response => {
        this.kundetyper = response.data;
      })
      .catch(error => {
        console.log("There was an error:", error.response);
      });
    },
    data() {
        return {
            kundetyper: {}
        }
    }
}
</script>

<style lang="scss" scoped>
    .content-item {
        margin: 15px;
    }
</style>