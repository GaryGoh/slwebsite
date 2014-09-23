class StaticPageController < ApplicationController
  layout "index", only: [:index]


  def home
    @issues_school = Issue.where('category_id = 1').last(5).reverse
    @issues_sl = Issue.where('category_id = 2').last(5).reverse
    @issues_notice = Issue.where('category_id = 3').last(5).reverse
    @backgrounds = HomeBackground.limit(3).find(:all, :order => "created_at DESC")
    @background_active = @backgrounds.first
    @backgrounds_standby = @backgrounds.last(2)

  end

  def index
    # Index top news
    @issues_index = Issue.limit(8).find(:all, :order => "created_at DESC")
    @topnews = Issue.where('category_id = 1').last(6).reverse
    @normnews = Issue.where('category_id = 1').first(6).reverse

    # Index societies, solved ActiveAdmin paginate scope bug
    @societies = Society.where(:is_outstanding => true)
    @societies1 = @societies.where(:department_id => 1)
    @societies2 = @societies.where(:department_id => 2)
    @societies3 = @societies.where(:department_id => 3)
    @societies4 = @societies.where(:department_id => 4)

    # Index issues
    @issues = Issue.search(params[:search])
    @issues_top = Issue.joins(:category).where(:categories => {:category_name => "顶置新闻"}).last(6).reverse
    @issues_society = Issue.joins(:category).where(:categories => {:category_name => "社团新闻"}).last(4).reverse
    @issues_school = Issue.joins(:category).where(:categories => {:category_name => "学校新闻"}).reverse
    @issues_global = Issue.joins(:category).where(:categories => {:category_name => "世界时事"}).last(6).reverse

    # Index notis
    @notis = Noti.search(params[:search])
    @notis_activity = Noti.where(:category_id => 11).last(5).reverse
    @notis_info = Noti.where(:category_id => 12).last(5).reverse
    @notis_good = Noti.where(:category_id => 13).last(5).reverse


    # Index Download
    @materials = Material.all.reverse


    # Index societies
    @gy = Society.where('department_id = 1').order("RANDOM()")
    @wy = Society.where('department_id = 2').order("RANDOM()")
    @ty = Society.where('department_id = 3').order("RANDOM()")
    @xs = Society.where('department_id = 4').order("RANDOM()")

    # Index User's track
    unless session[:user_id] == ""
      @last_current_user_id = Impression.where(:user_id => current_user_stu.id).reverse
    end

    @week4 = Impression.where("created_at BETWEEN ? AND ?",
                              Date.today.to_time - 28.day, Date.today.to_time - 21.day).reverse
    @w4 = Array.new()
    for i in 0..7
      @w4.push(Impression.where("created_at BETWEEN ? AND ?",
                                Date.today.to_time - (28 - i).day, Date.today.to_time - (28 - i - 1).day).reverse)
    end

    @week3 = Impression.where("created_at BETWEEN ? AND ?",
                              Date.today.to_time - 21.day, Date.today.to_time - 14.day).reverse

    @w3 = Array.new()
    for i in 0..7
      @w3.push(Impression.where("created_at BETWEEN ? AND ?",
                                Date.today.to_time - (21 - i).day, Date.today.to_time - (21 - i - 1).day).reverse)
    end

    @week2 = Impression.where("created_at BETWEEN ? AND ?",
                              Date.today.to_time - 14.day, Date.today.to_time - 7.day).reverse
    @w2 = Array.new()
    for i in 0..7
      @w2.push(Impression.where("created_at BETWEEN ? AND ?",
                                Date.today.to_time - (14 - i).day, Date.today.to_time - (14 - i - 1).day).reverse)
    end

    @week1 = Impression.where("created_at BETWEEN ? AND ?",
                              Date.today.to_time - 7.day, Date.today.to_time).reverse
    @w1 = Array.new()
    for i in 0..7
      @w1.push(Impression.where("created_at BETWEEN ? AND ?",
                                Date.today.to_time - (7 - i).day, Date.today.to_time - (7 - i - 1).day).reverse)
    end
    #@lastest_news = Issue.find(:id => 16)

  end


  def about
  end

  def news
    @issues = Issue.all
    respond_to do |format|
      format.html
      format.js
    end

  end

  def background_params
    params.require(:home_background).permit(:ava_pic)
  end

end


