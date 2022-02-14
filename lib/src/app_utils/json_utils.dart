import 'dart:convert';
import 'package:herald_book/src/network/models/vos/message_vo.dart';

class JsonUtils {
  static List<MessageVO> getMessages(String json) {
    Map mapValue = jsonDecode(json);
    // This is where you iterate via the data object
    // that is the value which is key,value pair
    List<MessageVO> data = [];
    mapValue['all_word_counts'].forEach((key, value) {
      data.add(MessageVO(word: key.toString(), count: value.toString()));
    });
    data.sort(((a, b) => int.parse(a.count).compareTo(int.parse(b.count))));
    return data.length > 30 ? data.reversed.take(30).toList() : data.reversed.toList();
    
  }
}
