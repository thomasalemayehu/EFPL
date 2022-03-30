import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";
import FixtureDetail from "../components/FixtureDetailComponent.vue";

const routes = [
  {
    path: "/",
    name: "home",
    component: HomeView,
  },
  {
    path: "/about",
    name: "about",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/AboutView.vue"),
  },

  // Fixture Routes
  {
    path: "/fixtures",
    name: "Fixtures",
    component: () => import("../components/FixturesComponent.vue"),
  },

  {
    path: "/fixture/detail",
    name: "Fixture Detail",
    component: FixtureDetail,
  },

  // Team Route
  {
    path: "/teams",
    name: "Teams",
    component: () => import("../components/TeamsComponent.vue"),
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
