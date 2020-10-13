<template>
<div>
  <div class="content-item">
    <h1>Registrer ny kunde</h1>
    <KundeInput />
  </div>
</div>
</template>

<script>
import KundeInput from "@/components/kunde/NyKundeInput.vue";
export default {
  name: "Nykunde",
  components: {
    KundeInput
  }
};
</script>

<style lang="scss" scoped>
.content-item {
  margin: 15px;
  padding-top: 15px;
  padding-bottom: 15px;
  h1 {
    margin: 0;
    margin-left: 15px;
  }
}
</style>