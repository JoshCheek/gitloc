class Gitloc
  module LineCounts
    def self.call(names_to_bodies)
      names_to_bodies.map do |name, body|
        loc = body.lines.count { |line| line !~ /^\s*$/ }
        [name, loc]
      end
    end
  end
end
