<template>
  <div class="tela-login">
    <h1>Tela Login</h1>

    <form @submit.prevent="entrar">
      <label>
        Login
        <input v-model.trim="login" type="text" required autocomplete="username" />
      </label>

      <label>
        Senha
        <input v-model="senha" type="password" required autocomplete="current-password" />
      </label>

      <button type="submit" :disabled="carregando">
        {{ carregando ? 'Entrando...' : 'Entrar' }}
      </button>

      <p v-if="erro" class="erro">{{ erro }}</p>
    </form>

    <p>
      Não tem conta?
      <router-link to="/cadastro">Cadastre-se</router-link>
    </p>
  </div>
</template>

<script>
import { saveAuth } from '@/services/auth'

export default {
  name: 'telaLogin',
  data() {
    return { login: '', senha: '', erro: '', carregando: false }
  },
  methods: {
    async entrar() {
      this.erro = ''
      this.carregando = true
      try {
        const res = await fetch(`/api/usuarios/login/${encodeURIComponent(this.login)}`)

        if (res.status === 404) {
          this.erro = 'Usuário não encontrado.'
          return
        }
        if (!res.ok) {
          this.erro = `Erro ao consultar usuário (HTTP ${res.status}).`
          return
        }

        const usuario = await res.json()

        if (usuario.senha !== this.senha) {
          this.erro = 'Senha incorreta.'
          return
        }

        saveAuth(usuario)

        // Redireciona: prioridade para ?redirect, senão escolhe por perfil
        const redirect = this.$route.query.redirect
        if (redirect) {
          this.$router.replace(redirect)
        } else if (usuario.administrador === true) {
          this.$router.replace({ name: 'telaAdministrador' })
        } else {
          this.$router.replace({ name: 'telaUsuario' })
        }
      } catch (e) {
        this.erro = 'Falha de conexão com o servidor.'
      } finally {
        this.carregando = false
      }
    }
  }
}
</script>

<style scoped>
.tela-login { max-width: 360px; margin: 2rem auto; }
form { display: flex; flex-direction: column; gap: .75rem; }
label { display: flex; flex-direction: column; font-size: .9rem; }
input { padding: .5rem; }
button { padding: .6rem; cursor: pointer; }
.erro { color: #b00020; }
</style>