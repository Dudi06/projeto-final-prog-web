<template>
  <div>
    <Header />
    <tempNav />
    <router-view />
    <Footer />
  </div>
</template>

<script>

import Header from './components/AppHeader.vue'
import Footer from './components/AppFooter.vue'
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