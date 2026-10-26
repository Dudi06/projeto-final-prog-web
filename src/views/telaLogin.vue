<template>
  <div>
        <Header />
        <p> Tela Login </p>
        <Footer />
  </div>
</template>

<script>

import Header from "@/components/AppHeader"
import Footer from "@/components/AppFooter.vue"

export default {
  name: "telaLogin",
  components: {
    Header,
    Footer
  }
}

</script>