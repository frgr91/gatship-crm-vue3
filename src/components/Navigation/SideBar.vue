<template>
  <div id="nav" class="sidebar" :class="[sidebarOpen ? 'open' : 'closed']">
    <SideBarButton
      :buttonText="'Oversikt'"
      :buttonIcon="iconOverview"
      :routeTo="'/'"
    />
    <SideBarButton
      :buttonText="'Kunder'"
      :buttonIcon="iconKundeliste"
      @click="toggleKunder"
      :class="[collapseKunder ? '' : 'active']"
    />
    <div
      class="menu-group-kunder"
      :class="[collapseKunder ? 'menu-group-closed' : '']"
    >
      <SideBarButton
        :buttonText="'Kundeliste'"
        :buttonIcon="iconViewList"
        :routeTo="'/kundeliste'"
        :class="[sidebarOpen ? 'indent' : '']"
      />
      <SideBarButton
        :buttonText="'Ny kunde'"
        :buttonIcon="iconPersonAdd"
        :routeTo="'/nykunde'"
        :class="[sidebarOpen ? 'indent' : '']"
      />
    </div>
    <SideBarButton
      :buttonText="'Kundetyper'"
      :buttonIcon="iconKundeliste"
      @click="toggleKundetyper"
      :class="[collapseKundetyper ? '' : 'active']"
    />
    <div
    class="menu-group-kundetyper"
    :class="[collapseKundetyper ? 'menu-group-closed' : '']"
    >
    <SideBarButton
      :buttonText="'Alle kundetyper'"
      :buttonIcon="iconViewList"
      :routeTo="'/kundetyper'"
      :class="[sidebarOpen ? 'indent' : '']"
    />
    <SideBarButton
      :buttonText="'Ny kundetype'"
      :buttonIcon="iconPersonAdd"
      :routeTo="'/nykundetype'"
      :class="[sidebarOpen ? 'indent' : '']"
    />
    </div>
    
  </div>
</template>
<script>
import SideBarButton from "@/components/Navigation/SideBarButton.vue";
import iPerson from "@/assets/icons/icon-person.svg";
import iOverview from "@/assets/icons/icon-overview.svg";
import iKundeliste from "@/assets/icons/icon-kundeliste.svg";
import iPersonAdd from "@/assets/icons/icon-person-add.svg";
import iViewList from "@/assets/icons/icon-view-list.svg";
import iExpandCollapse from "@/assets/icons/icon-expand-collapse.svg";
export default {
  components: {
    SideBarButton
  },
  props: {
    sidebarOpen: {
      type: Boolean,
      requried: true
    }
  },
  data() {
    return {
      collapseKunder: true,
      collapseKundetyper: true,
      iconCollapse: iExpandCollapse,
      iconOverview: iOverview,
      iconPerson: iPerson,
      iconKundeliste: iKundeliste,
      iconPersonAdd: iPersonAdd,
      iconViewList: iViewList
    };
  },
  methods: {
    toggleKunder() {
      this.collapseKunder
        ? (this.collapseKunder = false)
        : (this.collapseKunder = true);
    },
    toggleKundetyper() {
      this.collapseKundetyper
        ? (this.collapseKundetyper = false)
        : (this.collapseKundetyper = true);
    }
  }
};
</script>

<style lang="scss" scoped>
.sidebar {
  z-index: 1;
  display: block;
  position: fixed;
  top: 58px;
  height: calc(100vh - 58px);
  background: #fff;
  overflow: hidden;
  -webkit-box-shadow: 4px 0px 18px -1px rgba(153, 153, 153, 0.63);
  -moz-box-shadow: 4px 0px 18px -1px rgba(153, 153, 153, 0.63);
  box-shadow: 4px 0px 18px -1px rgba(153, 153, 153, 0.63);
  transition: all 0.25s;
}

.indent {
  margin-left: 25px;
  transition: all .25s;
}

.closed:hover {
  width: 250px !important;
}

.collapse-btn {
  width: 245px;
  margin-left: 5px;
  height: 45px;
}

.menu-group-kunder {
  margin-top: 5px;
  width: 250px;
  overflow: hidden;
  height: 100px;
  transition: all 0.5s;
}

.menu-group-kundetyper {
  margin-top: 5px;
  width: 250px;
  overflow: hidden;
  height: 100px;
  transition: all 0.5s;
}

.active {
  background: rgba(240, 240, 240, 0.667);
}

.menu-group-closed {
  height: 0;
  transition: all 0.5s;
}
</style>