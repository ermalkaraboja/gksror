class TestsController < ApplicationController
  #before_filter :try_login, except: [:index]

  def index
    flash[:notice] = 'Custom message test'
  end
end
