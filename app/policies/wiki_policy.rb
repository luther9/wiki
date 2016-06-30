class WikiPolicy < ApplicationPolicy
  def show?
    super && is_visible
  end

  def update?
    super && is_visible
  end

  def destroy?
    super && is_visible
  end

  class Scope < Scope
    def resolve
      scope.visible_to user
    end
  end

  private

  def is_visible
    scope.visible_to(user).exists?
  end
end
