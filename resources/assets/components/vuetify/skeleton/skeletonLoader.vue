<template>
  <v-sheet
    :color="`grey ${theme.isDark ? 'darken-2' : 'lighten-4'}`"
    class="px-3 pt-3 pb-3"
  >
    <v-skeleton-loader
      class="mx-auto"
      max-width="300"
      type="card"
    ></v-skeleton-loader>
  </v-sheet>
</template>

<script>
  export default {
    // Vuetify components provide
    // a theme variable that is
    // used to determine dark
    inject: ['theme'],
  }

  /**
   * type
Type
string
Default
undefined
Description
A string delimited list of skeleton components to create such as 
type="text@3" or type="card, list-item". Will recursively generate
 a corresponding skeleton from the provided string. Also supports 
 short-hand for multiple elements such as article@3 and paragraph@2
  which will generate 3 article skeletons and 2 paragraph skeletons.
   Please see below for a list of available pre-defined options.

   {
  "actions": "button@2",
  "article": "heading, paragraph",
  "avatar": "avatar",
  "button": "button",
  "card": "image, card-heading",
  "card-avatar": "image, list-item-avatar",
  "card-heading": "heading",
  "chip": "chip",
  "date-picker": "list-item, card-heading, divider, date-picker-options, date-picker-days, actions",
  "date-picker-options": "text, avatar@2",
  "date-picker-days": "avatar@28",
  "heading": "heading",
  "image": "image",
  "list-item": "text",
  "list-item-avatar": "avatar, text",
  "list-item-two-line": "sentences",
  "list-item-avatar-two-line": "avatar, sentences",
  "list-item-three-line": "paragraph",
  "list-item-avatar-three-line": "avatar, paragraph",
  "paragraph": "text@3",
  "sentences": "text@2",
  "table": "table-heading, table-thead, table-tbody, table-tfoot",
  "table-heading": "heading, text",
  "table-thead": "heading@6",
  "table-tbody": "table-row-divider@6",
  "table-row-divider": "table-row, divider",
  "table-row": "table-cell@6",
  "table-cell": "text",
  "table-tfoot": "text@2, avatar@2",
  "text": "text"
}
   */
</script>
