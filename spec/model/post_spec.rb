require 'rails_helper'
RSpec.describe Post, type: :model do
  let(:author) { User.new(name: 'Osman', photo: '', bio: 'Website admin', posts_counter: 0) }
  subject do
    Post.new(author:, title: 'Rails Rspec', text: 'Hi Rails spec', comments_counter: 0, likes_counter: 0)
  end
  before { subject.save }
  context "Testing. Model's validations\n" do
    it '1. Test: All valid input' do
      expect(subject).to be_valid
    end

    it '2. Test: Title should not be blank' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it '3. Test: Title should not be greater than 250 character' do
      subject.title = 'R' * 251
      expect(subject).to_not be_valid
    end

    it '4. Test: Comments counter should not be less than zero' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it '5. Test: Comments counter should not be decimal number' do
      subject.comments_counter = 3.14
      expect(subject).to_not be_valid
    end

    it '6. Test: Likes counter should not be less than zero' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end

    it '7. Test: Likes counter should not be decimal number' do
      subject.likes_counter = 3.14
      expect(subject).to_not be_valid
    end
  end

  context " Testing Model's methods\n" do
    let(:user) { User.new(name: 'Osman Wako', photo: '', bio: 'Lecturer at JIT ', posts_counter: 0) }
    let(:post) { Post.new author: user, title: 'Hi Rails', comments_counter: 0, likes_counter: 0 }
    let(:post1) { Post.new author: user, title: 'Hi Laravel', comments_counter: 0, likes_counter: 0 }
    let(:comment1) { Comment.new user: author, post:, text: 'Hi Laravel' }
    let(:comment2) { Comment.new user:, post:, text: 'Hi Djiango' }
    let(:comment3) { Comment.new user: author, post:, text: 'Hi React' }

    it "1. Testing User's posts counter should be one" do
      user.save
      post.save
      post.update_posts_counters
      expect(user.posts_counter).to eq(1)
    end

    it "2. Testing User's posts counter should be two" do
      user.save
      post.save
      post1.save
      post.update_posts_counters
      expect(user.posts_counter).to eq(2)
    end

    it "3. Testing post's Recent Comments should be two" do
      user.save
      post.save
      comment1.save
      comment2.save
      post.recent_comments
      expect(post.recent_comments.length).to eq(2)
    end

    it "4. Testing post's Recent Comments should be three" do
      user.save
      post.save
      comment1.save
      comment2.save
      comment3.save
      expect(post.recent_comments.length).to eq(3)
    end
  end
end
