<template>
  <header>
    <div class="navbar-content">
      <div class="brand" :class="[sidebarOpen ? 'open' : 'brand-closed']" @click="checkRoute">
        <div class="app-icon">
          <img alt="Gatship icon" :src="icon.app" />
        </div>
        <p class="app-name">GAT-SHIP <span>CRM</span></p>
      </div>
      <div class="">
        <button class="nav-item" @click="toggleMenu">
          <img v-if="sidebarOpen" alt="Close menu icon" :src="icon.menuOpen" />
          <img v-else alt="Open menu icon" :src="icon.menu" />
        </button>
      </div>
      <div class="" v-if="$route.name === 'Kundeliste'">
        <button v-if="!searchbarOpen" class="nav-item" @click="toggleSearchbar">
          <img alt="Close menu icon" :src="icon.search" />
        </button>
      </div>
      <div v-if="$route.name === 'Kundeliste' && searchbarOpen" class="search-bar-container" :class="[sidebarOpen ? '' : 'search-bar-closed']">
        <button class="nav-item" @click="toggleSearchbar">
          <img alt="Open menu icon" :src="icon.close" />
        </button>
        <button class="nav-item" @click="toggleFilter">
          <img alt="Open menu icon" :src="icon.filter" />
        </button>
        <input 
              v-model="search"
              placeholder="Søk"
              type="text"
              @keyup="setSearch"
              id="searchInput"
              />
      </div>
    </div>
  </header>
</template>
<script>
// ICON IMPORTS
import iconApp from "@/assets/icons/gatship_logo_edited2.svg";
import iconMenu from "@/assets/icons/icon-menu.svg";
import iconMenuOpen from "@/assets/icons/icon-menu-open.svg";
import iconSearch from "@/assets/icons/icon-search.svg";
import iconClose from "@/assets/icons/icon-close.svg";
import iconFilter from "@/assets/icons/icon-filter-alt.svg";

// COMPONENT IMPORTS

export default {
  components: {
  },
  props: {
    sidebarOpen: {
      type: Boolean,
      requried: true
    }
  },
  data() {
    return {
      routeName : "",
      icon: {
        search: iconSearch,
        menu: iconMenu,
        menuOpen: iconMenuOpen,
        app: iconApp,
        close: iconClose,
        filter: iconFilter
      },
      search: "",
      searchbarOpen: false
    };
  },
  methods: {
    toggleMenu() {
      this.$emit("toggle-menu");
    },
    toggleSearchbar() {
      this.searchbarOpen ? this.searchbarOpen = false : this.searchbarOpen = true;
      //this.$emit("close-sidebar");
      this.$emit("close-filter");
    },
    setSearch() {
      this.$emit("set-search", this.search);
    },
    toggleFilter() {
      this.$emit("toggle-filter")
    }
  }
};
</script>

<style lang="scss">

.search-bar-container {
  position:relative;
  width: calc(100% - 300px);
  background: none;
  display: flex;
  justify-content: flex-start;
  align-items: center;
  right: 0;
  transition: all .5s;
  button {
    width: 50px !important;
  }
  input {
    font-family: "Roboto-Regular";
    width: calc(100% - 110px);
    margin-right: 15px;
    margin-left: 5px;
    background: none;
    outline: none;
    border: none;
    border-bottom: 2px solid #fff;
    padding: 5px;
    font-size: 0.9rem;
    transition:all .25s;
  }
  input::placeholder {
    color: #fff;
  }
  input:focus{
    background: #fff;
    color: #646363;
    border-radius: 2.5px;
    /*
    -webkit-box-shadow: 1px 6px 18px -9px rgba(0,0,0,0.92);
-moz-box-shadow: 1px 6px 18px -9px rgba(0,0,0,0.92);
box-shadow: 1px 6px 18px -9px rgba(0,0,0,0.92);

*/
  }
}

.search-bar-closed {
    width: calc(100% - 110px);
    transition: all .5s;
}

header {
  z-index: 100;
  background: #f39200;
  display: block;
  position: fixed;
  top: 0;
  width: 100%;
  height: 58px;
  .navbar-content {
    margin: 0;
    width: inherit;
    height: 50px;
    padding: 4px 0px;
    position: relative;
    display: flex;
    justify-content: flex-start;
    align-items: center;

    .brand {
      width: 250px;
      height: 60px;
      display: -webkit-box;
      display: -webkit-flex;
      display: -moz-box;
      display: -ms-flexbox;
      display: flex;
      -webkit-flex-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
      cursor: pointer;
      overflow: hidden;
      transition: all 0.5s;
      .app-icon {
        margin-left: 5px;
        width: 50px;
        height: 60px;
        display: -webkit-box;
        display: -webkit-flex;
        display: -moz-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-flex-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
        img {
          padding: 5px 5px;
          width: 35px;
          height: 35px;
          filter: invert(40%) sepia(1%) saturate(4%) hue-rotate(328deg)
            brightness(93%) contrast(89%);
        }
      }
      .app-name {
        min-width: 190px;
        text-align: left;
        color: #646363;
        letter-spacing: 2px;
        margin-left: 10px;
        font-family: "Roboto-Regular";
        font-size: 18px;
        font-weight: 800;
        span {
          font-weight: 400;
          color: #fff;
        }
      }
    }
  }
}

.nav-item {
  z-index: 100;
  width: 50px;
  height: 50px;
  background: transparent;
  border-radius: 50%;
  border-style: none;
  position: relative;
  outline: none;
  margin-left: 0px;
  img {
    filter: invert(100%) sepia(100%) saturate(1%) hue-rotate(105deg) brightness(103%) contrast(101%);
  }
}

.nav-item::after {
  z-index: -1;
  width: 40px;
  height: 40px;
  left: 5px;
  top: 2.5px;
  right: 0;
  bottom: 0;
  border-radius: 50%;
  content: "";
  pointer-events: none;
  position: absolute;
  background: #646363;
  opacity: 0;
  transition: all 0.5s;
}

.nav-item:hover {
  cursor: pointer;
  &:hover:after {
    opacity: 0.75;
  }
}
@media only screen and (max-width: 600px) {
  .search-bar-container {
    z-index: 100;
    position: fixed;
    width: 100%;
    height: 60px;
    background: #f39200;
    flex-direction: row-reverse;
}
}
</style>
