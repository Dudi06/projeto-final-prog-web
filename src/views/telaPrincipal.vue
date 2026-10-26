<template>
  <div>
        <Header />
        <p> Tela Principal </p>
        <Footer />
  </div>
</template>

<script>

import Header from "@/components/AppHeader"
import Footer from "@/components/AppFooter.vue"

export default {
  name: "telaPrincipal",
  components: {
    Header,
    Footer
  }
}

</script>