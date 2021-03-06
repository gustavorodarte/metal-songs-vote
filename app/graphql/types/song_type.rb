# defines a new GraphQL type
Types::SongType = GraphQL::ObjectType.define do
  # this type is named `Song`
  name 'Song'

  # it has the following fields
  field :id, !types.ID
  field :name, !types.String
  field :band, !types.String
end