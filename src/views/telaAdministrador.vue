<template>
  <div>
        <Header />
        <p> Tela Administrador </p>
        <Footer />
  </div>
</template>

<script>

import Header from "@/components/header.vue"
import Footer from "@/components/footer.vue"

export default {
  name: "telaAdministrador",
  components: {
    Header,
    Footer
  }
}

</script>