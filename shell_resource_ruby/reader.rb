require 'json'

params = JSON.parse STDIN.read
if File.exist? params["filename"]
  contents = File.read params["filename"]
end

obj = {
  contents: contents
}

puts obj.to_json



