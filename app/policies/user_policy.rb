class UserPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    admin?
  end

  def update?
    admin? || current_user?
  end

  def delete?
    admin?
  end

  def show?
    admin? || trainer? || current_user?
  end

  private

  def admin?
    user.present? && user.role == "admin"
  end

  def trainer?
    user.present? && user.role == "trainer"
  end

  def current_user?
    user.present? && record == user
  end

end
