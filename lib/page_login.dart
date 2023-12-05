import 'package:flutter/material.dart';
import 'package:checkoutin/menu_utama.dart';
import 'package:checkoutin/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Size sizemedia;
  TextEditingController namaController = TextEditingController();
  TextEditingController nomerController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passagainController = TextEditingController();
  bool rememberUser = false;
  var floginen = true;

  @override
  Widget build(BuildContext context) {
    sizemedia = MediaQuery.of(context).size;
    emailController.text = 'rivansetia1302@gmail.com';
    passwordController.text = '12345';
    return Container(
      decoration: const BoxDecoration(),
      child: Scaffold(
        backgroundColor: Colors.purple,
        body: Stack(children: [
          Positioned(bottom: 0, child: _buildBottom()),
        ]),
      ),
    );
  }
  Widget _buildBottom() {
    return SizedBox(
      width: sizemedia.width,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }
  Widget _buildForm() {
     return Container(
      child:Column(
      children: [
        Container(
        child: Visibility(
        visible: floginen,  
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
          "LOGIN",
          style: TextStyle(
              fontSize: 32, fontWeight: FontWeight.w500),
        ),
        Container(
          constraints: BoxConstraints(
            maxHeight: 60,
            maxWidth: 60
          ),
          child: Image.asset('lib/images/logo.png'),
        )
              ],
            ),
          ),
       
        _buildGreyText("Selamat Datang"),
        const SizedBox(height: 60),
        _buildGreyText("Email address"),
        _buildInputField(emailController),
        const SizedBox(height: 40),
        _buildGreyText("Password"),
        _buildInputField(passwordController, isPassword: true),
        const SizedBox(height: 20),
        _buildRememberForgot(),
        const SizedBox(height: 20),
        _buildLoginButton(),
        const SizedBox(height: 20),
        //_buildOtherLogin(),
        ],
        )),
        ),
        Container(
        child: Visibility(
        visible: !floginen,  
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
          "REGISTER",
          style: TextStyle(
              fontSize: 32, fontWeight: FontWeight.w500),
        ),
        Container(
          constraints: BoxConstraints(
            maxHeight: 60,
            maxWidth: 60
          ),
          child: Image.asset('lib/images/logo.png'),
        )
              ],
            ),
          ),
        _buildGreyText("Selamat Datang"),
        const SizedBox(height: 40),
        _buildGreyText("Nama"),
        _buildInputField(namaController),
        const SizedBox(height: 20),
        _buildGreyText("Nomer Telepon"),
        _buildInputField(nomerController),
        const SizedBox(height: 20),
        _buildGreyText("Alamat"),
        _buildInputField(alamatController),
        const SizedBox(height: 20),
        _buildGreyText("Email address"),
        _buildInputField(emailController),
        const SizedBox(height: 20),
        _buildGreyText("Password"),
        _buildInputField(passwordController, isPassword: true),
        
        const SizedBox(height: 20),
        _buildLoginButton(),
        const SizedBox(height: 20),
        
        //_buildOtherLogin(),
        ],
        
        )),
        ),
        floginen
        ?
        TextButton(  
            onPressed: () {
              setState(() {
                floginen = false;
              });
            }, child: _buildGreyText("Daftar")) 
        :
        TextButton(  
            onPressed: () {
              setState(() {
                floginen = true;
              });
            }, child: _buildGreyText("Masuk"))
      ],
      )
      
       
    );
  }
   Widget _buildGreyText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.grey),
    );
  }

  Widget _buildInputField(TextEditingController controller, {isPassword = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isPassword ? const Icon(Icons.remove_red_eye) : const Icon(Icons.done),
      ),
      obscureText: isPassword,
    );
  }

  Widget _buildRememberForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
                value: rememberUser,
                onChanged: (value) {
                  setState(() {
                    rememberUser = value!;
                  });
                }),
            _buildGreyText("Remember me"),
          ],
        ),
        TextButton(
            onPressed: () {}, child: _buildGreyText("I forgot my password"))
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        userList.forEach((index) { 
if(emailController.text == index.email && passwordController.text == index.password){
  Navigator.push(context, MaterialPageRoute(builder: ((context) => const MainMenu())));
        }
        });
        
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 20,
        //shadowColor: myColor,
        minimumSize: const Size.fromHeight(60),
      ),
      child: 
      floginen ?
      const Text("Masuk")
      :
      const Text("Daftar")
      ,
    );
  }
}