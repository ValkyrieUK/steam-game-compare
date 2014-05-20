require './lib/loader'
class SteamClient

  def get_games(community_id)
    get_steam_id(community_id)
    map_games(@steam_id)
  end

  private

  def get_steam_id(community_id)
    new_community_id = community_id.to_i
    if new_community_id == 0
      @steam_id = SteamId.new(community_id).steam_id64
    else
      @steam_id = community_id.to_i
    end
  end

  def map_games(steam_id)
    SteamId.new(steam_id).games.map {|i| i[1].name}
  end
end