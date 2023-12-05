import 'package:checkoutin/page_about.dart';
import 'package:flutter/material.dart';
import 'package:checkoutin/user.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int indexusr = 0;
  
  @override
  Widget build(BuildContext context) {
  var nama = userList[indexusr].nama;
  var nomertlp = userList[indexusr].nomertlp;
  var alamat = userList[indexusr].alamat;
    return MaterialApp(
      home: Scaffold(

        appBar: AppBar(
          title: const Text('Profil Pengguna'),
          backgroundColor: Colors.purple,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                       border: Border(bottom: BorderSide(color:Colors.black.withOpacity(0.3) ))
                      ),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                    ClipOval(
                      child: Image.asset('lib/images/user.png',
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                      
                      ),
                      
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 45),
                        Text(nama, style: const TextStyle(fontSize: 18),),
                        IconButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => EditProfile(previousText: nama, indexchange: 0,))));
                        }, icon: const Icon( Icons.mode_sharp), iconSize: 18,)
                      ],
                    )
                      ]
                    )
                    )
                  ],
                ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color:Colors.black.withOpacity(0.3) ))
                    
                  ),
                  padding:const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  children: [
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      child: const Text('Nomer Telepon'),
                    ),
                    Expanded(child:
                    InkWell(
                      onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: ((context) => EditProfile(previousText: nomertlp, indexchange: 1,))));
                      },
                      child:
                    TextField(
                      enabled: false,
                        decoration: InputDecoration(
                          hintText: nomertlp,
                          disabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)
                          ),
                          suffixIcon: const Icon(Icons.mode_edit, color: Colors.black, size: 18,),
                          hintStyle:const  TextStyle(color:Colors.black)
                        ),
                      ),
                    )
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      child:const Text('Alamat'),
                    ),
                    Expanded(child:
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: ((context) => EditProfile(previousText: alamat, indexchange: 2,))));
                      },
                      child:
                    TextField(
                      enabled: false,
                        decoration: InputDecoration(
                          hintText: alamat,
                          disabledBorder:const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)
                          ),
                          suffixIcon:const Icon(Icons.mode_edit, color: Colors.black, size: 18,),
                          hintStyle:const TextStyle(color:Colors.black)
                        ),
                      ),
                    )
                    )
                  ],
                ),
                  ],

                )                
                ),
                Container(
                  child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: ((context) => About())));
                      },
                      child: const TextField(
                      enabled: false,
                        decoration: InputDecoration(
                          hintText: 'About',
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)
                          ),
                          prefixIcon: Icon(Icons.info, color: Colors.black45, size: 18,),
                          hintStyle: TextStyle(color:Colors.black87)
                        ),
                      ),
                    )

                  )
            ],
          ),
        ),
      ),
    );
  }
}

// class MenuProfile {
//   String judul;
//   String nama;
//   Icon ikon;
//   EditProfile routeedit;

//   MenuProfile({
//   required this.judul,
//   required this.nama,
//   required this.ikon,
//   required this.routeedit
//   });
// }

// List<MenuProfile> menuprofilelist = [
//   MenuProfile(
//     judul: 'Nomer Telepon',
//     nama: userList[0].nomertlp,
//     ikon: const Icon(Icons.mode_edit, color: Colors.black, size: 18,),
//     routeedit: EditProfile(previousText: userList[0].nomertlp, indexchange: 2),
//   ),
//   MenuProfile(
//     judul: 'Alamat',
//     nama: userList[0].nomertlp,
//     ikon: const Icon(Icons.mode_edit, color: Colors.black, size: 18,),
//     routeedit: EditProfile(previousText: userList[0].nomertlp, indexchange: 2),
//   ),
// ];

class EditProfile extends StatelessWidget {
  final String previousText;
  final int indexchange;
  EditProfile({required this.previousText,required this.indexchange});
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = previousText;
    String label = indexchange == 0 ? 'Nama' : indexchange == 2 ? 'Alamat' : indexchange == 1 ? 'Nomer Telepon' : '';
    return Scaffold(
      appBar: AppBar(
        title: Text(label),
        backgroundColor: Colors.purple,
        
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding:const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: label,
                border:const OutlineInputBorder(),
              ),
            ),
           const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
indexchange == 0 ? 
changenama()
 : indexchange == 2 ? 
 changealamat() : 
 indexchange == 1 ? 
 changenomertlp():''; 
  
  Navigator.pop(context);
              },
              child:const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
void changenama(){
int indexToChange = userList.indexWhere((user) => user.nama == previousText);
  if (indexToChange != -1) {
    userList[indexToChange] = UserData(
      nama: nameController.text,
      email: userList[indexToChange].email,
      password: userList[indexToChange].password,
      alamat: userList[indexToChange].alamat,
      nomertlp: userList[indexToChange].nomertlp,
    );
  }
  }
  void changenomertlp(){
int indexToChange = userList.indexWhere((user) => user.nomertlp == previousText);
  if (indexToChange != -1) {
    userList[indexToChange] = UserData(
      nama: userList[indexToChange].nama,
      password: userList[indexToChange].password,
      email: userList[indexToChange].email,
      alamat: userList[indexToChange].alamat,
      nomertlp: nameController.text,
    );
  }
  }
  void changealamat(){
int indexToChange = userList.indexWhere((user) => user.alamat == previousText);
  if (indexToChange != -1) {
    userList[indexToChange] = UserData(
      nama: userList[indexToChange].nama,
      password: userList[indexToChange].password,
      email: userList[indexToChange].email,
      alamat: nameController.text,
      nomertlp: userList[indexToChange].nomertlp,
    );

  }
}
}
