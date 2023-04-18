class ApplicationController < ActionController::Base
  include Pagy::Backend

  def validate
    @environment = ENV
  end
end
