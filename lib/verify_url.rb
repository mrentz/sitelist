require 'net/http'

#p "Enter website url"
#url = gets.chomp

class VerifyUrl
  
  def self.status(url)
    http = Net::HTTP.new(url)
    begin
      response = http.request_get('/')
      status =  response.code.to_i
    rescue
      status = 500
    end
  end
  
  def self.get_domain(url)
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
  
  def self.assign_protocol(domain)
    protocol = ['http://', 'https://', 'http://www.', 'https://www.']
    i = 0
    while i < protocol.size && (status(domain + protocol[i]) =~ /^3|2/ ).nil?
      full_domain = protocol[i] + domain
      p "trying " + full_domain
      i +=1
    end
    return full_domain
  end
  
  def self.assign_url(domain)
    tld = [".com", '.net', '.org']
    i = 0
    new_domain = domain + tld[0]
    while i < tld.size && (status(domain + tld[i]) =~ /^3|2/ ).nil?
      p "trying " + domain + tld[i]
      new_domain = assign_protocol domain + tld[i]
      i +=1
    end
    p "exiting with status #{status domain + tld[i].to_s}"
    validation new_domain, status(domain + tld[i].to_s)
  end
  
  def self.validation url, validation
    domain_preprocess = [url, validation]
    p domain_preprocess
  end
  
  def self.check(url)
    url_status = status(url).to_i
    if  (url_status.to_s =~ /^3|2/).nil? then # if not valid a valid url
      domain = assign_url(get_domain(url))
    else
      a = validation(url, url_status)
    end
    if (url_status >= 400) then
      errors.add(:url_status, "#{url} doesn't seem to be a valid url")
    end
  end
  
end

#VerifyUrl.check(url)
