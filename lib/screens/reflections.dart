import 'package:flutter/material.dart';
// import 'package:inmy_head/reflections/reflections2.dart';
import '../constants/constants.dart';
import 'drawer.dart';
import '../data/reflection_data.dart';

class Reflections extends StatefulWidget {
  const Reflections({super.key});
  @override
  State<Reflections> createState() => _ReflectionsState();
}

// class _ReflectionsState extends State<Reflections> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Container(
//         decoration: const BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage("images/reflect2.jpg"), fit: BoxFit.cover)),
//         child: Scaffold(
//           backgroundColor: Colors.transparent,
//           body: PageView(
//             children: <Widget>[
//               Stack(
//                 children: const <Widget>[
//                   Cont2(),
//                   TextPage(
//                       text:
//                           "What is the most interesting \n thing you learned today?"),
//                 ],
//               ),
//               Stack(
//                 children: const <Widget>[
//                   Cont2(),
//                   TextPage(text: "What inpspired you today?"),
//                 ],
//               ),
//               Stack(
//                 children: const <Widget>[
//                   Cont2(),
//                   TextPage(text: "What are your goals for tommorow?"),
//                 ],
//               ),
//               Stack(
//                 children: const <Widget>[
//                   Cont2(),
//                   TextPage(
//                       text:
//                           "What is the one thing you could've \n done better today?"),
//                 ],
//               ),
//               Stack(
//                 children: const <Widget>[
//                   Cont2(),
//                   TextPage(text: "What was your favorite part of the day?"),
//                   Button(),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

class _ReflectionsState extends State<Reflections> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final reflectionData = Reflectionata();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: const NavigationDrawer(),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/4.png"), fit: BoxFit.cover),
          ),
          child: Form(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          _globalKey.currentState?.openDrawer();
                        },
                        icon: const Icon(Icons.menu, size: FontSize.s40),
                        color: ColorManager.black,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'homePage');
                        },
                        icon: const Icon(Icons.close_sharp, size: FontSize.s40),
                        color: ColorManager.black,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Text(
                    'Reflections',
                    style: TextStyle(
                      color: ColorManager.black,
                      fontSize: FontSize.s40,
                      fontWeight: FontWeightManager.bold,
                      shadows: const [
                        Shadow(
                          blurRadius: 9.0,
                          color: Colors.grey,
                          offset: Offset(3.0, 3.0),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 60.0),
                Expanded(
                  // height: 320,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: reflectionData.reflectionList!.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 400,
                        child: ListTile(
                          title: SizedBox(
                            height: 350,
                            child: Container(
                              width: 350,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: ColorManager.purple3,
                              ),
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, left: 10, right: 5),
                                    child: Center(
                                      child: Text(
                                        reflectionData.reflectionList![index],
                                        style: TextStyle(
                                          color: ColorManager.white,
                                          fontSize: FontSize.s20,
                                          fontWeight: FontWeightManager.bold2,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: TextFormField(
                                      onTap: () {},
                                      maxLines: 9,
                                      decoration: InputDecoration(
                                        fillColor: ColorManager.white,
                                        labelText:
                                            'Take a few moments reflect...',
                                        alignLabelWithHint: true,
                                        labelStyle: TextStyle(
                                          color: ColorManager.white,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                              color: ColorManager.white),
                                        ),
                                        hintText: 'Type your answer...',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
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
