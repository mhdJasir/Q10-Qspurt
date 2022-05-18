
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:q10/Components/Functions.dart';
import 'package:q10/Components/Loaders.dart';
import 'package:q10/Constants/Styles.dart';
import 'package:q10/screens/HomeScreen.dart';

class SignUpLogin extends StatefulWidget {
  const SignUpLogin({Key key}) : super(key: key);

  @override
  _SignUpLoginState createState() => _SignUpLoginState();
}

class _SignUpLoginState extends State<SignUpLogin> {
   LoginResult loginResult;
   var name;
   var email;
   var image;
  facebookLogin()async{
    loginResult =await FacebookAuth.instance.login();
    final userData=await FacebookAuth.i.getUserData();
    print(userData);
    name=userData['name'];
    email=userData['email'];
    image=userData['picture']['data']['url'];
    setState(() {

    });
  }
  GoogleSignInAccount _account;
  final _signIn=GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: basicPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              sbh(20),
              name!=null?
              Column(
                children: [
                   Text(name),
                   sbh(10),
                   Text(email),
                  sbh(10),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(image),
                  ),
                ],
              ):Container(),
              sbh(20),
              Center(
                child: Container(
                  height: 50,width: 300,
                  child: ElevatedButton.icon(
                      onPressed: ()async{
                        showLoading(context);
                        await _signIn.signOut();
                        _account=await _signIn.signIn();
                        Navigator.pop(context);
                        name=_account.displayName;
                        email=_account.email;
                        image=_account.photoUrl;
                        setState(() {});
                      },
                      icon: FaIcon(FontAwesomeIcons.google),
                      label: Text("Google sign in")),
                ),
              ),
              sbh(20),
              Center(
                child: Container(
                  height: 50,width: 300,
                  child: ElevatedButton.icon(
                      onPressed: ()async{
                        showLoading(context);
                       await FacebookAuth.i.logOut();
                        facebookLogin();
                        Navigator.pop(context);
                        setState(() {});
                      },
                      icon: FaIcon(FontAwesomeIcons.facebook),
                      label: Text("Facebook sign in")),
                ),
              ),
              sbh(100),
              Center(
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (c){
                      return HomeScreen();
                    }));
                  },
                  child: Container(
                    color: Colors.grey[300],
                    height: 50,width: 300,
                    child: Center(child: Text("Next")),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
