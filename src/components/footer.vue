<template>
  <div>
    <footer class="footer">
      
      <!-- Foi feito como solicitado, mas está relacionado a diversas páginas que não existem -->

      <div>
        <section class="footer_sessao">
          <h2 class="footer_titulo">Sobre</h2>
          <nav class="footer_links">
            <router-link to="/politica-cookies">Política de cookies</router-link>
            <router-link to="/politica-trocas">Política de Troca e Devolução</router-link>
            <router-link to="/privacidade">Privacidade</router-link>
          </nav>
        </section>

        <section class="footer_sessao">
          <h2 class="footer_titulo">Cards</h2>
          <nav class="footer_links">
            <router-link to="/cards-em-alta">Cards em Alta</router-link>
            <router-link to="/todas-edicoes">Todas Edições</router-link>
            <router-link to="/mais-baratos">Mais Baratos</router-link>
          </nav>
        </section>

        <section class="footer_sessao">
          <h2 class="footer_titulo">Fale Conosco</h2>
          <div class="social-links">
            
            <router-link to="" aria-label="Instagramlink">
              <img src="" alt="Instagram" />
            </router-link>

            <router-link to="" aria-label="YouTubelink">
              <img src="" alt="YouTube" />
            </router-link>

            <router-link to="" aria-label="Facebooklink">
              <img src="" alt="Facebook" />
            </router-link>

            <router-link to="" aria-label="TikToklink">
              <img src="" alt="TikTok" />
            </router-link>

          </div>
        </section>

      </div>

    </footer>
  </div>
</template>

<script>

</script>

<style scoped>
.footer {
  background-color: #f8f8f8;
  padding: 20px;

}

.footer_links {
  display: flex;
  flex-direction: column;
  align-items: left;
}

</style>