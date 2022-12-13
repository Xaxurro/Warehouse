import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:warehouse/pages/Options/changeColor.dart';
import 'package:warehouse/Functions/TileFunctions.dart';
import 'package:warehouse/pages/Login.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        tilePage('Color', 'Color App', Icons.color_lens_sharp, context, const ChangeColorPage()),
        Divider(),
        tileFunction(
          'LogOut',
          'Exit',
          Icons.logout,
          context,
          () async{
            await FirebaseAuth.instance.signOut();

            //borrar user email de shared preferences
            SharedPreferences sp = await SharedPreferences.getInstance();
            sp.remove('userEmail');

            //redirigir al login
            MaterialPageRoute route = MaterialPageRoute(builder: ((context) => LoginPage()));
            Navigator.pushReplacement(context, route);
          }
        )
      ],
    );
  }
  
void logout(BuildContext context) async {
    //cerrar sesion en firebase
    await FirebaseAuth.instance.signOut();

    //borrar user email de shared preferences
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('userEmail');

    //redirigir al login
    MaterialPageRoute route = MaterialPageRoute(builder: ((context) => LoginPage()));
    Navigator.pushReplacement(context, route);
  }
}

