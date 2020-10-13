<template>
  <div class="menu-item">
    <router-link v-if="routeTo" :to="routeTo">
      <div>
        <img :src="buttonIcon" alt="" />
      </div>
      <p>{{ buttonText }}</p>
    </router-link>
    <button v-else class="menu-item-collapse" @click="rotateIcon">
      <div>
        <img :src="buttonIcon" alt="" />
      </div>
      <p>{{ buttonText }}</p>
      <span>
        <img
          :src="iconCollapse"
          alt=""
          class=""
          :class="[isOpen ? '' : 'rotate-180']"
        />
      </span>
    </button>
  </div>
</template>

<script>
import iExpandCollapse from "@/assets/icons/icon-expand-collapse.svg";
export default {
  props: {
    buttonText: {
      type: String,
      required: true
    },
    buttonIcon: {
      type: String,
      required: true
    },
    routeTo: {
      type: String,
      required: false
    }
  },
  data() {
    return {
      iconCollapse: iExpandCollapse,
      isOpen: true
    };
  },
  methods: {
    rotateIcon() {
      this.isOpen ? (this.isOpen = false) : (this.isOpen = true);
    }
  }
};
</script>

<style lang="scss" scoped>
.menu-item,
.menu-item-collapse {
  margin-top: 5px;
  width: 250px;
  margin-left: 0;
  transition: all .25s;
  a,
  button {
    font-family: "Roboto-Regular";
    font-weight: 400;
    text-transform: none;
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-flex-align: center;
    -ms-flex-align: center;
    -webkit-align-items: center;
    align-items: center;
    background: none;
    border: none;
    border-radius: 10px 0 0 10px;
    padding: 0;
    margin-left: 5px;
    width: 245px;
    height: 45px;
    color: black;
    text-decoration: none;
    transition: all 0.25s;
    outline: none;
    div {
      width: 50px !important;
      height: 45px;
      background: transparent;
      border-radius: 5px;
      img {
        width: 25px;
        height: 25px;
        padding: 10px 10px;
        filter: invert(40%) sepia(1%) saturate(4%) hue-rotate(328deg)
          brightness(93%) contrast(89%);
        transition: transform 0.25s;
      }
    }
    p {
      text-align: left;
      width: 150px;
      font-family: "Poppins-Regular";
      letter-spacing: normal;
      font-size: 1rem;
      margin-left: 10px;
    }
  }
  a:hover,
  button:hover {
    color: #f39200;
    cursor: pointer;
    div {
      img {
        filter: invert(57%) sepia(100%) saturate(3143%) hue-rotate(14deg)
          brightness(110%) contrast(102%);
      }
    }
  }
}

.rotate-180 {
  transform: rotate(180deg);
  transition: all 0.25s;
}
</style>