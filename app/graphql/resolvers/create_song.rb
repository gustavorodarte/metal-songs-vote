class Resolvers::CreateSong <  GraphQL::Function

  argument :name, !types.String
  argument :band, !types.String

  type Types::SongType

  def call(_obj, args, ctx)
    Song.create!(
      name: args[:name],
      band: args[:band],
    )
  end
end