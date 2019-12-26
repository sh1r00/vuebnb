<template>
    <div class="container">
        <div class="sliderContainer">
            <div class="sliderWrapper">
                <ratings-slider :values="slider1Values" raising :v-model="sliderOutputValue">
                    {{slider}}
                </ratings-slider>
            </div>
            <div class="sliderWrapper">
                <ratings-slider :values="slider2Values" raising :v-model="value.slider2">
                    {{slider2}}
                </ratings-slider>
            </div>
            <div class="sliderWrapper">
                <ratings-slider :values="slider3Values" raising :v-model="value.slider3">
                    {{slider3}}
                </ratings-slider>
            </div>
        </div>
        <listing-comments></listing-comments>
    </div>
</template>

<script>
import ListingComments from './ListingComments.vue'
import RatingsSlider from '../Reviews/RatingsSlider.vue'

export default {
    components: {
        ListingComments,
        RatingsSlider
    },
    data() {
        return {
            value: {
                slider1: '',
                slider2: '',
                slider3: ''
            },
            slider1: 'a',
            slider1Values: [
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
            slider2: 'b',
            slider2Values: [
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
            slider3: 'c',
            slider3Values: [
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
        }
    }
}
</script>

<style scoped>
.sliderContainer {
    height: auto;
    width: auto;
    display: flex;
    flex-direction: column;
}
.sliderWrapper {
    height: auto;
    max-width: 300px;
    padding: 25px;
    display: flex;
    align-items: center;
    justify-content: center;
}
</style>