require_relative "base_api"

class Signup < BaseApi
  # include HTTParty
  # base_uri "http://rocklov-web:3333"

  def create (payload)

    return self.class.post(
             "/signup",
             body: payload.to_json,
             headers: {
               "Content-Type": "application/json",
             },
           )
  end
end
