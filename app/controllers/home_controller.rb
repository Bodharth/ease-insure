class HomeController < ApplicationController
  def index
  	@subscriber = Subscriber.new
  	@news = NewsAndNotification.all.limit(5).order(:published_at)
  end
end
