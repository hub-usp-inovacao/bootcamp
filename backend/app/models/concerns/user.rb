class User
    include Mongoid::Document
    
    field :id, type: String
    field :name, type: String
    field :email, type: String
    field :cpf, type: String
end