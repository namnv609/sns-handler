class IndexController < ApplicationController
  def index
    @logs = Log.all
  end
end
