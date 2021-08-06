Dado("Login com {string} e {string}") do |email, password|
  @email = email

  @login_page.open
  @login_page.with(email, password)

  # checkpoint para garantir que estamos no Dashboard
  expect(@dash_page.on_dash?).to be true
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

Dado("que acesso o formulario de cadastro de anúncios") do
  @dash_page.goto_equipo_form
  # click_button "Criar anúncio"

  # isso é um checkpoint para garantir que estou no lugar correto
  # expect(page).to have_css "#equipoForm"
end

Dado("que eu tenho o seguinte equipamento:") do |table|
  @anuncio = table.rows_hash
  #    log @anuncio

  MongoDB.new.remove_equipo(@anuncio[:nome], @email)
end

Quando("submeto o cadastro desse item") do
  @equipos_page.create(@anuncio)

  #     thumb = Dir.pwd  + "/features/support/fixtures/images/" + @anuncio[:thumb]

  #     find("#thumbnail input[type=file]", visible: false).set thumb

  #     find("input[placeholder$=equipamento]").set @anuncio[:nome]
  #     find("#category").find('option', text: @anuncio[:categoria]).select_option
  #     find("input[placeholder^=Valor]").set @anuncio[:preco]

  #   click_button "Cadastrar"

end

Então("devo ver esse item no meu Dashboard") do
  # anuncios = find(".equipo-list")
  expect(@dash_page.equipo_list).to have_content @anuncio[:nome]
  expect(@dash_page.equipo_list).to have_content "R$#{@anuncio[:preco]}/dia"
end

Então("deve conter a mensagem de alerta: {string}") do |expect_alert|
  expect(@alert.dark).to have_text expect_alert
end

#Remover anuncios.feature são steps gerados pelo cucumber com o intuito de automatizar essa parte do teste;

Dado("que eu tenho um anúncio indesejado:") do |table|
  user_id = page.execute_script(" return localStorage.getItem('user')")
  # log user_id

  thumbnail = File.open(File.join(Dir.pwd, "features/support/fixtures/images", table.rows_hash[:thumb]), "rb")
  @equipo = {
    thumbnail: thumbnail,
    name: table.rows_hash[:nome],
    category: table.rows_hash[:categoria],
    price: table.rows_hash[:preco],
  }

  EquiposService.new.create(@equipo, user_id)

  visit current_path
end

Quando("eu solicito a exclusão desse item") do
  # equipo = find(".equipo-list li", text: @equipo[:name])
  # equipo.find(".delete-icon").click
  @dash_page.request_removal(@equipo[:name])
end

Quando("confirmo a exclusão") do
  # click_on "Sim"
  @dash_page.confirm_removal
end


Quando('não confirmo a solicitação') do
  @dash_page.cancel_removal
end


Então("não devo ver esse item no meu Dashboard") do
  # result = page.has_no_css?(".equipo-list li", text: @equipo[:name])
  expect(
    @dash_page.has_no_equipo?(@equipo[:name])
  ).to be true
end

Então('esse item deve permanecer no meu Dashboard') do                          
  expect(@dash_page.equipo_list).to have_content @equipo[:name]

end                                                                             
                                                                                