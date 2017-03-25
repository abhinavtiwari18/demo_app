class HomeController < ApplicationController

  def index
    # if Time.now.hour == 10
    #   @published_deals = Deal.where(:publish_date => Time.now.beginning_of_day..Time.now.end_of_day)
    # end
    @published_deals = Deal.all
  end
end
