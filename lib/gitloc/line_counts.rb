class Gitloc
  module LineCounts
    def self.call(names_to_bodies)
      names_to_bodies
        .map    { |name, body| [name, count_lines(body)] }
        .select { |name, body| body }
    end

    def self.count_lines(body)
      body.lines.count { |line| line !~ /^\s*$/ }
    rescue ArgumentError
      nil
    end
  end
end
