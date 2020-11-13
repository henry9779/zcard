class ApplicationController < ActionController::Base

  rescue_from ActiveRecord::RecordNotFound,with: :error

  private

  def error
   render file: 'public/404.html', 
          layout: false ,
          status: 404
  end
  
end
