import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'admin_box.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});
  @override
  State<Admin> createState() => _AdminState();
}
class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
             return Scaffold(
              
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/login.png"), fit: BoxFit.cover)),
                  child: Scaffold(
      
            backgroundColor: Colors.transparent,
                //  
                  body: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
        alignment: const FractionalOffset(0.40, 0.40),
                        child: Container(
                          height: 400,
                          width: 350,
                            decoration: BoxDecoration(
              color: ColorManager.beige,
              borderRadius: const BorderRadius.all(Radius.circular(40.0),)),
                          alignment: Alignment.center,
                 
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AdminBox(text:'Worries',button:(){ Navigator.pushNamed(context, 'worry');}),
                  AdminBox(text:'Reflect',button:(){ Navigator.pushNamed(context, 'reflections');}),
                  AdminBox(text:'Gratitude',button:(){ Navigator.pushNamed(context, 'gratitude');}),
                  ],),
                      
                        ),
                ),
                    ],
                  ),
        ),
            ),
      ),
     );
  }
}
// class TextFieldX extends StatefulWidget {
//   // final Function() button;
//   final VoidCallback? button;
//   // final String button;
//   const TextFieldX({
//     required this.button,
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<TextFieldX> createState() => TextFieldXState();
// }