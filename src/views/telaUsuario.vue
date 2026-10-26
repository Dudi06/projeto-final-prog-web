<template>
  <div>
        <Header />
        <p> Tela Usuario </p>
        <Footer />
  </div>
</template>

<script>

import Header from "@/components/AppHeader"
import Footer from "@/components/AppFooter.vue"

export default {
  name: "telaUsuario",
  components: {
    Header,
    Footer
  }
}

</script>