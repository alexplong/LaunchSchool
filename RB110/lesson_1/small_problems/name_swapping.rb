def swap_name(name)
  first = name.split[0]
  last = name.split[1]
  "#{last}, #{first}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'