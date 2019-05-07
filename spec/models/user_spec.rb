require 'rails_helper'

RSpec.describe User, type: :model do
  context "validation test" do
    it 'user should be valid' do
      user = User.new(username: "Bob", email: "bob@exe.com", password: "bob").save
      expect(user).to eq(true)
    end

    it 'username can not be empty' do
      user = User.new(username: "", email: "bob@exe.com", password: "bob").save
      expect(user).to eq(false)
    end

    it 'username should be unique' do
      user1 = User.new(username: "Bob", email: "bob@exe.com", password: "bob").save
      user2 = User.new(username: "Bob", email: "bob2@exe.com", password: "bob").save
      expect(user2).to eq(false)
    end
    let(:usernameParams) {{password: "bob", email: "bob@exe.com"}}
    it 'username should be unique and case sensitive' do
      user1 = User.new(usernameParams.merge(username: "Bob")).save
      user2 = User.new(usernameParams.merge(username: "Bob")).save
      user3 = User.new(usernameParams.merge(username: "bOb")).save
      user4 = User.new(usernameParams.merge(username: "boB")).save
      user5 = User.new(usernameParams.merge(username: "bob")).save
      user6 = User.new(usernameParams.merge(username: "BOB")).save
      expect(user2).to eq(false)
      expect(user3).to eq(false)
      expect(user4).to eq(false)
      expect(user5).to eq(false)
      expect(user6).to eq(false)
    end

    it 'username can not be too long' do
      uname = "a"*26
      user = User.new(username: uname, email: "bob@exe.com", password: "bob").save
      expect(user).to eq(false)
    end

    it 'username can not be too short' do
      user1 = User.new(username: "aa", email: "bob@exe.com", password: "bob").save
      user2 = User.new(username: "a", email: "a@exe.com", password: "bvb").save
      expect(user1).to eq(false)
      expect(user2).to eq(false)
    end

    it 'username cannot be too short or too long' do
      user = User.new(username: "xxx", email: "bob@exe.com", password: "bob")
      expect(user.username.length).to be_between(3,25).inclusive
    end

    it 'email can not be empty' do
      user = User.new(username: "xxx", email: "", password: "bob").save
      expect(user).to eq(false)
    end

    let(:emailParams) {{username: "xxx", password: "bob"}}
    it 'email should be valid' do
      user = User.new(username: "xxx", email: "bob@exe.com", password: "bob")
      expect(user.email).to match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)

      user1 = User.new(emailParams.merge(email: "box@exe.com")).save
      user2 = User.new(emailParams.merge(email: "bobexe.com")).save
      user3 = User.new(emailParams.merge(email: "bob@execom")).save
      user4 = User.new(emailParams.merge(email: "bobexecom")).save
      user5 = User.new(emailParams.merge(email: "@exe.com")).save
      user6 = User.new(emailParams.merge(email: "bob@exe.")).save
      user7 = User.new(emailParams.merge(email: "bob@.com")).save
      user8 = User.new(emailParams.merge(email: "bob@exe.78")).save
      
      expect(user1).to eq(true)
      expect(user2).to eq(false)
      expect(user3).to eq(false)
      expect(user4).to eq(false)
      expect(user5).to eq(false)
      expect(user6).to eq(false)
      expect(user7).to eq(false)
      expect(user8).to eq(false)
    end

    it 'email should be unique' do
      user1 = User.new(username: "bob", email: "bob123@exe.com", password: "bobob").save
      user2 = User.new(username: "max", email: "bob123@exe.com", password: "hhhhh").save
      expect(user2).to eq(false)
    end
    
    it 'email should be valid and case-sensitive' do
      user1 = User.new(emailParams.merge(email: "box@exe.com")).save
      user2 = User.new(emailParams.merge(email: "Box@exe.com")).save
      user3 = User.new(emailParams.merge(email: "bOx@exe.com")).save
      user4 = User.new(emailParams.merge(email: "boX@exe.com")).save
      user5 = User.new(emailParams.merge(email: "BOX@exe.com")).save
      user6 = User.new(emailParams.merge(email: "BOx@exe.com")).save
      user7 = User.new(emailParams.merge(email: "BoX@exe.com")).save
      user8 = User.new(emailParams.merge(email: "bOX@exe.com")).save

      expect(user2).to eq(false)
      expect(user3).to eq(false)
      expect(user4).to eq(false)
      expect(user5).to eq(false)
      expect(user6).to eq(false)
      expect(user7).to eq(false)
      expect(user8).to eq(false)
    end
    let(:passParams) {{username: "john", email: "john@exe.com"}}
    it 'password cannot be blank' do
      user = User.new(passParams.merge(password: "")).save
      expect(user).to eq(false)

      user1 = User.new(passParams.merge(password: "x"))
      expect(user1.password).not_to be_nil
    end
  end
end
