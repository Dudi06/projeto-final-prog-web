
<template>
  <div class="site-layout">
    <Header />
    <tempNav />

    <main class="site-content">
      <router-view />
    </main>

    <Footer />
  </div>
</template>

<script>
import Header from './components/AppHeader.vue'
import Footer from './components/AppFooter.vue'
import tempNav from './components/tempNav.vue'

export default {
  components: {
    Header,
    Footer,
    tempNav
  }
}
</script>

<style>
html,
body,
#app {
  min-height: 100%;
  margin: 0;
}

.site-layout {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

.site-content {
  flex: 1;
}
</style>
