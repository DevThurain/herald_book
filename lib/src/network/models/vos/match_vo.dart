class MatchVO {
  int? matchId;
  int? playerSlot;
  bool? radiantWin;
  int? duration;
  int? gameMode;
  int? lobbyType;
  int? heroId;
  int? startTime;
  int? kills;
  int? deaths;
  int? assists;
  int? leaverStatus;
  int? partySize;

  MatchVO(
      {this.matchId,
      this.playerSlot,
      this.radiantWin,
      this.duration,
      this.gameMode,
      this.lobbyType,
      this.heroId,
      this.startTime,
      this.kills,
      this.deaths,
      this.assists,
      this.leaverStatus,
      this.partySize});

  MatchVO.fromJson(Map<String, dynamic> json) {
    matchId = json['match_id'];
    playerSlot = json['player_slot'];
    radiantWin = json['radiant_win'];
    duration = json['duration'];
    gameMode = json['game_mode'];
    lobbyType = json['lobby_type'];
    heroId = json['hero_id'];
    startTime = json['start_time'];
    kills = json['kills'];
    deaths = json['deaths'];
    assists = json['assists'];
    leaverStatus = json['leaver_status'];
    partySize = json['party_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['match_id'] = this.matchId;
    data['player_slot'] = this.playerSlot;
    data['radiant_win'] = this.radiantWin;
    data['duration'] = this.duration;
    data['game_mode'] = this.gameMode;
    data['lobby_type'] = this.lobbyType;
    data['hero_id'] = this.heroId;
    data['start_time'] = this.startTime;
    data['kills'] = this.kills;
    data['deaths'] = this.deaths;
    data['assists'] = this.assists;
    data['leaver_status'] = this.leaverStatus;
    data['party_size'] = this.partySize;
    return data;
  }
}
