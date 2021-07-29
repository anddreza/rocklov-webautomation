Então('sou redirecionado para o Dashboard') do
    expect(@dash_page.on_dash?).to be true
    # to have_css ".dashboard"
end

Então('vejo a mensagem de alerta: {string}') do |expect_alert|
   # alert = find(".alert-dark")
    expect(@alert.dark).to eql expect_alert  
end