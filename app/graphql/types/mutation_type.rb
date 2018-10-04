Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createUser, function: Resolvers::CreateUser.new
  field :createSong, function: Resolvers::CreateSong.new
  field :signinUser, function: Resolvers::SignInUser.new
end
