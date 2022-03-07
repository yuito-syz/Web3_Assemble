<template>
  <div id="logged-in-home">
    <v-parallax>
        <v-container
          fill-height
        >
          <v-row
            justify="center"
            align="center"
          >
            <v-col
              cols="12"
              :sm="container.sm"
              :md="container.md"
            >
              <v-card-title class="white--text">
                最近のプロジェクト
              </v-card-title>

              <v-divider dark />

              <v-row
                align="center"
              >
                <v-col
                  cols="12"
                  :sm="card.sm"
                  :md="card.md"
                >
                  <v-btn
                    block
                    :height="card.height"
                    :elevation="card.elevation"
                  >
                    <div>
                      <v-icon
                        size="24"
                        color="myblue"
                        class="my-2"
                      >
                        mdi-plus
                      </v-icon>
                      <div class="caption myblue--text">
                        プロジェクトを追加
                      </div>
                    </div>
                  </v-btn>
                </v-col>
                <v-col
                  v-for="(project, i) in recentProjects.slice(0, 2)"
                  :key="`card-project-${i}`"
                  cols="12"
                  :sm="card.sm"
                  :md="card.md"
                >
                  <v-card
                    block
                    :height="card.height"
                    :elevation="card.elevation"
                    :to="$my.projectLinkTo(project.id)"
                    class="v-btn text-capitalize"
                  >
                    <v-card-title class="pb-1 d-block text-truncate">
                      {{ project.name }}
                    </v-card-title>
                    <v-card-text class="caption">
                      <v-icon size="14">
                        mdi-update
                      </v-icon>
                      {{ $my.format(project.updatedAt) }}
                    </v-card-text>
                  </v-card>
                </v-col>
              </v-row>
            </v-col>
          </v-row>
        </v-container>
    </v-parallax>
    <v-container>
      <v-row justify="center">
        <v-col
          cols="12"
          :sm="container.sm"
          :md="container.md"
        >
          <v-card-title>
            全てのプロジェクト
          </v-card-title>

          <v-divider class="mb-4" />

          <v-data-table
            :headers="tableHeaders"
            :items="recentProjects"
            item-key="id"
            hide-default-footer
          >
            <template v-slot:[`item.name`]="{ item }">
              <nuxt-link
                :to="$my.projectLinkTo(item.id)"
                class="text-decoration-none"
              >
                {{ item.name }}
              </nuxt-link>
            </template>
            <template v-slot:[`item.updatedAt`]="{ item }">
              {{ $my.format(item.updatedAt) }}
            </template>
          </v-data-table>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>

export default {
  layout ({ store }) {
    return store.state.loggedIn ? 'default' : 'welcome'
  },
  data () {
    return {
      container: {
        sm: 10,
        md: 8
      },
      card: {
        sm: 6,
        md: 4,
        height: 120,
        elevation: 4
      },
      tableHeaders: [
        {
          text: '名前',
          value: 'name'
        },
        {
          text: '更新日',
          width: 150,
          value: 'updatedAt'
        }
      ]

    }
  },
  computed: {
    recentProjects () {
      const copyProjects = Array.from(this.$store.state.projects)
      return copyProjects.sort((a, b) => {
        if (a.updatedAt > b.updatedAt) { return -1 }
        if (a.updatedAt < b.updatedAt) { return 1 }
        return 0
      })
    }
  }
}
</script>

<!-- css 追加 -->
<style lang="scss">
#logged-in-home {
  .v-parallax__content {
    padding: 0;
  }
}
</style>