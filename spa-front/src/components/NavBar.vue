<template>
    <nav class="bg-gray-800">
      <div class="max-w-7xl mx-auto px-2 sm:px-6 lg:px-8">
        <div class="relative flex items-center justify-between h-16">
          <div class="flex-1 flex items-center justify-center sm:items-stretch sm:justify-start">
            <div class="flex-shrink-0 flex items-center">
            </div>
            <div class="hidden sm:block sm:ml-6">
              <div class="flex space-x-4">
                <button @click='movePosts()' class="bg-gray-900 text-white px-3 py-2 rounded-md text-sm font-medium">Top</button>
              </div>
            </div>
          </div>
          <div class="absolute inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0">
            <div class="ml-3 relative">
              <div>
                <button class="bg-gray-800 flex text-sm rounded-full focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-800 focus:ring-white" id="user-menu" aria-haspopup="true">
                  <img class="h-8 w-8 rounded-full" src="../assets/logo.png">
                </button>
              </div>
            </div>
          </div>
          <div class="absolute inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0">
            <div class="ml-3 relative">
              <div>
                <button @click='moveNewPost()' class="bg-gray-900 text-white px-3 py-2 rounded-md text-sm font-medium">create Post</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </nav>
</template>
  
<script lang="ts">
  import { defineComponent } from 'vue'
  import router from '@/router'
  
  export default defineComponent({
    name: 'NavBar',
  
    setup () {
      const movePosts = () => {
        router.push('/posts')
      }
  
      const moveNewPost = () => {
        router.push('/posts/new')
      }
  
      return {
        movePosts,
        moveNewPost
      }
    }
  })
</script>