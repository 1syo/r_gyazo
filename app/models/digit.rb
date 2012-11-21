class Digit
  @@seeds = [('0'..'9'),('a'..'z'),('A'..'Z')].map{|c| c.to_a }.flatten

  def self.generate(length = 1)
    (1..length).map{ @@seeds[rand(@@seeds.length)] }.join
  end
end
