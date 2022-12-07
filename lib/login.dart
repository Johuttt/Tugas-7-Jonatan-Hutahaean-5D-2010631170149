import 'package:flutter/material.dart';
import 'package:tugas7/mahasiswa_list_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  saveData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('usernameUser', _username.text.toString());
    prefs.setString('passwordUser', _password.text.toString());

    final String? usernameUser = prefs.getString('usernameUser');

    if (_username.text == "" && _password.text == "") {
      print("Tidak Bisa Login!");
    } else if (_username.text == "" || _password.text == "") {
      print("Tidak Bisa Login!");
    } else {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MahasiswaListPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                        color: Colors.black, shape: BoxShape.circle),
                    child: const Center(
                        child:
                            Icon(Icons.person, size: 50, color: Colors.white)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _username,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        prefixIcon: Icon(
                          Icons.person,
                          size: 40,
                        ),
                        hintText: "Masukkan Username",
                        hintStyle: TextStyle(color: Colors.black),
                        labelText: "Username",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _password,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 40,
                        ),
                        hintText: "Masukkan Password",
                        hintStyle: TextStyle(color: Colors.black),
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    color: Colors.black,
                    elevation: 5,
                    child: SizedBox(
                      height: 50,
                      child: InkWell(
                        splashColor: Colors.white,
                        onTap: saveData,
                        child: const Center(
                          child: Text(
                            "Masuk",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
