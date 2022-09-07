class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  require 'open-uri'
  require 'nokogiri'

  def home
    @plants = Plant.all
  end
end
