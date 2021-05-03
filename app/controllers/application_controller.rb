class ApplicationController < ActionController::Base

  def validate
    @environment = ENV
  end

end
