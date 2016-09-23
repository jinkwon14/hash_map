class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hash_value = 0
    self.each_with_index do |el,idx|
      el = el.ord if el.class == String
      hash_value += (el+idx).to_s(2).to_i * el
    end
    hash_value
  end
end

class String
  def hash
    self.chars.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash_value = 1
    self.each do |key,val|
      hash_value *= (key.hash + val.hash)
      hash_value = hash_value % 10**10
    end
    hash_value
  end
end
