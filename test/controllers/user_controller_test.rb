require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest

    def setup
        @user = User.new(username: "Jiya", email: "jiya@exe.com", password: "jiya")
    end

    test "should get user index" do
        get users_path
        assert_response :success
    end

    test "should get new" do
        get signup_path
        assert_response :success
    end

    test "should get show" do
        get user_path (@user)
        assert_response :success
    end

    test "User should be able to create" do
        assert_difference 'User.count', 1 do
            post users_path, params:{user: {username: "Jiya", email: "jiya@exe.com", password: "password"}}
            follow_redirect!
        end
        assert_redirected_to user_path(@user)
    end

end