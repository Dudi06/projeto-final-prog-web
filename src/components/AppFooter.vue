
<template>
  <footer class="app-footer">
    <div class="footer-item">
      <h4>SOBRE</h4>
    </div>

    <div class="footer-item">
      <h4>CARDS</h4>
    </div>

    <div class="footer-item">
      <h4>FALE CONOSCO</h4>
    </div>
  </footer>
</template>

<script>
export default {
  name: 'AppFooter'
}
</script>

<style scoped>
.app-footer {
  display: flex;
  justify-content: space-around;
  align-items: center;

  width: 100%;
  box-sizing: border-box;
  padding: 1.5rem 1rem;

  background-color: #ffffff;
  color: #000000;
}

.footer-item h4 {
  margin: 0;
  font-size: 1.1rem;
  font-weight: 700;
}
</style>
