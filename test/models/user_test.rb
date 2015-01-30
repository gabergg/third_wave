require 'test_helper'

class UserTest < ActiveSupport::TestCase

  #name presence
  #email presence
  #password minimum 6
  #name max 50
  ## Validation testing
  
  test "should save user with valid parameters" do
    user = User.new(name: "gabe", email: "gaber@gmail.com", password: "wakaka", password_confirmation: "wakaka")
    assert user.save, "Failed to save user with valid parameters"
  end

  test "should not save user with password shorter than 6 characters" do
    user = User.new(name: "gabe", email: "gaber@gmail.com", password: "wakak", password_confirmation: "wakak")
    assert_not user.save, "Saved user with password shorter than 6 characters"
  end

  test "should not save user with password and confirmation mismatched" do
    user = User.new(name: "gabe", email: "gaber@gmail.com", password: "wakaka", password_confirmation: "wakakb")
    assert_not user.save, "Saved user with password and confirmation mismatched"
  end

  test "should not save user with no password confirmation" do
    user = User.new(name: "gabe", email: "gaber@gmail.com", password: "wakaka")
    assert_not user.save, "Saved user with no password confirmation"
  end

  test "should not save user with no password" do
    user = User.new(name: "gabe", email: "gaber@gmail.com", password_confirmation: "wakakb")
    assert_not user.save, "Saved user with no password"
  end

  test "should not save user with no password or confirmation" do
    user = User.new(name: "gabe", email: "gaber@gmail.com")
    assert_not user.save, "Saved user with no password or confirmation"
  end
  
  test "should not save user with name longer than 50 characters" do
    user = User.new(name:)
  end

end