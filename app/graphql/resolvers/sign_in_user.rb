class Resolvers::SignInUser < GraphQL::Function
  argument :email, !Types::AuthProviderEmailInput

  # defines inline return type for the mutation
  type do
    name 'SigninPayload'

    field :token, types.String
    field :user, Types::UserType
  end

  def call(_obj, args, _ctx)
    input = args[:email]

    # basic validation
    return unless input

    user = User.find_by email: input[:email]

    # ensures we have the correct user
    return unless user
    return unless user.valid_password?(input[:password])
    
    valid_password = user.valid_password?(input[:password])

    if (user.respond_to?(:valid_for_authentication?) && !user.valid_for_authentication? { valid_password }) || !valid_password
        GraphQL::ExecutionError.new('Incorrect Email/Password')
    end
    
    token = user.create_token

    user.save
    
    OpenStruct.new({
      user: user,
      token: token
    })
  end
end