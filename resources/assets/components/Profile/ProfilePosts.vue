<template>
  <div id="saved" class="saved-container">

    <h2>Created Posts</h2>

    <div v-if="listings.length" class="listing-summaries">
      <listing-summary
        v-for="listing in listings"
        :listing="listing"
        :key="listing.id"
      ></listing-summary>
    </div>

    <div v-else>You haven't created a post yet!</div>

  </div>
</template>


<script>
import ListingSummary from '../Listings/ListingSummary.vue'
export default {
  components: { ListingSummary },

  computed: {
    listings () {
        console.log(this.$store.state)
      return this.$store.state.listing_summaries
        .filter(
          item => this.$store.state.user.created.indexOf(item) > -1
        )
    }
  }
}
</script>


<style>
  .saved-container {
    margin: 0 auto;
    padding: 0 25px;
  }

  @media (min-width: 1131px) {
    .saved-container {
      width: 1095px;
      padding-left: 40px;
      margin-bottom: -10px;
    }
  }

  @media (min-width: 1231px) {
    .saved-container {
      width: 1195px;
    }
  }

  #saved .listing-summaries {
    display: flex;
    flex-wrap: wrap;
    justify-content: left;
    overflow: hidden;
  }

  #saved .listing-summaries .listing-summary {
    padding-bottom: 30px;
  }

  .listing-summaries > .listing-summary {
    margin-right: 15px;
  }
</style>
