class User
    include Mongoid::Document
    
    field :name, type: String
    field :email, type: String
    field :cpf, type: String
end