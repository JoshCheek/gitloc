require 'gitloc'

RSpec.describe Gitloc do
  it 'raises RepoDoesNotExistError when the repo does not exist' do
    expect { Gitloc.call("not-a-repo") }
      .to raise_error Gitloc::RepoDoesNotExistError, /not-a-repo/
  end
end
