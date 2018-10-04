# defines a new GraphQL type
Types::UserType = GraphQL::ObjectType.define do
  # this type is named `Song`
  name 'User'

  # it has the following fields
  field :id, !types.ID
  field :name, !types.String
  field :email, !types.String
end