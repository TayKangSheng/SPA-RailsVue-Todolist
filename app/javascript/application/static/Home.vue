<template lang="html">
  <main-layout>
    <div class="row">
      <div style="display: block; margin:auto; width: 30%;">
        <img src="/assets/logo.png" width="150">
        <img src="/assets/rails.png" width="150">
      </div>
      <h2 class="text-center">Welcome to Single Page Vue-Rails Application</h2>
    </div>
  </main-layout>

</template>

<script>
  import MainLayout from '../layouts/Main.vue'
  export default {
    components: {
      MainLayout
    }
  }
</script>

<style lang="css">
</style>
