import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elattar_windows/screens/manager/home_manager.dart';
import 'package:firedart/auth/exceptions.dart';
// import 'package:elattar_windows/screens/moderators/home_moderators.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:elattar_windows/services/auth.dart';
import 'package:flutter/material.dart';
// import 'dart:io';
import 'package:firedart/firedart.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static String id = 'Login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  // final _auth = Auth();
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body:Form(
        key: formstate,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 200,
                    width: screenWidth ,
                    child: Image(
                      width: screenWidth,
                      image: const AssetImage("assets/login.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget> [
                  Text('Welcome Back', style: TextStyle(color: Colors.black, fontSize: 35),),
                ],
              ),
              const SizedBox(height: 50,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget> [
                  Text('البريد الإلكتروني', style: TextStyle(color: Colors.black, fontSize: 25),),
                ],
              ),
              const SizedBox(height: 5,),
              // Directionality(
              //   textDirection: TextDirection.rtl,
              //   child:TextFormField(
              //     keyboardType: TextInputType.emailAddress,
              //     validator: (value)
              //     {
              //       if(value!.isEmpty)
              //       {
              //         return 'أدخل بريد الإلكتروني';
              //       }
              //       return null;
              //     },
              //     onSaved: (value){
              //       email = value!;
              //     },
              //     autofillHints: const [AutofillHints.newUsername],
              //     decoration: const InputDecoration(
              //       filled: true,
              //       fillColor: Colors.white,
              //       hintText: 'البريد',
              //       labelText: 'البريد الإلكتروني',
              //       prefixIcon: Icon(Icons.email),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: TextFormField(
                    // controller: nameController,
                    // ignore: missing_return
                    validator: (value)
                    {
                      if(value!.isEmpty){
                        return 'أدخل البريد الإلكتروني ';
                      }
                      return null;
                      // { return _errorMessage(hint); }
                    },
                    // autofillHints: autoFillHints,
                    onSaved: (value) {
                      email = value!;
                    },
                    // autofocus: false,
                    keyboardType: TextInputType.emailAddress,
                    // obscureText: ' أدخل البريد الإلكتروني ' == ' أدخل كلمه المرور ' ? true : false,
                    cursorColor: Colors.red,
                    decoration: InputDecoration(
                      hintText: ' أدخل البريد الإلكتروني ',
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.grey,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Colors.white
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Colors.white
                          )
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Colors.white
                          )
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget> [
                  Text('كلمه المرور', style: TextStyle(color: Colors.black, fontSize: 25),),
                ],
              ),
              const SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: TextFormField(
                    // controller: nameController,
                    // ignore: missing_return
                    validator: (value)
                    {
                      if(value!.isEmpty){
                        return 'أدخل كلمه المرور ';
                      }
                      return null;
                      // { return _errorMessage(hint); }
                    },
                    // autofillHints: autoFillHints,
                    onSaved: (value) {
                      password = value!;
                    },
                    // autofocus: false,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: true,
                    cursorColor: Colors.red,
                    decoration: InputDecoration(
                      hintText: ' أدخل كلمه المرور ',
                      prefixIcon: const Icon(
                        Icons.password,
                        color: Colors.grey,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Colors.white
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Colors.white
                          )
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Colors.white
                          )
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 35,),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 120),
                  child: Builder(
                    // ignore: deprecated_member_use
                    builder: (context) => ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: getColor(Colors.blue, Colors.red)
                      ),
                      // ignore: void_checks
                      onPressed: () async {
                        print('1111111111111111111111111111111111111');
                        if (formstate.currentState!.validate())
                        {
                          try {
                            print('2222222222222222222222222222222');
                            formstate.currentState!.save();
                            print('33333333333333333333333333333333333');
                            showLoading(context);
                            print('44444444444444444444444444444444444444');
                            var auth = FirebaseAuth.instance;
                            // auth.signUp(email, password);
                            print('5555555555555555555555555555555555555');
                            // Sign in with user credentials
                            await auth.signIn(email, password);
                            print('666666666666666666666666666666666666');
                            // Get user object
                            var user = await auth.getUser();
                            print('7777777777777777777777777777777777777');
                            // ignore: avoid_print
                            print(user);
                            print('8888888888888888888888888888888888888888888');
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pushNamedAndRemoveUntil(HomeManager.id, (route) => false);
                            // await _auth.signIn(email, password);
                            // User? user = FirebaseAuth.instance.currentUser;

                            DocumentReference managerRef = Firestore.instance.collection('Manager').document(user.id);
                            CollectionReference managerCollection = Firestore.instance.collection('Manager');
                            final groceries = await managerCollection.get();
                            final groceriesB = await managerRef.get();
                            print(groceries); // [/Manager/3J13XtRRdCWy42EMPV7ofLuYGkC3 {email: manager@google.com, password: manager@google.com123}, /Manager/pZboAx30FlSwANg9Lhfh0JCmeRc2 {email: asdasdasd@asd.asd, password: asd.asd.asd}]
                            print(groceries.length); // 2
                            print(groceries.isEmpty); // false
                            print(groceries.isNotEmpty); // true
                            print('OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO');
                            print(groceriesB['password']);  // manager@google.com123
                            print(groceriesB['email']); // manager@google.com
                            print('KKKKKKKKKKKKKKKKKKKKKKKKK');
                            print(managerRef); // DocumentReference: Manager/3J13XtRRdCWy42EMPV7ofLuYGkC3
                            // print(managerRef.stream);
                            // DocumentSnapshot manager = await FirebaseFirestore.instance.collection('Manager').doc(user!.uid).get();
                            // print(managerRef.get());
                            // ignore: unrelated_type_equality_checks
                            // if (managerRef.stream.isEmpty != false) {
                            //   print('BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
                              // ignore: use_build_context_synchronously
                              // Navigator.of(context).pop();
                              // ignore: use_build_context_synchronously
                              // Navigator.of(context).pushNamedAndRemoveUntil(HomeManager.id, (route) => false);
                            // }
                            // var moderatorsRef = Firestore.instance.collection('Moderators').document(user.id);
                            // DocumentSnapshot moderators = await FirebaseFirestore.instance.collection('Moderators').doc(user.uid).get();
                            // print(moderatorsRef.get());
                            // ignore: unrelated_type_equality_checks
                            // if (moderatorsRef.stream.isEmpty != true) {
                            //   print('HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH');
                              // ignore: use_build_context_synchronously
                              // Navigator.of(context).pop();
                              // ignore: use_build_context_synchronously
                              // Navigator.of(context).pushNamedAndRemoveUntil(HomeModerators.id, (route) => false);
                            // }
                            print('WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW');
                          }on AuthException catch (e) {
                            Navigator.of(context).pop();
                            print('ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ');
                            AwesomeDialog(
                                context : this.context,
                                title: 'الحاله',
                                body:  e.message != null ? Text(e.message)
                                // : e.code != null ? Text(e.code)
                                    : const Text('حدث خطأ ما: بالرجاء المحاوله لاحقاً'),
                                dialogType: DialogType.warning)
                                .show();
                          }
                        } else {}
                      },
                      child: const Text(
                        ' تسجيل ', // Login
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  )
              ),
              const SizedBox(height: 35,),
              // Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 120),
              //     child: Builder(
              //       // ignore: deprecated_member_use
              //       builder: (context) => ElevatedButton(
              //         style: ButtonStyle(
              //             backgroundColor: getColor(Colors.blue, Colors.red)
              //         ),
              //         // ignore: void_checks
              //         onPressed: () async {
              //           if (formstate.currentState!.validate())
              //           {
              //             try {
              //               formstate.currentState!.save();
              //               showLoading(context);
              //               await _auth.signIn(email, password);
              //               User? user = FirebaseAuth.instance.currentUser;
              //
              //
              //               DocumentSnapshot manager = await FirebaseFirestore.instance.collection('Manager').doc(user!.uid).get();
              //               if (manager.data() != null) {
              //                 // ignore: use_build_context_synchronously
              //                 Navigator.of(context).pop();
              //                 // ignore: use_build_context_synchronously
              //                 Navigator.of(context).pushNamedAndRemoveUntil(HomeManager.id, (route) => false);
              //               }
              //               DocumentSnapshot moderators = await FirebaseFirestore.instance.collection('Moderators').doc(user.uid).get();
              //               if (moderators.data() != null) {
              //                 // ignore: use_build_context_synchronously
              //                 Navigator.of(context).pop();
              //                 // ignore: use_build_context_synchronously
              //                 Navigator.of(context).pushNamedAndRemoveUntil(HomeModerators.id, (route) => false);
              //               }
              //             }on FirebaseAuthException catch (e) {
              //               Navigator.of(context).pop();
              //               AwesomeDialog(
              //                   context : this.context,
              //                   title: 'الحاله',
              //                   body:  e.message != null ? Text(e.code)
              //                   // : e.code != null ? Text(e.code)
              //                       : const Text('حدث خطأ ما: بالرجاء المحاوله لاحقاً'),
              //                   dialogType: DialogType.warning)
              //                   .show();
              //             }
              //           } else {}
              //         },
              //         child: const Text(
              //           ' تسجيل ', // Login
              //           style: TextStyle(color: Colors.black),
              //         ),
              //       ),
              //     )
              // ),
              const SizedBox(height: 35,),
            ],
          ),
        ),
      ),
    );
  }
  MaterialStateProperty<Color> getColor(Color color, Color colorPressed){
    getColor(Set<MaterialState> state){
      if(state.contains(MaterialState.pressed)){
        return colorPressed;
      } else {
        return color;
      }
    }
    return MaterialStateProperty.resolveWith(getColor);
  }

  showLoading(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
              title: Text('أنتظر قليلاً'),
              content: SizedBox(
                  height: 50,
                  child: Center(
                      child: CircularProgressIndicator()
                  )
              )
          );
        }
    );
  }

}
