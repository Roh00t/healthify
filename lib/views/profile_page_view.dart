import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healthify/services/auth_service.dart';
import 'package:healthify/services/firestore_service.dart';
import 'package:healthify/views/home_page_view.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Profile'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    FutureBuilder(
                        future: AuthService().currentUser(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return displayUserInformation(context, snapshot);
                          } else {
                            return CircularProgressIndicator();
                          }
                        })
                  ],
                ))));
  }

  Widget displayUserInformation(context, snapshot) {
    final user = snapshot.data;

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            controller: nameController..text = user.displayName,
            decoration: InputDecoration(
              labelText: "Username:",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            controller: emailController..text = user.email,
            decoration: InputDecoration(
              labelText: "Email:",
            ),
          ),
        ),
      
        // ignore: deprecated_member_use
        RaisedButton(
          onPressed: () async {
            try {
               if (user != null) {
                 await AuthService().updateDisplayName(nameController.text);
            Navigator.pop(context);
            await AuthService().updateEmail(emailController.text);
           await FirestoreService().updateUserData(
                            nameController.text.trim(),
                            emailController.text.trim(),);
               }else{
                  Fluttertoast.showToast(msg:'Please Log In Again', gravity: ToastGravity.TOP);
                  return Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomePage(),));
               }
            
            }catch (e){
      Fluttertoast.showToast(msg: e.message, gravity: ToastGravity.TOP);
      return Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomePage(),));
    }
          },
          child: Text("Save Changes"),
        )
      ],
    );
  }
}