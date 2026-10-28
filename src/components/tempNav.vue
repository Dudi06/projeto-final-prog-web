<template>
  <div id="nav">
    <p>Navegação temporária do site</p>
    <router-link to="/">Tela Principal</router-link> |
    <router-link to="/produto">Tela Produto</router-link> |
    <router-link to="/carrinho">Tela Carrinho</router-link> |

    <template v-if="logado">
      <router-link to="/usuario">Minha Conta</router-link>
      <template v-if="admin">
        | <router-link to="/administrador">Admin</router-link>
      </template>
      | <a href="#" @click.prevent="sair">Sair ({{ nome }})</a>
    </template>
    <template v-else>
      <router-link to="/login">Tela Login</router-link> |
      <router-link to="/cadastro">Tela Cadastro</router-link>
    </template>
  </div>
</template>

<script>
import { getAuth, isAdmin, logout } from '@/services/auth'

export default {
  name: 'tempNav',
  data() {
    return { logado: false, admin: false, nome: '' }
  },
  created() {
    this.refresh()
  },
  watch: {
    $route() { this.refresh() }
  },
  methods: {
    refresh() {
      const u = getAuth()
      this.logado = !!u
      this.admin = isAdmin()
      this.nome = u ? u.nome : ''
    },
    sair() {
      logout()
      this.refresh()
      this.$router.push({ name: 'login' })
    }
  }
}
</script>