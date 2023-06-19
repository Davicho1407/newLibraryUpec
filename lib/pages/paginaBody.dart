import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:libreria_upec/direccionesDrawer/editarUsuario.dart';
import 'package:libreria_upec/direccionesDrawer/libros.dart';
import 'package:libreria_upec/direccionesDrawer/notificaciones.dart';
import 'package:libreria_upec/direccionesDrawer/nuevoChat.dart';
import 'package:libreria_upec/direccionesDrawer/nuevoContenido.dart';
import 'package:libreria_upec/direccionesDrawer/redSocial.dart';
import 'package:libreria_upec/pages/loginPage.dart';

class PaginaBody extends StatefulWidget {
  const PaginaBody({super.key});

  @override
  State<PaginaBody> createState() => _PaginaBodyState();
}

class _PaginaBodyState extends State<PaginaBody> {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  void signOutFromGoogle() async {
    await _googleSignIn.signOut();
  }

  @override
  void initState() {
    getDatosID();
    super.initState();
  }

  final user = FirebaseAuth.instance.currentUser?.uid;
  String usuario = '';
  String email = '';
  Future getDatosID() async {
    if (user != null) {
      DocumentReference documentReference =
          FirebaseFirestore.instance.collection('usuarios').doc(user);

      documentReference.get().then((DocumentSnapshot doc) {
        if (doc.exists) {
          final data = doc.data() as Map<String, dynamic>;
          setState(() {
            usuario = data['nombre'];
            email = data['email'];
          });
        } else {
          print('El documento no existe.');
        }
      }, onError: (e) => print('Error en conseguir los documentos: $e'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Inicio',
          style: TextStyle(color: Colors.black),
        ),
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.tealAccent),
              accountName: Text("Usuario: $usuario",
                  style: TextStyle(color: Colors.black)),
              accountEmail:
                  Text("Email: $email", style: TextStyle(color: Colors.black))),
          ListTile(
            leading: Icon(Icons.house),
            title: Text("Inicio"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PaginaBody()));
            },
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text("Nuevo Chat"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NuevoChat()));
            },
          ),
          ListTile(
            leading: Icon(Icons.content_copy),
            title: Text("Nuevo Contenido"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NuevoContenido()));
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text("Libros"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Libros()));
            },
          ),
          ListTile(
            leading: Icon(Icons.telegram),
            title: Text("Red Social"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RedSocial()));
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Notificaciones"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Notificaciones()));
            },
          ),
          ListTile(
            leading: Icon(Icons.supervised_user_circle),
            title: Text("Editar usuario"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditarUsuario()));
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Salir"),
            onTap: () async {
              try {
                await FirebaseAuth.instance.signOut();
                signOutFromGoogle();
                // Navegar a la pantalla de inicio de sesión
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              } catch (e) {
                print(e);
              }
            },
          )
        ],
      )),
      body: _PaginaBienvenidad(),
    );
  }
}

class _PaginaBienvenidad extends StatefulWidget {
  const _PaginaBienvenidad({super.key});

  @override
  State<_PaginaBienvenidad> createState() => __PaginaBienvenidadState();
}

class __PaginaBienvenidadState extends State<_PaginaBienvenidad> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(18),
            child:
                Text('¡Aquí puedes encontrar información para tu aprendizaje!',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center),
          )
        ],
      ),
    ));
  }
}
