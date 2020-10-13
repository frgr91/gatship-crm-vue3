<template>
<div>
    <div class="content-item">
        <h1>Registrer kundetype</h1>
        <div class="form-group">
            <label for="kundetype">Kundetype:</label>
            <input 
            v-model="kundetype.kundeTypeNavn"
            type="text"
            id="kundetype"
            >
        </div>
        <div class="form-group">
            <label for="beskrivelse">Beskrivelse:</label>
            <input 
            v-model="kundetype.beskrivelse"
            type="text"
            id="beskrivelse"
            >
        </div>
        <button class="btn" @click="setKundetype(kundetype)">Registrer</button>
    </div>
</div>
</template>

<script>

import ApiService from "@/services/ApiService.js";

export default {
  data() {
    return {
      kundetype: {
        kundeTypeNavn: "",
        beskrivelse: "",
      }
    }
  },
  methods: {
      setKundetype(kundetype) {
          ApiService.postKundetype(kundetype);
      }
  }
}
</script>

<style lang="scss" scoped>
    .content-item {
        margin: 15px;
    }
</style>