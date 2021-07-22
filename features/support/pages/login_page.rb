

class LoginPage
    include Capybara::DSL

    def open 
        visit "/"
    end 

    def with (email, password)
        return find("input[placeholder='Seu email']").set email
        return find("input[type=password]").set password 
        click_button "Entrar"
    end 
    # def campo_email 
    #     return find("input[placeholder='Seu email']")
    # end

    # def campo_senha 
    #    return find("input[type=password]")
    # end 

    # def botao_entrar
    #     click_button "Entrar"
    # end 
end 