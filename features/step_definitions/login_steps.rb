
Dado('que acesso a página principal') do
    visit "/"
    login_page = LoginPage.new
    login_page.open 
end
  
Quando('submeto minhas credenciais com {string} e {string}') do |email, password|
    login_page = LoginPage.new
  
    login_page.with(email, password)
    # login_page.campo_email.set email
    # login_page.campo_senha.set password
    # login_page.botao_entrar 
end
