class MasterPolicy < ApplicationPolicy
  def create?
    authorize_only_admin
  end

  def index?
    authorize_admin_or_user_platform
  end

  def show?
    authorize_admin_or_user_platform
  end

  def update?
    authorize_only_admin
  end

  def destroy?
    authorize_only_admin
  end

  private

  def authorize_admin_or_user_platform
    user.role == 'admin' || user.role == 'user_platform'
  end

  def authorize_only_admin
    user.role == 'admin'
  end
end
