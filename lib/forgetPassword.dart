import 'package:flutter/material.dart';

class password extends StatefulWidget {
  const password({Key? key}) : super(key: key);

  @override
  State<password> createState() => _passwordState();
}

class _passwordState extends State<password> {
  var formKey = GlobalKey<FormState>();
  var tfemail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var sceenInfo = MediaQuery.of(context);
    final double sceenWidthInfo = sceenInfo.size.width;
    final double sceenHeihtInfo = sceenInfo.size.height;
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:  EdgeInsets.all(sceenHeihtInfo/25),
              child: Text("öğrenciden",
                style: TextStyle(
                    fontSize: sceenWidthInfo/10,
                    color: Colors.indigo
                ),
              ),
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.all(sceenHeihtInfo/40),
                    child: TextFormField(
                      controller: tfemail,
                      decoration:  const InputDecoration(
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
                        labelText: "Öğrenci mail adresinizi giriniz",
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                      validator: (tfinput) {
                        if (tfinput!.isEmpty) {
                          return "Öğrenci Mail adresinizi giriniz";
                        }
                        return tfemail.text.contains("@edu.tr") ? null:"Mail adresi edu.tr uzantılı olmalı";
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: sceenWidthInfo/1.1,
                height: sceenHeihtInfo/12,
                child: ElevatedButton(
                  child: Text("Şifremi sıfırla", style: TextStyle(
                      fontSize: sceenWidthInfo / 23, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo,
                    //shadowColor: Colors.lightGreen,
                    //elevation: 20,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      side: BorderSide(color: Colors.grey),
                    ),
                  ),
                  onPressed: () {
                    bool controllResult= formKey.currentState!.validate();
                    if(controllResult){
                      //Şifreyi yenileme
                    }
                  },

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}