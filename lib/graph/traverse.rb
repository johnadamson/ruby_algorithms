module Graph
  class Traverse
    attr_reader :grid

    def initialize(grid)
      @grid = grid
      @work = []
    end

    def longest_sequence
      enqueue_root_nodes

      longest = @work.first
      while (root = @work.pop) do
        @work.concat root.next
        longest = root if root.path.length > longest.path.length
      end
      longest.path.length
    end

    private

    def enqueue_root_nodes
      grid.nodes.each do |node|
        @work << Step.new(node, grid)
      end
    end
  end
end
