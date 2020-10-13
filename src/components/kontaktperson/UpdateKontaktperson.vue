<template>
    <h1>Endre kontaktperson</h1>
    <div class="form-group">
          <label>Fornavn:</label>
          <input
            v-model="input.fornavn"
            type="text"
            placeholder="Ola"
            class="field"
          />
        </div>
        <div class="form-group">
          <label>Etternavn:</label>
          <input
            v-model="input.etternavn"
            type="text"
            placeholder="Normann"
            class="field"
          />
        </div>
        <div class="form-group">
          <label>Tittel:</label>
          <input
            v-model="input.tittel"
            type="text"
            placeholder="CEO eller mr? hmm"
            class="field"
          />
        </div>
        <div class="form-group">
          <label>Epost:</label>
          <input
            v-model="input.epost"
            type="text"
            placeholder="olanormann@norge.no"
            class="field"
          />
        </div>
        <div class="form-group">
          <label>Mobil nr:</label>
          <input
            v-model.number="input.mobilNr"
            type="text"
            placeholder="90458533"
            class="field"
          />
        </div>
        <button class="btn" @click="putKontaktperson(input)">Large endringer</button>
</template>
<script>
import ApiService from '@/services/ApiService.js';

export default {
    props: {
        kundeNr: {
            type: String,
            required: true
        },
        kontaktperson: {
          type: Object
        }
    },
    data() {
        return {
          input: {
            id: +this.kontaktperson.id,
            kundeNr: +this.kundeNr,
            fornavn: this.kontaktperson.fornavn,
            etternavn: this.kontaktperson.etternavn,
            tittel: this.kontaktperson.tittel,
            epost: this.kontaktperson.epost,
            mobilNr: +this.kontaktperson.mobilNr
          }
        }
    },
    methods: {
      putKontaktperson(kontaktperson) {
          ApiService.putKontaktperson(kontaktperson);
      },
      toggleEndreKontaktperson() {
        this.$emit("toggle-kontaktperson");
      }
    }
}
</script>

<style lang="sass" scoped>

</style>