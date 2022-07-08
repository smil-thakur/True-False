import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:true_false/methods/firestore_methods.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
User? user;

class Auth {
  Future<User?> signin() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);
        UserCredential result = await auth.signInWithCredential(authCredential);
        user = result.user;
        MyFirebase firebase = MyFirebase();
        await firebase.addUser(user!);
        return user;
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> signout() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      googleSignIn.signOut();
    } catch (e) {
      print(e);
    }
  }
}
