class Thingy < ActiveRecord::Base
  enum :flavor, [:salty, :sweet, :bitter, :sour, :umami]
  enum :smell, {:floral => "Floral", :sulphorous => "Sulphorous", :smoky => "Smoky", :stale => "Stale"}
end
