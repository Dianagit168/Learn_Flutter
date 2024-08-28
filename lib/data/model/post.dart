class Post {
  final int? id;
  final String? description;
  final String? thumbnail;

  Post(this.id, this.description, this.thumbnail);

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        //Named constructor
        json['id'],
        json['description'],
        json['thumbnail'],
      );
}
