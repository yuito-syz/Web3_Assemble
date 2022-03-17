<template>
  <v-container>
    <v-card v-for="post in posts" :key="post.id" max-width="500" class="mx-auto mb-5" @click="toShow(post.id)">
      <v-card-text>
        {{ post.content }}
      </v-card-text>
    </v-card>

    <v-dialog v-model="dialog"  scrollable  max-width="80%">
      <template v-slot:activator="{ on }">
        <v-button class="position-absolute mt-4 action-btn" pill variant="primary" size="lg" v-on="on">
          +
        </v-button>
      </template>
      <v-textarea v-model="content" autofocus />
      <v-button class="mt-3" variant="primary" @click="save()" >
        保存
      </v-button>
    </v-dialog>
  </v-container>
</template>

<script>
export default {
  data: () => {
    return {
      posts: [],
      dialog: false
    }
  },

  mounted() {
    this.fetchContents()
  },

  methods: {
    fetchContents() {
      this.$axios.get('/api/v1/posts')
        .then((res) => {
          // リクエスト成功時の処理
          console.log(res)
        })
        .catch(() => {
          // リクエスト失敗時の処理
        })
    },

    save() {
      this.$axios.post('/api/v1/posts', this.params)
        .then((res) => {
          console.log(res)
          this.content = ''
          this.fetchContents()
          this.toast(res.data, {
            title: '成功',
            variant: 'success'
          })
        })
        .catch((err) => {
          const message = err.response.data
          this.toast(message, {
            title: 'エラー',
            variant: 'danger'
          })
        })
    },

    toShow(id) {
      this.$router.push(`/posts/${id}`)
    }
  }
}
</script>

<style scoped>
.action-btn {
  right: 16px;
}
</style>