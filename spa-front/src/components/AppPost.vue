<template>
    <div class="rounded overflow-hidden shadow-lg mt-8 pt-8 mr-8">
      <div class="font-bold text-xl mb-2">{{post.title}}</div>
      <p class="text-grey-darker text-base">
        {{ post.body }}
      </p>
    </div>
</template>
  
<script lang="ts">
  import { Post } from '@/types/post'
  import { defineComponent, PropType } from 'vue'
  
  export default defineComponent({
    name: 'AppPost',
    props: {
      post: {
        type: Object as PropType<Post>,
        required: true
      }
    }
  })
</script>
  
<style scoped>
  
</style>