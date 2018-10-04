Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :allSongs, !types[Types::SongType] do
    resolve ->(obj, args, ctx) { Song.all }
  end
end
