require './lib/loader'
require 'sinatra'

get '/' do
  erb :index
end

post '/compare' do
  puts params[:steam_id1]
  puts params[:steam_id2]
  @person1_games = steam_client.get_games(params[:steam_id1])
  @person2_games = steam_client.get_games(params[:steam_id2])
  erb :compare
end

def steam_client
  @steam_client ||= SteamClient.new
end
