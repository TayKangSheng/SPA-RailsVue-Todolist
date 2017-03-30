<template>
  <div>
    <v-nav-bar></v-nav-bar>
    <div class="container">
      <slot></slot>
      <v-footer></v-footer>
    </div>
  </div>
</template>

<script>
  import VNavBar from '../components/VNavBar.vue'
  import VFooter from '../components/VFooter.vue'

  export default {
    data: function(){
      return {
      }
    },
    components: {
      VNavBar,
      VFooter
    }
  }
</script>

<style lang="css">

</style>
