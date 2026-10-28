<template>
  <div class="tela-usuario">
    <h1>Minha Conta</h1>

    <p v-if="!usuario">Você não está logado.</p>

    <template v-else>
      <!-- Mensagens -->
      <p v-if="sucesso" class="sucesso">{{ sucesso }}</p>
      <p v-if="erro" class="erro">{{ erro }}</p>

      <form @submit.prevent="salvar">
        <label>
          Nome
          <input v-model.trim="form.nome" type="text" required />
        </label>

        <label>
          E-mail
          <input v-model.trim="form.email" type="email" required />
        </label>

        <label>
          Endereço
          <input v-model.trim="form.endereco" type="text" />
        </label>

        <label>
          Login
          <input v-model.trim="form.login" type="text" required />
        </label>

        <label>
          Nova senha <small>(deixe em branco para não alterar)</small>
          <input v-model="novaSenha" type="password" autocomplete="new-password" />
        </label>

        <div class="acoes">
          <button type="submit" :disabled="salvando">
            {{ salvando ? 'Salvando...' : 'Salvar alterações' }}
          </button>
          <button type="button" class="btn-secundario" @click="sair">
            Sair
          </button>
        </div>
      </form>

      <hr />

      <section class="zona-perigo">
        <h2>Excluir conta</h2>
        <p class="aviso">
          Esta ação é permanente. Todos os seus dados serão removidos.
        </p>
        <button type="button" class="btn-perigo" @click="excluirConta" :disabled="excluindo">
          {{ excluindo ? 'Excluindo...' : 'Excluir minha conta' }}
        </button>
      </section>
    </template>
  </div>
</template>

<script>
import { getAuth, saveAuth, logout } from '@/services/auth'

export default {
  name: 'telaUsuario',
  data() {
    return {
      usuario: null,
      form: { nome: '', email: '', endereco: '', login: '' },
      novaSenha: '',
      salvando: false,
      excluindo: false,
      erro: '',
      sucesso: ''
    }
  },
  created() {
    this.usuario = getAuth()
    if (this.usuario) this.preencherForm()
  },
  methods: {
    preencherForm() {
      this.form = {
        nome: this.usuario.nome || '',
        email: this.usuario.email || '',
        endereco: this.usuario.endereco || '',
        login: this.usuario.login || ''
      }
    },

    async salvar() {
      this.erro = ''
      this.sucesso = ''

      // Se o login mudou, verifica se o novo login já está em uso
      if (this.form.login !== this.usuario.login) {
        try {
          const check = await fetch(`/api/usuarios/login/${encodeURIComponent(this.form.login)}`)
          if (check.status === 200) {
            const existente = await check.json()
            // Se o login já existe e não é o próprio usuário → conflito
            if (existente.id !== this.usuario.id) {
              this.erro = 'Este login já está em uso por outro usuário.'
              return
            }
          }
        } catch {
          this.erro = 'Falha de conexão com o servidor.'
          return
        }
      }

      const payload = { ...this.form }
      this.salvando = true
      try {
        if (this.novaSenha.trim() !== '') {
          // usuário digitou nova senha → envia
          payload.senha = this.novaSenha
        } else {
          // busca o registro atual no banco para reaproveitar a senha existente
          const atual = await fetch(`/api/usuarios/${this.usuario.id}`)
          if (!atual.ok) {
            this.erro = `Falha ao carregar dados atuais (HTTP ${atual.status}).`
            return
          }
          const atualJson = await atual.json()
          payload.senha = atualJson.senha   // texto puro, arquitetura atual
        }

        const res = await fetch(`/api/usuarios/${this.usuario.id}`, {
          method: 'PUT',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(payload)
        })

        if (!res.ok) {
          this.erro = `Falha ao salvar (HTTP ${res.status}).`
          return
        }

        const atualizado = await res.json()

        // Persiste no localStorage (sem senha)
        saveAuth(atualizado)
        this.usuario = getAuth()
        this.preencherForm()
        this.novaSenha = ''
        this.sucesso = 'Dados atualizados com sucesso!'

        // Limpa a mensagem após 3s
        setTimeout(() => { this.sucesso = '' }, 3000)
      } catch {
        this.erro = 'Falha de conexão com o servidor.'
      } finally {
        this.salvando = false
      }
    },

    async excluirConta() {
      const confirmado = window.confirm(
          'Tem certeza que deseja excluir sua conta? Esta ação não pode ser desfeita.'
      )
      if (!confirmado) return

      this.erro = ''
      this.excluindo = true
      try {
        const res = await fetch(`/api/usuarios/${this.usuario.id}`, {
          method: 'DELETE'
        })

        if (res.status === 204) {
          logout()
          this.$router.replace({ name: 'login' })
          return
        }

        if (res.status === 500) {
          this.erro =
              'Não foi possível excluir: você possui vendas registradas. ' +
              'Contate o administrador.'
          return
        }

        this.erro = `Falha ao excluir (HTTP ${res.status}).`
      } catch {
        this.erro = 'Falha de conexão com o servidor.'
      } finally {
        this.excluindo = false
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
.tela-usuario { max-width: 520px; margin: 2rem auto; }

form { display: flex; flex-direction: column; gap: .75rem; }
label { display: flex; flex-direction: column; font-size: .9rem; }
label small { color: #666; font-weight: normal; }

input[type="text"],
input[type="email"],
input[type="password"] { padding: .5rem; }

.acoes { display: flex; gap: .5rem; margin-top: .5rem; }
button { padding: .6rem 1rem; cursor: pointer; }
.btn-secundario { background: #eee; border: 1px solid #ccc; }
.btn-perigo { background: #b00020; color: white; border: none; }
.btn-perigo:disabled { opacity: .6; cursor: not-allowed; }

hr { margin: 2rem 0 1rem; border: none; border-top: 1px solid #ddd; }

.zona-perigo h2 { color: #b00020; font-size: 1.1rem; margin-bottom: .25rem; }
.aviso { font-size: .85rem; color: #555; margin-bottom: .75rem; }

.erro { color: #b00020; }
.sucesso { color: #0a7d28; }
</style>