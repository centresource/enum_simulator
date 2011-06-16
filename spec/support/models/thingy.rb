class Thingy < ActiveRecord::Base
  enum :flavor, [:salty, :sweet, :bitter, :sour, :umami]
end
