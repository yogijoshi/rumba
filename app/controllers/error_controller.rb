class ErrorController < ApplicationController
  layout 'error'
  def showerror
    flash[:error] = params[:message]
  end

end
