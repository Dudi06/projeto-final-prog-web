<template>
  <div>
        <Header />
        <p> Tela Carrinho </p>
        <Footer />
  </div>
</template>

<script>

import Header from "@/components/header.vue"
import Footer from "@/components/footer.vue"

export default {
  name: "telaCarrinho",
  components: {
    Header,
    Footer
  }
}

</script>