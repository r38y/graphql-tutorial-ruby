class Resolvers::CreateVote < GraphQL::Function
  argument :linkId, types.ID

  type Types::VoteType

  def call(_obj, args, ctx)
    Rails.logger.fatal(args.to_h)
    Vote.create!(
      link: Link.find_by(id: args[:linkId]),
      user: ctx[:current_user]
    )
  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
  end
end
