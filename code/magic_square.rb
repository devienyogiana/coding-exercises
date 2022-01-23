class MagicSquare
  # Implement a method that takes a 2D array, 
  # checks if it's a magic square and returns either true or false depending on the result.
  # sequence (https://en.wikipedia.org/wiki/Magic_square)
  def self.validate(square)
    total = 0

    # get the sum of the first row
    for elem in square[0]
      total += elem
    end

    # compare each row's sum
    square.each do |col|
      tempTotal = 0
      col.each do |elem|
        tempTotal += elem.to_i
      end
      if tempTotal != total
        return false
      end
    end

    # compare each column's sum
    for i in 0..square.size-1
      tempTotal = 0
      for j in 0..square.size-1
        tempTotal += square[j][i].to_i
      end
      if tempTotal != total
        return false
      end
    end

    return true
  end
end

