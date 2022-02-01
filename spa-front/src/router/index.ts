import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router'
import Home from '@/views/Home.vue'
import Login from '@/views/Login.vue'
import Post from '@/views/Post.vue'
import NewPost from '@/views/NewPost.vue'
import Account from '@/views/Account.vue' 
import { authorizeToken } from './authGuard' 

const routes: Array<RouteRecordRaw> = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {                  
    path: '/login', 
    name: 'Login', 
    component: Login,
    meta: { requiresNotAuth: true } 
  },  
  {
    path: '/posts',
    name: 'Post',
    component: Post,
    meta: { requiresAuth: true }
  },
  {
    path: '/posts/new',
    name: 'NewPost',
    component: NewPost,
    meta: { requiresAuth: true }
  },
  {
    path: '/account',
    name: 'Account',
    component: Account,
    meta: { requiresAuth: true }
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

router.beforeEach(authorizeToken) 
export default router
