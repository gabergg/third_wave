require 'test_helper'

class RoasterTest < ActiveSupport::TestCase

  test "should not save roaster without name" do
    roaster = Roaster.new
    assert_not roaster.save, "Saved the roaster without a name"
  end
  
end