<template>
<div class="content-item col-3">
<div class="card-header">
  <span>
    <router-link :to="{ name: 'Kunde', params: { kundeNr: kunde.kundeNr} }">
      <p>#{{ kunde.kundeNr }}</p>
    </router-link>
    <p>{{ kunde.kundeTypeNavn }}</p>
  </span>
  <!--
  <span>
    <a>
      <img :src="icon.showMore" alt="show more icon" />
    </a>
  </span>
  -->
</div>
<h2>{{ kunde.firmaNavn }}</h2>
<div class="card-body">
  <div class="bullet">
    <span>
      <img :src="icon.email" alt="email icon">
      <p>{{ kunde.epost }}</p>
    </span>
  </div>
  <div class="bullet">
    <span>
      <img :src="icon.phone" alt="phone icon">
      <p>{{ kunde.telefonNr }}</p>
    </span>
  </div>
  <div class="bullet">
    <span>
      <img :src="icon.address" alt="address icon">
      <p>{{ kunde.adresse }}</p>
    </span>
  </div>
</div>
<router-link :to="{ name: 'Kunde', params: { kundeNr: kunde.kundeNr, postNr: kunde.postNr } }">
    <span>
      <p>Mer info</p>
      <!--
      <img :src="icon.showMore" alt="show more icon" />
      -->
    </span>
  </router-link>
</div>
</template>

<script>
// ICONS
import iShowMore from "@/assets/icons/icon-show-more.svg";
import iPhone from "@/assets/icons/icon-phone.svg";
import iEmail from "@/assets/icons/icon-email.svg";
import iAddress from "@/assets/icons/icon-address.svg";
export default {
    
    props: {
        kunde: Object
    },
    data() {
        return {
            icon: {
              showMore: iShowMore,
              phone: iPhone,
              email: iEmail,
              address: iAddress
            }
        }
    }
}
</script>

<style lang="scss">
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