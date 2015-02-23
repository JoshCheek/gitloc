class Gitloc
  Error = Class.new StandardError

  class RepoDoesNotExistError < Error
    def initialize(repo_name)
      super "#{repo_name} does not exist"
    end
  end
end
