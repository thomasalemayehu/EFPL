<template>
  <div @click="changeLang">
    <p>{{ getCurrLang }}</p>
  </div>
</template>

<script>
export default {
  name: "LocaleWidget",
  computed: {
    getCurrLang() {
      return localStorage.getItem("lang") == "en" ? "AM" : "EN";
    },
  },
  methods: {
    changeLang() {
      const currentLang = localStorage.getItem("lang");
      const langToSet = currentLang == "en" ? "am" : "en";
      console.log(langToSet);
      localStorage.setItem("lang", langToSet);
      window.location.reload();
    },
  },
};
</script>

<style scoped>
div {
  position: absolute;
  left: 95%;
  bottom: 3%;
  width: 60px;
  height: 60px;
  background: var(--primary-900);
  border-radius: 50%;
  color: var(--neutral-200);
  display: grid;
  place-items: center;
  box-shadow: var(--primary-900) 0px 5px 8px 0px;
}
p {
  font-size: 16px;
}
</style>
