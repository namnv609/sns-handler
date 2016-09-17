class IndexController < ApplicationController
  http_basic_authenticate_with :name => "Username", :password => "Password"

  def index
    @logs = Log.all
  end
end
