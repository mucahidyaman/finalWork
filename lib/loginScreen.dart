import 'package:final_work/forgetPassword.dart';
import 'package:flutter/material.dart';
//import 'package:login_signup_screen/login_form.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);


  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  var formKey = GlobalKey<FormState>();

  var tfemail = TextEditingController();
  var tfpassword = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var sceenInfo = MediaQuery.of(context);
    final double sceenWidthInfo = sceenInfo.size.width;
    final double sceenHeightInfo = sceenInfo.size.height;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:  EdgeInsets.all(sceenWidthInfo/25),
                child: Text("öğrenciden", style: TextStyle(fontSize: sceenWidthInfo/10, color: Colors.indigo),),
              ),
              
              Form(
                key: formKey,
                child: Column(
                  children: [

                    Padding(
                      padding:  EdgeInsets.all(sceenHeightInfo/40),
                      child: TextFormField(
                        controller: tfemail,
                        decoration: const InputDecoration(
                          hintText: "Öğrenci mail adresinizi giriniz",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),

                          ),
                          labelText: "Email",
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                        validator: (tfinput) {
                          if (tfinput!.isEmpty) {
                            return "Mail adresinizi giriniz";
                          }

                          return tfemail.text.contains("@edu.tr") ? null:"Mail adresi edu.tr uzantılı olmalı";
                        },
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(sceenHeightInfo/40),
                      child: TextFormField(
                        controller: tfpassword,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Şifrenizi Giriniz",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          labelText: "Şifre",
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),

                        ),
                        validator: (tfinput) {
                          if (tfinput!.isEmpty) {
                            return "Şifrenizi  giriniz";
                          }
                          if (tfinput.length < 8) {
                            return "Şifreniz en az 8 haneli olmalıdır";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 30.0, left: 20.0, bottom: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const password()));
                        },
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Şifremi unuttum.",
                            style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.w400,
                              fontSize: sceenWidthInfo / 30,


                            ),

                          ),
                        ),
                      ),
                    ),


                    Padding(
                      padding:  EdgeInsets.all(sceenHeightInfo/40),
                      child: SizedBox(
                        width: sceenWidthInfo/1.1,
                        height: sceenHeightInfo/12 ,
                        child: ElevatedButton(
                          child: Text("GİRİŞ YAP", style: TextStyle(
                              fontSize: sceenWidthInfo / 25, color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.indigo,
                            //shadowColor: Colors.lightGreen,
                            //elevation: 20,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              side: BorderSide(color: Colors.white),
                            ),
                          ),
                          onPressed: () {
                            bool controlResult = formKey.currentState!.validate();
                            if (controlResult) {

                            }
                          },

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Henüz üye değil misin?",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: sceenWidthInfo / 35,

                              ),

                            ),
                            GestureDetector(
                              onTap: (){

                              },
                              child: Text(
                                "Hemen üye ol.",
                                style: TextStyle(
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.bold,
                                  fontSize: sceenWidthInfo / 35,

                                ),

                              ),
                            ),

                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}