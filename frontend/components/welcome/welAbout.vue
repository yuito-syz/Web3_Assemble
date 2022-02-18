<template>
  <div>
    <v-card-title class="pb-8 text-subtitle-2 justify-center">
      このアプリケーションの作り方は、下記URLに公開されています。
    </v-card-title>
    <v-card-title class="text-subtitle-2 justify-center">
      「Rails6とNuxt.jsで作るユーザーJWT認証付きシングルページアプリケーション」
    </v-card-title>
    <v-card-text class="text-center">
      <a
        :href="blogUrl"
        rel="nofollow"
        target="_blank"
        class="text-decoration-none"
      >
        {{ blogUrl }}
      </a>
    </v-card-text>
    <v-card-title class="text-subtitle-2 justify-center">
      採用している技術
    </v-card-title>
    <v-container
      fluid
      :style="{ maxWidth: '960px' }"
    >
      <v-row justify="space-around">
        <div
          v-for="(tec, i) in technologies"
          :key="`tec-${i}`"
          class="text-center pa-2"
        >
          <v-avatar
            :color="tec.color"
            size="80"
          >
            <span class="white--text">
              {{ tec.name }}
            </span>
          </v-avatar>
          <div class="pt-2 text-body-2 my-grey">
            {{ tec.use }}
          </div>
          <div class="pt-2 text-body-2 my-grey">
            {{ tec.v }}
          </div>
        </div>
      </v-row>
    </v-container>
  </div>
</template>

<script>
export default {
  data () {
    return {
      blogUrl: 'https://blog.cloud-acct.com/categories/udemy',
      technologies: [
        { name: 'Docker', v: 'v19.03+', use: '開発環境', color: '#2496ED' },
        { name: 'Rails api', v: 'v6.0+', use: 'サーバーサイド', color: '#CC0000' },
        { name: 'Postgre SQL', v: '', use: 'データベース', color: '#336791' },
        { name: 'Nuxt.js spa', v: 'v2.13+', use: 'フロントエンド', color: '#00C48D' },
        { name: 'Heroku', v: '', use: 'ホスティング', color: '#6762A6' },
        { name: 'Vuetify', v: 'v2.3+', use: 'CSSフレームワーク', color: '#1867C0' }
      ]
    }
  }
}
</script>   