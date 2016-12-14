require 'Matrix'

class MutableMatrix < Matrix
  def []=(i, j, x)
    @rows[i][j] = x
  end
end
