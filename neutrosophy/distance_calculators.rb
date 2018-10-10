class DistanceCalculators

  def manhattan(svn1, svn2)
    nil
  end

  def euclidean(svn_set1, svn_set2)
    sum = 0
    svn_set1.each do |i|
      sum += pow(svn_set1[i][0] - svn_set2[i][0], 2)
      +pow(svn_set1[i][1] - svn_set2[i][1], 2)
      +pow(svn_set1[i][2] - svn_set2[i][2], 2)
    end
    round(1.0 / 0.3 * sum, 2)
  end
end