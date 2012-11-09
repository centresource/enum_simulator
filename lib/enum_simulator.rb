# EnumSimulator
module EnumSimulator
  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods
    def enum(attr, values)
      val_dupe = values
      if self.columns_hash[attr.to_s].respond_to? :null and self.columns_hash[attr.to_s].null
        if val_dupe.is_a? Hash
          val_dupe[nil] = ""
        else
          val_dupe << nil unless val_dupe.include? nil
        end
      end
      valid = val_dupe.is_a?(Hash) ? val_dupe.keys : val_dupe
      @enumerated_attributes ||= {}
      @enumerated_attributes[attr] = val_dupe
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
