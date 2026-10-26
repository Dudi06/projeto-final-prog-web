<template>
  <div>
        <Header />
        <p> Tela Cadastro </p>
        <Footer />
  </div>
</template>

<script>

import Header from "@/components/header.vue"
import Footer from "@/components/footer.vue"

export default {
  name: "telaCadastro",
  components: {
    Header,
    Footer
  }
}

</script>