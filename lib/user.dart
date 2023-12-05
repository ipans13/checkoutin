class UserData {
  String nama;
  String email;
  String password;
  String alamat;
  String nomertlp;

  UserData({
    required this.nama,
    required this.email,
    required this.password,
    required this.alamat,
    required this.nomertlp,
  });
}

List<UserData> userList = [
  UserData(
    nama: 'Rivan',
    email: 'rivansetia1302@gmail.com',
    password: '12345',
    alamat: '123 Main Street',
    nomertlp: '1234567890',
  ),
];
