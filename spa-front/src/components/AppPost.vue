<template>
  <div class="mt-8 pt-8">
    <div class="float-right">
      <img :src="post.icatch_url" class="rounded-2xl w-72 h-36">
    </div>
    <div class="text-xl mb-2 px-2 py-2">
      <a class="flex">
        <img :src="post.profile_image_url" class="rounded-2xl w-5 h-5">
        <div class="text-xs px-2">{{ post.name }} {{ formattedCreatedAt }}</div>
      </a>
      <p class="font-bold mt-2">{{ post.title }}</p>
    </div>
    <p class="text-grey-darker text-base px-2 text-gray-400">
      {{ truncatedText }}
    </p>
  </div>
</template>

<script lang="ts">
import { Post } from '@/types/post'
import { defineComponent, PropType } from 'vue'
import { formatDate } from '@/pipes/date-pipe'
import { truncateText } from '@/utils/truncate-text'

export default defineComponent({
  name: 'AppPost',
  props: {
    post: {
      type: Object as PropType<Post>,
      required: true
    }
  },

  setup (props) {
    const formattedCreatedAt = formatDate(props.post.created_at)
    const truncatedText = truncateText(props.post.body)

    return {
      formattedCreatedAt,
      truncatedText
    }
  }
})
</script>

<style scoped>

</style>
