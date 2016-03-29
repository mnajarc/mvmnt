class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :almacena_paginas

protected

  def almacena_paginas
    @menu_paginas = Rails.cache.fetch('paginas') do
       Pagina.all
    end
  end
end
