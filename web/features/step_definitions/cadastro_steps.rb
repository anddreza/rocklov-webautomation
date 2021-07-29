
Dado('que acesso a página de cadastro') do
  # visit "/signup"
  @signup_page.open 
end
  
# Quando('submeto o meu cadastro completo') do
#   MongoDB.new.remove_user("andrezasilva744@gmail.com")
#     find("#fullName").set "Andreza Silva"
#     find("#email").set "andrezasilva744@gmail.com"
#     find("#password").set "pwd123"
#     click_button "Cadastrar"
# end

Quando('submeto o seguinte formulário de cadastro:') do |table|
  # log table.hashes
  user = table.hashes.first
  # log user
  MongoDB.new.remove_user(user[:email])
  @signup_page.create(user)
    # find("#fullName").set user[:nome]
    # find("#email").set user[:email]
    # find("#password").set user[:senha]
    # click_button "Cadastrar"
    # sleep 5 
end

# Então('sou redirecionado para o Dashboard') do
#    expect(page).to have_css ".dashboard"
# end

# Quando('submeto o meu cadastro sem o nome') do
#   find("#email").set Faker::Internet.free_email 
#   find("#password").set "pwd123"

#   click_button "Cadastrar"
# end

# Então('vejo a mensagem de alerta: Oops. Informe seu nome completo!') do
#   alert = find(".alert-dark")
#   expect(alert.text).to eql "Oops. Informe seu nome completo!"
# end

# Quando('submeto o meu cadastro sem o email') do                               
#   find("#fullName").set "Andreza Silva"
#   find("#password").set "pwd123"

#   click_button "Cadastrar"
# end       

# Quando('submeto o meu cadastro com email incorreto') do
#   find("#fullName").set "Andreza Silva"
#   find("#email").set "andrezasilva744*gmail.com"
#   find("#password").set "pwd123"

#   click_button "Cadastrar"
# end                                                                
                                                                              
# Então('vejo a mensagem de alerta: Oops. Informe um email válido!') do         
#   alert = find(".alert-dark")
#   expect(alert.text).to eql "Oops. Informe um email válido!"
# end                                                                           
          
# Quando('submeto o meu cadastro sem a senha') do                                 
#   find("#fullName").set "Andreza Silva"
#   find("#email").set Faker::Internet.free_email 
 
#   click_button "Cadastrar" 
# end                                                                             
                                                                                
# Então('vejo a mensagem de alerta: Oops. Informe sua senha secreta!') do         
#   alert = find(".alert-dark")
#   expect(alert.text).to eql "Oops. Informe sua senha secreta!"
# end                                                                             
                                                                     
# Então('vejo a mensagem de alerta: {string}') do |expect_alert|
#   alert = find(".alert-dark")
#   expect(alert.text).to eql expect_alert  
# end