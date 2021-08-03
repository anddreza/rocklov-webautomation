# require_relative "routes/signup"
# require_relative "libs/mongo"


describe "POST /signup " do 
    context "novo usuario" do 
    before(:all) do 
        payload = {name: "Pitty", email: "pitty@bol.com.br", password: "pwd123"}
        MongoDB.new.remove_user(payload[:email])

        @result = Signup.new.create(payload)
        end 
        it "valida status code" do 
            expect(@result.code).to eql 200
        end 

        it "valida id do usuário" do 
            expect(@result.parsed_response["_id"].length).to eql 24
        end 
    end 

    context "usuario ja existe" do 
         before(:all) do
            # monto o payload - dado que eu tenho um novo cliente, um novo usuário 
            payload = {name: "Joao da Silva", email: "joao@ig.com.br", password: "pwd123"}
            MongoDB.new.remove_user(payload[:email])
            # faço uma chamada para fazer o cadastro via api, é o que garante a duplicidade, faz parte da precondição - e o email desse usuario já foi cadastrado no sistema 

            Signup.new.create(payload)
            
            # ação do meu teste - quando faço uma requisição para a rota /signup
            @result = Signup.new.create(payload)
         end 

            it "deve retornar 409" do 
                # então deve retornar 409 
                expect(@result.code).to eql 409
            end    
            
            it "deve retornar mensagem " do 
                expect(@result.parsed_response["error"]).to eql "Email already exists :("
            end 
        end 

        # name é obrigatório
        # email é obrigatório
        # password é obrigatório 

        

    end 
