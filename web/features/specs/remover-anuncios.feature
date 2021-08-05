# language: pt


Funcionalidade: Remover Anúncios
    Sendo um anúnciante que possui um equipamento indesejado
    Quero poder remover esse anúncio
    Para que eu possa manter o meu dashboard atualizado

    @temp
    Cenario: Remover um anúncio
        * Login com "spide@hotmail.com" e "pwd123"

        Dado que eu tenho um anúncio indesejado:
            | thumb     | telecaster.jpg |
            | nome      | Telecaster     |
            | categoria | Cordas         |
            | preco     | 50             |
        Quando eu solicito a exclusão desse item
            E confirmo a exclusão
        Então não devo ver esse item no meu Dashboard

    Cenario: Desistir da exclusão

        Dado que eu tenho um anúncio indesejado:
            | thumb     | conga.jpg |
            | nome      | Conga     |
            | categoria | Cordas    |
            | preco     | 100       |
        Quando eu solicito a exclusão desse item
            Mas não confirmo a solicitação
        Então não devo ver esse item no meu Dashboard

    