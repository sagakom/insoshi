class PreferencesController < ApplicationController
  
  before_filter :setup
  
  def index
    render :action => "show"
  end
  
  def show
    respond_to do |format|
      format.html
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @preferences.update_attributes(params[:preference])
        flash[:notice] = 'Preference was successfully updated.'
        format.html { redirect_to(@preferences) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  private
    
    def setup
      @preferences = Preference.find(:first)
    end
end
