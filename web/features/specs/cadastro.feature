#language: pt

Funcionalidade: Cadastro

    Sendo um músico que possui equipamentos musicais
    Quero fazer o meu cadastro no RockLov
    Para que eu possa disponibilizá-los para locação

    @cadastro
    Cenario: Fazer cadastro

        Dado que acesso a página de cadastro
        Quando submeto o seguinte formulário de cadastro:
            | nome          | email                     | senha  |
            | Andreza Silva | andrezasilva744@gmail.com | pwd123 |
        Então sou redirecionado para o Dashboard

    Esquema do Cenario: Tentativa de Cadastro

        Dado que acesso a página de cadastro
        Quando submeto o seguinte formulário de cadastro:
            | nome         | email         | senha         |
            | <nome_input> | <email_input> | <senha_input> |
        Então vejo a mensagem de alerta: "<mensagem_output>"
        #placeholder do cucumber
        Exemplos:
            | nome_input    | email_input               | senha_input | mensagem_output                  |
            |               | andrezasilva74x@gmail.com | abc123      | Oops. Informe seu nome completo! |
            | Andreza Silva |                           | pwd123      | Oops. Informe um email válido!   |
            | Andreza Silva | andrezasilva744*gmail.com | pwd123      | Oops. Informe um email válido!   |
            | Andreza Silva | andrezasilva744&gmail.com | pwd123      | Oops. Informe um email válido!   |
            | Andreza Silva | andrezasilva74x@gmail.com |             | Oops. Informe sua senha secreta! |

# @tentativa_cadastro
# Cenario: Submeter cadastro sem o nome

# Dado que acesso a página de cadastro
# Quando submeto o seguinte formulário de cadastro:
#  | nome         |email                    |senha |
#  |              |andrezasilva744@gmail.com|pwd123|
# Então vejo a mensagem de alerta: "Oops. Informe seu nome completo!"

# @tentativa_cadastro
# Cenario: Submeter cadastro sem o email

# Dado que acesso a página de cadastro
# Quando submeto o seguinte formulário de cadastro:
#  | nome         |email                    |senha |
#  |Andreza Silva |                         |pwd123|
# Então vejo a mensagem de alerta: "Oops. Informe um email válido!"

# @tentativa_cadastro
# Cenario: Submeter cadastro com email incorreto

# Dado que acesso a página de cadastro
# Quando submeto o seguinte formulário de cadastro:
#  | nome         |email                    |senha |
#  |Andreza Silva |andrezasilva744&gmail.com|pwd123|
# Então vejo a mensagem de alerta: "Oops. Informe um email válido!"

# @tentativa_cadastro
# Cenario: Submeter cadastro sem a senha

# Dado que acesso a página de cadastro
# Quando submeto o seguinte formulário de cadastro:
#  | nome         |email                    |senha |
#  |Andreza Silva |andrezasilva744@gmail.com|      |
# Então vejo a mensagem de alerta: "Oops. Informe sua senha secreta!"
