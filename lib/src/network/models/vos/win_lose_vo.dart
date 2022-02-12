class WinLoseVO {
  int? win;
  int? lose;

  WinLoseVO({this.win, this.lose});

  WinLoseVO.fromJson(Map<String, dynamic> json) {
    win = json['win'];
    lose = json['lose'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['win'] = this.win;
    data['lose'] = this.lose;
    return data;
  }
}
