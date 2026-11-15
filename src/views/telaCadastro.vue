
<template>
  <div class="tela-cadastro">
    <h1 class="titulo-cadastro">Criar conta</h1>

    <p class="subtitulo-cadastro">
      Preencha os dados para se cadastrar na loja.
    </p>

    <form @submit.prevent="cadastrar">
      <div class="campo-cadastro">
        <label for="nome">Nome</label>

        <IconField>
          <InputIcon>
            <i class="pi pi-user" />
          </InputIcon>

          <InputText
            id="nome"
            v-model.trim="form.nome"
            placeholder="Digite seu nome completo"
            autocomplete="name"
            required
            fluid
          />
        </IconField>
      </div>

      <div class="campo-cadastro">
        <label for="email">E-mail</label>

        <IconField>
          <InputIcon>
            <i class="pi pi-envelope" />
          </InputIcon>

          <InputText
            id="email"
            v-model.trim="form.email"
            type="email"
            placeholder="seuemail@exemplo.com"
            autocomplete="email"
            required
            fluid
          />
        </IconField>
      </div>

      <div class="campo-cadastro">
        <label for="endereco">Endereço</label>

        <IconField>
          <InputIcon>
            <i class="pi pi-map-marker" />
          </InputIcon>

          <InputText
            id="endereco"
            v-model.trim="form.endereco"
            placeholder="Digite seu endereço"
            autocomplete="street-address"
            fluid
          />
        </IconField>
      </div>

      <div class="campo-cadastro">
        <label for="login">Login</label>

        <IconField>
          <InputIcon>
            <i class="pi pi-at" />
          </InputIcon>

          <InputText
            id="login"
            v-model.trim="form.login"
            placeholder="Escolha um nome de usuário"
            autocomplete="username"
            required
            fluid
          />
        </IconField>
      </div>

      <div class="campo-cadastro">
        <label for="senha">Senha</label>

        <IconField>
          <InputIcon>
            <i class="pi pi-lock" />
          </InputIcon>

          <InputText
            id="senha"
            v-model="form.senha"
            type="password"
            placeholder="Crie uma senha"
            autocomplete="new-password"
            required
            fluid
          />
        </IconField>
      </div>

      <div class="opcao-administrador">
        <Checkbox
          v-model="form.administrador"
          inputId="administrador"
          :binary="true"
        />

        <label for="administrador">
          Cadastrar como administrador
        </label>
      </div>

      <AppButton
        :label="carregando ? 'Cadastrando...' : 'Cadastrar'"
        type="submit"
        :disabled="carregando"
        class="botao-cadastrar"
      />

      <p v-if="erro" class="mensagem erro">
        <i class="pi pi-exclamation-circle" />
        {{ erro }}
      </p>

      <p v-if="sucesso" class="mensagem sucesso">
        <i class="pi pi-check-circle" />
        {{ sucesso }}
      </p>
    </form>

    <p class="login-link">
      Já tem conta?
      <router-link to="/login">Entrar</router-link>
    </p>
  </div>
</template>

<script>
import InputText from 'primevue/inputtext'
import IconField from 'primevue/iconfield'
import InputIcon from 'primevue/inputicon'
import Checkbox from 'primevue/checkbox'

import AppButton from '@/components/AppButton.vue'

export default {
  name: 'telaCadastro',

  components: {
    InputText,
    IconField,
    InputIcon,
    Checkbox,
    AppButton
  },

  data() {
    return {
      form: {
        nome: '',
        email: '',
        endereco: '',
        login: '',
        senha: '',
        administrador: false
      },
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
        const check = await fetch(
          `/api/usuarios/login/${encodeURIComponent(this.form.login)}`
        )

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
.tela-cadastro {
  max-width: 440px;
  margin: 3rem auto;
  padding: 2rem;
  background: var(--surface-card);
  border: 1px solid var(--surface-border);
  border-radius: 12px;
}

.titulo-cadastro {
  margin: 0;
  text-align: center;
  font-size: 1.8rem;
  font-weight: 700;
}

.subtitulo-cadastro {
  margin: 0.5rem 0 1.75rem;
  text-align: center;
  color: var(--text-color-secondary);
  font-size: 0.9rem;
}

form {
  display: flex;
  flex-direction: column;
  gap: 1.15rem;
}

.campo-cadastro {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}

.campo-cadastro label {
  font-size: 0.9rem;
  font-weight: 600;
}

.campo-cadastro :deep(.p-icon-field) {
  width: 100%;
}

.campo-cadastro :deep(.p-inputtext) {
  width: 100%;
}

.opcao-administrador {
  display: flex;
  align-items: center;
  gap: 0.6rem;
  margin: 0.25rem 0;
}

.opcao-administrador label {
  font-size: 0.9rem;
  cursor: pointer;
}

.botao-cadastrar {
  width: 100%;
}

.mensagem {
  display: flex;
  align-items: flex-start;
  gap: 0.5rem;
  margin: 0;
  font-size: 0.9rem;
  overflow-wrap: anywhere;
}

.erro {
  color: #b00020;
}

.sucesso {
  color: #0a7d28;
}

.login-link {
  margin: 1.5rem 0 0;
  text-align: center;
  font-size: 0.9rem;
}

.login-link a {
  font-weight: 600;
}

@media (max-width: 480px) {
  .tela-cadastro {
    margin: 1.5rem 1rem;
    padding: 1.5rem;
  }
}
</style>
