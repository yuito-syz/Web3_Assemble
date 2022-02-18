<template>
    <v-app-bar
        app
        dark
        > 
        <v-avatar>
            <app-logo/>
        </v-avatar>

        <v-toolbar-title>
            goodbooking
        </v-toolbar-title>

        <v-spacer />

        <v-toolbar-items class="ml-2">
        <v-btn
            v-for="(menu, i) in menus"
            :key="`menu-btn-${i}`"
            text
        >
            {{ $t(`menus.${menu.title}`) }}
        </v-btn>
        </v-toolbar-items>
    </v-app-bar>
</template>

<script>
import appLogo from '../ui/appLogo'
export default {
    components: { appLogo },
    props: {
        menus: {
        type: Array,
        default: () => []
        }
    },
    el: '#app'
}
</script>
