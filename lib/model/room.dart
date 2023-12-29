class Room{
  late String id;
  late String title;
  late String description;
  late int categoryId;

  Room(this.id, this.title, this.description, this.categoryId);

  Room.fromJson(Map<String,dynamic> json){
    id =json["id"];
    title =json["title"];
    description =json["description"];
    categoryId =json["categoryId"];
  }
  Map<String,dynamic> toJson(){
    return{
  "id" : id,
  "title" : title,
  "description" : description,
  "categoryId" : categoryId,
  };
}


}