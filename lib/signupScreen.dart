import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  //DropDownButton için gerekli liste ve  yapılan seçim
  var school = <String>[];
  String selected_school = "Okulunuz";

  //TextformField için;
  var formKey = GlobalKey<FormState>();
  var tfemail = TextEditingController();
  var tfpassword = TextEditingController();
  var tfpassword_again = TextEditingController();
  @override
  void initState() {
    super.initState();
    school.add("Okulunuz");
    school.add("Akdeniz Üniversitesi");
    school.add("Boğaziçi Üniversitesi");
    school.add("Ege Üniversitesi");
    school.add("İstanbul Üniversitesi");
    school.add("Selçuk Üniversitesi");
  }
  Widget build(BuildContext context) {
    var sceenInfo = MediaQuery.of(context);
    final double sceenWidthInfo = sceenInfo.size.width;
    final double sceenHeightInfo = sceenInfo.size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(sceenWidthInfo / 15),
                child: Text("öğrenciden", style: TextStyle(fontSize: sceenWidthInfo / 10, color: Colors.indigo),
                ),
              ),
              Padding(
                padding:  EdgeInsets.all(sceenHeightInfo / 40),
                child: Container(
                  height: sceenHeightInfo / 12,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black , width: 1 ),
                      borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton<String>(
                    value: selected_school,
                    items:school.map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                        value: value,

                        child: Text(" $value", style: TextStyle(color:Colors.black, fontSize: 17),),
                      );
                    }).toList(),
                    icon: Icon(Icons.arrow_drop_down,),
                    iconSize: 26,
                    isExpanded: true,
                    underline: SizedBox(),
                    onChanged: (String? selected_data){
                      setState(() {
                        selected_school= selected_data!;
                      });
                    },
                  ),
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(sceenHeightInfo / 40),
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
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0)),
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

                          return tfemail.text.contains("@edu.tr")
                              ? null
                              : "Mail adresi edu.tr uzantılı olmalı";
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(sceenHeightInfo / 40),
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
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0)),
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
                      padding: EdgeInsets.all(sceenHeightInfo / 40),
                      child: TextFormField(
                        controller: tfpassword_again,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Şifrenizi Tekrar Giriniz",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0)),
                          ),
                          labelText: "Şifrenizi Tekrar Giriniz",
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
                          if (tfpassword.text != tfpassword_again.text) {
                            return "Şifreler uyuşmuyor";
                          }

                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(sceenHeightInfo / 40),
                      child: SizedBox(
                        width: sceenWidthInfo / 1,
                        height: sceenHeightInfo / 12,
                        child: ElevatedButton(
                          child: Text("KAYIT OL",
                              style: TextStyle(
                                  fontSize: sceenWidthInfo / 25,
                                  color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.indigo,
                            //shadowColor: Colors.lightGreen,
                            //elevation: 20,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              side: BorderSide(color: Colors.white),
                            ),
                          ),
                          onPressed: () {
                            bool controlResult =
                            formKey.currentState!.validate();
                            if (controlResult) {}
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Zaten bir hesabın var mı?",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: sceenWidthInfo / 35,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Giriş yap.",
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
