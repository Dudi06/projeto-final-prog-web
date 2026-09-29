### Visão relacional para o banco de dados
1. Para a disciplina criar o banco com o uso de Postgress, no pgadm4
2. Para a disciplina criar um usuário responsavel com login: "aluno" e senha: "ufc123"
3. Da entidade Card, card_images ainda não foi adicionado


| Usuario |      |       |       |               |       |          |
|---      |---   |---    |---    |---            |---    |---       |
| id (PK) | nome | login | senha | administrador | email | endereco |

| Venda |         |               |
|---    |---      |---            |
|id(PK) |data_hora|usuario_id (FK)|

| Card |    |    |                     |         |    |    |              |                |               |          |            |                  |
|---   |--- |--- |---                  |---      |--- |--- |---           |---             |---            |---       |---         |---               |
|id(PK)|nome|type|humanReadableCardType|frameType|desc|race|ygoprodeck_url|cardmarket_price|tcgplayer_price|ebay_price|amazon_price|coolstuffinc_price|

| Cardset |        |        |            |         |
|---      |---     |---     |---         |---      |
|id(PK)   |set_name|set_code|num_of_cards|set_image|

| Monstro       |      |   |   |         |         |
|---            |---   |---|---|---      |---      |
|card_id(PK)(FK)|id(PK)|atk|def|level    |attribute|

| venda_card    |                |     |          |
|---            |---             |---  |---       |
|card_id(PK)(FK)|venda_id(PK)(FK)|preco|quantidade|

| card_cardset   |                  |        |        |          |               |         |
|---            |---               |---     |---     |---       |---            |---      |  
|card_id(PK)(FK)|cardset_id(PK)(FK)|set_name|set_code|set_rarity|set_rarity_code|set_price|

Legenda: 
>PK - Primary Key (Chave primária)

>FK - Foreign Key (Chave estrangeira)