# Exercise4-1
class Exercise4
  def self.string_shuffle(s)
    s.split('').shuffle.join
  end
end

# Exercise4-2
class String
  def shuffle
    self.split('').shuffle.join
  end
end
