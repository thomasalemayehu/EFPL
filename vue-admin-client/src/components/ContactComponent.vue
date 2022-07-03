<template>
  <main>
    <div class="admin-contact">
      <h1>{{ $t("Contact Page") }}</h1>

      <form @submit.prevent="handleSubmit">
        <label>{{ $t("Email") }}:</label>
        <select v-model="info.receiverEmail" required>
          <option hidden disabled selected value>
            -- {{ $t("select email") }}--
          </option>
          <option value="mikealexiv565@gmail.com">{{ $t("Dev -1") }}</option>
          <option value="sorrysoup156@gmail.com">{{ $t("Dev -2") }}</option>
        </select>
        <div></div>

        <div class="emailBody">
          <label>{{ $t("Message") }}:</label>
          <textarea
            placeholder="write something.... "
            required
            v-model="info.emailBody"
            style="height: 200px"
          ></textarea>
        </div>

        <div class="submit">
          <button>{{ $t("submit") }}</button>
        </div>
      </form>
      <p v-if="isLoading">{{ $t("Loading") }}</p>
    </div>
  </main>
</template>

<script>
export default {
  data() {
    return {
      info: { receiverEmail: "", emailBody: "" },
      isLoading: null,
    };
  },
  methods: {
    async handleSubmit() {
      this.isLoading = true;
      this.$store.dispatch("sendEmail", this.info);
      this.isLoading = false;
    },
  },
};
</script>

<style scoped>
@import "../assets/design-system.css";
h1 {
  font-size: 24px;
}
main {
  width: 100%;
  height: 100vh;
  background: linear-gradient(to right, #ebf2fad4, #ebf2fad4),
    url("../assets/img/pipes.png");
  color: var(--primary-900);
}
.admin-contact {
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  width: 50%;
}
form {
  text-align: left;
  padding: var(--spacing-large);
  /* border: 1px solid; */
  border-radius: 10px;
}
select,
textarea {
  width: 100%;
  padding: var(--spacing-small);
  border: 1px solid #ccc;
  border-radius: 5px;
  box-sizing: border-box;
  margin-top: var(--spacing-xsmall);
  margin-bottom: var(--spacing-base);
  resize: vertical;
  background: transparent;
}
textarea {
  resize: none;
}

label {
  color: var(--primary-900);
  display: inline-block;
  margin: var(--spacing-regular) 0 var(--spacing-base);
  font-size: var(--text-xsmall);
  font-weight: bold;
  text-transform: uppercase;
}
button {
  background: var(--primary-900);
  color: var(--neutral-200);
  border: 0;
  padding: var(--spacing-small) var(--spacing-regular);
  margin-top: var(--spacing-regular);
  border-radius: 6px;
  cursor: pointer;
  width: 30%;
  margin-left: 70%;
}
input {
  display: block;
  padding: var(--spacing-small) var(--spacing-xsmall);
  width: 100%;
  box-sizing: border-box;
  border: none;
  border-bottom: 1px solid var(--neutral-600);
  color: var(--neutral-600);
}
.submit {
  text-align: center;
}
@media screen and (max-width: 768px) {
  .admin-contact {
    width: 100%;
  }
  form {
    border: none;
  }
}
</style>
