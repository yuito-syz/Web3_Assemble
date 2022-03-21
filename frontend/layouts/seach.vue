<template>
    <v-card>
        <v-app-bar
            flat
            color="rgba(0, 0, 0, 0)"
        >
        <v-btn
            icon
            large
            class="mr-5"
            @click="pageBack"
        >
            <v-icon>mdi-arrow-left</v-icon>
        </v-btn>
        <v-toolbar-title>
            検索
        </v-toolbar-title>
        </v-app-bar>
        <v-divider />
        <v-form>
        <v-container>
         <v-row
           class="pt-7 pl-5 pr-5"
         >
           <v-text-field
             v-model="keyword"
             outlined
             rounded
             label="検索ワードを入力"
             append-outer-icon="mdi-magnify"
             @click:append-outer="search"
           >
           </v-text-field>
         </v-row>
        </v-container>
        </v-form>
        <v-divider />
        <v-tabs
            v-model="tab"
            color="primary accent-10"
            grow
        ><v-tab>投稿</v-tab>
       <v-tab>ユーザー</v-tab>
        </v-tabs>
        <v-tabs-items v-model="tab">
            <v-tab-item>
         <div v-if="posts.length > 0">
           <v-card-text class="ml-2">投稿検索({{ posts.length }})件</v-card-text>
         </div>
         <comment-card
           v-for="post in posts"
           :key="post.id"
           :content-id="post.id"
           :keyword="keyword"
         />
            </v-tab-item>
            <v-tab-item>
         <div v-if="users.length > 0">
           <v-card-text class="ml-2">ユーザー検索({{ users.length}})件</v-card-text>
         </div>
         <user-follow-card
           v-for="user in users"
           :key="user.id"
           :user="user"
           :followingUsers="followingUsers"
           :keyword="keyword"
         />
            </v-tab-item>
        </v-tabs-items>
   </v-card>
</template>
<script>
import { mapGetters } from 'vuex'
export default {
    data () {
        return {
            tab: null,
            keyword: '',
            loading: false,
            posts: [],
            users: [],
            followingUsers: []
        }
    },
    computed: {
        ...mapGetters({
            currentUserId: 'auth/currentUserId'
        })
    },
    mounted () {
        setTimeout(() => {
            this.fetchFolowingUser()
        }, 100)
    },
    methods: {
        search () {
            this.loading = true
            const url = 'api/v1/search'
            this.$axios.get(url, { params: { keyword: this.keyword } })
            .then((res) => {
                this.posts = res.data.posts
                this.users = res.data.users
            })
            .catch((err) => {
                console.log(err)
            })
        },
        fetchFolowingUser () {
            const url = `api/v1/users/${this.currentUserId}/following_users`
            this.$axios.get(url)
            .then((res) => {
                this.followingUsers = res.data.following_users
            })
            .catch((err) => {
                console.log(err)
            })
        },
        pageBack () {
            this.$router.go(-1)
        }
    }
}
</script>