<template>
    <div class="profileContainer">
        <v-list class="profileNav">
            <v-list-item
                v-for="tab in tabs"
                :key="tab.id"
                @click="selected = tab.name;"
                :class="['profileNav-btn', { active: selected === tab.name }]"
            >
                <sup v-if="tab.count">({{ tab.count }})</sup>
                    {{tab.name}}
            </v-list-item>
        </v-list>
        <div class="profileView">
            <component  tag="div" :is="selected"></component>
        </div>
    </div>
</template>

<script>
import Posts from './ProfilePosts.vue'
import Favs from './ProfileFavs.vue'
import Comments from './ProfileComments.vue'

export default {
    components: {
        Posts,
        Favs,
        Comments
    },
    data() {
        return {
           tabs: [
               {
                   name: 'Posts',
                   count: this.$store.state.user.created.length
                },
                {
                    name: 'Favs',
                    count: this.$store.state.user.saved.length
                 },
                 {
                     name: 'Comments',
                     count: this.$store.state.user.comments.length
                 }
           ],
           selected: 'Posts'
        }
    }
}
</script>

<style scoped>
.profileContainer {
    display: flex;
    flex-direction: row;
}
.profileNav {
    display: flex;
    flex-direction: column;
    height: auto;
    width: 250px;
    background-color: lightgrey;
}
button {
    height: 100px;
    width: 250px;
}
.active {
    background-color: #4fc08d;
}
</style>