require "http"

system "clear"
puts "Choose an option"
puts "[1] one product"
puts "[2] all products"


input_option = gets.chomp
if input_option == "1"
  response = HTTP.get("http://localhost:3000/one_product.json")
  product = response.parse["fortune"]
  puts fortune
elsif input_option == "2"
  response = HTTP.get("http://localhost:3000/all_product.json")
  products = response.parse["lotto_numbers"]
  p lotto_numbers
end