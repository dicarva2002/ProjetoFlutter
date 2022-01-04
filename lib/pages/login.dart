import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/createAccount.dart';
import 'package:flutter_application_1/pages/edit.dart';
import 'package:flutter_application_1/pages/EditPassword.dart';
import 'package:flutter_application_1/services/auth_service.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isHiddenPassword = true;
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();

  bool isLogin = true;
  late String titulo;
  late String actionButton;
  late String toggleButton;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    setFormAction(true);
  }

  setFormAction(bool acao) {
    setState(() {
      isLogin = acao;
      if (isLogin) {
        titulo = "Bem Vindo";
        actionButton = "Login";
        toggleButton = "Ainda nao tem conta? Crie agora.";
      } else {
        titulo = "Crie sua conta";
        actionButton = "Criar";
        toggleButton = "Voltar ao Login";
      }
    });
  }

  login() async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().login(email.text, senha.text);
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  registar() async {
    try {
      await context.read<AuthService>().registar(email.text, senha.text);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(children: [
              Text(
                titulo,
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.5,
                ),
              ),
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
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.email),
                      labelText: "Email"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Informe o email corretamente!';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                height: 40,
                margin:
                    new EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                child: TextFormField(
                  controller: senha,
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Informe a sua senha!';
                    } else if (value.length < 6) {
                      return 'Sua senha deve ter no minimo 6 carateres';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                height: 40,
                width: 200,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (isLogin) {
                        login();
                      } else {
                        registar();
                      }
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => HomePage()));
                  },
                  child: Text(
                    actionButton,
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
              TextButton(
                  onPressed: () => setFormAction(!isLogin),
                  child: Text(toggleButton)),
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
// habilitar dentro do firebase o login 
