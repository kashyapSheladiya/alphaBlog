require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest

    test "Get sign up form and new user sign up" do
        get signup_path 
        assert_template 'users/new'
        assert_difference 'User.count', 1 do
            post users_path, params:{user: {username: "Jiya", email: "jiya@exe.com", password: "password"}}
            follow_redirect!
        end
        assert_template 'users/show'
        assert_match "Jiya", response.body
    end

    test "Invalid email address" do
        get signup_path 
        assert_template 'users/new'
        assert_no_difference 'User.count' do
            post users_path, params:{user: {name: "Jiya", email: "jiyaexe.com", password: "password"}}
            post users_path, params:{user: {name: "Jiya", email: "jiya@execom", password: "password"}}
            post users_path, params:{user: {name: "Jiya", email: "jiyaexecom", password: "password"}}
        end
        assert_template 'users/new'
        assert_select 'h2.panel-title'
        assert_select 'div.panel-body'
    end

    test "Invalid username" do
        get signup_path 
        assert_template 'users/new'
        assert_no_difference 'User.count' do
            post users_path, params:{user: {name: " ", email: "jiya@exe.com", password: "password"}}
        end
        assert_template 'users/new'
        assert_select 'h2.panel-title'
        assert_select 'div.panel-body'
    end

    test "Invalid password" do
        get signup_path 
        assert_template 'users/new'
        assert_no_difference 'User.count' do
            post users_path, params:{user: {name: "Jiya", email: "jiya@exe.com", password: nil}}
        end
        assert_template 'users/new'
        assert_select 'h2.panel-title'
        assert_select 'div.panel-body'
    end

end