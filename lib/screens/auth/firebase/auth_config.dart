
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:swecom_app/screens/auth/login.dart';
import 'package:swecom_app/screens/dashboard/home.dart';
import 'package:swecom_app/screens/helper/widgets.dart';

class AuthService {
  Future<String?> registration({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LogInScreen(),
        ),
      );
      showAppSnackBar(context: context, message: "Registration Successful.", type: SnackBarType.success);
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showAppSnackBar(context: context, message: 'The password provided is too weak.', type: SnackBarType.failure);
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        showAppSnackBar(context: context, message: 'The password provided is too weak.', type: SnackBarType.failure);
        return 'The account already exists for that email.';
      } else {
        showAppSnackBar(context: context, message: e.message ?? "Error creating account, please try again.", type: SnackBarType.failure);
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const HomeDashboardScreen(),
        ),
      );
      showAppSnackBar(context: context, message: "Login Successful.", type: SnackBarType.success);
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showAppSnackBar(context: context, message:"Invalid credentials.", type: SnackBarType.failure);
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        showAppSnackBar(context: context, message:"Invalid credentials.", type: SnackBarType.failure);
        return 'Wrong password provided for that user.';
      } else {
        showAppSnackBar(context: context, message: e.message ?? "Error signing in, please try again.", type: SnackBarType.failure);
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  User? getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }

  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LogInScreen()), (route) => false);
  }

}