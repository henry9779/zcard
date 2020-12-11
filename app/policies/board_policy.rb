class BoardPolicy < ApplicationPolicy
  class Scope < Scope
    def hide?
      user && user.role == 'user' && board.user == user
      # 有登入並且為user角色
    end

    def resolve
      scope.all
    end
  end
end
