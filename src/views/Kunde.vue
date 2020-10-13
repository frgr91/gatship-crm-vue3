<template>
  <div>
    <h1>{{ kunde.firmaNavn }}</h1>
    <div class="content-item" v-if="!oppdaterKundeActive">
        <p><strong>Kundenr: </strong> {{ kunde.kundeNr }}</p>
        <p><strong>Adresse: </strong> {{ kunde.adresse}}</p>
        <p><strong>Postnummer: </strong>{{ postadresse.postNr}}</p>
        <p><strong>Poststed: </strong>{{ postadresse.postSted}}</p>
        <p><strong>Telefon nummer: </strong> {{ kunde.telefonNr }}</p>
        <p><strong>E-post: </strong> {{ kunde.epost }}</p>
        <p><strong> Kundetyper: </strong></p>
        <p v-for="kundetyper in kundetype" :key="kundetyper.id">{{ kundetyper.kundeTypeNavn }}</p>
        <div class="top-bar" v-if="!oppdaterKundeActive">
        <button 
          class="btn" 
          @click="toggleOppdaterInformasjon"
          >Oppdater kundeinformasjon
        </button>
        <button 
          class="btn" 
          @click="toggleOppdaterInformasjon"
          >Endre kundetyper
        </button>
        <button 
          class="btn danger" 
          @click="deleteKunde(this.kundeNr)"
          >Slett kunde
        </button>
      </div>
      </div>
    
      <div class="content-item" v-else>
        
      <form>
        <div class="form-group">
          <label>Firmanavn:</label>
          <input
            v-model="kunde.firmaNavn"
            type="text"
            placeholder="GAT-Ship AS"
            class="field"
          />
        </div>
        <div class="form-group">
          <label>Telefon nummer:</label>
          <input
            v-model.number="kunde.telefonNr"
            type="text"
            placeholder="90909090"
            class="field"
          />
        </div>
        <div class="form-group">
          <label>Epost:</label>
          <input
            v-model="kunde.epost"
            type="text"
            placeholder="fredrik.granerud@gmail.com"
            class="field"
          />
        </div>
        <div class="form-group">
          <label>Adresse:</label>
          <input
            v-model="kunde.adresse"
            type="text"
            placeholder="Bjørkeveien 17"
            class="field"
          />
        </div>
        <div class="form-group">
          <label>Postnummer:</label>
          <input
            v-model.number="kunde.postNr"
            type="number"
            placeholder="3179"
            class="field"
          />
        </div>
        <button class="btn" @click="toggleOppdaterInformasjon">Avbryt</button>
        <button class="btn" type="submit" @click="putKunde(kunde)">POST IT!</button>
      </form>
    </div >
    <div>
      <h1 >KONTAKTPERSONER ({{kontaktperson.length}})</h1>
      <button v-if="!nyKontaktpersonActive" class="btn" @click="toggleNyKontaktperson">Ny kontaktperson</button>
      <NyKontaktperson 
        v-if="nyKontaktpersonActive" 
        :kundeNr="this.kundeNr" 
        @toggle-ny-kontaktperson="toggleNyKontaktperson" 
        @legg-til-liste="leggTilListe"/>
      <Kontaktperson :kontaktperson="kontaktperson" :kundeNr="this.kundeNr"/>
    </div>
</div>
</template>
<script>
import ApiService from '@/services/ApiService.js';
import NyKontaktperson from '@/components/kontaktperson/NyKontaktperson.vue';
import Kontaktperson from '@/components/kontaktperson/Kontaktperson.vue';

export default {
  components: {
    NyKontaktperson,
    Kontaktperson
  },
  props: {
    kundeNr: {
      type:String
    }
  },
  data() {
    return {
      kunde: {},
      kundetype: {},
      kontaktperson: {},
      postadresse: {},
      kundetyper: {},
      oppdaterKundeActive: false,
      nyKontaktpersonActive: false
    }
  },
  created() {
    ApiService.getKunde(this.kundeNr)
      .then(response => {
        this.kunde = response.data;

        ApiService.getPostadresse(this.kunde.postNr)
          .then(response => {
            this.postadresse = response.data
          })
          .catch(error => {
            console.log('There was an error:', error.response)
          })
      })
      .catch(error => {
        console.log('There was an error:', error.response)
      })

      ApiService.getKundetype(this.kundeNr)
      .then(response => {
        this.kundetype = response.data
      })
      .catch(error => {
        console.log('There was an error:', error.response)
      })

      ApiService.getKontaktperson(this.kundeNr)
      .then(response => {
        this.kontaktperson = response.data
      })
      .catch(error => {
        console.log('There was an error:', error.response)
      })

       ApiService.getKundetyper()
      .then(response => {
        this.kundetyper = response.data;
        console.log(this.kundetype);
      })
      .catch(error => {
        console.log("There was an error:", error.response);
      });

    },
  methods: {
    deleteKunde(id) {
      ApiService.deleteKunde(id);
    },
    putKunde(kunde) {
      console.log(kunde);
      ApiService.putKunde(kunde);
      this.toggleOppdaterInformasjon();
    },
    toggleOppdaterInformasjon() {
      this.oppdaterKundeActive
        ? (this.oppdaterKundeActive = false)
        : (this.oppdaterKundeActive = true);
    },
    toggleNyKontaktperson(){
      this.nyKontaktpersonActive
        ? (this.nyKontaktpersonActive = false)
        : (this.nyKontaktpersonActive = true);
    },
    leggTilListe(x) {
      console.log("HEISANN"+x);
      this.kontaktperson.push(x);
      this.toggleNyKontaktperson();
    }
  }
}
</script>

<style lang="scss">
 
 h1 {
   text-align: left;
   margin: 15px;
   display: block;
 }


.top-bar {
  width: 100%;
  display: flex;
  padding:0;
  button {
    margin: 15px;
  }
}

a {
  text-decoration: none;
  opacity: 1;
  transition: all 0.5s;
}

a:hover {
  opacity: 0.9;
  transition: all 0.5s;
}

p,
h2 {
  margin: 10px;
}
.content-item {
  display: block;
  width: inherit;
  margin: 15px;
  .card-header {
    display: inline-flex;
    width: 100%;
    span:first-child {
    display: inline-flex;
    justify-content: flex-start;
    p {
      display: inline-flex;
      background: #646363;
      color: #fff;
      padding: 5px 10px;
      border-radius: 25px;
      letter-spacing: 0.8px;
    }
    p:first-child {
      background: #f39200;
    }
  }
}
  .card-body {
    display: flex;
    flex-direction: column;
  }
  .bullet {
    margin-left: 5px;
    align-items: center;
    span {
      display: inline-flex;
      justify-content: flex-start;
      //border: 1px solid darkgray;
      //border-radius: 25px;
      img {
        padding: 8px;
        filter: invert(40%) sepia(1%) saturate(4%) hue-rotate(328deg)
            brightness(93%) contrast(89%);
      }
      p {
        font-size: 1.1rem;
        margin-left: 2px;
      }
    }
    
  }
}
</style>
