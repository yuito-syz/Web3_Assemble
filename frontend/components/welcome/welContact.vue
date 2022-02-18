<template>
  <v-row
    justify="center"
  >
    <v-col
      cols="12"
      sm="10"
      md="8"
    >
      <v-form
        ref="contact"
        v-model="isValid"
      >
        <v-container>
          <v-row>
            <v-col
              cols="12"
              sm="6"
            >
              <v-text-field
                v-model="name"
                :rules="nameRules"
                :disabled="sentIt"
                label="名前(必須)"
                outlined
              />
            </v-col>
            <v-col
              cols="12"
              sm="6"
            >
              <v-text-field
                v-model="email"
                :rules="emailRules"
                :disabled="sentIt"
                label="メールアドレス(必須)"
                outlined
                validate-on-blur
              />
            </v-col>
          </v-row>

          <v-textarea
            v-model="contents"
            :rules="contentRules"
            :disabled="sentIt"
            label="お問合せの内容をお聞かせください(必須)"
            rows="5"
            outlined
            auto-grow
          />

          <v-btn
            :disabled="!isValid || loading || sentIt"
            :loading="loading"
            color="primary"
            class="mr-2"
            @click="onSend"
          >
            送信する
          </v-btn>

          <v-btn
            text
            @click="formReset"
          >
            キャンセル
          </v-btn>
          <div class="grey--text">
            <small>実際には送信されません</small>
          </div>
        </v-container>
      </v-form>
    </v-col>
    <v-snackbar
      v-model="sentIt"
      timeout="-1"
      color="primary"
    >
      お問合せ内容が送信されました。メールアドレスへ担当者よりご連絡いたします。
      <template v-slot:action="{ attrs }">
        <v-btn
          color="white"
          text
          v-bind="attrs"
          @click="formReset"
        >
          Close
        </v-btn>
      </template>
    </v-snackbar>
  </v-row>
</template>

<script>
export default {
  data () {
    return {
      isValid: false,
      name: '',
      nameRules: [
        v => !!v || '名前を入力してください'
      ],
      email: '',
      emailRules: [
        v => !!v || 'メールアドレスを入力してください',
        v => /.+@.+\..+/.test(v) || 'メールアドレスが正しくありません'
      ],
      contents: '',
      contentRules: [
        v => !!v || 'お問合せ内容を入力してください'
      ],
      loading: false,
      sentIt: false
    }
  },
  methods: {
    onSend () {
      this.loading = true
      setTimeout(() => {
        this.loading = false
        this.sentIt = true
      }, 1500)
    },
    formReset () {
      this.sentIt = false
      this.$refs.contact.reset()
    }
  }
}
</script>