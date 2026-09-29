# Trabalho final Entrega 1 - Loja de cartas

UNIVERSIDADE FEDERAL DO CEARÁ
INSTITUTO UNIVERSIDADE VIRTUAL
Disciplina: SMD0052 - PROGRAMAÇÃO PARA WEB I (2026.2 - T01)
Professor: LEONARDO OLIVEIRA MOREIRA

Equipe:
ALIDJA DAFNY ALVES RODRIGUES - 556344
EDUARDO LOPES FERNANDEZ FERNANDES - 565051
FELIPE MOREIRA PONTES DA ROCHA - 564652
GUILHERME ALVES TEIXEIRA DA SILVA - 568154
HENRIQUE SEGUNDO DA FONSECA - 566118
JOAO LUCAS NASCIMENTO SILVA - 566469

Descrição geral do sistema: O sistema se trata de um e-commerce de cartas, expecificamente de YU GI OH, para a venda de cartas single (unitárias); o sistema se trata de uma atividade avaliativa para a disciplina de programação web do semestre 2026.2

Tecnologias:
| Camada             | Tecnologia                  | Função                                                          | Justificativa                                                                                                                                                             |
|--------------------|-----------------------------|-----------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Linguagem          | Java 21 LTS                 | Linguagem de programação do backend                             | versão LTS do Java já bem estabelecida.                                                                                                                                   |
| Backend            | Spring Boot                 | Estrutura base e configuração automática da aplicação           | reduz a configuração manual, fornece servidor de aplicação Tomcat e agrega as dependências do backend no projeto                                                          |
| Backend (web)      | Spring MVC                  | Camada web: controllers e roteamento de requisições HTTP        | mapeia endpoints para métodos de controllers e separa as rotas da regra de negócio.                                                                                       |
| Persistência       | Spring Data JPA + Hibernate | Repositórios de acesso a dados sobre a API JPA                  | gera as operações básicas de CRUD a partir de interfaces e converte objetos java em registros relacionais.                                                                |
| Banco de dados     | PostgreSQL                  | Sistema gerenciador<br>de banco de dados<br>relacional<br>      | suporta integridade referencial, transações e<br>chaves estrangeiras, necessárias para<br>pedidos, estoque e clientes. Além de ser um<br>SGBD familiar para a equipe.<br> |
| Frontend           | Vue.js                      | Interface web do<br>usuário<br>                                 | constrói a interface a partir de componentes<br>reutilizáveis e consome a nossa API Rest                                                                                  |
| Serviço externo    | YGOProDeck<br>API<br>       | Fonte de dados das<br>cartas (nome, tipo,<br>imagem, atributos) | Evita o cadastro manual de milhares de<br>cartas. É consumida pelo backend, que a<br>integra ao catálogo da loja.<br>                                                     |
| Versionamento      | Git                         | Controle de versão<br>local<br>                                 | registra o histórico de alterações e permite o<br>trabalho em ramificações.<br>                                                                                           |
| Repositório remoto | GitHub                      | Hospedagem do<br>repositório e<br>colaboração<br>               | centraliza o código do projeto e permite o<br>compartilhamento entre os integrantes.                                                                                      |



Link do projeto no GitHub: https://github.com/Dudi06/projeto-final-prog-web
Link das telas no Figma: https://www.figma.com/design/HwV6WgayKOvu9IENdVSxEu/yugioh?node-id=0-1&t=1DJSUEI8fjXQ7MCV-1