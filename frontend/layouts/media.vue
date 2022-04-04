<template>
  <v-app>
    <v-app-bar
      max-height="100"  
      class="px-14"
    >
      <app-logo/>
      <app-title/>
  
    </v-app-bar>
    
    <v-main>
      <v-container
        class="pa-0 mb-10"
      >
        <v-col>
          <v-row
            justify="center"
          >
            <v-tabs
                  v-model="tab"
                  background-color="transparent"
                  color="basil"
                  grow
                  class="mx-16, my-2"
              >
              <v-tab
                  v-for="item in items"
                  :key="item"
              >
                  {{ item }}
              </v-tab>
            </v-tabs>
          </v-row>
        </v-col>
        <v-row>
          <v-col>
            <v-card height="300"></v-card>
          </v-col>
        </v-row>
        <v-row
          justify="center"
        >
          <v-col
            v-for="n in 2"
            :key="n"
            cols="6"
          >
            <v-card height="200"></v-card>
          </v-col>
        </v-row>
        <v-row>
          <v-col>
            <v-sheet rounded="lg">
              <v-list two-line>
                <template v-for="n in 6">
                  <v-list-item
                    :key="n"
                  >
                    <v-list-item-avatar color="grey darken-1">
                    </v-list-item-avatar>

                    <v-list-item-content>
                      <v-list-item-title>Message {{ n }}</v-list-item-title>

                      <v-list-item-subtitle>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil repellendus distinctio similique
                      </v-list-item-subtitle>
                    </v-list-item-content>
                  </v-list-item>

                  <v-divider
                    v-if="n !== 6"
                    :key="`divider-${n}`"
                    inset
                  ></v-divider>
                </template>
              </v-list>
            </v-sheet>
          </v-col>
        </v-row>
      </v-container>
    </v-main>

    <v-divider></v-divider>

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