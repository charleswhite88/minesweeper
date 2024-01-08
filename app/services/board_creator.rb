class BoardCreator
    def self.generate_board(mines_locations , rows, cols)
        grid = Array.new(rows) { Array.new(cols) }
        rows.times do |r|
            cols.times do |c|
                index = r * cols + c
                grid[r][c] = check_mines_location?(mines_locations, index) ? -1 : count_neighbour_mines(index, rows, cols, mines_locations)
            end
        end
        grid
    end
    
    def self.place_mines(rows = 0, cols = 0, mines = 0)
        (0..(rows * cols) - 1).to_a.sample(mines)
    end

    private

    def self.count_neighbour_mines(index, rows, cols, mines_locations)
      neighbours(index, rows, cols).count { |neighbour_index| mines_locations.include?(neighbour_index) }
    end

    def self.neighbours(index, rows, cols)
        directions = [-cols - 1, -cols, -cols + 1, -1, 1, cols - 1, cols, cols + 1]
        directions.map{|direction| [index + direction, direction]}
            .select { |(neighbour_index, direction)|  valid_neighbour?(index, neighbour_index, rows, cols, direction) }.map(&:first).uniq
    end

    def self.valid_neighbour?(index, neighbour_index, rows, cols, direction)
        place_in_range?(neighbour_index, rows * cols) &&
        !((index % cols) == 0 && (direction == -1 || direction == (cols - 1) || direction == (-cols - 1))) && 
        !((index % cols) == (cols - 1) && (direction == 1 || direction == (-cols + 1) || direction == (cols + 1)))
    end

    def self.place_in_range?(neighbour_index, dimension)
      neighbour_index >= 0 && neighbour_index < dimension
    end

    def self.check_mines_location?(mines_locations, index)
      mines_locations.include?(index)
    end
end