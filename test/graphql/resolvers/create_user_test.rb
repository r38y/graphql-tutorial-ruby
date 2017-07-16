require 'test_helper'

class Resolvers::CreateUserTest < ActiveSupport::TestCase
  def perform(args = {})
    Resolvers::CreateUser.new.call(nil, args, {})
  end

  test 'creating new user' do
    link = perform(
      name: 'Bob Johnson',
      authProvider: {
      email: {
        email: 'bob@example.com',
        password: 'password'
      }
    })

    assert link.persisted?
    assert_equal link.name, 'Bob Johnson'
    assert_equal link.email, 'bob@example.com'
  end
end
