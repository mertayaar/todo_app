import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ToDoItem extends Equatable {
   int? id;
   String? title;
   String? description;
   String? imageUrl;
  

   ToDoItem({
    this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
  
  });
  factory ToDoItem.fromDatabaseJson(Map<String, dynamic> map) => ToDoItem(
        id: map['id'],
        title: map['title'],
        description: map['description'],
        imageUrl: map['imageUrl'],
       
      );
 
  Map<String, dynamic> toDatabase() => {
        "id": id,
        "title": title,
        "description": description,
        "imageUrl": imageUrl,
      };

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        imageUrl,
      ];
}
