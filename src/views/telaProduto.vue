<template>
  <div>
        <Header />
        <p> Tela Produto</p>
        <Footer />
  </div>
</template>

<script>

import Header from "@/components/header.vue"
import Footer from "@/components/footer.vue"

export default {
  name: "telaProduto",
  components: {
    Header,
    Footer
  }
}

</script>