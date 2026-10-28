<template>
  <div class="tela-usuario">
    <h1>Minha Conta</h1>

    <div v-if="usuario">
      <p><strong>Nome:</strong> {{ usuario.nome }}</p>
      <p><strong>Login:</strong> {{ usuario.login }}</p>
      <p><strong>E-mail:</strong> {{ usuario.email }}</p>
      <p><strong>Endereço:</strong> {{ usuario.endereco || '—' }}</p>
      <p><strong>Perfil:</strong> {{ usuario.administrador ? 'Administrador' : 'Usuário' }}</p>

      <button @click="sair">Sair</button>
    </div>

    <p v-else>Você não está logado.</p>
  </div>
</template>

<script>
import { getAuth, logout } from '@/services/auth'

export default {
  name: 'telaUsuario',
  data() {
    return { usuario: null }
  },
  created() {
    this.usuario = getAuth()
  },
  methods: {
    sair() {
      logout()
      this.$router.replace({ name: 'login' })
    }
  }
}
</script>

<style scoped>
.tela-usuario { max-width: 500px; margin: 2rem auto; }
button { margin-top: 1rem; padding: .5rem 1rem; cursor: pointer; }
</style>