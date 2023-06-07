def create
  case save(model_params)
  in [:ok, model]
    render :json => model
  in [:error, errors]
    render :json => errors
  end
end

def save(attrs)
  model = Model.new(attrs)
  model.save ? [:ok, model] : [:error, model.errors]
end




def greet(hash = {})
  case hash
  in {greeting: greeting, first_name: first_name, last_name: last_name}
    greet(greeting: greeting, name: "#{first_name} #{last_name}")
  in {greeting: greeting, name: name}
    puts "#{greeting}, #{name}"
  in {name: name}
    greet(greeting: "Hello", name: name)
  in {greeting: greeting}
    greet(greeting: greeting, name: "Anonymous")
  else
    greet(greeting: "Hello", name: "Anonymous")
  end
end

greet # Hello, Anonymous
greet(name: "Rafael") # Hello, Rafael
greet(first_name: "Rafael", last_name: "Pereira") # Hello, Anonymous
greet(greeting: "Bonjour", first_name: "Rafael", last_name: "Pereira") # Bonjour, Rafael Pereira
greet(greeting: "Bonjour") # Bonjour, Anonymous




a = 1
case {a: 1, b: 2}
in {a: ^a}
  puts "matches"
end

city = "Amsterdam"
order = {billing_address: {city: "Berlin"}, shipping_address: {city: "Zurich"}}

case order
in {billing_address: {city: }, shipping_address: {city: ^city}}
  puts "both billing and shipping are to the same city"
else
  puts "both billing and shipping must be to the same city"
end

puts city # Berlin



[1, 2, "Three"] => [Integer => one, two, String => three]
puts one
puts two
puts three

[1, 2, "Three"] in [Integer => one, two, String => three]



=begin
class AdminController < AuthenticatedController
  before_action :verify_admin
 
  private
 
  def verify_admin
    Current.user => {role: :admin}
  rescue NoMatchingPatternError
    raise NotAllowedError
  end
end
=end