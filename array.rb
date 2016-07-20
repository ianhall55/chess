class Array
  def deep_dup
    self.map {|e| e.is_a?(Array) ? e.deep_dup : e}
  end
end

# 3: piece.moves = [[4, 7], [5, 7], [2, 7], [1, 7], [3, 6], 
# [3, 5], [3, 4], [3, 3], [3, 2], [3, 1], [3, 0],
# [2, 6], [1, 5], [4, 6], [5, 5], [6, 4], [7, 3]]
