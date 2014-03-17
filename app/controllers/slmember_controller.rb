class SlmemberController < ApplicationController
  def list
    @permission = AdminPermission.find(2)
    @slmembers = @permission.admin_users

  end

  def show
    @slmember = AdminUser.find(params[:id])
  end
end
