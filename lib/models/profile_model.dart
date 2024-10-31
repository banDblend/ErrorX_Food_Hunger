class ProfileMode1 {
  final String? id;
  final String username;
  final String fullname;
  final String phoneNo;

  const ProfileMode1({
    this.id,
    required this.username,
    required this.fullname,
    required this.phoneNo,
  });

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "fullname": fullname,
      "phoneNo": phoneNo,
    };
  }
}
