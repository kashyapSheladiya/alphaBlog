require 'rails_helper'

RSpec.describe Category, type: :model do
  context "validation testing" do
    it 'category should be valid' do
      category = Category.new(name: "Sports").save
      expect(category).to be(true)
    end

    it 'category cannot be empty' do
      category = Category.new(name: "").save
      expect(category).to be(false)
    end

    it 'category should be unique' do
      category = Category.new(name: "sports").save
      category1 = Category.new(name: "sports").save
      expect(category1).to be(false)
    end

    it 'category can not be too long' do
      cname = "a"*26
      category = Category.new(name: cname).save
      expect(category).to be(false)
    end

    it 'category can not be too short' do
      cname = "aa"
      category = Category.new(name: cname).save
      expect(category).to be(false)
    end

    it 'length of category should be between 3 to 25' do
      category = Category.new(name: "xxx")
      expect(category.name.length).to be_between(2,26).exclusive
    end
  end
end
