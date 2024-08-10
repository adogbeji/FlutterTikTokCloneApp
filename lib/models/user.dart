import 'package:cloud_firestore/cloud_firestore.dart';

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
  
  // Gets user data from database
  static User fromSnap(DocumentSnapshot snapshot) {  // NB: snapshot refers to the user data that's coming from database
    var dataSnapshot = snapshot.data() as Map<String, dynamic>;

    return User(
      name: dataSnapshot['name'],
      uid: dataSnapshot['uid'],
      image: dataSnapshot['image'],
      email: dataSnapshot['email'],
      youtube: dataSnapshot['youtube'],
      facebook: dataSnapshot['facebook'],
      twitter: dataSnapshot['twitter'],
      instagram: dataSnapshot['instagram'],
    );
  }
}