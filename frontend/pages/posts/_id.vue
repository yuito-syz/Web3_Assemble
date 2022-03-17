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
        <v-dialog>
            <template v-slot:activator="{ on }">
                <v-button
                    size="sm"
                    variant="success"
                    v-on="on"
                >
                    編集
                </v-button>
            </template>
            <v-textarea
                v-model="content"
            >
            </v-textarea>
            <v-button
                class="mt-3"
                variant="primary"
                :disabled="disabled"
                @click="update()"
            >
                更新
            </v-button>
        </v-dialog>
        <v-dialog>
            <template v-slot:activator="{ on }">
                <v-button
                    size="sm"
                    variant="danger"
                    v-on="on"
                >
                    削除
                </v-button>
            </template>
            <v-button
                @ok="destroy()"
            >
                <p>投稿を削除しますか？</p>
            </v-button>
        </v-dialog>
    </v-card>
  </v-container>
</template>

<script>
export default {
    data: () => {
        return {
            post: {
                content: this.content
            }
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
        update() {
            const url = `/api/v1/posts/${this.$route.params.id}`
            this.$axios.put(url, this.params)
            .then((res) => {
                this.fetchContent()
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
        destroy() {
            const url = `/api/v1/posts/${this.$route.params.id}`
            this.$axios.delete(url)
            .then(() => {
                this.toTop()
            })
            .catch((err) => {
                const message = err.response.data
                this.toast(message, {
                    title: 'エラー',
                    variant: 'danger'
                })
            })
        }
    }
}
</script>
