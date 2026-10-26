<template>
  <div>
    <Header />
    <tempNav />
    <router-view />
    <Footer />
  </div>
</template>

<script>

import Header from './components/header.vue'
import Footer from './components/footer.vue'
import tempNav from './components/tempNav.vue'

export default {
  name: 'App',
  components: {
    Header,
    Footer,
    tempNav
  }
}

</script>

<style>

</style>