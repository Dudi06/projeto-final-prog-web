<template>
  <div class="tela-cadastro">
    <h1>Tela Cadastro</h1>

    <form @submit.prevent="cadastrar">
      <label>Nome
        <input v-model.trim="form.nome" type="text" required />
      </label>

      <label>E-mail
        <input v-model.trim="form.email" type="email" required />
      </label>

      <label>Endereço
        <input v-model.trim="form.endereco" type="text" />
      </label>

      <label>Login
        <input v-model.trim="form.login" type="text" required autocomplete="username" />
      </label>

      <label>Senha
        <input v-model="form.senha" type="password" required autocomplete="new-password" />
      </label>

      <label class="checkbox">
        <input v-model="form.administrador" type="checkbox" />
        Cadastrar como administrador
      </label>

      <button type="submit" :disabled="carregando">
        {{ carregando ? 'Cadastrando...' : 'Cadastrar' }}
      </button>

      <p v-if="erro" class="erro">{{ erro }}</p>
      <p v-if="sucesso" class="sucesso">{{ sucesso }}</p>
    </form>

    <p>
      Já tem conta?
      <router-link to="/login">Entrar</router-link>
    </p>
  </div>
</template>

<script>
export default {
  name: 'telaCadastro',
  data() {
    return {
      form: { nome: '', email: '', endereco: '', login: '', senha: '', administrador: false },
      erro: '',
      sucesso: '',
      carregando: false
    }
  },
  methods: {
    async cadastrar() {
      this.erro = ''
      this.sucesso = ''
      this.carregando = true
      try {
        // Verifica se o login já existe (a tabela não tem UNIQUE em login,
        // mas evitamos duplicidade no frontend)
        const check = await fetch(`/api/usuarios/login/${encodeURIComponent(this.form.login)}`)
        if (check.status === 200) {
          this.erro = 'Este login já está em uso.'
          return
        }

        const res = await fetch('/api/usuarios', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(this.form)
        })

        if (!res.ok) {
          this.erro = `Falha no cadastro (HTTP ${res.status}).`
          return
        }

        this.sucesso = 'Cadastro realizado! Redirecionando para o login...'
        setTimeout(() => this.$router.push({ name: 'login' }), 1200)
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
.tela-cadastro { max-width: 400px; margin: 2rem auto; }
form { display: flex; flex-direction: column; gap: .75rem; }
label { display: flex; flex-direction: column; font-size: .9rem; }
label.checkbox { flex-direction: row; align-items: center; gap: .4rem; }
input[type="text"], input[type="email"], input[type="password"] { padding: .5rem; }
button { padding: .6rem; cursor: pointer; }
.erro { color: #b00020; }
.sucesso { color: #0a7d28; }
</style>