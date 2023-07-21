require 'rails_helper'
RSpec.describe Like, type: :model do
  let(:user) { User.new(name: 'Osman Wako', photo: '', bio: 'Lecturer at JIT ', posts_counter: 0) }
  let(:author) { User.new(name: 'Mohammed Berisso', photo: '', bio: 'Lecturer at JIT ', posts_counter: 0) }
  let(:post) { Post.new author: user, title: 'Hi Rails', comments_counter: 0, likes_counter: 0 }
  let(:like1) { Like.new user: author, post: }
  let(:like2) { Like.new user:, post: }
  let(:like3) { Like.new user: author, post: }

  context "Testing. Model's methods\n" do
    it "1. Post's Likes counter should be one" do
      post.save
      like1.save
      like1.update_likes_counters
      expect(post.likes_counter).to eq(1)
    end

    it "2. Post's Likes counter should be three" do
      post.save
      like1.save
      like2.save
      like3.save
      like2.update_likes_counters
      expect(post.likes_counter).to eq(3)
    end
  end
end
