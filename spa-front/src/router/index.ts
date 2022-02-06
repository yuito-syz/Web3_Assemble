import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router'
import Login from '@/views/Login.vue'
import Post from '@/views/Post.vue'
import PostDetail from '@/views/PostDetail.vue'
import NewPost from '@/views/NewPost.vue'
import Account from '@/views/Account.vue'
import { authorizeToken } from './guards'

const routes: Array<RouteRecordRaw> = [
  {
    path: '/login',
    name: 'Login',
    component: Login,
    meta: { requiresNotAuth: true }
  },
  {
    path: '/',
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
    path: '/posts/:id',
    name: 'PostDetail',
    component: PostDetail,
    meta: { requiresAuth: true }
  },
  {
    path: '/account',
    name: 'Account',
    component: Account,
    meta: { requiresAuth: true }
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})
router.beforeEach(authorizeToken)

export default router
