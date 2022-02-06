<template>
  <div class="rounded overflow-hidden shadow-lg mt-8 pt-8 mr-8">
    <img class="mx-auto" :src="post.encoded_icatch">
    <div class="font-bold text-xl mb-2">{{ post.title }}</div>
    <p class="text-grey-darker text-base">
      {{ post.body }}
    </p>
  </div>
</template>

<script lang="ts">
import { defineComponent, onMounted, ref } from 'vue'
import { getPost } from '@/api/post'
import { useRoute } from 'vue-router'

export default defineComponent({
  name: 'PostDetail',
  setup () {
    const route = useRoute()
    const id = route.params.id as string
    const post = ref({})

    const onGetPost = async () => {
      await getPost(id)
        .then((res) => {
          post.value = res
        })
    }

    onMounted(() => {
      onGetPost()
    })

    return {
      post
    }
  }
})
</script>
