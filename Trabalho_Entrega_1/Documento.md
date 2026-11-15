# Trabalho final Entrega 1 - Loja de cartas

UNIVERSIDADE FEDERAL DO CEARÁ                                 \
INSTITUTO UNIVERSIDADE VIRTUAL                                \
Disciplina: SMD0052 - PROGRAMAÇÃO PARA WEB I (2026.2 - T01)   \
Professor: LEONARDO OLIVEIRA MOREIRA                          

#### Equipe:
ALIDJA DAFNY ALVES RODRIGUES - 556344             \
EDUARDO LOPES FERNANDEZ FERNANDES - 565051        \
FELIPE MOREIRA PONTES DA ROCHA - 564652           \
GUILHERME ALVES TEIXEIRA DA SILVA - 568154        \
HENRIQUE SEGUNDO DA FONSECA - 566118              \
JOAO LUCAS NASCIMENTO SILVA - 566469              

Descrição geral do sistema: O sistema se trata de um e-commerce de cartas, expecificamente de YU GI OH, para a venda de cartas single (unitárias); o sistema se trata de uma atividade avaliativa para a disciplina de programação web do semestre 2026.2

### Tecnologias:
| Camada             | Tecnologia                  | Função                                                          | Justificativa                                       |
|--------------------|-----------------------------|-----------------------------------------------------------------|-----------------------------------------------------|
| Linguagem          | Java 21 LTS                 | Linguagem de programação do backend                             | Versão LTS do Java já bem estabelecida.             |
| Backend            | Spring Boot                 | Estrutura base e configuração automática da aplicação           | reduz a configuração manual, fornece servidor de aplicação Tomcat e agrega as dependências do backend no projeto |
| Backend (web)      | Spring MVC                  | Camada web: controllers e roteamento de requisições HTTP        | Mapeia endpoints para métodos de controllers e separa as rotas da regra de negócio.|
| Persistência       | Spring Data JPA + Hibernate | Repositórios de acesso a dados sobre a API JPA                  | Gera as operações básicas de CRUD a partir de interfaces e converte objetos java em registros relacionais.|
| Banco de dados     | PostgreSQL                  | Sistema gerenciador de banco de dados relacional       | Suporta integridade referencial, transações e chaves estrangeiras, necessárias para pedidos, estoque e clientes. Além de ser um SGBD familiar para a equipe.  |
| Frontend           | Vue.js                      | Interface web do usuário                                  | Constrói a interface a partir de componentes reutilizáveis e consome a nossa API Rest|
| Serviço externo    | YGOProDeck API        | Fonte de dados das cartas (nome, tipo, imagem, atributos) | Evita o cadastro manual de milhares de cartas. É consumida pelo backend, que a integra ao catálogo da loja.                                                      |
| Versionamento      | Git                         | Controle de versão local                                  | Registra o histórico de alterações e permite o trabalho em ramificações.|
| Repositório remoto | GitHub                      | Hospedagem dorepositório e colaboração               | Centraliza o código do projeto e permite o compartilhamento entre os integrantes.|

### Arquitetura do projeto:
![Arquitetura do projeto imagem](Trabalho_Entrega_1\imagens\Arquitetura_projeto.png)

### Imagens do projeto no Figma:
Tela inicial
![Tela inicial imagem](Trabalho_Entrega_1\imagens\Pagina_Incial.png)
Tela de login
![Tela de login imagem](Trabalho_Entrega_1\imagens\Pagina_login.png)
Tela de cadastro
![Tela de cadastro imagem](Trabalho_Entrega_1\imagens\Pagina_cadastro.png)
Tela de carramento
![Tela de carramento imagem](Trabalho_Entrega_1\imagens\Pagina_carregamento_cadastro.png)
Pop up de logout
![Pop up de logout imagem](Trabalho_Entrega_1\imagens\Pagina_Inicial_popup.png)
Tela de produto
![Tela de produto imagem](Trabalho_Entrega_1\imagens\Pagina_produto.png)
Tela de carrinho de compras
![Tela de carrinho de compras imagem](Trabalho_Entrega_1\imagens\Pagina_carrinho.png)

#### Links importantes:
Link do projeto no GitHub: https://github.com/Dudi06/projeto-final-prog-web                                             \
Link das telas no Figma: https://www.figma.com/design/HwV6WgayKOvu9IENdVSxEu/yugioh?node-id=0-1&t=1DJSUEI8fjXQ7MCV-1