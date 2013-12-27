class SocietyController < ApplicationController
  #layout "application"

  def index
    @gy_societies = Society.where('department_id = 1').order("RANDOM()")
    @wy_societies = Society.where('department_id = 2').order("RANDOM()")
    @ty_societies = Society.where('department_id = 3').order("RANDOM()")
    @xs_societies = Society.where('department_id = 4').order("RANDOM()")

    #@society = Society.find_by_id(params[:id])
    #@issues = @society.issues
  end


  def showso
    @society = Society.find_by_id(params[:id])
    @issues = Issue.all
  end
end
