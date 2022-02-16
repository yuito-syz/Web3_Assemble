<template> 
    <container> 
      <cols offset-md="1" md="10" class="mt-3">
        <h3 class = "text-center">ログイン</h3>

          <Notification :message="error" v-if="error" class="mb-4 pb-3" />

          <form @submit.prevent="login">
            <form-group label="メールアドレス:">
              <form-input placeholder="Enter email" required v-model="email" type="email"></form-input>
            </form-group>
            <form-group label="パスワード:">
              <form-input placeholder="Enter password" required v-model="password" type="password"></form-input>
            </form-group>
            <button block type="submit" variant="primary">送信</button>
          </form>
      </cols>
    </container>
</template>

<script>
  export default {
    data: function () {
      return {
        email: '',
        password: '',
        error: null,
      }
    },
    methods: {
      async login() {
          await this.$auth.loginWith('local', {
            data: {
              password: this.password,
              email: this.email
            }
          })
          .then(
            (response) => {
            },
            (error) => {
              this.error = error.response.data.errors
            }
          )
      }
    }
  }
</script>

<style></style>