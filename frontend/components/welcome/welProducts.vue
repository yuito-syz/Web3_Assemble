<template>
  <v-row>
    <v-col
      cols="12"
      sm="6"
    >
      <v-list flat>
        <v-list-item
          v-for="(point, i) in points"
          :key="`point-${i}`"
        >
          <v-list-item-icon>
            <v-icon
              size="30"
              :color="point.color"
              v-text="point.icon"
            />
          </v-list-item-icon>
          <v-list-item-content>
            <div
              class="text-subtitle-1"
              v-text="point.text"
            />
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-col>
    <v-col
      cols="12"
      sm="6"
    >
      <v-sparkline
        :value="sparkline.value"
        :gradient="sparkline.gradient"
        :smooth="sparkline.radius || false"
        :padding="sparkline.padding"
        :line-width="sparkline.width"
        :stroke-linecap="sparkline.lineCap"
        :gradient-direction="sparkline.gradientDirection"
        :fill="sparkline.fill"
        :type="sparkline.type"
        :auto-line-width="sparkline.autoLineWidth"
        auto-draw
      />
    </v-col>
  </v-row>
</template>

<script>
export default {
  data () {
    const gradients = [
      ['#222'],
      ['#42b3f4'],
      ['red', 'orange', 'yellow'],
      ['purple', 'violet'],
      ['#00c6ff', '#F0F', '#FF0']
    ]
    return {
      points: [
        {
          icon: 'mdi-file-table-box-multiple-outline',
          color: 'blue',
          text: '直感的な操作で快適に事業計画書を作成'
        },
        {
          icon: 'mdi-chart-bar',
          color: 'green accent-4',
          text: 'KPIから考えた夢物語ではない経営計画値を算出'
        },
        {
          icon: 'mdi-chart-arc',
          color: 'deep-orange',
          text: 'ビジュアライズに優れたグラフツールで経営を可視化'
        }
      ],
      sparkline: {
        width: 4,
        radius: 10,
        padding: 4,
        lineCap: 'round',
        gradient: gradients[4],
        value: [0, 2, 5, 9, 5, 10, 8, 2, 9, 20],
        gradientDirection: 'right',
        gradients,
        fill: false,
        type: 'trend',
        autoLineWidth: true
      }
    }
  }
}
</script>