<template>
  <div>
        <p> Tela Login </p>

        <section class="section">
          <h1 id="login-title">Já Possui Conta</h1>
          <form class="auth-form" action="" method="post">
            <div class="entrada">
              <label for="login_email">E-mail:</label>
              <input id="login_email" name="email" type="email" placeholder="Digite Seu E-mail" required>
            </div>
            
            <div class="entrada">
              <label for="senha">Senha:</label>
              <input id="senha" name="senha" type="password" placeholder="Digite Sua Senha" required>
            </div>
            <button class="btn" type="submit">Entrar</button>
          </form>
        </section>

        <section class="section">
          <h1 id="register-title">Cadastre-se</h1>
          <form class="auth-form" action="" method="get">
            <div class="entrada">
              <label for="registro_email">E-mail:</label>
              <input id="registro_email" name="email-cadastro" type="email" placeholder="Digite Seu E-mail" required>
            </div>
            <button class="btn" type="submit">Continuar</button>
          </form>
        </section>

  </div>
</template>

<script>

export default {
  name: "telaLogin",
  components: {
  }
}

</script>