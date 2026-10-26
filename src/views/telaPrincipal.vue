<template>
  <div>
        <Header />
        <p> Tela Principal </p>
        <Footer />
  </div>
</template>

<script>

import Header from "@/components/header.vue"
import Footer from "@/components/footer.vue"

export default {
  name: "telaPrincipal",
  components: {
    Header,
    Footer
  }
}

</script>