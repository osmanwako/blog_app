class ApplicationController < ActionController::Base
  def current_user
    @user = User.includes(:posts, :comments, :likes).last
    if (@user.nil?)
      @user = User.create(name: "Osman", bio: "Lecturer at JIT", photo: "")
      @user.save
      @user = User.create(name: "Vanina", bio: "Lecturer at MIT", photo: "")
      @user.save
    end
    @user
  end
end
