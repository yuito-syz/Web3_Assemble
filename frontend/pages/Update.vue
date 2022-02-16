<template> 
  <container> 
    <cols offset-md="1" md="10" class="mt-3">
      <h3 class = "form-title text-center">ユーザー情報変更</h3>
      <Notification :message="error" v-if="error" class="mb-4 pb-3" />

      <form @submit.prevent="update">
        <form-group label="名前:">
          <form-input placeholder="Enter your nickname" required v-model="name" type="text"></form-input>
        </form-group>
        <form-group label="メールアドレス:">
          <form-input placeholder="Enter email" required v-model="email" type="email"></form-input>
        </form-group>
        <form-group label="パスワード:">
          <form-input placeholder="Enter password" required v-model="password" type="password"></form-input>
        </form-group>
        <form-group label="パスワード確認用:">
          <form-input placeholder="password confirmation" required v-model="password_confirmation" type="password"></form-input>
        </form-group>
        <button block type="submit" variant="primary">Submit</button>
      </form>
    </cols>
  </container>
</template>

<script>

export default{
  middleware: 'auth',
  data: function () {
    return {
        name: '',
        email: '',
        password: '',
        password_confirmation: '',
        error: null
    }
  },
  methods: {
    async update() {
      try{
        await this.$axios.$put('/api/auth',{
            name: this.name,
            email: this.email,
            password: this.password,
            password_confirmation: this.password_confirmation
        })
        this.$router.push('/')
      }catch(e){
        this.error = e.response.data.errors.full_messages
      }
    }
  }
}
</script>

<style></style>