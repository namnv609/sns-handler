# encoding: UTF-8

class SnsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:index]

  def index
    render text: "OK ^^"
  end
end
