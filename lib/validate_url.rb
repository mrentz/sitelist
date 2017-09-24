require 'net/http'

p "Enter website url"
url = gets.chomp

def status(url)
  http = Net::HTTP.new(url)
  begin
    response = http.request_get('/')
    status =  response.code
  rescue
    status = 500
  end
end

def get_domain(url)
  sliced_url = url.split(/\.|\/\//)
  case sliced_url.size
  when 1
    domain = url
  when 2
    domain = sliced_url[0]
  when 3
    domain = sliced_url[1]
  when 4
    domain = sliced_url[2]
  else
    domain = url
  end

end

def assign_protocol(domain)
  protocol = ['http://', 'https://', 'http://www.', 'https://www.']
  i = 0
  while i < protocol.size && (status(domain + protocol[i]) =~ /^3|2/ ).nil?
    full_domain = protocol[i] + domain
    p "trying " + full_domain
    i +=1
  end
  return full_domain
end

def assign_url(domain)
  tld = [".com", '.net', '.org']
  i = 0
  new_domain = domain + tld[0]
  while i < tld.size && (status(domain + tld[i]) =~ /^3|2/ ).nil?
    p "trying " + domain + tld[i]
    new_domain = assign_protocol domain + tld[i]
    i +=1
  end
  p "exiting with status #{status domain + tld[i].to_s}"
  return new_domain
end

if (status(url) =~ /^3|2/).nil? then # if not valid a valid url
  domain = assign_url(get_domain(url))
  p "the domain is #{domain}"
else
  domain = url
  p 'saving url ' + url 
end
  



