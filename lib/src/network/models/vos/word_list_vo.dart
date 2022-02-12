class WordListVO {
  MyWordCounts? myWordCounts;
  AllWordCounts? allWordCounts;

  WordListVO({this.myWordCounts, this.allWordCounts});

  WordListVO.fromJson(Map<String, dynamic> json) {
    myWordCounts = json['my_word_counts'] != null
        ? new MyWordCounts.fromJson(json['my_word_counts'])
        : null;
    allWordCounts = json['all_word_counts'] != null
        ? new AllWordCounts.fromJson(json['all_word_counts'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.myWordCounts != null) {
      data['my_word_counts'] = this.myWordCounts!.toJson();
    }
    if (this.allWordCounts != null) {
      data['all_word_counts'] = this.allWordCounts!.toJson();
    }
    return data;
  }
}

class MyWordCounts {
  int? ggez;
  int? your;

  MyWordCounts({this.ggez, this.your});

  MyWordCounts.fromJson(Map<String, dynamic> json) {
    ggez = json['ggez'];
    your = json['your'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ggez'] = this.ggez;
    data['your'] = this.your;
    return data;
  }
}

class AllWordCounts {
  int? gg;
  int? ezpz;
  int? ggez;

  AllWordCounts({this.gg, this.ezpz, this.ggez});

  AllWordCounts.fromJson(Map<String, dynamic> json) {
    gg = json['gg'];
    ezpz = json['ezpz'];
    ggez = json['ggez'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gg'] = this.gg;
    data['ezpz'] = this.ezpz;
    data['ggez'] = this.ggez;
    return data;
  }
}
