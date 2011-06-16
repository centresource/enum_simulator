# EnumSimulator
module EnumSimulator
  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods
    def enum(attr, values)
      @enumerated_attributes ||= {}
      @enumerated_attributes[attr] = values
      validates_inclusion_of attr, :in => values

      class_eval <<RUBY
        def #{attr}
          read_attribute(:#{attr}).to_sym
        end

        def #{attr}=(value)
          write_attribute(:#{attr},value.to_s)
        end
RUBY
    end

    def enumerated_attributes
      @enumerated_attributes
    end
  end
end
