require './environment'
require 'pry'

module FormsLab
  class App < Sinatra::Base

    get "/" do
      erb :root
    end

    get "/new" do
      erb :"pirates/new"
    end

    post "/pirates" do
      # binding.pry
      @pirate = Pirate.new(params[:pirate])

      params[:pirate][:ships].each do |ship|
        Ship.new(ship)
      end
      @first_ship = Ship.all.first
      @second_ship = Ship.all.last
      erb :"pirates/show"
    end

  end
end
