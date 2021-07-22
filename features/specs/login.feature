#language: pt

Funcionalidade: Login
    Sendo um usuário cadastrado
    Quero acessar o sistema da Rocklov
    Para que eu possa anunciar meus equipamentos musicais

    @login
    Cenario: Login do usuário

        Dado que acesso a página principal
        Quando submeto minhas credenciais com "andrezasilva744@gmail.com" e "pwd123"
        Então sou redirecionado para o Dashboard

    Esquema do Cenario: Tentar logar
        Dado que acesso a página principal
        Quando submeto minhas credenciais com "<email_input>" e "<senha_input>"
        Então vejo a mensagem de alerta: "<mensagem_output>"

        Exemplos:
            | email_input               | senha_input | mensagem_output                  |
            | andrezasilva744@gmail.com | abc123      | Usuário e/ou senha inválidos.    |
            | andrezasilva744@404.com   | pwd123      | Usuário e/ou senha inválidos.    |
            | andrezasilva744&aol.com   | pwd123      | Oops. Informe um email válido!   |
            |                           | pwd123      | Oops. Informe um email válido!   |
            | andrezasilva744@gmail.com |             | Oops. Informe sua senha secreta! |




# Cenario: Senha incorreta

#     Dado que acesso a página principal
#     Quando submeto minhas credenciais com senha incorreta
#     Então vejo a mensagem de alerta: Usuário e/ou senha inválidos.

# Cenário: Email não cadastrado

#     Dado que acesso a página principal
#     Quando submeto minhas credenciais com email que não existe na Rocklov
#     Então vejo a mensagem de alerta: Usuário e/ou senha inválidos.

# Cenario: Email incorreto

#     Dado que acesso a página principal
#     Quando submeto minhas credenciais com email incorreto
#     Então vejo a mensagem de alerta: Oops. Informe um email válido!

# Cenario: Email não informado

#     Dado que acesso a página principal
#     Quando submeto minhas credenciais sem o email
#     Então vejo a mensagem de alerta: Oops. Informe um email válido!

# Cenario: Senha não informada

#     Dado que acesso a página principal
#     Quando submeto minhas credenciais sem a senha
#     Então vejo a mensagem de alerta: ops. Informe sua senha secreta!