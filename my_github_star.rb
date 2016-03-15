require 'open-uri'
require 'json'

puts "please input client_id......"
id = gets
puts "please input client_secret......"
secret = gets

id = id.chomp
secret = secret.chomp

uri = "https://api.github.com/users/#{id}/starred?client_id=#{id}&client_secret=#{secret}&page=0&per_page=10000"

puts uri

response = nil
open(uri) do |http|
  response = http.read
end
result = JSON.parse(response)

aFile = File.new("README.md", "w")


aFile.syswrite("# my_stars \n")
aFile.syswrite("Command-line application to get your github stars and write to a md file \n")
aFile.syswrite("## How to use \n")
aFile.syswrite("1. clone my_start \n")
aFile.syswrite("2. ruby my_github_start.rb \n")
aFile.syswrite("3. intput id & secret \n")
aFile.syswrite("4. open README.md \n")
aFile.syswrite("\n")
aFile.syswrite("## All stars \n")
aFile.syswrite("URL | Description \n")
aFile.syswrite("------- | ------- \n")

result.each do |item|
  i_name = item['name']
  i_html_url = item['html_url']
  i_description = item['description']
  content = "[#{i_name}](#{i_html_url}) | #{i_description} \n"

  if aFile
    aFile.syswrite(content)
  end
end

aFile.close
