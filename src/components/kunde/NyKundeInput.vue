<template>
  <form>
    <div class="form-group">
      <label>Firmanavn</label>
      <input
        v-model="kunde.firmaNavn"
        type="text"
        placeholder="GAT-Ship AS"
        class=""
      />
    </div>
    <div class="form-group">
    <label>Velg kundetype</label>
    <select v-model="kunde.kundeTypeNavn">
      <option
        v-for="option in kundetype"
        :value="option.kundeTypeNavn"
        :key="option.kundeTypeNavn"
        :selected="option === kunde.kundeTypeNavn"
        >{{ option.kundeTypeNavn }}</option
      >
    
    </select>
    </div>
    <div class="form-group">
    <label>Telefon nummer</label>
    <input
      v-model.number="kunde.telefonNr"
      type="number"
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
    <label>Adresse</label>
    <input
      v-model="kunde.adresse"
      type="text"
      placeholder="Bjørkeveien 17"
      class="field"
    />
    </div>
    <div class="form-group">
    <label>Postnummer</label>
    <input
      v-model.number="kunde.postNr"
      type="number"
      placeholder="3179"
      class="field"
    />
    </div>
    <button class="btn" type="submit" @click="setKunde(this.kunde)">Registrer</button>
  </form>
</template>

<script>
import ApiService from "@/services/ApiService.js";
export default {
  components: {
  },
  created() {
    ApiService.getKundetyper()
      .then(response => {
        this.kundetype = response.data;
        console.log(this.kundetype);
      })
      .catch(error => {
        console.log("There was an error:", error.response);
      });
  },
  data() {
    return {
      kundetype: [],
      kunde: {
        kundeTypeNavn: "",
        firmaNavn: "",
        telefonNr: null,
        epost: "",
        adresse: "",
        postNr: null
      }
    };
  },
  computed: {},
  methods: {
    setKunde(kunde) {
      console.log(kunde);
      ApiService.postKunde(kunde);
      //this.kunde.kundeTypeNavn = "";
      //this.kunde.firmaNavn = "";
    }
  }
};
</script>

<style lang="scss" scoped>
  .btn {
    margin-left: 15px;
  }
</style>