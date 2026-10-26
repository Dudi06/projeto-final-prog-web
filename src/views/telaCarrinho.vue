<template>
  <div>
        <Header />
        <p> Tela Carrinho </p>
        <Footer />
  </div>
</template>

<script>

import Header from "@/components/AppHeader"
import Footer from "@/components/AppFooter.vue"

export default {
  name: "telaCarrinho",
  components: {
    Header,
    Footer
  }
}

</script>