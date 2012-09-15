# EnumSimulator
module EnumSimulator
  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods
    def enum(attr, values)
      if self.columns_hash[attr.to_s].respond_to? :null and self.columns_hash[attr.to_s].null
        if values.is_a? Hash
          values[nil] = ""
        else
          values << nil
        end
      end
      valid = values.is_a?(Hash) ? values.keys : values
      @enumerated_attributes ||= {}
      @enumerated_attributes[attr] = values
      validates_inclusion_of attr, :in => valid

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

ActiveSupport.on_load(:active_record) do
  include EnumSimulator
end
