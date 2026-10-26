import { createRouter, createWebHistory } from 'vue-router'
import telaPrincipal from '@/views/telaPrincipal.vue'

const routes = [
  {
    path: '/',
    name: 'telaPrincipal',
    component: telaPrincipal
  },
  {
    path: '/login',
    name: 'login',
    component: () => import('@/views/telaLogin.vue')
  },
  {
    path: '/cadastro',
    name: 'cadastro',
    component: () => import('@/views/telaCadastro.vue')
  },
  {
    path: '/produto',
    name: 'telaProduto',
    component: () => import('@/views/telaProduto.vue')
  },
  {
    path: '/carrinho',
    name: 'telaCarrinho',
    component: () => import('@/views/telaCarrinho.vue')
  },
  {
    path: '/usuario',
    name: 'telaUsuario',
    component: () => import('@/views/telaUsuario.vue')
  },
  {
    path: '/administrador',
    name: 'telaAdministrador',
    component: () => import('@/views/telaAdministrador.vue')
  }
]

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes
})

export default router   