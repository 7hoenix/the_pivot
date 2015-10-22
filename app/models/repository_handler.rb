class RepositoryHandler
  attr_reader :client, :user

  def initialize(current_client, current_user)
    @client = current_client
    @user   = current_user
  end

  def populate_repositories
    client.repositories(user.nickname).map do |repo|
      Repository.create(full_name: repo[:full_name], name: repo[:name])
    end
  end
end
