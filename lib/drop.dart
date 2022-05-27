import 'package:flutter/material.dart';

class dropButton extends StatefulWidget {
  const dropButton({Key? key}) : super(key: key);

  @override
  State<dropButton> createState() => _dropButtonState();
}

class _dropButtonState extends State<dropButton> {

  //DropDownButton için gerekli liste ve  yapılan seçim
  var school = <String>[];
  String selected_school = "Okulunuz";
  @override
  void initState() {
    super.initState();
    school.add("Okulunuzu");
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(sceenHeightInfo / 40),
              child: Container(
                width: sceenWidthInfo / 1.1,
                height: sceenHeightInfo / 12,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: DropdownButton<String>(

                  value: selected_school,
                  items:school.map<DropdownMenuItem<String>>((String value){
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(" $value", style: TextStyle(color:Colors.black, fontSize: 17),),
                    );
                  }).toList(),
                  icon: const Padding(
                    padding:  EdgeInsets.only(left: 180),
                    child: Icon(Icons.arrow_drop_down,),
                  ),
                  onChanged: (String? selected_data){
                    setState(() {
                      selected_school= selected_data!;
                    });
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
