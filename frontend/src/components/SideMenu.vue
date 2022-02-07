<template>
  <aside class="w-full lg:w-4/5 lg:px-6 text-xl text-gray-800 leading-normal">
    <div class="pb-8 mt-8">
      <p class="tracking-wide leading-7 text-gray-500">注目のタグ</p>
    </div>
    <div class="flex flex-wrap items-start">
      <div class="flex mb-6">
        <a class="mr-4">
          <div class="px-2 py-4 rounded-2xl relative bg-gray-100">
            <p class="text-gray-900 leading-6 text-xs">Technology</p>
          </div>
        </a>
      </div>
      <div class="flex mb-6">
        <a class="mr-4">
          <div class="px-2 py-4 rounded-2xl relative bg-gray-100">
            <p class="text-gray-900 leading-6 text-xs">General</p>
          </div>
        </a>
      </div>
      <div class="flex mb-6">
        <a class="mr-4">
          <div class="px-2 py-4 rounded-2xl relative bg-gray-100">
            <p class="text-gray-900 leading-6 text-xs">Politics</p>
          </div>
        </a>
      </div>
      <div class="flex mb-6">
        <a class="mr-4">
          <div class="px-2 py-4 rounded-2xl relative bg-gray-100">
            <p class="text-gray-900 leading-6 text-xs">Food</p>
          </div>
        </a>
      </div>
    </div>
  </aside>
</template>

<script lang="ts">
import { defineComponent } from 'vue'

export default defineComponent({
  name: 'SideMenu'
})
</script>
