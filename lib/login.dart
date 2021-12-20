import 'package:flutter/material.dart';
import 'package:flutter_application_1/createAccount.dart';
import 'package:flutter_application_1/edit.dart';
import 'package:flutter_application_1/EditPassword.dart';

class HomePage1 extends StatelessWidget {
  bool isHiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Image(
                  image: ExactAssetImage('images/logoUniRides.png'),
                ),
              ),
              Container(
                height: 40,
                margin:
                    new EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.email),
                      labelText: "Email"),
                ),
              ),
              Container(
                height: 40,
                margin:
                    new EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                child: TextField(
                  obscureText: isHiddenPassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.password),
                    labelText: "Password",
                    suffixIcon: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(
                        Icons.visibility,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 200,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => HomePage()));
                  },
                  child: Text(
                    "CRIAR CONTA",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      primary: Colors.black),
                ),
              ),
              Container(
                height: 40,
                width: 200,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => HomePage3()));
                  },
                  child: Text(
                    "ENTRAR",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      primary: Colors.black),
                ),
              ),
            ]),
            margin: new EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    //if (isHiddenPassword == true) {
    // isHiddenPassword == false;
    //} else {
    // isHiddenPassword == true;
    //}

    isHiddenPassword = !isHiddenPassword;
  }
}
