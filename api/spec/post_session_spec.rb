require_relative "routes/sessions"
require_relative "helpers"

describe "POST /sessions" do
    context "login com sucesso" do 
        before(:all) do 

            payload = { email: "betao@yahoo.com", password: "pwd123"}
            @result = Sessions.new.login(payload)
    # puts "teste"
    # payload = { email: "betao@yahoo.com", password: "pwd123"}

    # @result = HTTParty.post(
    # "http://rocklov-web:3333/sessions", 
    # body: payload.to_json,
    # headers: {
    #     "Content-Type": "application/json"
    #     },
    # )
        end 

        it "valida status code" do 
            expect(@result.code).to eql 200
        end 

        it "valida id do usuário" do 
            expect(@result.parsed_response["_id"].length).to eql 24
        end 
    end

    # examples = [
    #     {
    #         title: "senha incorreta",
    #         payload: {email: "betao@yahoo.com", password: "123456"},
    #         code: 401, 
    #         error:  "Unauthorized"
    #     },
    #     {
    #         title: "usuario não existe",
    #         payload: {email: "404@yahoo.com", password: "123456"},
    #         code: 401, 
    #         error:  "Unauthorized"
    #     },
    #     {
    #         title: "email em branco",
    #         payload: {email: "", password: "123456"},
    #         code: 412, 
    #         error:  "required email"
    #     },
    #     {
    #         title: "sem o campo email",
    #         payload: {password: "123456"},
    #         code: 412, 
    #         error:  "required email"
    #     },
    #     {
    #         title: "senha em branco",
    #         payload: {email: "betao@yahoo.com", password: ""},
    #         code: 412, 
    #         error:  "required password"
    #     },
    #     {
    #         title: "sem o campo senha",
    #         payload: {email: "betao@yahoo.com"},
    #         code: 412, 
    #         error:  "required password"
    #     },
    # ]


# puts examples.to_json

examples = Helpers::get_fixture("login")
# examples = YAML.load(File.read(Dir.pwd + "/spec/fixtures/login.yml"), symbolize_names: true)

    examples.each do |e|
    #### COPIADO E COLADO DO CIMA, POREM COM O CONTEXTO DIFERENTE 
    context "#{e[:title]}" do 
        before(:all) do 
            # payload = { email: "betao@yahoo.com", password: "123456"}
            @result = Sessions.new.login(e[:payload])
        end 

        it "valida status code #{e[:code]}" do 
            expect(@result.code).to eql e[:code]
        end 

        it "valida id do usuário" do 
            expect(@result.parsed_response["error"]).to eql e[:error]
            end 
         end
    end 
end 