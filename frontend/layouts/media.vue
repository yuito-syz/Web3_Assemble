<template>
  <v-app>
    <v-app-bar>
      <app-logo/>
      <app-title/>
    </v-app-bar>
    <v-row
        justify="center"
      >
        <v-tabs
              v-model="tab"
              background-color="transparent"
              color="basil"
              grow
          >
          <v-tab
              v-for="item in items"
              :key="item"
          >
              {{ item }}
          </v-tab>
        </v-tabs>

        <v-tabs-items v-model="tab">
              <v-tab-item
                  v-for="item in items"
                  :key="item"
              >
                  <v-card
                      flat
                  >
                  <v-card-text>{{ text }}</v-card-text>
                  </v-card>
              </v-tab-item>
        </v-tabs-items>
    </v-row>
  
    <v-footer
      dark
      padless
    >
      <v-card
        flat
        tile
        class="indigo lighten-1 white--text text-center"
      >
        <v-card-text>
          <v-btn
            v-for="icon in icons"
            :key="icon"
            class="mx-4 white--text"
            icon
          >
            <v-icon size="24px">
              {{ icon }}
            </v-icon>
          </v-btn>
        </v-card-text>

        <v-card-text class="white--text pt-0">
          Phasellus feugiat arcu sapien, et iaculis ipsum elementum sit amet. Mauris cursus commodo interdum. Praesent ut risus eget metus luctus accumsan id ultrices nunc. Sed at orci sed massa consectetur dignissim a sit amet dui. Duis commodo vitae velit et faucibus. Morbi vehicula lacinia malesuada. Nulla placerat augue vel ipsum ultrices, cursus iaculis dui sollicitudin.
        </v-card-text>

        <v-divider></v-divider>

        <v-card-text class="white--text">
          {{ new Date().getFullYear() }} — <strong>Web3_Assemble</strong>
        </v-card-text>
      </v-card>
    </v-footer>
  </v-app>
</template>

<script>

export default {
  data () {
    return {
      tab: null,
      items: [
        'Web3.0', 'メタバース', 'MetaMask', 'DeFi', 'NFT', 'DAO',
      ],
      icons: [
        'mdi-facebook',
        'mdi-twitter',
        'mdi-linkedin',
        'mdi-instagram',
      ],
    }
  }
}
</script>