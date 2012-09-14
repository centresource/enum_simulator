# EnumSimulator
module EnumSimulator
  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods
    def enum(attr, values)
      # pushes 'nil' into the values array if the column definition allows null values
      values << nil if self.columns_hash[attr.to_s].respond_to? :null and self.columns_hash[attr.to_s].null
      @enumerated_attributes ||= {}
      @enumerated_attributes[attr] = values
      validates_inclusion_of attr, :in => values

      class_eval <<RUBY
        def #{attr}
          read_attribute(:#{attr}).to_sym if read_attribute(:#{attr})
        end

        def #{attr}=(value)
          value = value.to_s unless value.nil?
          write_attribute(:#{attr},value)
        end
RUBY
    end

    def enumerated_attributes
      @enumerated_attributes
    end
  end
end
