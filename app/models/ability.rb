class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= AdminUser.new
    #if (user.admin_permission == "社团主席")
    #  can :read, [User, Issue]
    #end
    #
    #if (user.admin_permission == "超级管理员")
    #  can :manage, :all
    #end
    #
    #if (user.admin_permission == "社联委员")
    #  can :manage, :all
    #  cannot :manage, AdminUser
    #end
    #
    case user.admin_permission.to_s
      when "超级管理员" #SuperAdmin
        can :manage, :all
      when "社联委员" #Admin
        can :read, ActiveAdmin::Page, :name => "Dashboard"
        can :manage, AdminUser, :id => user.id
        cannot :destroy, AdminUser
      #can :manage, DashBoard
      #can :manage, AdminUser, :id => user.id
      #can :manage, User
      #can :manage, Issue
      #can :manage, Society
      #can :manage, Faq
      #can :manage, SubFaq
      #can :manage, IssueImage
      #can :manage, Material
      when "社团主席" #Teacher
                  #can :manage, DashBoard
                  #can :manage, :all
        can :read, ActiveAdmin::Page, :name => "Dashboard"

        can :manage, AdminUser, :id => user.id
        cannot :destroy, AdminUser

        can :manage, User, User.user_societies.society_id => user.society_id
        #cannot :update, User
        cannot :destroy, User

        can :manage, Issue, :society_id => user.society_id
        cannot :destroy, Issue

        can :manage, Society, :id => user.society_id
        cannot :destroy, Society

        can :manage, Faq
        can :manage, SubFaq
        can :manage, IssueImage
        can :manage, Material
        # AdminUser
        cannot :manage, [Category, Department, Member, SlDepartment, HomeBackground]
    end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
