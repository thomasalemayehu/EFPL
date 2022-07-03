<template>
  <section class="main-container">
    <div class="left-section">
      <img src="../assets/img/Ethiopian_Premier_League_LOGO.png" alt="" />
      <h1 class="left-h1">Ethiopian Fantasy Premier League</h1>
      <p class="left-p">
        A brand new way to enjoy the Ethiopian Premier League
      </p>
    </div>
    <div class="right-section">
      <div class="admin-login">
        <h1>{{ $t("Login Page") }}</h1>
        <form @submit.prevent="loginAdmin">
          <div class="email">
            <label>{{ $t("Email") }}:</label>
            <input
              required
              type="email"
              v-model="loginInfo.email"
              name="email"
            />
          </div>
          <div>
            <label>{{ $t("Password") }}:</label>
            <div class="password">
              <input
                :type="showPassword ? 'text' : 'password'"
                required
                v-model="loginInfo.password"
                minlength="8"
                name="password"
              />
              <button
                class="toggle-password"
                @click.prevent="showPassword = !showPassword"
              >
                <img
                  :src="passwordVisibleIcon.path"
                  :alt="passwordVisibleIcon.alt"
                  v-if="showPassword"
                />
                <img
                  :src="hiddenPasswordIcon.path"
                  :alt="hiddenPasswordIcon.alt"
                  v-else
                />
              </button>
            </div>
          </div>
          <div class="action-buttons">
            <p class="forgot-pass">
              <router-link :to="{ name: 'forgot-password' }">{{
                $t("forgot password")
              }}</router-link>
            </p>
            <div class="submit">
              <button name="submit">{{ $t("Login") }}</button>
            </div>
          </div>
        </form>

        <div v-if="isLoading">
          <SpinnerComponent />
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import { passwordVisibleIcon, hiddenPasswordIcon } from "@/utils/Icons";
import SpinnerComponent from "@/components/SpinnerComponent.vue";
import store from "../store";
export default {
  name: "AdminLoginView",
  components: {
    SpinnerComponent,
  },
  data() {
    return {
      showPassword: false,
      loginInfo: {
        email: "",
        password: "",
      },

      isLoading: false,
      regExp: /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/,
      // icons
      passwordVisibleIcon: passwordVisibleIcon,
      hiddenPasswordIcon: hiddenPasswordIcon,
    };
  },
  methods: {
    loginAdmin() {
      this.isLoading = true;
      if (this.regExp.test(this.loginInfo.password) === true) {
        this.$store.dispatch("loginAdmin", this.loginInfo);
      } else {
        store.dispatch("Global/setNotificationInfo", {
          showNotification: true,
          notificationType: "error",
          notificationMessage:
            "Password must be 8 characters and include at least one uppercase, one lowercase, a symbol and a number",
        });
      }
      this.isLoading = false;
    },
  },
};
</script>

<style scoped>
@import "../assets/design-system.css";

section {
  background: red;
  height: 100vh;
  display: flex;
}
.left-section {
  width: 40%;
  height: 100%;
  background: var(--primary-900);
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: 0 16px;
}
img {
  height: 300px;
}
.left-h1 {
  font-size: 56px;
  text-align: center;
  letter-spacing: 0.25px;
  font-weight: bold;
  color: var(--neutral-200);
}
.left-p {
  margin-top: 12px;
  color: var(--neutral-200);
}
.right-section {
  width: 60%;
  height: 100%;
  background: linear-gradient(to right, #ebf2fa9c, #ebf2fa9c),
    url("../assets/img/pipes.png");
  color: var(--primary-900);
  display: grid;
  place-items: center;
}
.admin-login {
  width: 100%;
  padding: var(--spacing-xlarge);
}
form {
  text-align: left;
  padding: 0px 100px 0px 0px;
}
h1 {
  font-size: var(--text-base);
  font-weight: 500;
  color: var(--neutral-700);
  margin-bottom: var(--spacing-base);
  font-size: 24px;
}
label {
  color: var(--neutral-700);
  display: inline-block;
  margin: var(--spacing-regular) 0 var(--spacing-2xsmall);
  font-size: var(--text-small);
}
button {
  border: 0;
}
.toggle-password img {
  width: 25px;
}
input {
  display: block;
  padding: var(--spacing-small) var(--spacing-xsmall);
  width: 100%;
  box-sizing: border-box;
  border: none;
  border: 0.25px solid var(--primary-900);
  border-radius: 6px;
  color: var(--neutral-600);
}
.forgot-pass a {
  text-decoration: none;
  color: var(--neutral-700);
  font-size: var(--text-small);
}
.submit {
  text-align: center;
}
.password {
  position: relative;
}
.password > button {
  position: absolute;
  top: 50%;
  right: var(--spacing-base);
  transform: translateY(-50%);
  background: none;
  color: var(--success-400);
  padding: 0;
  margin: 0;
}
.action-buttons {
  display: flex;
  justify-content: flex-end;
  align-items: center;
  margin-top: var(--spacing-large);
}
.action-buttons button {
  margin-left: var(--spacing-base);
  font-weight: bold;
  background: var(--primary-900);
  color: var(--neutral-200);
  padding: var(--spacing-small) var(--spacing-xlarge);
  border-radius: 6px;
  cursor: pointer;
}

@media screen and (max-width: 768px) {
  .admin-login {
    width: 100%;
  }
  form {
    border: none;
  }
}
</style>
