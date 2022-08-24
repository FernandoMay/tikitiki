class Comment {
  String username;
  String comment;
  final datePublished;
  List likes;
  String profilePhoto;
  String uid;
  String id;

  Comment({
    required this.username,
    required this.comment,
    required this.datePublished,
    required this.likes,
    required this.profilePhoto,
    required this.uid,
    required this.id,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'comment': comment,
        'datePublished': datePublished,
        'likes': likes,
        'profilePhoto': profilePhoto,
        'uid': uid,
        'id': id,
      };

  // static Comment fromSnap(DocumentSnapshot snap) {
  //   var snapshot = snap.data() as Map<String, dynamic>;
  //   return Comment(
  //     username: snapshot['username'],
  //     comment: snapshot['comment'],
  //     datePublished: snapshot['datePublished'],
  //     likes: snapshot['likes'],
  //     profilePhoto: snapshot['profilePhoto'],
  //     uid: snapshot['uid'],
  //     id: snapshot['id'],
  //   );
  // }
}

class User {
  String name;
  String profilePhoto;
  String email;
  String uid;

  User(
      {required this.name,
      required this.email,
      required this.uid,
      required this.profilePhoto});

  Map<String, dynamic> toJson() => {
        "name": name,
        "profilePhoto": profilePhoto,
        "email": email,
        "uid": uid,
      };

  // static User fromSnap(DocumentSnapshot snap) {
  //   var snapshot = snap.data() as Map<String, dynamic>;
  //   return User(
  //     email: snapshot['email'],
  //     profilePhoto: snapshot['profilePhoto'],
  //     uid: snapshot['uid'],
  //     name: snapshot['name'],
  //   );
  // }
}

class Video {
  String username;
  String uid;
  String id;
  List likes;
  int commentCount;
  int shareCount;
  String songName;
  String caption;
  String videoUrl;
  String thumbnail;
  String profilePhoto;

  Video({
    required this.username,
    required this.uid,
    required this.id,
    required this.likes,
    required this.commentCount,
    required this.shareCount,
    required this.songName,
    required this.caption,
    required this.videoUrl,
    required this.profilePhoto,
    required this.thumbnail,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "profilePhoto": profilePhoto,
        "id": id,
        "likes": likes,
        "commentCount": commentCount,
        "shareCount": shareCount,
        "songName": songName,
        "caption": caption,
        "videoUrl": videoUrl,
        "thumbnail": thumbnail,
      };

  // static Video fromSnap(DocumentSnapshot snap) {
  //   var snapshot = snap.data() as Map<String, dynamic>;

  //   return Video(
  //     username: snapshot['username'],
  //     uid: snapshot['uid'],
  //     id: snapshot['id'],
  //     likes: snapshot['likes'],
  //     commentCount: snapshot['commentCount'],
  //     shareCount: snapshot['shareCount'],
  //     songName: snapshot['songName'],
  //     caption: snapshot['caption'],
  //     videoUrl: snapshot['videoUrl'],
  //     profilePhoto: snapshot['profilePhoto'],
  //     thumbnail: snapshot['thumbnail'],
  //   );
  // }
}
