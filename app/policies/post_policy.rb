class PostPolicy < ApplicationPolicy
  def update?
    return true if  admin? && post_approved?
    return true if user_or_admin && !post_approved?
  end

  private

    def user_or_admin
      record.user_id == user.id || admin_types.include?(user.type)
    end

    def admin?
      admin_types.include?(user.type)
    end

    def post_approved?
      record.approved?
    end
end
