<template>
  <div class="content-container">
    <div>
      <h1>Kunder</h1>
        <Kundeliste />
    </div>
    <div>
      <div class="content">
        <h1>Kontaktpersoner</h1>
        <Kontaktpersoner />
      </div>
    </div>
    <div>
      <div class="content">
        <h1>Kundetyper</h1>
        <Kundetyper />
      </div>
    </div>
  </div>
</template>

<script>
import Kundeliste from "@/views/Kundeliste.vue";
import Kundetyper from "@/views/Kundetyper.vue";
import Kontaktpersoner from "@/components/Kontaktpersoner.vue";
export default {
  name: "Oversikt",
  components: {
    Kundeliste,
    Kundetyper,
    Kontaktpersoner
  },

  data() {
    return {};
  },
  methods: {}
};
</script>

<style lang="scss" scoped>
h1 {
  margin-left: 15px;
}
</style>
