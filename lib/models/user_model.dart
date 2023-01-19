class UserModel {
  final int id;
  final String fname;
  final String lname;
  final String avatar;
  UserModel(
      {required this.id,
      required this.fname,
      required this.lname,
      required this.avatar});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        fname: json['first_name'] ?? 'First Name',
        lname: json['last_name'] ?? 'Last Name',
        avatar: json['avatar'] ??
            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.flaticon.com%2Ffree-icon%2Fuser_149071&psig=AOvVaw3QS7aTHa_FaFGO0FHe3OQN&ust=1673974888640000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCIj4ocbIzPwCFQAAAAAdAAAAABAE');
  }
}
