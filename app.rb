require './lib/loader'
require 'sinatra'

get '/' do
  erb :index
end

post '/compare' do
  puts params
  puts params[:steam_id1]
  puts params[:steam_id2]
  @person1_games = steam_client.get_games(params[:steam_id1])
  @person2_games = steam_client.get_games(params[:steam_id2])
  @games_in_common = games_in_common
  erb :compare
end

def games_in_common
  @person1_games & @person2_games
end

def steam_client
  @steam_client ||= SteamClient.new
end
