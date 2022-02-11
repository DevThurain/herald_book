class PlayerVO {
  Null? trackedUntil;
  Null? soloCompetitiveRank;
  Null? competitiveRank;
  int? rankTier;
  Null? leaderboardRank;
  MmrEstimate? mmrEstimate;
  Profile? profile;

  PlayerVO(
      {this.trackedUntil,
      this.soloCompetitiveRank,
      this.competitiveRank,
      this.rankTier,
      this.leaderboardRank,
      this.mmrEstimate,
      this.profile});

  PlayerVO.fromJson(Map<String, dynamic> json) {
    trackedUntil = json['tracked_until'];
    soloCompetitiveRank = json['solo_competitive_rank'];
    competitiveRank = json['competitive_rank'];
    rankTier = json['rank_tier'];
    leaderboardRank = json['leaderboard_rank'];
    mmrEstimate = json['mmr_estimate'] != null
        ? new MmrEstimate.fromJson(json['mmr_estimate'])
        : null;
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tracked_until'] = this.trackedUntil;
    data['solo_competitive_rank'] = this.soloCompetitiveRank;
    data['competitive_rank'] = this.competitiveRank;
    data['rank_tier'] = this.rankTier;
    data['leaderboard_rank'] = this.leaderboardRank;
    if (this.mmrEstimate != null) {
      data['mmr_estimate'] = this.mmrEstimate!.toJson();
    }
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    return data;
  }
}

class MmrEstimate {
  int? estimate;

  MmrEstimate({this.estimate});

  MmrEstimate.fromJson(Map<String, dynamic> json) {
    estimate = json['estimate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['estimate'] = this.estimate;
    return data;
  }
}

class Profile {
  int? accountId;
  String? personaname;
  Null? name;
  bool? plus;
  int? cheese;
  String? steamid;
  String? avatar;
  String? avatarmedium;
  String? avatarfull;
  String? profileurl;
  Null? lastLogin;
  Null? loccountrycode;
  bool? isContributor;

  Profile(
      {this.accountId,
      this.personaname,
      this.name,
      this.plus,
      this.cheese,
      this.steamid,
      this.avatar,
      this.avatarmedium,
      this.avatarfull,
      this.profileurl,
      this.lastLogin,
      this.loccountrycode,
      this.isContributor});

  Profile.fromJson(Map<String, dynamic> json) {
    accountId = json['account_id'];
    personaname = json['personaname'];
    name = json['name'];
    plus = json['plus'];
    cheese = json['cheese'];
    steamid = json['steamid'];
    avatar = json['avatar'];
    avatarmedium = json['avatarmedium'];
    avatarfull = json['avatarfull'];
    profileurl = json['profileurl'];
    lastLogin = json['last_login'];
    loccountrycode = json['loccountrycode'];
    isContributor = json['is_contributor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_id'] = this.accountId;
    data['personaname'] = this.personaname;
    data['name'] = this.name;
    data['plus'] = this.plus;
    data['cheese'] = this.cheese;
    data['steamid'] = this.steamid;
    data['avatar'] = this.avatar;
    data['avatarmedium'] = this.avatarmedium;
    data['avatarfull'] = this.avatarfull;
    data['profileurl'] = this.profileurl;
    data['last_login'] = this.lastLogin;
    data['loccountrycode'] = this.loccountrycode;
    data['is_contributor'] = this.isContributor;
    return data;
  }
}
