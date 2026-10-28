import { createRouter, createWebHistory } from 'vue-router'
import telaPrincipal from '@/views/telaPrincipal.vue'
import { isLoggedIn, isAdmin } from '@/services/auth'

export const routes = [
  { path: '/',              name: 'telaPrincipal',   component: telaPrincipal },
  { path: '/login',         name: 'login',           component: () => import('@/views/telaLogin.vue') },
  { path: '/cadastro',      name: 'cadastro',        component: () => import('@/views/telaCadastro.vue') },
  { path: '/produto',       name: 'telaProduto',     component: () => import('@/views/telaProduto.vue') },
  { path: '/carrinho',      name: 'telaCarrinho',    component: () => import('@/views/telaCarrinho.vue') },
  {
    path: '/usuario',
    name: 'telaUsuario',
    component: () => import('@/views/telaUsuario.vue'),
    meta: { requiresAuth: true }
  },
  {
    path: '/administrador',
    name: 'telaAdministrador',
    component: () => import('@/views/telaAdministrador.vue'),
    meta: { requiresAuth: true, requiresAdmin: true }
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

router.beforeEach((to) => {
  if (to.meta.requiresAuth && !isLoggedIn()) {
    return { name: 'login', query: { redirect: to.fullPath } }
  }
  if (to.meta.requiresAdmin && !isAdmin()) {
    return { name: 'telaUsuario' }
  }
})

export default router