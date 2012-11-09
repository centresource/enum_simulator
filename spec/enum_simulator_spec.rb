require 'spec_helper'

describe EnumSimulator do
  describe "enum" do
    it "should define an enum method on all classes" do
      Thingy.should respond_to(:enum)
      OtherThingy.should respond_to(:enum)
    end

    it "should cast incoming assignments of symbols to strings" do
      x = Thingy.new
      x.flavor = :cork
      x.send(:read_attribute,:flavor).should == 'cork'
    end

    it "should cast internal representation of strings to symbols" do
      x = Thingy.new
      x.send(:write_attribute,:flavor,'basket')
      x.flavor.should == :basket
    end

    it "should return nil if the value is nil" do
      x = Thingy.new
      x.flavor.should == nil
    end

    it "should require the symbolized value of the attribute specified in the first argument to be a member of the array passed as the second argument" do
      x = Thingy.new
      x.should { validate_inclusion_of :flavor, :in => [:sweet, :sour, :salty, :bitter, :umami] }
    end

    it "should require the symbolized value of the attribute specified in the first argument to be a key in the hash passed as the second argument" do
      x = Thingy.new
      x.should { validate_inclusion_of :smell, :in => [:floral, :sulphorous, :smoky, :stale, nil] }
    end

    it "should require a value for the attribute if the column definition does not allow null" do
      lambda { x = Thingy.create! }.should raise_error ActiveRecord::RecordInvalid
    end

    it "should allow the setting of an attribute to nil if the column definition allows null" do
      lambda { x = Thingy.create! :flavor => :sweet }.should_not raise_error
    end
  end

  describe "enumerated_attributes" do
    it "should define an enumerated_attributes method on all classes" do
      Thingy.should respond_to(:enumerated_attributes)
      OtherThingy.should respond_to(:enumerated_attributes)
    end

    it "should be nil for a class without any enumerated attributes" do
      OtherThingy.enumerated_attributes.should be_nil
    end

    it "should return a hash, keyed with the names of all enumerated attributes" do
      Thingy.enumerated_attributes.should be_a(Hash)
      Thingy.enumerated_attributes.should have_key(:flavor)
    end

    describe "each item" do
      it "should be an array of all possible enumerable values for the key in question" do
        Thingy.enumerated_attributes[:flavor].should include(:sweet)
        Thingy.enumerated_attributes[:flavor].should include(:salty)
        Thingy.enumerated_attributes[:flavor].should include(:sour)
        Thingy.enumerated_attributes[:flavor].should include(:bitter)
        Thingy.enumerated_attributes[:flavor].should include(:umami)
        Thingy.enumerated_attributes[:flavor].should_not include(:magic)
        Thingy.enumerated_attributes[:flavor].should_not include(:corned_beef)
      end

      it "should not include nil in array of possible enumerable values even when column allows null" do
        Thingy.enumerated_attributes[:flavor].should_not include(nil)
        Thingy.enumerated_attributes[:smell].should include(nil)
      end

      it "should not affect the original values of a constant passed" do
        Foo::CONSTANT.include?(nil).should be_false
      end

      describe "when an array is passed to enum" do
        it "should be an array of all possible enumerable values for the key in question" do
          Thingy.enumerated_attributes[:flavor].should be_a(Array)
        end
      end

      describe "when a hash is passed to enum" do
        it "should be a hash of all possible enumerable values for the key in question" do
          Thingy.enumerated_attributes[:smell].should be_a(Hash)
        end
      end
    end
  end
end
