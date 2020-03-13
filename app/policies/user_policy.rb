class UserPolicy #< ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def index?
    @user.admin?
    # user.role == 'admin' #|| record.user == user
  end

  # def show?
  #   # @current_user.user?
  #   user.role == 'admin' #|| record.user == user
  # end
end
