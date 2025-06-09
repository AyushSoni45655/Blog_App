import 'package:blog_app/features/domain/entity/blog.dart';

class BlogModel extends BlogEntity {
  BlogModel({
    required super.id,
    required super.title,
    required super.description,
    required super.image,
    required super.date,
    required super.time,
  });
  Map<String,dynamic>toMap(){
    return{
      "Id":id,
      "Title":title,
      "Description":description,
      "Time":time,
      "Date":date,
      "Image":image
    };
  }
  factory BlogModel.fromJson(
      Map<String,dynamic>json
    //  DocumentSnapshot snaps
      ){
    //final json = snaps.data()! as Map<String,dynamic>;
    return BlogModel(
        id: json["Id"]??"No Id",
        title: json["Title"]??"No title",
        description: json["Description"]??"No Description",
        image: json["Image"]??"No image",
        date: json["Date"]??"No date",
        time: json["Time"]??"No time"
    );
  }
}
