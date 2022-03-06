<template>
  <v-container>
    <v-card width="400px" class="mx-auto mt-5">
      <v-card-title>
        <h1 class="display-1">
          ログイン
        </h1>
      </v-card-title>
      <v-card-text>
        <v-form ref="form" lazy-validation>
          <v-text-field
            v-model="email"
            prepend-icon="mdi-email"
            label="メールアドレス"
          />
          <v-text-field
            v-model="password"
            prepend-icon="mdi-lock"
            append-icon="mdi-eye-off"
            label="パスワード"
          />
          <v-card-actions>
            <v-btn
              color="light-green darken-1"
              class="white--text"
              @click="login"
            >
              ログイン
            </v-btn>
          </v-card-actions>
        </v-form>
      </v-card-text>
    </v-card>
  </v-container>
</template>

<script>
export default {
  // layout: 'beforeLogin',
  name: 'App',
  auth: false,
  data() {
    return {
      password: '',
      email: '',
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
  },
}
</script>