class Array
  def deep_dup
    self.map {|e| e.is_a?(Array) ? e.deep_dup : e}
  end
end
