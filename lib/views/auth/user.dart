class User {
  String? name;
  String? uid;
  String? image;
  String? email;
  String? youtube;
  String? facebook;
  String? twitter;
  String? instagram;

  User({
    this.name,
    this.uid,
    this.image,
    this.email,
    this.youtube,
    this.facebook,
    this.twitter,
    this.instagram,
  });

  // Map<String, dynamic> toJson() =>

  // {
  //   'name': name,
  //   'uid': uid,
  //   'image': image,
  //   'email': email,
  //   'youtube': youtube,
  //   'facebook': facebook,
  //   'twitter': twitter,
  //   'instagram': instagram
  // }; 
  
  // Converts data to JSON format
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'uid': uid,
      'image': image,
      'email': email,
      'youtube': youtube,
      'facebook': facebook,
      'twitter': twitter,
      'instagram': instagram,
    };
  }

  // static User fromSnap() {}
}