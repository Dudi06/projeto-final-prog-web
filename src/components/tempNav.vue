<template>
  <div id="nav">
    <p>Navegação temporária do site</p>
         <AppButton
        label="Tela Principal"
        @click="$router.push('/')"
      /> |
         <AppButton
        label="Tela Produto"
        @click="$router.push('/produto')"
      />|
      <AppButton
        label="Tela Carrinho"
        @click="$router.push('/carrinho')"
      /> |

    <template v-if="logado">
      <router-link to="/usuario">Minha Conta</router-link>
      <template v-if="admin">
        | <router-link to="/administrador">Admin</router-link>
      </template>
      | <a href="#" @click.prevent="sair">Sair ({{ nome }})</a>
    </template>
    <template v-else>
      <AppButton
        label="Tela Login"
        @click="$router.push('/login')"
      />|
      <AppButton
        label="Tela Cadastro"
        @click="$router.push('/cadastro')"
      />
    </template>
  </div>
</template>

<script>
import { getAuth, isAdmin, logout } from '@/services/auth'
import AppButton from '@/components/AppButton.vue'

export default {
  name: 'tempNav',

  components: {
    AppButton
  },
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