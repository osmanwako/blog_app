class ApplicationController < ActionController::Base
  def current_user
    @user = User.last
    if (@user.nil?)
      @user = User.create(name: "Osman", bio: "Lecturer at JIT", photo: "")
      @user.save
      @user = User.create(name: "Vanina", bio: "Lecturer at MIT", photo: "")
      @user.save
    end
  end
end
