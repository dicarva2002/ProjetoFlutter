import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';

class HomePage3 extends StatelessWidget {
  bool isHiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            title: Center(
              child: Image.asset(
                'images/logoUniRides.png',
                fit: BoxFit.contain,
                height: 50,
              ),
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(children: [
                Container(
                  height: 40,
                  margin: new EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 10.0),
                  child: TextField(
                    obscureText: isHiddenPassword,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.password),
                      labelText: "Password Atual",
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
                  margin: new EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 10.0),
                  child: TextField(
                    obscureText: isHiddenPassword,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.password),
                      labelText: "Nova Password",
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
                  margin: new EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 10.0),
                  child: TextField(
                    obscureText: isHiddenPassword,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.security),
                      labelText: "Confirmar Password",
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
                              builder: (BuildContext context) => HomePage1()));
                    },
                    child: Text(
                      "ALTERAR PASSWORD",
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
                SizedBox(
                  height: 15,
                ),
              ]),
              margin:
                  new EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: (Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.home),
                iconSize: 40,
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
                iconSize: 40,
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person),
                iconSize: 40,
                color: Colors.white,
              ),
            ],
          )),
        ));
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
