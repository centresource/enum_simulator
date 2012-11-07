class Foo < ActiveRecord::Base
  CONSTANT = [:one, :two, :three] 
  enum :first_enum, CONSTANT 
  enum :second_enum, CONSTANT
end
