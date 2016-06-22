class WelcomeController < ApplicationController
  # Dummy classes to satisfy Pundit.
  class Welcome
  end

  class WelcomePolicy < ApplicationPolicy
    def about?
      true
    end
  end

  def index
  end

  def about
    authorize Welcome.new
  end
end
