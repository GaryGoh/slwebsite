class SocietyController < ApplicationController
  layout "application", only: [:gy, :wy, :ty, :xs]

  def index

    #@society = Society.find_by_id(params[:id])
    #@issues = @society.issues
  end

  def gy
    @gy_societies = Society.where('department_id = 1').order("RANDOM()")
  end

  def wy
    @wy_societies = Society.where('department_id = 2').order("RANDOM()")
  end

  def ty
    @ty_societies = Society.where('department_id = 3').order("RANDOM()")
  end

  def xs
    @xs_societies = Society.where('department_id = 4').order("RANDOM()")
  end

  def showso
    @society = Society.find_by_id(params[:id])
    @issues = @society.issues
  end
end
