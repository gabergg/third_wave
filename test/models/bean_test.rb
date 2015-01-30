require 'test_helper'

class BeanTest < ActiveSupport::TestCase
  
  test "should not save bean without name" do
    bean = Bean.new
    assert_not bean.save, "Saved the bean without a name"
  end
  
end