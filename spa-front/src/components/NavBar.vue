<template>
  <nav class="w-full bg-gray-800">
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
        <div v-if="isUserSignedIn()" class="absolute inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0">
          <div class="ml-3 relative">
            <div>
              <button class="bg-gray-800 flex text-sm rounded-full focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-800 focus:ring-white" id="user-menu" aria-haspopup="true">
              <button @click='moveAccount()' class="bg-gray-900 text-white px-3 py-2 rounded-md text-sm font-medium">MyPage</button>
              </button>
            </div>
          </div>
        </div>
        <div v-if="isUserSignedIn()" class="absolute inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0">
          <div class="ml-3 relative">
            <div>
              <button @click='moveNewPost()' class="bg-gray-900 text-white px-3 py-2 rounded-md text-sm font-medium">create Post</button>
            </div>
          </div>
        </div>
        <div v-if="isUserSignedIn()" class="absolute inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0">
          <div class="ml-3 relative">
            <div>
              <button @click='handleLogOut()' class="bg-gray-900 text-white px-3 py-2 rounded-md text-sm font-medium">Log Out</button>
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
import { logout } from '@/api/auth'
import { useState } from '@/state/use-state'

export default defineComponent({
  name: 'NavBar',

  setup () {
    const state = useState()

    const movePosts = () => {
      router.push('/')
    }

    const moveNewPost = () => {
      router.push('/posts/new')
    }

    const moveAccount = () => {
      router.push('/account')
    }

    const handleLogOut = async () => {
      await logout()
        .then(() => {
          state.removeAuthState()
          router.push('/login')
        })
    }

    const isUserSignedIn = () => {
      if (state.authState['access-token']) {
        return true
      } else {
        return false
      }
    }

    return {
      movePosts,
      moveNewPost,
      moveAccount,
      handleLogOut,
      isUserSignedIn
    }
  }
})
</script>
