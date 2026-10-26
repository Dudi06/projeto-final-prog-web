<template>
  <div>
        <Header />
        <p> Tela Cadastro </p>
        <Footer />
  </div>
</template>

<script>

import Header from "@/components/AppHeader"
import Footer from "@/components/AppFooter.vue"

export default {
  name: "telaCadastro",
  components: {
    Header,
    Footer
  }
}

</script>