require 'gitloc'

class Gitloc
  class Binary
    def self.call(argv, outstream, errstream)
      repo = argv.first
      files_to_lines = Gitloc.call(repo)
      files_to_lines.each do |filename, loc|
        outstream.puts "#{loc}\t#{filename}"
      end
    end
  end
end
