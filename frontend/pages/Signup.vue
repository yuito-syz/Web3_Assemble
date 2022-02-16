<template> 
  <container> 
    <cols offset-md="1" md="10" class="mt-3">
      <h3 class="text-center">登録ページ</h3>

      <Notification :message="error" v-if="error" class="mb-4 pb-3" />

      <form @submit.prevent="signup">
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
    async signup() {
      try{
        await this.$axios.post('/api/auth',{
            name: this.name,
            email: this.email,
            password: this.password,
            password_confirmation: this.password_confirmation
        })    
        await this.$auth.loginWith('local', {
          data: {
            password: this.password,
            email: this.email
          },
        })    
      }catch(e){
        this.error = e.response.data.errors.full_messages
      }
    }
  }
}
</script>

<style></style>