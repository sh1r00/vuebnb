<template>
    <div class="review-container">
        <button class="btn btn-review" @click.stop="openReviewModal()">
            Add a Review
        </button>
        <modal-window ref="reviewModal">
            <div class="sliderContainer">
                <div class="sliderWrapper">
                    <ratings-slider :name="slider1.name" :values="slider1.values" raising @change="persistChange">
                    </ratings-slider>
                </div>
                <div class="sliderWrapper">
                    <ratings-slider :name="slider2.name" :values="slider2.values" raising @change="persistChange">
                        {{slider2.name}}
                    </ratings-slider>
                </div>
                <div class="sliderWrapper">
                    <ratings-slider :name="slider3.name" :values="slider3.values" raising @change="persistChange">
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
                name: 'slider1',
                value: '',
                values: [
                    {
                        label: "Not at all",
                        value: "a"
                    },
                    {
                        label: "A tiny bit",
                        value: "b"
                    },
                    {
                        label: "Its ok",
                        value: "c"
                    },
                    {
                        label: "Its very good",
                        value: "d"
                    },
                    {
                        label: "Its AMAZING!",
                        value: "e"
                    }
                ],
            },
            slider2: {
                name: 'slider2',
                value: '',
                values: [
                    {
                        label: "Not at all",
                        value: "a"
                    },
                    {
                        label: "A tiny bit",
                        value: "b"
                    },
                    {
                        label: "Its ok",
                        value: "c"
                    },
                    {
                        label: "Its very good",
                        value: "d"
                    },
                    {
                        label: "Its AMAZING!",
                        value: "e"
                    }
                ],
            },
            slider3: {
                name: 'slider3',
                value: '',
                values: [
                    {
                        label: "Not at all",
                        value: "a"
                    },
                    {
                        label: "A tiny bit",
                        value: "b"
                    },
                    {
                        label: "Its ok",
                        value: "c"
                    },
                    {
                        label: "Its very good",
                        value: "d"
                    },
                    {
                        label: "Its AMAZING!",
                        value: "e"
                    }
                ],
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
modal-window >>> .sliderContainer {
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