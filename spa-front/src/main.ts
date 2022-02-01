import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import '@/assets/styles/tailwind.css'
import VueQrcode from '@chenfengyuan/vue-qrcode'

const app = createApp(App).use(router)

if (VueQrcode.name) {
    app.component(VueQrcode.name, VueQrcode)
}
 
  
  app.mount('#app')