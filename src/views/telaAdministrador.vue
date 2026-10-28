<template>
  <div class="tela-admin">
    <h1>Painel do Administrador</h1>

    <section v-if="admin">
      <h2>Logado como</h2>
      <p><strong>{{ admin.nome }}</strong> ({{ admin.login }})</p>
      <button @click="sair">Sair</button>
    </section>

    <section>
      <h2>Usuários cadastrados</h2>

      <p v-if="carregando">Carregando...</p>
      <p v-else-if="erro" class="erro">{{ erro }}</p>

      <table v-else>
        <thead>
        <tr>
          <th>ID</th><th>Nome</th><th>Login</th><th>E-mail</th><th>Admin</th>
        </tr>
        </thead>
        <tbody>
        <tr v-for="u in usuarios" :key="u.id">
          <td>{{ u.id }}</td>
          <td>{{ u.nome }}</td>
          <td>{{ u.login }}</td>
          <td>{{ u.email }}</td>
          <td>{{ u.administrador ? 'Sim' : 'Não' }}</td>
        </tr>
        </tbody>
      </table>
    </section>
  </div>
</template>

<script>
import { getAuth, logout } from '@/services/auth'

export default {
  name: 'telaAdministrador',
  data() {
    return { admin: null, usuarios: [], carregando: false, erro: '' }
  },
  async created() {
    this.admin = getAuth()
    await this.carregarUsuarios()
  },
  methods: {
    async carregarUsuarios() {
      this.carregando = true
      this.erro = ''
      try {
        const res = await fetch('/api/usuarios')
        if (!res.ok) {
          this.erro = `Erro ao buscar usuários (HTTP ${res.status}).`
          return
        }
        this.usuarios = await res.json()
      } catch (e) {
        this.erro = 'Falha de conexão com o servidor.'
      } finally {
        this.carregando = false
      }
    },
    sair() {
      logout()
      this.$router.replace({ name: 'login' })
    }
  }
}
</script>

<style scoped>
.tela-admin { max-width: 800px; margin: 2rem auto; }
table { width: 100%; border-collapse: collapse; margin-top: .5rem; }
th, td { border-bottom: 1px solid #ddd; padding: .4rem .6rem; text-align: left; }
th { background: #f3f3f3; }
.erro { color: #b00020; }
button { margin-top: .5rem; padding: .5rem 1rem; cursor: pointer; }
</style>