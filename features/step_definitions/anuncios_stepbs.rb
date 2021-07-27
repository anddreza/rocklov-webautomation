Dado('Login com {string} e {string}') do |email, password|
    @email = email 
   
    @login_page.open 
    @login_page.with(email, password)
  end

# Dado('que estou logado como {string} e {string}') do |email, password|
    # @email = email 
    # visit "/"
    # find("input[placeholder='Seu email']").set email
    # find("input[type=password]").set password

    # click_button "Entrar"
    
    # login_page = LoginPage.new
    # @login_page.open 
    # @login_page.with(email, password)
    # login_page.campo_email.set email
    # login_page.campo_senha.set password
    # login_page.botao_entrar 
# end
  
Dado('que acesso o formulario de cadastro de anúncios') do
    @dash_page.goto_equipo_form 
    # click_button "Criar anúncio"

    # isso é um checkpoint para garantir que estou no lugar correto
    # expect(page).to have_css "#equipoForm"
end

Dado('que eu tenho o seguinte equipamento:') do |table|
   @anuncio = table.rows_hash
#    log @anuncio 

    MongoDB.new.remove_equipo(@anuncio[:nome], @email )
end
  
Quando('submeto o cadastro desse item') do
    @equipos_page.create(@anuncio)
    
#     thumb = Dir.pwd  + "/features/support/fixtures/images/" + @anuncio[:thumb]

#     find("#thumbnail input[type=file]", visible: false).set thumb 

#     find("input[placeholder$=equipamento]").set @anuncio[:nome]
#     find("#category").find('option', text: @anuncio[:categoria]).select_option
#     find("input[placeholder^=Valor]").set @anuncio[:preco]

#   click_button "Cadastrar"
    
end
  
Então('devo ver esse item no meu Dashboard') do
    # anuncios = find(".equipo-list")
    expect(@dash_page.equipo_list).to have_content @anuncio[:nome]
    expect(@dash_page.equipo_list).to have_content "R$#{@anuncio[:preco]}/dia"
end

Então('deve conter a mensagem de alerta: {string}') do |expect_alert|
    expect(@alert.dark).to have_text expect_alert 
end