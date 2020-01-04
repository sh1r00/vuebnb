<template>
    <div class="review-container">
        <button class="btn btn-review" @click.stop="openReviewModal()">
            Add a Review
        </button>
        <modal-window ref="reviewModal">
            <div class="sliderContainer">
                <div class="sliderWrapper">
                    <ratings-slider
                        :name="slider1.name"
                        :title="slider1.title"
                        :labels="slider1.labels"
                        :icons="slider1.icons"
                        :sliderMin="slider1.min"
                        :sliderMax="slider1.max"
                        raising @change="persistChange"
                    >
                        {{ slider1.name }}
                    </ratings-slider>
                </div>
                <div class="sliderWrapper">
                    <ratings-slider
                        :name="slider2.name"
                        :title="slider2.title"
                        :labels="slider2.labels"
                        :icons="slider2.icons"
                        :sliderMin="slider2.min"
                        :sliderMax="slider2.max"
                        raising @change="persistChange"
                    >
                        {{slider2.name}}
                    </ratings-slider>
                </div>
                <div class="sliderWrapper">
                    <ratings-slider
                        :name="slider3.name"
                        :title="slider3.title"
                        :labels="slider3.labels"
                        :icons="slider3.icons"
                        :sliderMin="slider3.min"
                        :sliderMax="slider3.max"
                        raising @change="persistChange"
                    >
                        {{slider3.name}}
                    </ratings-slider>
                </div>
            </div>
        </modal-window>
    </div>
</template>

<script>
import RatingsSlider from '../Reviews/RatingsSlider.vue'
import ModalWindow from '../Helper/ModalWindow.vue'

export default {
    components: {
        RatingsSlider,
        ModalWindow
    },
    data() {
        return {
            slider1: {
                value: '',
                min: '0',
                max: '4',
                name: 'slider1',
                title: 'Slider One',
                labels: [
                    "Not at all",
                    "A tiny bit",
                    "Its ok",
                    "Its very good",
                    "Its AMAZING!",
                ],
                icons: [
                    'mdi-emoticon-angry',
                    'mdi-emoticon-confused',
                    'mdi-emoticon-neutral',
                    'mdi-emoticon',
                    'mdi-emoticon-cool'
                ]
            },
            slider2: {
                value: '',
                min: '0',
                max: '4',
                name: 'slider2',
                title: 'Slider Two',
                labels: [
                    "Not at all",
                    "A tiny bit",
                    "Its ok",
                    "Its very good",
                    "Its AMAZING!",
                ],
                icons: [
                    'mdi-emoticon-angry',
                    'mdi-emoticon-confused',
                    'mdi-emoticon-neutral',
                    'mdi-emoticon',
                    'mdi-emoticon-cool'
                ]
            },
            slider3: {
                value: '',
                min: '0',
                max: '4',
                name: 'slider3',
                title: 'Slider Three',
                labels: [
                    "Not at all",
                    "A tiny bit",
                    "Its ok",
                    "Its very good",
                    "Its AMAZING!",
                ],
                icons: [
                    'mdi-emoticon-angry',
                    'mdi-emoticon-confused',
                    'mdi-emoticon-neutral',
                    'mdi-emoticon',
                    'mdi-emoticon-cool'
                ]
            },
        }
    },
    methods: {
        persistChange(payload) {
            let payloadName = payload.name
            let payloadValue = payload.value

            if (payloadName === 'slider1'){
                this.slider1.value = payloadValue
            } else if (payloadName === 'slider2'){
                this.slider2.value = payload.value
            }else if (payloadName === 'slider3') {
                this.slider3.value = payload.value
            }
        },
      openReviewModal() {
          this.$refs.reviewModal.modalOpen = true;
      }
    }
}
</script>

<style>
.sliderContainer {
    background-color: white;
    height: auto;
    width: auto;
    display: flex;
    flex-direction: column;
}
modal-window >>> .sliderWrapper {
    height: auto;
    max-width: 300px;
    padding: 25px;
    display: flex;
    align-items: center;
    justify-content: center;
}
</style>