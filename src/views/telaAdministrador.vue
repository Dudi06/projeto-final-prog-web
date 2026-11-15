<template>
  <div>
        <Header />
        <p> Tela Administrador </p>
        <Footer />
  </div>
</template>

<script>

import Header from "@/components/AppHeader"
import Footer from "@/components/AppFooter.vue"

export default {
  name: "telaAdministrador",
  components: {
    Header,
    Footer
  }
}

</script>