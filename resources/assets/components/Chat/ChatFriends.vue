<template>
    <div class="chat-friends-list">
        <button
            v-for="friend in friends"
            :key="friend.id"
            class="chat-friends"
            @click="chatWith(friend)"
        >
            <img :src="friend.img" placeholder="User Image" />
            <h1>
                {{ friend.name }}
            </h1>

            <span v-if="friend.online">
                <input name="online" type="radio" checked>
            </span>
            <span v-else>
                <input name="online" type=radio disabled>
            </span>
        </button>
    </div>
</template>

<script>
export default {
    props: {
        data: {
            type: Array,
            required: true,
            default: {}
        }
    },
    data() {
        return {
            friends: this.data
        }
    },
    methods: {
        chatWith(data){
            this.$emit('chatWith', data)
        }
    }
}
</script>

<style scoped>
.chat-friends-list {
    display: flex;
    flex-direction: row;
}
input {
    color: yellow;
    background-color: blue;
}
</style>