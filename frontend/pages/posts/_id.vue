<template>
  <v-container>
    <v-card>
      <v-card-text>
        {{ post.content }}
      </v-card-text>
      <v-button
        size="sm"
        @click="toTop()"
      >
        Topへ
      </v-button>
    </v-card>
  </v-container>
</template>

<script>
export default {
    data: () => {
        return {
        post: {},
        }
    },

    mounted() {
        this.fetchContent()
    },

    methods: {
        fetchContent() {
        const url = `/api/v1/posts/${this.$route.params.id}`
        this.$axios.get(url)
            .then((res) => {
                this.post = res.data.post
            })
            .catch(() => {
                this.toTop()
            })
        },
        toTop() {
        this.$router.push('/posts')
        },
    }
}
</script>
