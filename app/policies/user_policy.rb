class UserPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    admin
  end

  def show?
    admin || trainer || user.present? && user == record.user
  end

  private

  def admin
    user.present? && user.role == "admin"
  end

  def trainer
    user.role == "trainer"
  end

end
