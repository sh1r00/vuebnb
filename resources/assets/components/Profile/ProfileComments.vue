<template>
    <div>
        <div v-if="listing.length">
        <div class="comments" v-for="(comment, index) in userData.comments" :key="index">
            <h1>Comments</h1>
            <slot v-bind="comment"></slot>
        </div>
        </div>
        <div v-else>
            You haven't posted a comment yet
        </div>
    </div>
</template>
