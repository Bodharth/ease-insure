class HomeController < ApplicationController
  def index
  	@subscriber = Subscriber.new
  	@news = NewsAndNotification.all
  end
end
