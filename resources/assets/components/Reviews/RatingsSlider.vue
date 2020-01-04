<template>
  <v-row>
    <v-col class="pa-12">
      <h1>
        {{ title }}
      </h1>
      <v-slider
        :tick-labels="labels"
        :color="color"
        :track-color="grey"
        v-model="sliderValue"
        always-dirty
        :min="sliderMin"
        :max="sliderMax"
        ticks="always"
        tick-size="4"
        :style="{ 'border-left-width': sliderWidth + 'px' }"
        class="slider__track-top"
        @input="update"
        @change="change"
      >
        <template v-slot:thumb-label="props">
          <v-icon
            dark
          >
            {{ emotion(props.value) }}
          </v-icon>
        </template>
      </v-slider>
    </v-col>
  </v-row>
</template>

<script>
  export default {
    props: {
      name: {
        type: String,
        required: true,
        default: 'slider'
      },
      title: {
        type: String,
        required: false,
        default: 'unknown slider'
      },
      value: {
        type: String,
        required: false,
        defaule: ''
      },
      labels: {
        type: Array,
        required: false,
        default: () => []
      },
      icons: {
        type: Array,
        required: false,
        default: () => []
      },
      sliderMin: {
        type: String,
        required: false,
        default: "0"
      },
      sliderMax: {
        type: String,
        required: false,
        default: "100"
      },
      step: {
        type: String,
        required: false,
        default: "1"
      },
      hideLabel: {
        type: Boolean,
        required: false,
        default: false
      },
      raising: {
        type: Boolean,
        required: false,
        default: false
      }
    },
    data() {
      return {
        sliderValue: null,
      }
    },
    computed: {
      color () {
        const fifth = this.sliderMax * 1/5
        const twoFifth = this.sliderMax * 2/5
        const threeFifth = this.sliderMax * 3/5
        const fourFifth = this.sliderMax * 4/5
        if (this.sliderValue <= fifth) return 'red'
        if (this.sliderValue <= twoFifth) return 'orange'
        if (this.sliderValue <= threeFifth) return 'yellow'
        if (this.sliderValue <= fourFifth) return 'green'
        if (this.sliderValue <= this.max) return 'teal'
      }
    },
    mounted() {
      this.$nextTick(() => {
        this.sliderWidth = this.$refs.slider.clientWidth
      })
    },
    methods: {
      emotion (val) {
        return this.icons[val]
      },
      update() {
        this.$emit('input', this.sliderValue);
      },
      change() {
        this.$emit('change', {'name': this.name, 'value': this.sliderValue});
      }
    }
  }
</script>

<style>
.slider__track-bottom {
  position: relative;
  margin-top: 50px;
  margin-bottom: 30px;
  width: 100%;
  display: flex;
  flex-direction: column;
  content: "";
  position: absolute;
  border-style: solid;
}
</style>