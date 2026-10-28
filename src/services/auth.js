const KEY = 'auth_user'

export function saveAuth(user) {
    // Remove a senha antes de persistir — o backend devolve no JSON,
    // mas ela nunca deve ser guardada no cliente
    const { id, nome, login, email, endereco, administrador } = user
    localStorage.setItem(KEY, JSON.stringify({ id, nome, login, email, endereco, administrador }))
}

export function getAuth() {
    const raw = localStorage.getItem(KEY)
    return raw ? JSON.parse(raw) : null
}

export function isLoggedIn() {
    return getAuth() !== null
}

export function isAdmin() {
    const u = getAuth()
    return !!(u && u.administrador === true)
}

export function logout() {
    localStorage.removeItem(KEY)
}