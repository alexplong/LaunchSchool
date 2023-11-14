=begin
Difficulty: ___

Write a function that when given a URL as a string, parses out just the domain 
name and returns it as a string. 

For example:

domain_name("http://github.com/carbonfive/raygun") == "github" 
domain_name("http://www.zombie-bites.com") == "zombie-bites"
domain_name("https://www.cnet.com") == "cnet"

=end

=begin
Input: a string
Output: a string

RULES
- Given a url, parse out just domain and return it as a string
Implicit:
- Domain name is before these possible patterns ['.com', '.co', '.ru', ]
- and domain name is after these possible patterns ['//', 'www.', ]

EXAMPLE
"http://google.com" -> 

ALGORITHM
- Given a URL as a string
- Create a prefix var and set to all prefix patterns
- Create a suffix var and set to all suffix patterns
- Iterate through prefix patterns and check if URL contains curr prefix pattern
  - If so, split URL by prefix pattern to return an arr
  - Reassign URL to last element of prefix arr
- Iterate through suffix patterns and chedck if url contains curr suffix pattern
  - If so, split URL by suffix pattern to return an arr
  - Reassign URL to first element of suffix arr
- Return URL
=end

def domain_name(url)
  url = url.dup
  prefix_patterns = ['//', 'www.']
  suffix_patterns = ['.com', '.co', '.ru', '.net', '.org']

  prefix_patterns.each do |curr_pref|
    if url.include?(curr_pref)
      url = url.split(curr_pref).last
      break
    end
  end

  suffix_patterns.each do |curr_suf|
    if url.include?(curr_suf)
      url = url.split(curr_suf).first
      break
    end
  end

  url

end

p domain_name("http://google.com") == "google"
p domain_name("http://google.co.jp") == "google"
p domain_name("www.xakep.ru") == "xakep"
p domain_name("https://youtube.com") == "youtube"