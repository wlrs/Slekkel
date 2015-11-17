open("urls.txt").read.split("\n").each do |url|
  url =~ /\/(\w+)-1.*\.(png|gif)/
  slug = $1
  format = $2
  puts slug
  puts format

  url.gsub!(/\.(png|gif)/, "@2x.#{format}")
  puts url

  `curl "#{url}" > emoji_to_upload/#{slug}.#{format}`
end