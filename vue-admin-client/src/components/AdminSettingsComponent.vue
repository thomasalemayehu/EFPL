<template>
  <main>
    <SeasonImportModalComponent
      :showModal="showModal"
      @closeModal="closeModal"
    />

    <ConfirmModalComponent
      :showConfirmModal="showConfirmModal"
      modalMessage="This action will delete the teams , fixtures and players from the current season. Are you sure you want to continue ?"
      :boldWords="[
        'teams',
        'players',
        'fixtures',
        'current',
        'season',
        'sure',
        'continue',
      ]"
      :saveAction="exportSeasonDataModal"
      @closeModal="closeConfirmModal"
    />

    <div class="settings-content">
      <div class="appearance-section">
        <h3>{{ $t("Appearance") }}</h3>
        <p>{{ $t("Choose an accent color") }}</p>

        <div class="appearance-color-swatch">
          <div class="color-swatch active-swatch">
            <div>
              <img src="../assets/icons/check-mark.svg" alt="" />
            </div>
          </div>
          <div class="color-swatch">
            <div></div>
          </div>
          <div class="color-swatch">
            <div></div>
          </div>
          <div class="color-swatch">
            <div></div>
          </div>
          <div class="color-swatch">
            <div></div>
          </div>
          <div class="color-swatch">
            <div></div>
          </div>
          <div class="color-swatch">
            <div></div>
          </div>
          <div class="color-swatch">
            <div></div>
          </div>
          <div class="color-swatch">
            <div></div>
          </div>
          <div class="color-swatch">
            <div></div>
          </div>
        </div>
      </div>

      <div class="export-import-section">
        <h3>{{ $t("Backup & Restore") }}</h3>
        <p>
          {{ $t("Import and Export season data") }}
          <span
            >({{ $t("Export of complete season clears current season") }})</span
          >
        </p>

        <div class="export-import-actions">
          <div @click="initiateImport">{{ $t("Import") }}</div>
          <div @click="exportSeasonData">{{ $t("Export") }}</div>
        </div>

        <div class="contact-section">
          <h3>{{ $t("Contact") }}</h3>

          <p>{{ $t("Contact the developers") }}</p>

          <div>
            <router-link :to="{ name: 'contact' }">
              {{ $t("Contact Us") }}
            </router-link>
          </div>
        </div>

        <div class="language-section">
          <h3>{{ $t("Language") }}</h3>

          <p>{{ $t("Select language") }}</p>

          <select name="" id="" @change="changeLang($event)">
            <option value="am">{{ $t("Amharic") }}</option>
            <option value="en">{{ $t("English") }}</option>
          </select>
        </div>

        <div class="manage-account-section">
          <h3>{{ $t("Manage Account") }}</h3>

          <p>{{ $t("Manage your account") }}</p>

          <div class="manage-account-action">
            <div class="logout" @click="logOutAdmin">{{ $t("Logout") }}</div>
            <div class="reset">
              <router-link :to="{ name: 'forgot-password' }">
                {{ $t("Reset Password") }}
              </router-link>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>
</template>

<script>
// utils
import store from "@/store";

// Components
import SeasonImportModalComponent from "@/components/SeasonImportModalComponent.vue";
import ConfirmModalComponent from "@/components/ConfirmModalComponent.vue";

export default {
  components: {
    SeasonImportModalComponent,
    ConfirmModalComponent,
  },
  data() {
    const lang = localStorage.getItem("lang") || "am";
    return {
      lang: lang,
      showModal: false,
      accMenu: false,
      langMenu: false,
      seasonMenu: false,

      //
      showConfirmModal: false,
    };
  },
  methods: {
    closeConfirmModal() {
      this.showConfirmModal = false;
    },
    toggleAcc() {
      this.accMenu = !this.accMenu;
    },
    toggleLang() {
      this.langMenu = !this.langMenu;
    },
    toggleSeason() {
      this.seasonMenu = !this.seasonMenu;
    },

    closeModal() {
      this.showModal = false;
    },

    initiateImport() {
      this.showModal = true;
    },
    async exportSeasonData() {
      // get season data
      await store.dispatch("Season/getSeasonStatus");

      const isSeasonComplete = store.state.Season.isSeasonComplete;

      if (isSeasonComplete) {
        this.showConfirmModal = true;
      } else {
        store.dispatch("Season/exportSeason", "partial");
      }
    },

    exportSeasonDataModal() {
      store.dispatch("Season/exportSeason", "complete");

      this.closeModal();
    },
    logOutAdmin() {
      this.$store.dispatch("logOutAdmin");
    },
    changeLang(event) {
      localStorage.setItem("lang", event.target.value);
      window.location.reload();
    },
  },
};
</script>

<style scoped>
@import "../assets/design-system.css";
.settings-content {
  padding: 24px 16px 24px 60px;
  background: linear-gradient(to right, #ebf2fad4, #ebf2fad4),
    url("../assets/img/pipes.png");
  color: var(--primary-900);
  min-height: 100vh;
}
h3 {
  padding-top: 12px;
  color: var(--primary-900);
}

p {
  margin-top: 16px;
}
.appearance-color-swatch {
  margin-top: 12px;
  display: flex;
}
.color-swatch {
  width: 40px;
  height: 40px;
  margin-right: 24px;
  border-radius: 50%;
  background: red;
  display: grid;
  place-items: center;
}
.appearance-color-swatch > div:nth-of-type(1) {
  background: var(--primary-900);
}
.appearance-color-swatch > div:nth-of-type(2) {
  background: #0fd267;
}
.appearance-color-swatch > div:nth-of-type(3) {
  background: #ebbe11;
}
.appearance-color-swatch > div:nth-of-type(4) {
  background: #e99e0f;
}
.appearance-color-swatch > div:nth-of-type(5) {
  background: #e91111;
}
.appearance-color-swatch > div:nth-of-type(6) {
  background: #ea1193;
}
.appearance-color-swatch > div:nth-of-type(7) {
  background: #cc10ea;
}
.appearance-color-swatch > div:nth-of-type(8) {
  background: #5a10ea;
}
.appearance-color-swatch > div:nth-of-type(9) {
  background: #479fbd;
}
.appearance-color-swatch > div:nth-of-type(10) {
  background: #0abb91;
}
.color-swatch > div {
  display: none;
}
.active-swatch > div,
.active-swatch > div > img {
  display: block;
  width: 22px;
  height: 22px;
}
.export-import-section,
.contact-section,
.language-section,
.manage-account-section {
  margin-top: 36px;
}
p > span {
  font-size: 14px;
  color: rgba(255, 0, 0, 0.793);
}
.export-import-actions {
  display: flex;
  margin-top: 12px;
}
.export-import-actions > div {
  padding: 8px 16px;
  background: var(--primary-900);
  margin-right: 16px;
  color: var(--neutral-200);
}
.contact-section > div {
  margin-top: 12px;
  padding: 8px 16px;
  background: var(--primary-900);
  width: fit-content;
  color: var(--neutral-200);
}
.language-section > select {
  margin-top: 12px;
  height: 32px;
  outline: none;
  border: 1px solid var(--primary-900);
  border-radius: 5px;
  width: 20%;
}
.manage-account-action {
  display: flex;
}
.manage-account-action > div {
  margin-top: 12px;
  margin-right: 12px;
  padding: 8px 16px;
  background: var(--primary-900);
  width: fit-content;
  color: var(--neutral-200);
  text-align: center;
}
a {
  color: var(--neutral-200);
  text-decoration: none;
}
</style>
