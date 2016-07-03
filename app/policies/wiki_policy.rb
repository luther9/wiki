class WikiPolicy < ApplicationPolicy
  def show?
    is_visible
  end

  def update?
    is_visible
  end

  def destroy?
    is_visible
  end

  class Scope < Scope
    def resolve
      wikis = []
      if user.role == 'admin'
        wikis = scope.all
      elsif user.role == 'premium'
        all_wikis = scope.all
        all_wikis.each { |wiki|
          if !wiki.private? || wiki.owner == user || wiki.collaborators.include?(user)
            wikis << wiki
          end
        }
      else
        all_wikis = scope.all
        all_wikis.each { |wiki|
          if !wiki.private? || wiki.collaborators.include?(user)
            wikis << wiki
          end
        }
      end
      wikis
    end
  end

  private

  # Returns true if the user may edit the wiki.
  def is_visible
    !scope.empty?
  end
end
