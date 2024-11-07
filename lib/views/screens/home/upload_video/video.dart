class Video {
  Video({
    this.userID,
    this.userName,
    this.videoID,
    this.totalComments,
    this.totalShares,
    this.likesList,
    this.artistSongName,
    this.descriptionTags,
    this.videoUrl,
    this.thumbnailUrl,
    this.publishedDateTime,
  });

  String? userID;
  String? userName;
  String? videoID;
  int? totalComments;
  int? totalShares;
  List? likesList;
  String? artistSongName;
  String? descriptionTags;
  String? videoUrl;
  String? thumbnailUrl;
  int? publishedDateTime;


  // Converts data to JSON
  Map<String, dynamic> toJson() => {
    'userID': userID,
    'userName': userName,
    'videoID': videoID,
    'totalComments': totalComments,
    'totalShares': totalShares,
    'likesList': likesList,
    'artistSongName': artistSongName,
    'descriptionTags': descriptionTags,
    'videoUrl': videoUrl,
    'thumbnailUrl': thumbnailUrl,
    'publishedDateTime': publishedDateTime,
  };
}