<template>
<div class="content-item">
    <h1>Ny kontaktperson</h1>
    <form>
        <div class="form-group">
          <label>Fornavn:</label>
          <input
            v-model="kontaktperson.fornavn"
            type="text"
            placeholder="Ola"
            class="field"
          />
        </div>
        <div class="form-group">
          <label>Etternavn:</label>
          <input
            v-model="kontaktperson.etternavn"
            type="text"
            placeholder="Normann"
            class="field"
          />
        </div>
        <div class="form-group">
          <label>Tittel:</label>
          <input
            v-model="kontaktperson.tittel"
            type="text"
            placeholder="CEO eller mr? hmm"
            class="field"
          />
        </div>
        <div class="form-group">
          <label>Epost:</label>
          <input
            v-model="kontaktperson.epost"
            type="text"
            placeholder="olanormann@norge.no"
            class="field"
          />
        </div>
        <div class="form-group">
          <label>Mobil nr:</label>
          <input
            v-model.number="kontaktperson.mobilNr"
            type="text"
            placeholder="90458533"
            class="field"
          />
        </div>
        <button class="btn" @click="postKontaktperson(kontaktperson)">Legg til</button>
        <button class="btn" @click="toggleNyKontaktperson">Avbryt</button>
      </form>
</div>
</template>
<script>
import ApiService from '@/services/ApiService.js';

export default {
    props: {
        kundeNr: {
            type: String,
            required: true
        }
    },
    data() {
        return {
            kontaktperson: {
                kundeNr: +this.kundeNr,
                fornavn: "",
                etternavn: "",
                tittel: "",
                epost: "",
                mobilNr: ""
            }
        }
    },
    methods: {
        postKontaktperson(obj) {
            ApiService.postKontaktpersoner(obj);
            this.$emit("legg-til-liste", obj);
        },
        toggleNyKontaktperson() {
          this.$emit("toggle-ny-kontaktperson")
        }
    }
}
</script>

<style lang="sass" scoped>

</style>