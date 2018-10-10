require_relative 'svn_number'

class InformationAggregators

  def svnwa(list, w)
    t = 1
    i = 1
    f = 1

    list.each do |j|
      t *= j[0]
      i *= j[1]
      f *= j[2]
    end

    n1 = round(1 - pow(t, w[0]), 2)
    n2 = round(pow(i, w[1]), 2)
    n3 = round(pow(f, w[2]), 2)
    SVNNumber.new(n1, n2, n3)
  end

end