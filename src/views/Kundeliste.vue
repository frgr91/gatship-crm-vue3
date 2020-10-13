<template>
  <div class="content-container" :class="[filterOpen ? 'pd-15' : '']">
    <div v-if="filterOpen"  class="filter-container" :class="[sidebarOpen ? '' : 'filter-open']">
      <p>Filter</p>
        <label>kundetype</label>
        <select v-model="select" @click="sorterKundetyper">
          <option value="">Alle</option>
          <option
            v-for="(kunde, index) in unikeKundetyper"
            :key="index"
            :value="kunde"
          >{{ kunde }}
          </option>
        </select>
        <p>Søk etter:</p>
      <div class="filter-item" :class="sokekriterier === 1 ? 'radio-active' : ''">
        <input
        v-model="sokekriterier"
        :value="1"
            type="radio"
            name="navn"
            id="navn"
          />
        <label for="navn">Firmanavn</label>
      </div>
      <div class="filter-item" :class="sokekriterier === 2 ? 'radio-active' : ''">
        <input
        v-model="sokekriterier"
        :value="2"
            type="radio"
            name="epost"
            id="epost"
          />
        <label for="epost">Epost</label>
      </div>
      <div class="filter-item" :class="sokekriterier === 3 ? 'radio-active' : ''">
        <input
        v-model="sokekriterier"
        :value="3"
            type="radio"
            name="tlf"
            id="tlf"
          />
        <label for="tlf">Telefon</label>
      </div>
      <div class="filter-item" :class="sokekriterier === 4 ? 'radio-active' : ''">
        <input
        v-model="sokekriterier"
        :value="4"
            type="radio"
            name="adresse"
            id="adresse"
          />
        <label for="adresse">Adresse</label>
      </div>
    </div>
    <KundeKort 
      v-for="kunde in filterKunder"
      :key="kunde.kundeNr"  
      :kunde="kunde" 
    />
  </div>
</template>
<script>
// SERVICES
import ApiService from "@/services/ApiService.js";
// COMPONENTS
import KundeKort from "@/components/KundeKort.vue";


export default {
  props: {
    sidebarOpen: {
      type: Boolean,
      requried: true
    },
      search: {
        type: String,
        required: false
      },
      filterOpen: {
        type: Boolean,
        required: true
      }
  },
  components: {
    KundeKort
  },
  data() {
    return {
      kunder: [],
      unikeKundetyper: [],
      select: "",
      sokekriterier: 1
    };
  },
  created() {
    ApiService.getKunder()
      .then(response => {
        this.kunder = response.data;
      })
      .catch(error => {
        console.log("There was an error:", error.response);
      });
  },
  methods: {
    sorterKundetyper() {
      // Må komme på en bedre løsning her.
      let sort = [
        ...new Set(this.kunder.map(k => k.kundeTypeNavn.toLowerCase()))
      ];
      //console.log(this.kundetyper);
      this.unikeKundetyper = sort;
      //console.log(this.kundetyper);
    }
  },
  computed: {
    filterKunder: function() {
      let filtered = this.kunder;
      if (this.search) {
        if(this.sokekriterier === 1) {
          filtered = this.kunder.filter(
          k => k.firmaNavn.toLowerCase().indexOf(this.search.toLowerCase()) > -1
        );
        }
        if(this.sokekriterier === 2) {
          filtered = this.kunder.filter(
          k => k.epost.toLowerCase().indexOf(this.search.toLowerCase()) > -1
        );
        }
        if(this.sokekriterier === 3) {
          filtered = this.kunder.filter(
          k => k.telefonNr.toString().indexOf(this.search.toLowerCase()) > -1
        );
        }
        if(this.sokekriterier === 4) {
          filtered = this.kunder.filter(
          k => k.adresse.toLowerCase().indexOf(this.search.toLowerCase()) > -1
        );
        }
      }
      if (this.select) {
        filtered = filtered.filter(
          k => k.kundeTypeNavn.toLowerCase() === this.select.toLowerCase()
        );
      }
      return filtered;
    }
  }
};
/* TODO:
1. Lage ferdig kort
2. fikse en v-if som viser tabell eller kort.

*/
</script>

<style lang="scss" scoped>
$primary: #f39200;
$secondary: #646363;

.content-container {
  margin: 15px;
}

.filter-container {
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;
  z-index: 100;
  position: fixed;
  top: 58px;
  right: 0;
  width: calc(100% - 250px);
  background: #fff;
  transition: all .25s;
  padding-bottom: 5px;
  height: 50px;
  overflow: hidden;
  box-shadow: 0px 7px 15px -17px black;
  label {
    padding: 5px 15px;
  }
  select {
    width: 5rem;
  }
  p {
    padding: 5px 15px;
  }
}

.filter-item {
  margin-left: 15px;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;
  height: inherit;
  input {
    display: none;
  }
  label {
    padding: 5px 15px;
    background:rgba(240, 240, 240, 0.667);
    border-radius: 25px;
    border: 1px solid #fff;
    transition: all .5s;
  }
  label:hover {
    background:#fff;
    border-color:#f39200;
    transition: all .5s;
    cursor: pointer;
  }
}

.radio-active {
  label, label:hover {
    border: 1px solid #f39200;
    background: #f39200;
    color:#fff;
    transition: all .5s;
    cursor:default;
  }
}

.search-bar {
  width: 100%;
  display: inline-block;
  color: #fff;
}
input {
  background: $primary;
  color: white;
  border-bottom: 2px solid white;
}

// velger hvor bred filter-containeren skal være
// small-medium-large brukes som referanse på om det er stor eller liten skjermstørrelse
// :class="[sidebarOpen ? 'small' : 'medium']"
.filter-open {
  width: calc(100% - 60px);
  transition: all .25s;
}

@media only screen and (max-width: 600px) {
  .filter-container {
    left:0;
    width: 100%;
    height: auto;
    display: flex;
    flex-direction: column;
    margin: 0;
    padding: 0;
    padding-bottom: 15px;
  }
}
</style>