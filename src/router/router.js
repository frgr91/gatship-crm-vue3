import { createRouter, createWebHashHistory } from "vue-router";
import Oversikt from "../views/Oversikt.vue";

const routes = [
  {
    path: "/",
    name: "Oversikt",
    component: Oversikt,
  },
  {
    path: "/kunde/:kundeNr",
    name: "Kunde",
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/Kunde.vue"),
    props: (route) => ({
      kundeNr: route.params.kundeNr,
    }),
  },
  {
    path: "/kundeliste",
    name: "Kundeliste",
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/Kundeliste.vue"),
  },
  {
    path: "/nykunde",
    name: "Nykunde",
    component: () => import("../views/Nykunde.vue"),
  },
  {
    path: "/kundetyper",
    name: "Kundetyper",
    component: () => import("../views/Kundetyper.vue"),
  },
  {
    path: "/nykundetype",
    name: "Nykundetype",
    component: () => import("../views/NyKundetype.vue"),
  },
];

const router = createRouter({
  history: createWebHashHistory(),
  routes,
});

export default router;
