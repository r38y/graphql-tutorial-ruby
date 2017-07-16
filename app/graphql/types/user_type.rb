Types::UserType = GraphQL::ObjectType.define do
  name 'User'
  field :id, !types.ID
  field :name, !types.String
  field :email, !types.String
  field :password, !types.String
  field :votes, -> { !types[Types::VoteType] }
  field :voteCount, types.Int do
    resolve ->(obj, args, ctx) { obj.votes.count }
  end
end
