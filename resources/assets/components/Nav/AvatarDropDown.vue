<template>
    <div class="text-center">
        <v-menu
            transition="slide-y-transition"
            bottom
        >
            <template v-slot:activator="{ on: menu }">
                <v-tooltip bottom>
                    <template v-slot:activator="{ on: tooltip }">
                        <v-input
                            type="button"
                            color="primary"
                            dark
                            v-on="{ ...tooltip, ...menu }"
                        >
                            <v-avatar>
                                <img
                                    :src="user.avatar"
                                    :alt="user.name"
                                >
                            </v-avatar>
                            <v-icon>
                                {{ 'mdi-chevron-bottom' }}
                            </v-icon>
                        </v-input>
                    </template>
                    <span> Check your personal menu! </span>
                </v-tooltip>
            </template>
            <v-list>
                <v-list-item>
                    <v-list-item-title>
                        {{ user.name }}
                    </v-list-item-title>
                    <v-icon>
                        {{ 'mid-account-outline' }}
                    </v-icon>
                </v-list-item>
                <v-list-item
                    v-for="(item, index) in items"
                    :key="index"
                    @click="navDropLink(item.link)"
                >
                    <v-list-item-title>
                        {{ item.title }}
                    </v-list-item-title>
                    <v-icon>
                        {{ item.icon }}
                    </v-icon>
                </v-list-item>
                <v-list-item>
                    <profile-page></profile-page>
                </v-list-item>
            </v-list>
        </v-menu>
    </div>
</template>

<script>
import ProfilePage from '../Profile/ProfilePage.vue'
    export default {
        prop: {
            drawer: {
                type: String,
                required: false,
                default: null
            }
        },
        components: {
            ProfilePage
        },
        data () {
            return {
                user: {
                    name: this.$store.state.user.name,
                    avatar: this.$store.state.user.avatar || '#',
                },
                items: [
                    { title: 'Home', icon: 'mdi-home', link: '/' },
                    { title: 'About', icon: 'mdi-account-question', link: '' },
                ],
                item: {},
            }
        },
        methods: {
            navDropLink() {
                return router.push(item.link)
            }
        }
    }
</script>