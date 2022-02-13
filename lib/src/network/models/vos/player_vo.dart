class PlayerVO {
  int? rankTier;
  MmrEstimate? mmrEstimate;
  Profile? profile;

  PlayerVO(
      {
      this.rankTier,
      this.mmrEstimate,
      this.profile});

  PlayerVO.fromJson(Map<String, dynamic> json) {
   
    rankTier = json['rank_tier'];
    mmrEstimate = json['mmr_estimate'] != null
        ? new MmrEstimate.fromJson(json['mmr_estimate'])
        : null;
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rank_tier'] = this.rankTier;
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
  bool? plus;
  int? cheese;
  String? steamid;
  String? avatar;
  String? avatarmedium;
  String? avatarfull;
  String? profileurl;
  bool? isContributor;

  Profile(
      {this.accountId,
      this.personaname,
      this.plus,
      this.cheese,
      this.steamid,
      this.avatar,
      this.avatarmedium,
      this.avatarfull,
      this.profileurl,
      this.isContributor});

  Profile.fromJson(Map<String, dynamic> json) {
    accountId = json['account_id'];
    personaname = json['personaname'];
    plus = json['plus'];
    cheese = json['cheese'];
    steamid = json['steamid'];
    avatar = json['avatar'];
    avatarmedium = json['avatarmedium'];
    avatarfull = json['avatarfull'];
    profileurl = json['profileurl'];
    isContributor = json['is_contributor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_id'] = this.accountId;
    data['personaname'] = this.personaname;
    data['plus'] = this.plus;
    data['cheese'] = this.cheese;
    data['steamid'] = this.steamid;
    data['avatar'] = this.avatar;
    data['avatarmedium'] = this.avatarmedium;
    data['avatarfull'] = this.avatarfull;
    data['profileurl'] = this.profileurl;
    data['is_contributor'] = this.isContributor;
    return data;
  }
}
