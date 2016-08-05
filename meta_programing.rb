#测试是否会污染标准库
class String
  def to_alphanumeric
    gsub /[^\w\s]/, ''
  end
end

puts "liner".reverse
puts "..liner,,.....     ".to_alphanumeric