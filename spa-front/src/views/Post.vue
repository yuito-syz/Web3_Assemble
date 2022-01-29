<template>
    <div class="grid grid-cols-3 gap-1">
      <AppPost :post="post" v-for="(post, index) in posts" :key="index" />
    </div>
  </template>
  
  <script lang="ts">
  import { defineComponent, onMounted, ref } from 'vue'
  import AppPost from '@/components/AppPost.vue'
  import { getPosts } from '@/api/post'
  import { Post } from '@/types/post'
  
  export default defineComponent({
    name: 'Post',
    components: {
      AppPost
    },
  
    setup () {
      const posts = ref([] as Post[])
      const onGetPosts = async () => {
        await getPosts()
          .then((res) => {
            posts.value = res
          })
          .catch((err: Error) => {
            console.info(err.message)
            alert('原因不明のエラーが発生しました。リロードすることで解決することがあります。')
          })
      }
  
      onMounted(() => {
        onGetPosts()
      })
  
      return {
        posts
      }
    }
  })
  </script>
  