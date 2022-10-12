class Survey {
  int id;
  String email;
  String firstname;
  String lastname;
  String avatar;

  Survey({
    required this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.avatar,
  });

  factory Survey.fromJson(Map<String, dynamic> json) {
    return Survey(
      id: json['id'],
      email: json['email'],
      firstname: json['first_name'] ?? 'First Name',
      lastname: json['last_name'] ?? 'Last Name',
      avatar: json['avatar'] ??
          'https://www.freepik.com/premium-photo/blank-white-crumpled-creased-paper-poster-texture-background_17489097.htm#&position=3&from_view=popular',
    );
  }
}
