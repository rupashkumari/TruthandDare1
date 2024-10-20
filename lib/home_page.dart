import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:truth/screen.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
final FirebaseAuth _auth= FirebaseAuth.instance;
User? _user;


@override
  void initState() {
    super.initState();
  _auth.authStateChanges().listen((User?event){
  setState(() {
    _user= event;
  }
  );
}
);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google SignIn"),
      ),
      body: _user !=null ? _userInfo() : _googleSignInButton() ,
    );
  }

Widget _googleSignInButton(){
  return  Center(
    child: SizedBox(
    height: 50,
    child: SignInButton(
      Buttons.google,
      text: "Sign up with Google",
       onPressed: _handleGoogleSignIn,
       ),
       ),
       );
}
Widget _userInfo(){
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisSize: MainAxisSize.max,
       children: [
        if(_user?.photoURL != null)
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(_user!.photoURL!),
            ),
          ),
        ),
        Text(_user!.email!),
        Text(_user!.displayName ?? ""),
        MaterialButton(
          color: Colors.red,
          child: const Text("Sign Out"),
          onPressed: () async{
          await _auth.signOut();
         setState(() {
           _user= null;
         });
          }
        ),
        
       ],
    ),
  );
}
Future<void> _handleGoogleSignIn() async{
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn(scopes: <String>["email","profile",]).signIn();
    if(googleUser != null){
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

       UserCredential userCredential = await _auth.signInWithCredential(credential);
       if (userCredential.user != null) {
        print('User signed in: ${userCredential.user?.email}');
        
         Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Screen()),
      );
       }
       else{
        print('Error: UserCredential is null');
       }
    }
    else{
      print('Error: Google sign-in cancelled by user');
    }
  } catch (error) {
    print("Sign-in error: $error");
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Sign-in failed: $error')),
    );
  }
}
}