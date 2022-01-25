import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router';
import Home from '@/views/Home.vue'
import Login from '@/views/Login.vue' 

const routes: Array<RouteRecordRaw> = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {                  // 追加
    path: '/login',  // 追加
    name: 'Login',   // 追加
    component: Login // 追加
  },                 // 追加
  //{
    // path: '/about',
    // name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    // component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  // }
]