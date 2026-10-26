<template>
  <div>
        <Header />
        <p> Tela Usuario </p>
        <Footer />
  </div>
</template>

<script>

import Header from "@/components/header.vue"
import Footer from "@/components/footer.vue"

export default {
  name: "telaUsuario",
  components: {
    Header,
    Footer
  }
}

</script>