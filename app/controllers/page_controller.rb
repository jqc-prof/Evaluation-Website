class PageController < ApplicationController
  def home
    if current_user && current_user.role == "teacher"
      @assignments = current_user.assignments 
      idforref = params[:id]
      flash[:asig_ref] = idforref
    elsif current_user && current_user.role == "student"
      @submissions = current_user.submissions
      idforref = params[:id]
      flash[:submis_ref] = idforref
    end
  end
end
