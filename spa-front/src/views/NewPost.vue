<template>
  <div class="flex items-center h-screen w- mx-auto bg-teal-lighter">
    <div class="w-full bg-white rounded shadow-lg p-8 m-4">
      <h1 class="block w-full text-center text-grey-darkest mb-6">New Post</h1>
      <div class="flex flex-col mb-4">
        <label class="mb-2 font-bold text-lg text-grey-darkest" for="title">Title</label>
        <input v-model='title' class="border py-2 px-3 text-grey-darkest" type="text" name="first_name" id="first_name">
      </div>
      <div class="flex flex-col mb-4">
        <label class="mb-2  font-bold text-lg text-grey-darkest" for="body">Body</label>
        <textarea v-model='body' cols="30" rows="8" class="border py-2 px-3 text-grey-darkest" name="body" id="body"></textarea>
      </div>
      <div class="flex flex-col mb-4">
        <label class="mb-2 font-bold text-lg text-grey-darkest" for="icatch">iCatch</label>
        <input @change="setIcatch($event)" accept="image/png,image/jpeg" class="border py-2 px-3 text-grey-darkest" type="file">
      </div>
      <button @click='handleCreatePost()' class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 uppercase text-lg mx-auto rounded" type="submit">Create Post</button>
    </div>
  </div>
</template>

<script lang="ts">
import { createPost } from '@/api/post'
import router from '@/router'
import { defineComponent, reactive, toRefs } from 'vue'

export default defineComponent({
  name: 'NewPost',
  setup () {
    const postData = reactive({
      title: '',
      body: ''
    })

    const formData = new FormData()

    const setIcatch = (e: Event) => {
      e.preventDefault()
      if (e.target instanceof HTMLInputElement && e.target.files) {
        formData.append('icatch', e.target.files[0])
      }
    }

    const handleCreatePost = async () => {
      formData.append('title', postData.title)
      formData.append('body', postData.body)
      await createPost(formData)
        .then(() => {
          router.push('/')
        })
    }

    return {
      ...toRefs(postData),
      handleCreatePost,
      setIcatch
    }
  }
})
</script>

<style scoped>

</style>
