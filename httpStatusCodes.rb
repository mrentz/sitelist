require 'net/http'

p "Enter website url"
url = gets.chomp

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
    while i < protocol.size && (status(protocol[i] + domain) =~ /^3|2/ ).nil?
      full_domain = protocol[i] + domain
      p "trying " + full_domain + "  #{status(protocol[i] + domain)}"  
      i +=1
    end
    return full_domain
  end
  
  def self.assign_url(domain)
    tld = [".com", '.net', '.org']
    i = 0
    new_domain = domain + tld[0]
    while i < tld.size && (status(domain + tld[i]).to_s =~ /^3|2/ ).nil?
      p "trying " + domain + tld[i] + "  #{status domain + tld[i]}"  
      new_domain = assign_protocol domain + tld[i]
      i +=1
    end
    p "exiting with status #{status(new_domain)}"
    validation new_domain, status(new_domain)
  end
  
  def self.validation url, status_code
    domain_preprocess = [url, status_code]
    p domain_preprocess
    if (status_code >= 400) then
      #      errors.add(:url_status, "#{url} doesn't seem to be a valid url")
      p "#{url} doesn't seem to be a valid url"
    end
  end
  
  def self.check(url)
    url_status = status(url)
    p url_status
    if  (url_status.to_s =~ /^3|2/).nil? then # if not valid a valid url
      domain = assign_url(get_domain(url))
    else
      a = validation(url, url_status)
    end
  end
  
end

VerifyUrl.check(url)
