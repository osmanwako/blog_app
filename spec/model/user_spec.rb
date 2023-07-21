require 'rails_helper'
RSpec.describe User, type: :model do
  subject { User.new(name: 'Osman', photo: '', bio: 'Website admin', posts_counter: 2) }
  before { subject.save }
  context("I) Testing Model's validations.\n") do
    it '1. Test: Name should be any string' do
      expect(subject).to be_valid
    end
    it '2. Test: Name should not be blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it '3.Test: Posts Counter should be positive Integer or zero' do
      subject.posts_counter = 3
      expect(subject).to be_valid
    end

    it '4. Test: Posts Counter should not be negative number ' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end
    it '5. Test: Posts Counter should not be decimal number' do
      subject.posts_counter = 3.14
      expect(subject).to_not be_valid
    end
  end

  context("II) Testing Model methods\n") do
    let(:author) { User.new(name: 'Osman Wako', photo: '', bio: 'Lecturer at JIT ', posts_counter: 0) }
    let(:post1) { Post.new author:, title: 'Hi Rails', comments_counter: 0, likes_counter: 0 }
    let(:post2) { Post.new author:, title: 'Hi Laravel', comments_counter: 0, likes_counter: 0 }
    let(:post3) { Post.new author:, title: 'Hi Djiango', comments_counter: 0, likes_counter: 0 }
    let(:post4) { Post.new author:, title: 'Hi React', comments_counter: 0, likes_counter: 0 }

    it '1. Testing Recent post should be two' do
      author.save
      post1.save
      post2.save
      expect(author.recent_posts).to eq([post2, post1])
      expect(author.recent_posts.length).to eq(2)
    end

    it '2. Testing Recent post should be three' do
      author.save
      post1.save
      post2.save
      post3.save
      expect(author.recent_posts).to eq([post3, post2, post1])
      expect(author.recent_posts.length).to eq(3)
    end

    it '3. Testing Recent post should be three' do
      author.save
      post1.save
      post2.save
      post3.save
      post4.save
      expect(author.recent_posts).to eq([post4, post3, post2])
      expect(author.recent_posts).to_not eq([post2, post3, post4])
      expect(author.recent_posts.length).to eq(3)
    end
  end
end
