class Thingy < ActiveRecord::Base
  enum :flavor, [:salty, :sweet, :bitter, :sour, :umami]
  enum :smell, [:floral, :sulphorous, :smoky, :stale]
end
