import { createApp } from 'vue'
import App from '@/App.vue'
import router from '@/router'
import '@/assets/styles/tailwind.css'
import VueQrcode from '@chenfengyuan/vue-qrcode'
import { globalAuthState, authStateKey } from '@/state/global-state'

const app = createApp(App)
  .use(router)

if (VueQrcode.name) {
  app.component(VueQrcode.name, VueQrcode)
}

app.provide(authStateKey, globalAuthState()).mount('#app')
