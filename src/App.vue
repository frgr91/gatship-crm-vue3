<template>
  <NavBar 
    :sidebarOpen="sidebarOpen" 
    @toggle-filter="toggleFilter" 
    @toggle-menu="toggleMenu" 
    @close-sidebar="closeSideBar" 
    @close-filter="closeFilter" 
    @set-search="setSearch" 
  />
  <SideBar 
    :sidebarOpen="sidebarOpen" 
  />
  <router-view 
    :filterOpen="filterOpen" 
    :sidebarOpen="sidebarOpen" 
    :search="search" 
    :class="[sidebarOpen ? 'content-small' : 'content-medium']" />
</template>
<script>
import NavBar from "@/components/Navigation/NavBar.vue";
import SideBar from "@/components/Navigation/SideBar.vue";
export default {
  components: {
    NavBar,
    SideBar
  },
  data() {
    return {
      sidebarOpen: false,
      search: "",
      filterOpen: false
    };
  },
  methods: {
    toggleMenu() {
      this.sidebarOpen ? (this.sidebarOpen = false) : (this.sidebarOpen = true);
    },
    setSearch(searchstring) {
      this.search = searchstring;
    },
    closeSideBar() {
      this.sidebarOpen = false;
    },
    toggleFilter() {
      this.filterOpen ? (this.filterOpen = false) : (this.filterOpen = true);
    },
    closeFilter() {
      this.filterOpen = false;
    }
  },
};
</script>

<style lang="scss">
@import "style/style.scss";

</style>
