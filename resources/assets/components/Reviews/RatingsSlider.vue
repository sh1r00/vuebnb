<template>
  <div class="slider">
    <div class="slider__wrapper">
      <div v-if="!hideLabel" :style="{ left: position }" class="slider__label">{{ sliderLabel }}</div>
      <div class="slider__track" :class="{'slider__track--rectangular': !raising}">
        <div
          v-if="raising"
          :style="{ 'border-left-width': sliderWidth + 'px' }"
          class="slider__track-top"
        />
        <div
          v-if="raising"
          :style="{ 'border-right-width': sliderWidth + 'px' }"
          class="slider__track-bottom"
        />
      </div>
      <input
        ref="slider"
        v-model="sliderValue"
        :max="sliderMax"
        class="slider__input"
        type="range"
        :min="sliderMin"
        :step="step"
        @input="update"
        @change="change"
      />
    </div>
  </div>
</template>

<script>
export default {
  props: {
    value: {
      type: String,
      required: false,
      default: ""
    },
    values: {
      type: Array,
      required: false,
      default: () => []
    },
    min: {
      type: String,
      required: false,
      default: "0"
    },
    max: {
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
      sliderWidth: 0,
      sliderValues: [],
      sliderValue: null,
      sliderMax: null,
      sliderMin: null
    };
  },
  computed: {
    sliderLabel() {
      // If using custom values, the custom label is returned, otherwise the value is also the label
      return this.sliderValues.length
        ? this.sliderValues[this.sliderValue - 1].label
        : this.sliderValue;
    },
    sliderOutputValue() {
      // If using custom values, the custom value is returned, otherwise just the default value
      return this.sliderValues.length
        ? this.sliderValues[this.sliderValue - 1].value
        : this.sliderValue;
    },
    position() {
      const val = this.sliderValue;
      // Measure width of slider element. Adjust by 20 to account for thumbsize
      const width = this.sliderWidth - 20;

      // Calculate percentage between left and right of input
      const percent =
        (val - this.sliderMin) / (this.sliderMax - this.sliderMin);

      // Janky value to get pointer to line up better
      const offset = -2;

      const position = width * percent + offset;

      return `${position}px`;
    }
  },
  created() {
    // Set local values, depending on use of custom or default
    if (this.values.length) {
      this.sliderValues = this.values;
      this.sliderMin = "1";
      this.sliderMax = this.sliderValues.length;

      // Find the corresponding custom value, and set the local sliderValue
      let index = 0;
      this.values.map((item, i) => {
        if (item.value === this.value) {
          index = i;
        }
        return true;
      });
      this.sliderValue = index + 1;
    } else {
      // In case of using default slider methods
      this.sliderMin = this.min;
      this.sliderMax = this.max;
      this.sliderValue = this.value;
    }
  },
  mounted() {
    this.$nextTick(() => {
      this.sliderWidth = this.$refs.slider.clientWidth;
    });
  },
  methods: {
    update() {
      this.$emit("input", this.sliderOutputValue);
    },
    change() {
      this.$emit("change", this.sliderOutputValue);
    }
  }
};
</script>

<style lang="scss" scoped>
$label-color: #333 !default;
$label-background: white !default;
$label-shadow: 0 10px 20px -5px rgba(45, 45, 45, 0.25);

$slider-track-background: #4fc08d !default;
$slider-track-height: 3px !default;

$thumb-background: #eee !default;
$thumb-size: 20px;

.slider {
  position: relative;
  margin-top: 50px;
  margin-bottom: 30px;
  width: 100%;
  display: flex;
  flex-direction: column;

  &__label {
    position: absolute;
    top: -17px;
    background: $label-background;
    color: $label-color;
    font-weight: bold;
    padding: 2px 5px;
    font-size: 12px;
    text-align: center;
    transform: translateX(-50%);
    margin-left: 1em;
    box-shadow: $label-shadow;
    min-width: 30px;
    white-space: nowrap;

    &:after {
      content: "";
      position: absolute;
      bottom: -10px;
      height: 0;
      width: 0;
      left: 0;
      right: 0;
      margin: auto;
      border: 5px solid transparent;
      border-top-color: $label-background;
    }
  }

  &__wrapper {
    position: relative;
    display: flex;
    align-items: center;
  }

  &__track {
    width: 100%;
    position: absolute;
    z-index: 0;
    height: 3px;
    background: $slider-track-background;

    &--rectangular {
      height: $slider-track-height;
    }
  }

  &__track-top,
  &__track-bottom {
    content: "";
    width: 100%;
    position: absolute;
    width: 0;
    height: 0;
    border-style: solid;
  }

  &__track-top {
    top: -6px;
    border-width: 0 0 6px 500px;
    border-color: transparent transparent $slider-track-background transparent;
  }

  &__track-bottom {
    top: 3px;
    border-width: 0 500px 6px 0;
    border-color: transparent $slider-track-background transparent transparent;
  }

  &__input {
    -webkit-appearance: none;
    margin: 10px 0;
    width: 100%;
    background: none;
    padding: 0;
    z-index: 1;
    position: relative;

    &:focus {
      outline: none;
    }
    &::-webkit-slider-runnable-track {
      width: 100%;
      height: 10px;
      cursor: pointer;
      animate: 0.2s;
      background: transparent;
      border-radius: 0;
      border: none;
    }

    // Thumb
    &::-webkit-slider-thumb {
      height: $thumb-size;
      width: $thumb-size;
      border-radius: 50%;
      cursor: pointer;
      -webkit-appearance: none;
      margin-top: -5px;
      background: $thumb-background;
    }
    &::-moz-range-thumb {
      height: $thumb-size;
      width: $thumb-size;
      border-radius: 50%;
      background: $thumb-background;
      cursor: pointer;
      border: none;
    }
    &::-ms-thumb {
      height: $thumb-size;
      width: $thumb-size;
      border-radius: 50%;
      background: $thumb-background;
      cursor: pointer;
    }

    // Track

    &:focus::-webkit-slider-runnable-track {
      background: transparent;
    }

    &::-moz-range-track {
      width: 100%;
      height: 10px;
      cursor: pointer;
      animate: 0.2s;
      background: transparent;
      border-radius: 0;
    }

    &::-ms-track {
      width: 100%;
      height: 10px;
      cursor: pointer;
      animate: 0.2s;
      background: transparent;
      border-color: transparent;
      border-width: 10px 0;
      border-radius: 0;
      color: transparent;
    }
    &::-ms-fill-lower {
      background: transparent;
      border: none;
      border-radius: 0;
    }
    &::-ms-fill-upper {
      background: transparent;
      border: none;
      border-radius: 0;
    }
  }
}
</style>