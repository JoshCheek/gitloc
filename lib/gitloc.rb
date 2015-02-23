require 'tmpdir'
require 'open3'

require 'gitloc/errors'
require 'gitloc/version'
require 'gitloc/line_counts'

class Gitloc
  def self.call(repo)
    names_to_bodies = Dir.mktmpdir { |dir|
      Dir.chdir dir
      out, err, status = Open3.capture3 'git', 'clone', repo, 'cloned'
      raise RepoDoesNotExistError, repo unless status.success?
      Dir.chdir 'cloned'
      Dir['**/*'].reject { |name| File.directory? name }
                 .map    { |name| [name, File.read(name) ] }
    }

    LineCounts.call(names_to_bodies)
  end
end
