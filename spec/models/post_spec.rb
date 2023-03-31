require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validation tests' do
    before(:each) do
      post = Post.new(Title: 'GOT').save
    end

    it 'ensure Title presence of title' do
      expect(post).to eq(true)
    end
    it 'ensures CommentsCounter is an integer' do

    end 
  end
end
