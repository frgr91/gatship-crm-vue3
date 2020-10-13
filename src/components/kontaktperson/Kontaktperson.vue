<template>
      <div v-for="kontaktpersoner in kontaktperson" :key="kontaktpersoner.id" class="content-item col-3">
        <div v-if="!endreKontaktpersonActive">
        <p>ID: {{ kontaktpersoner.id}}</p>
        <p>Fornavn: {{ kontaktpersoner.fornavn }}</p>
        <p>Etternavn: {{ kontaktpersoner.etternavn }}</p>
        <p>Tittel: {{ kontaktpersoner.tittel }}</p>
        <p>Epost: {{ kontaktpersoner.epost }}</p>
        <p>Mobil: {{ kontaktpersoner.mobilNr }}</p>
        <button class="btn" @click="toggleEndreKontaktperson">Endre kontaktperson</button>
        <button class="btn" @click="deleteKontaktperson(kontaktpersoner.id)">Slett kontaktperson</button>
        </div>
        <UpdateKontaktperson 
            v-if="endreKontaktpersonActive"
            :kontaktperson="kontaktpersoner" 
            :kundeNr="this.kundeNr" />
            <button v-if="endreKontaktpersonActive" class="btn" @click="toggleEndreKontaktperson">Avbryt</button>
      </div>
</template>
<script>
import ApiService from '@/services/ApiService.js';
import UpdateKontaktperson from '@/components/kontaktperson/UpdateKontaktperson.vue';

export default {
    components: {
        UpdateKontaktperson
    },
    props: {
        kontaktperson: {
            type: Object,
            required: true
        },
        kundeNr: {
            type: String
        }
    },
    data() {
        return {
            endreKontaktpersonActive: false
        }
    },
    methods: {
        deleteKontaktperson(id){
            ApiService.deleteKontaktperson(id);
        },
        toggleEndreKontaktperson() {
            this.endreKontaktpersonActive
        ? (this.endreKontaktpersonActive = false)
        : (this.endreKontaktpersonActive = true);
        }
    }
}
</script>