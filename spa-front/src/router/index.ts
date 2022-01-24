import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router';
import Home from '@/views/Home.vue' // @記法に修正
import Login from '@/views/Login.vue' // 追加

const routes: Array<RouteRecordRaw> = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {                  
    path: '/login',  
    name: 'Login', 
    component: Login 
  }
]