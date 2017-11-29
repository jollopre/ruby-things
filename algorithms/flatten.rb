module Algorithms
  # Iterative flattening combined with recursion
  def flatten(array, output=[])
    if array.is_a?(Array)
      array.each do |_|
        if _.is_a?(Array)
          flatten(_, output)
        else
          output << _
        end
      end
    end
    return output
  end
end