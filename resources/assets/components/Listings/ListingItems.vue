<template>
    <div class="container">
        <feature-list title="Menu Items" :items="listingItems">
            <template slot-scope="listingItem">
                <div class="card">
                    <div class="commentsAndRatings"> 
                        <star-rating             
                            :rating="item.rating"
                            avtive-color="#000"
                            :read-only="true"
                            :star-size="15"
                            :show-rating="false"
                            style="margin: 5px 0"
                        /> 
                        |
                        <router-link :to="{name: 'listingItemComment'}"> Comments </router-link>
                    </div>

                    <hr>

                    <div class="card-horizontal">
                        <span class="listingItem">{{ listingItem.title }}</span>
                        <div class="prices price-gram">
                            <h3> gram </h3>
                            {{ listingItem.price_per_gram }}
                        </div>
                        <div class="prices price-eigth">
                            <h3> 1/8 </h3>
                            {{ listingItem.price_per_eigth }}
                        </div>
                        <div class="prices price-quarter">
                            <h3> 1/4 </h3>
                            {{ listingItem.price_per_quarter }}
                        </div>
                        <div class="prices price-half">
                            <h3> 1/2 </h3>
                            {{ listingItem.price_per_half }}
                        </div>
                        <div class="prices price-ounce">
                            <h3> Oz </h3>
                            {{ listingItem.price_per_ounce }}
                        </div>
                    </div>
                    <details>
                        <summary> About </summary>
                        <p>{{ listingItem.description }}</p>
                    </details>
                </div>
                <hr>
            </template>
        </feature-list>
    </div>
</template>

<script>
import axios from 'axios';
import StarRating from 'vue-star-rating';
import FeatureList from './FeatureList.vue';

export default {
    data() {
        return {
            listingItems: [],
            item: {
                rating: 3
            }
        }
    },
    components: {
        StarRating,
        FeatureList
    },
    methods: {
            fetchListingItems() {
            axios.get('/api/listingItems/' + this.$route.params.listing).then(res => {
                this.listingItems = res.data
                //commit('FETCH_LISTINGITEMS', listingItems)s
            }).catch(err => {
                console.log(err)
            })
        }
    },
    mounted() {
        this.fetchListingItems();
    }
}
</script>

<style>
.container {
    height: auto;
}
.list-item {
    width: 40vw;
    justify-content: center;
    width: 100%;
}
.card {
    display: flex;
    flex-direction: column;
}
.commentsAndRatings {
    display: flex;
    flex-direction: row;
}
.card-horizontal {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
}
.prices {
    display: flex;
    flex-direction: column;
}
</style>