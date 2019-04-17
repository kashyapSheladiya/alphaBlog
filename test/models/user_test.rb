require 'test_helper'

class UserTest < ActiveSupport::TestCase
    def setup
        @user = User.new(username: "Jiya", email: "jiya@exe.com", password: "jiya")
    end

    test "user should be valid" do
        assert @user.valid?
    end

    test "Username can not be empty" do
        @user.username = " "
        assert_not @user.valid?
    end

    test "Username should be unique" do
        @user.save
        user2 = User.new(username: "Jiya")
        assert_not user2.valid?
    end

    test "Username should be unique and case sensitive" do
        @user.save
        user2 = User.new(username: "jiya")
        assert_not user2.valid?
    end

    test "Username can not be too long" do
        @user.username = "a" * 26
        assert_not @user.valid?
    end

    test "Username can not be too short" do
        @user.username = "aa"
        assert_not @user.valid?
    end

    test "Email can not be empty" do
        @user.email = " "
        assert_not @user.valid?
    end

    test "Email should be unique" do
        @user.save
        user2 = User.new(email: "jiya@exe.com")
        assert_not user2.valid?
    end

    test "Email should be unique and case sensitive" do
        @user.save
        user2 = User.new(email: "Jiya@exe.com")
        user3 = User.new(email: "jiyA@exe.com")
        assert_not user2.valid?
        assert_not user3.valid?
    end

    test "Email should contain @ and ." do
        @user.save
        user2 = User.new(email: "jiyaexe.com")
        user3 = User.new(email: "jiya@execom")
        user4 = User.new(email: "jiyaexecom")
        assert_not user2.valid?
        assert_not user3.valid?
        assert_not user4.valid?
    end

    test "Password can not be blank" do
        @user.password = nil
        assert_not @user.valid?
    end

    

end