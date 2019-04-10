require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "TestGuy", email: "test@gmail.com",
                      password: "foobar", password_confirmation: "foobar")
  end

# The assert_not's work in here through the fact we're doing validation in the model file
# Because of the validation in /app/mode/user.rb, the changes made, such as @user.name = "", 
#   are actually invalid changes, therefor they don't happen, meaning the test should pass

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
    #app/model/user.rb validation requires max length of 255, so user.email = a*244
    # FAILS the @user.valid? check, therefor
    # assert_not FALSE = TEST_PASS
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

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "associated microposts should be destroyed" do
    @user.save
    @user.microposts.create!(content: "Lorem ipsum")
    assert_difference 'Micropost.count', -1 do
      @user.destroy
    end
  end

end
