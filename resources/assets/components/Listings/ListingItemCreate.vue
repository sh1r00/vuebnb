<template>
    <div>
        <div class="listing-container">
            <div class="listingItemCreate listingItemCreate_name">
                <h1> Menu Item Title </h1>
                <input type="text" v-model="title" />
            </div>
            <hr>
            <div class="listingItemCreate listingItemCreate_description">
                <h2> Menu Item Description </h2>
                <textarea v-model="description"></textarea>
            </div>
            <hr>
            <div class="listingItemCreate listingItemCreate_strain">
                <h3> Strain </h3>
                <div class="listingItemCreate_strain__radio">
                    <label for="radio_indica">
                        <input id="radio_indica" type="radio" value="Indica" name="strainRadio" v-model="strain" />
                        <span> Indica </span>
                    </label>
                    <label for="radio_sativa">
                        <input id="radio_sativa" type="radio" value="Sative" name="strainRadio" v-model="strain" />
                        <span> Sativa </span>
                    </label>
                    <label for="radio_hybrid">
                        <input id="radio_hybrid" type="radio" value="Hybrid" name="strainRadio" v-model="strain" />
                        <span> Hybrid </span>
                    </label>
                </div>
            </div>
            <hr>
            <div class="listingItemCreate">
                <h3> Prices </h3>
                <div class=" listingItemCreate_prices">
                    <label id="listingItemCreate_price_per_gram">
                        <p> gram </p>
                        <input id="listingItemCreate_price_price_per_gram" type="number" v-model="price_per_gram" placeholder="$0.00" />
                    </label>
                    <label id="listingItemCreate_price_per_eigth">
                        <p> 1/8 </p>
                        <input id="listingItemCreate_price_price_per_eigth" type="number" v-model="price_per_eigth" placeholder="$0.00" />
                    </label>
                    <label id="listingItemCreate_price_per_quarter">
                        <p> 1/4 </p>
                        <input id="listingItemCreate_price_price_per_quarter" type="number" v-model="price_per_quarter" placeholder="$0.00" />
                    </label>
                    <label id="listingItemCreate_price_per_half">
                        <p> 1/2 </p>
                        <input id="listingItemCreate_price_price_per_half" type="number" v-model="price_per_half" placeholder="$0.00" />
                    </label>
                    <label id="listingItemCreate_price_per_gram">
                        <p> Ounce  </p>
                        <input id="listingItemCreate_price_price_per_ounce" type="number" v-model="price_per_ounce" placeholder="$0.00" />
                    </label>
                </div>
            </div>
            <br>
            <div>
                <button type="reset" class="btn btn-warning">Cancel</button>
                <button type="submit" value="create" class="btn btn-success" @click.prevent="listingItemCreate()">Create</button>
            </div>
        </div>
    </div>
</template>

<script>

import axios from 'axios'

export default {
    data() {
        return {
            title: '',
            description: '',
            strain: '',
            price_per_gram: '',
            price_per_eigth: '',
            price_per_quarter: '',
            price_per_half: '',
            price_per_ounce: '',
            listing_id: this.$route.params.listing
        }
    },
    methods: {
        listingItemCreate() {
            axios.post('/listingItemCreate' + '/' + this.$route.params.listing, {
                listing_id: this.listing_id,
                title: this.title,
                description: this.description,
                strain: this.strain,
                price_per_gram: this.price_per_gram,
                price_per_eigth: this.price_per_eigth,
                price_per_quarter: this.price_per_quarter,
                price_per_half: this.price_per_half,
                price_per_ounce: this.price_per_ounce
            })
            .then(response => {
                console.log(response)
                let listingItem = response.data.data
                let title = listingItem.title
                let redirectRoute = '/listing/' + this.listing_id
                this.$emit('completed', listingItem)
                if (response.status == 201) {
                    this.$router.push(redirectRoute)
                } else {
                    this.$emit('Could not complet post')
                }
            }).catch(error => {
                console.log(error)
                return this.error
            })
        }
    }
}
</script>

<style scoped>
.listing-container {
    background-color: white;
}
.listingItemCreate {
    display: flex;
    flex-direction: column;
}
.listingItemCreate_name input[type=text],
 .listingItemCreate_description input[type=text],
 .listingItemCreate_name label,
 .listingItemCreate_description textarea,
 .btn {
    width: 100%;
    font-size: 19px !important;
    line-height: 24px;
    color: #484848;
    font-weight: 300;
    -webkit-appearance: none;
}
.listingItemCreate_name input,
 .listingItemCreate_description textarea,
 .listingItemreate_price input {
     background-color: transparent;
     padding: 11px;
     border: 1px solid #DBDBDB;
     border-radius: 2px;
     box-sizing:border-box
}
.listingItemCreate_description textarea {
    min-height: 250px;
}
.listingItemCreate_prices {
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    justify-content: space-evenly;
}
.listingItemCreate_prices  label {
    display: flex;
    flex-wrap: wrap;
    flex-direction: column;
    align-items:center;
    justify-content: center;
    width: 20%;
    font-size: 19px !important;
    line-height: 24px;
    color: #484848;
    font-weight: 300;
    -webkit-appearance: none;
    padding: none;
    margin: none;
}
.listingItemCreate_prices  input {
    width: 60%;
    height: 40px;
    line-height: 24px;
    font-size: 19px;
    padding: 20%
}
.listingItemCreate_strain__radio {
    display: flex;
    flex-direction: row;
    justify-content: space-around;
}
.listingItemCreate_strain__radio label {
    width: 28%;
    height: 40px;
    text-align: center;
}
.listingItemCreate_strain__radio label input {
    display: none;
}
.listingItemCreate_strain__radio label span {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    height: 100%;
    box-sizing: border-box;
    border: 1px solid #DBDBDB;
    border-radius: 5px;
}
.listingItemCreate_strain__radio label input:checked + span {
    background-color: #4fc08d;
    opacity: 0.8;   
}
.btn-success {
    background-color: #4fc08d;
    color: #ffffff;
    cursor: pointer;
    border: #4fc08d;
    border-radius: 4px;
    padding-top: 12px;
    padding-bottom: 12px;
}
</style>