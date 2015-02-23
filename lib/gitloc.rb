require 'tmpdir'
require 'open3'

require 'gitloc/errors'
require 'gitloc/version'

class Gitloc
  def self.call(repo)
    Dir.mktmpdir { |dir|
      Dir.chdir dir
      out, err, status = Open3.capture3 'git', 'clone', repo, 'cloned'
      raise RepoDoesNotExistError, repo unless status.success?
      Dir.chdir 'cloned'
      files = Dir['**/*'].reject { |name| File.directory? name }
      files.map do |filename|
        loc = File.readlines(filename).count { |line| line !~ /^\s*$/ }
        [filename, loc]
      end
    }
  end
end
