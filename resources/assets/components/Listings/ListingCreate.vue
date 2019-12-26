<template>
    <div class="listing-container">
        <form @submit.prevent="storeListing()">
            <div class="heading">
                <label for="listingTitle">
                    <h1>Listing Title</h1>
                    <input id="listingTitle" type="text" v-model="title" />
                </label>
                <label for="listingAddress">
                    <p>Listing Address</p>
                    <input id="listingAddress" type="text" v-model="address" />
                </label>
            </div>
            <hr>
            <div class="about">
                <h3>About this listing</h3>
                <textarea id="listingAbout" v-model="about"></textarea>
            </div>
            <div class="lists">
                <feature-list title="Amenities" :items="amenities">
                    <template slot-scope="amenity">
                        <label :for="amenity.idTag">
                            <input :id="amenity.idTag" name="amenitiesCheckbox" type="checkbox" :value="[amenity.name, '1']" v-model="amenitiesSelected">
                            <span class="inputContent">
                             {{ amenity.title }}
                             </span>
                             <i class="fa fa-lg" :class="amenity.icon"></i>
                        </label>
                    </template>
                </feature-list>
            </div>
            <br>
            <div class="buttons">
                <button type="reset" class="btn btn-warning">Cancel</button>
                <button type="submit" value="create" class="btn btn-success" @click.prevent="storeListing()">Create</button>
            </div>
        </form>
    </div>
</template>
<script>
    import axios from 'axios';
    import ModalWindow from '../Helper/ModalWindow.vue';
    import FeatureList from './FeatureList.vue';
    import HeaderImage from './HeaderImage.vue';
    import ExpandableText from '../Helper/ExpandableText.vue';

    export default {
        components: {
            ModalWindow,
            FeatureList,
            HeaderImage,
            ExpandableText,
        },
        data() {
            return {
                title: '',
                address:'',
                about: '',
                amenities: {
                    amenity_wifi: { title: 'Wireless Internet', icon: 'fa-wifi', idTag:'wireless_internet', name:'amenity_wifi'},
                    amenity_pets_allowed: { title: 'Pets Allowed', icon: 'fa-paw', idTag:'pets_allowed', name:'amenity_pets_allowed'},
                    amenity_tv: { title: 'TV', icon: 'fa-television', idTag:'tv', name:'amenity_tv'},
                    amenity_kitchen: { title: 'Kitchen', icon: 'fa-cutlery', idTag:'kitchen', name:'amenity_kitchen'},
                    amenity_breakfast: { title: 'Breakfast', icon: 'fa-coffee', idTag:'breakfast', name:'amenity_breakfast'},
                    amenity_laptop: { title: 'Laptop friendly workspace', icon: 'fa-laptop', idTag:'laptop_friendly_workplace', name:'amenity_laptop'}
                },
                items: [],
                amenitiesSelected: [],
                filteredAmenities: {}
            }
        },
        methods: {
            storeListing() {
                let amenitiesToBeConverted = new Map(this.amenitiesSelected)
                let obj = Object.fromEntries(amenitiesToBeConverted)
                this.filteredAmenities = obj

                axios.post('/listingCreate', {
                    title: this.title,
                    address: this.address,
                    about: this.about,
                    amenity_wifi: this.filteredAmenities.amenity_wifi,
                    amenity_pets_allowed: this.filteredAmenities.amenity_pets_allowed,
                    amenity_tv: this.filteredAmenities.amenity_tv,
                    amenity_kitchen: this.filteredAmenities.amenity_kitchen,
                    amenity_breakfast: this.filteredAmenities.amenity_breakfast,
                    amenity_laptop: this.filteredAmenities.amenity_laptop
                })
                .then(response => {
                    console.log(response)
                    let listing = response.data.data
                    let title = listing.title
                    let redirectRoute = '/listing/' + listing.id
                    this.$emit('completed', listing)
                    if (response.status === 201) {
                        this.$router.push(redirectRoute)
                    } else {
                        this.$emit('Could not complete Post')
                    }
                }).catch(error => {
                    console.log(error)
                    return this.error
                })
            }
        }
    }
</script>
<style>
.heading {
    margin-bottom: 2em;
}
.heading h1 {
    font-size: 32px;
    font-weight: 700;
}
.heading p {
    font-size: 15px;
    color: rgb(118, 118, 118);
}
.heading input[type=text],
.about input[type=text],
.prices input[type=number],
.heading label,
.about textarea,
.lists label,
.btnLink,
.btn {
    width: 100%;
    font-size: 19px !important;
    line-height: 24px;
    color: #484848;
    font-weight: 300;
    -webkit-appearance: none;
}
.heading input,
.about textarea,
.prices input {
    background-color: transparent;
    padding: 11px;
    border: 1px solid #DBDBDB;
    border-radius: 2px;
    box-sizing:border-box
}
.about textarea {
    min-height: 250px;
}
.lists label {
    display: flex;
    flex-direction: row;
}
.lists label input {
    transform: scale(1.4);
    margin-right: 10px;
}
.lists label span {
    margin-right: 10px;
    border-bottom: 1px solid #DBDBDB;
    border-radius: 5px;
}
.lists label input:checked + span {
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
margin-bottom: 12px;
}
</style>

