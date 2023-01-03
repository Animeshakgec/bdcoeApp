class UserModel {
  String? uid;
  String? email;
  String? userName;
  String? phoneno;
  List<String> domain;
  String? bio;
  String? imageurl;
  String? year;

  UserModel({
    this.uid,
    this.email,
    this.userName,
    this.phoneno,
    this.domain = const [''],
    this.bio,
    this.imageurl,
    this.year,
  });

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      userName: map['userName'],
      phoneno: map['phoneno'],
      domain: map['domain'],
      bio: map['bio'],
      year: map['year'],
      imageurl: map['imageurl'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'userName': userName,
      'phoneno': phoneno,
      'domain': domain,
      'bio': bio,
      'imageurl': imageurl,
      'year': year,
    };
  }
}

class UserDataFetch {
  static String? uid;
  static String? email;
  static String? userName;
  static String? phoneno;
  static String? domain;
  static String? bio;
  static String? imageurl;
}

class FacultyUserData {
  static String? position1;
  static String? position2;
  // static String? email;
  static String? fname1;
  static String? fname2;
  //static String? phoneno;
  static String? linkedin1;
  static String? linkedin2;
  //static String? bio;
  static String? fimageurl1;
  static String? fimageurl2;
}

class CoordinatorUserData {
  // static String? email2;
  static String? fname1;
  static String? fname2;
  static String? fname3;
  static String? domain1;
  static String? domain2;
  static String? domain3;
  static String? year1;
  static String? year2;
  static String? year3;
  // static String? phoneno2;
  static String? linkedin1;
  static String? linkedin2;
  static String? linkedin3;
  static String? github1;
  static String? github2;
  static String? github3;
  // static String? bio;
  static String? fimageurl1;
  static String? fimageurl2;
  static String? fimageurl3;
}

class MembersUserData {
  // static String? email2;
  static String? fname1;
  static String? fname2;
  static String? fname3;
  static String? fname4;
  static String? fname5;
  static String? fname6;
  static String? domain1;
  static String? domain2;
  static String? domain3;
  static String? domain4;
  static String? domain5;
  static String? domain6;
  static String? year1;
  static String? year2;
  static String? year3;
  static String? year4;
  static String? year5;
  static String? year6;
  // static String? phoneno2;
  static String? linkedin1;
  static String? linkedin2;
  static String? linkedin3;
  static String? linkedin4;
  static String? linkedin5;
  static String? linkedin6;
  static String? github1;
  static String? github2;
  static String? github3;
  static String? github4;
  static String? github5;
  static String? github6;
  // static String? bio;
  static String? fimageurl1;
  static String? fimageurl2;
  static String? fimageurl3;
  static String? fimageurl4;
  static String? fimageurl5;
  static String? fimageurl6;
}
