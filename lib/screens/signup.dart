import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pingolearntest/screens/home.dart';
import 'package:pingolearntest/screens/login.dart';
import 'package:pingolearntest/util/myColor.dart';
import 'package:pingolearntest/util/textfield.dart';
import 'package:pingolearntest/util/util.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool load = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.background,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: bottomWidget(),
      appBar: AppBar(
        backgroundColor: MyColor.transparent,
        elevation: 0,
        leading: const SizedBox(),
        leadingWidth: 0,
        title: Text("Comments",
          style: GoogleFonts.poppins(
              color: MyColor.main,
              fontSize: 20,
              fontWeight: FontWeight.w700
          ),),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              textField("Name", name, TextInputType.name, false, !(name.text.length > 3),(value) => setState(() {})),

              textField("Email", email, TextInputType.emailAddress, false, !(email.text.length > 3 && email.text.contains("@") && email.text.contains(".")),(value) => setState(() {})),

              textField("Password", pass, TextInputType.name, false, !(pass.text.length > 3),(value) => setState(() {})),

              const SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }

  bottomWidget(){
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SizedBox(
        height: 110,
        child: Column(
          children: [
            InkWell(
              onTap: () async{
                setState(() {
                  load = true;
                });

                if(!formKey.currentState!.validate()){
                  setState(() {
                    load = false;
                  });
                  return;
                }

                try{

                  UserCredential? user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text.trim(), password: pass.text.trim());

                  if(user.user != null){
                    await FirebaseFirestore.instance.collection("user").add({
                      "name": name.text,
                      "email": email.text,
                      "uid": user.user!.uid,
                      "mask": false
                    });

                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                      return const Home();
                    }));
                  }
                  setState(() {
                    load = false;
                  });
                }on FirebaseAuthException catch (e){
                  setState(() {
                    load = false;
                  });
                  errorCode(context, e.code);
                }

              },
              child: Container(
                height: 49,
                width: 231,
                decoration: BoxDecoration(
                  color: MyColor.main,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: load ? Center(child: CircularProgressIndicator(color: MyColor.white,)) : Text("Signup",
                  style: GoogleFonts.poppins(
                      color: MyColor.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16
                  ),),
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? ",
                  style: GoogleFonts.poppins(
                      color: MyColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                  ),),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const Login();
                    }));
                  },
                  child: Text("Login",
                    style: GoogleFonts.poppins(
                        color: MyColor.main,
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                    ),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }



}
