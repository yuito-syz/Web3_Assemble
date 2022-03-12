<template>
  <div>
    <div v-if="isLiked" @click="deleteLike()">
      いいねを取り消す {{ count }}
    </div>
    <div v-else @click="registerLike()">
      いいねする {{ count }}
    </div>
  </div>
</template>

<script>
export default {
  // propsでrailsのviewからデータを受け取る
  props: ['userId', 'postId'],
  data() {
    return {
      likeList: []  // 例:{ id: 1, user_id: 1, post_id: 1 } 
    }
  },
  // 算出プロパティ ここではlikeListが変更される度に、count、isLiked が再構築される
  computed: {
    // いいね数を返す
    count() {
      return this.likeList.length
    },
    // ログインユーザが既にいいねしているかを判定する
    isLiked() {
      if (this.likeList.length === 0) { return false }
      return Boolean(this.findLikeId())
    }
  },
  // Vueインスタンスの作成・初期化直後に実行される
  created() {
    this.fetchLikeByPostId().then(result => {
      this.likeList = result
    })
  },
  methods: {
    // rails側のindexアクションにリクエストするメソッド
    async　fetchLikeByPostId() {
      const res = await axios.get(`/api/v1/likes/?post_id=${this.postId}`)
      if (res.status !== 200) {
        // エラー処理
      }
      return res.data
    },
    // rails側のcreateアクションにリクエストするメソッド
    async registerLike() {
      const res = await axios.post('/api/v1/likes', { post_id: this.postId })
      if (res.status !== 201) {
        // エラー処理
      }
      this.fetchLikeByPostId().then(result => {
        this.likeList = result
      })
    },
    // rails側のdestroyアクションにリクエストするメソッド
    async deleteLike() {
      const likeId = this.findLikeId()
      const res = await axios.delete(`/api/v1/likes/${likeId}`)
      if (res.status !== 200) {
        // エラー処理
      }
      this.likeList = this.likeList.filter(n => n.id !== likeId)
    },
    // ログインユーザがいいねしているlikeモデルのidを返す
    findLikeId() {
      const like = this.likeList.find((like) => {
        return (like.user_id === this.userId)
      })
      if (like) { return like.id }
    }
  }
}
</script>