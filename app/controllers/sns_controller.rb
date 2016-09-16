# encoding: UTF-8

class SnsController < ApplicationController
  require "open-uri"
  require "net/http"
  require "uri"

  skip_before_filter :verify_authenticity_token, :only => [:index]

  def index
    request_body = get_request_body request.raw_post
    date_time = Time.now.getlocal "+07:00"

    if request_body.any?
      case request_body[:Type]
      when "SubscriptionConfirmation"
        status = subscription_confirmation request_body[:SubscribeURL]
        write_log "#{date_time}: Subscription confirmation: #{status}"
      else
        write_log "#{date_time}: #{request.raw_post}"
      end
    end

    render text: "OK ^^!"
  end

  private
  def get_request_body request_body
    request_object = {}

    begin
      request_object = JSON.parse request_body
    rescue JSON::ParserError => e
    end

    request_object.symbolize_keys
  end

  def subscription_confirmation confirm_url
    response = Net::HTTP.get_response(URI::parse(confirm_url))

    response.code
  end

  def write_log log_content
    File.open("request_logs", "a+") { |file| file.puts log_content }
  end
end
