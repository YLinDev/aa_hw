class GraphNode
    attr_reader :value, :neighbors
    attr_writer :neighbors

    def initialize(value)
        @value = value
        @neighbors = []
    end

    def self.bfs(starting_node, target_value)
        queue = [starting_node]
        until queue.empty?
            first = queue.shift
            return first if first.value == target_value
            queue += first.neighbors
        end
        nil
    end
end