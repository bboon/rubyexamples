def tell_the_truth(options={})
  if options[:profession] == :lawyer
     'false because profession is laywer'
  else
     true
  end
end
x = tell_the_truth
puts x

y =tell_the_truth(:profession => :lawyer)
puts y
