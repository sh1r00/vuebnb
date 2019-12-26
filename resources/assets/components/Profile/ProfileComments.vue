<template>
    <div>
        <div class="comments" v-for="(comment, index) in userData.comments" :key="index">
            <h1>Comments</h1>
            <slot v-bind="comment"></slot>
        </div>
    </div>
</template>
