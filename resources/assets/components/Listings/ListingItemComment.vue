<template>
    <div class="container">
        <review-page></review-page>
        <listing-comments></listing-comments>
    </div>
</template>

<script>
import ListingComments from './ListingComments.vue'
import ReviewPage from '../Reviews/ReviewPage.vue'

export default {
    components: {
        ListingComments,
        ReviewPage
    }
}
</script>