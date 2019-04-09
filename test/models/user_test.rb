require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "TestGuy", email: "test@gmail.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "name shouldn't be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email shouldn't be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid emails" do
    valid_add = %w[user@example.com USER@foo.com first.last@foo.jp alice_booth@baz.com]
    valid_add.each do |v_a|
      @user.email = v_a
      assert @user.valid?, "#{v_a.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_add = %w[user@example,com user_at_foo.org user.name@example.foo@bar_baz.com foo@bar+baz.com]
    invalid_add.each do |inv_a|
      @user.email = inv_a 
      assert_not @user.valid?, "#{inv_a.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    dup_user = @user.dup 
    dup_user.email = @user.email.upcase
    @user.save
    assert_not dup_user.valid?
  end

end
