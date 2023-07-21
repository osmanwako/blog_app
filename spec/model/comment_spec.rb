require 'rails_helper'
RSpec.describe Comment, type: :model do
  let(:user) { User.new(name: 'Osman Wako', photo: '', bio: 'Lecturer at JIT ', posts_counter: 0) }
  let(:author) { User.new(name: 'Mohammed Berisso', photo: '', bio: 'Lecturer at JIT ', posts_counter: 0) }
  let(:post) { Post.new author: user, title: 'Hi Rails', comments_counter: 0, likes_counter: 0 }
  let(:comment1) { Comment.new user: author, post:, text: 'Hi Laravel' }
  let(:comment2) { Comment.new user:, post:, text: 'Hi Djiango' }
  let(:comment3) { Comment.new user: author, post:, text: 'Hi React' }

  context "Testing. Model's methods\n" do
    it "1. Post's Comments counter should be one" do
      post.save
      comment1.save
      comment1.update_comments_counters
      expect(post.comments_counter).to eq(1)
    end

    it "2. Post's Comments counter should be three" do
      post.save
      comment1.save
      comment2.save
      comment3.save
      comment1.update_comments_counters
      expect(post.comments_counter).to eq(3)
    end
  end
end
