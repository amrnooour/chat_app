class Message {
  late String id;
  late String content;
  late String roomId;
  late String senderName;
  late String senderId;
  late int dateTime;

  Message(
      {this.id = "", required this.content, required this.roomId, required this.senderName, required this.senderId,
        required this.dateTime});

  Message.fromJson(Map<String, dynamic> json){
    id = json["id"];
    content = json["content"];
    roomId = json["roomId"];
    senderName = json["senderName"];
    senderId = json["senderId"];
    dateTime = json["dateTime"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "content": content,
      "roomId": roomId,
      "senderName": senderName,
      "senderId": senderId,
      "dateTime": dateTime,
    };
  }
}