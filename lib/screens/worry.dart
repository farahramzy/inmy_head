import 'package:flutter/material.dart';
import 'package:inmy_head/data/worry_data.dart';

import '../constants/constants.dart';
import 'drawer.dart';
// import 'package:inmy_head/reflections/reflections2.dart';
// import 'constants.dart';
// import 'navigation_drawer/drawer.dart';

class Worry extends StatefulWidget {
  const Worry({super.key});
  @override
  State<Worry> createState() => _WorrysState();
}

// class _WorrysState extends State<Worry> {
//   final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Container(
//         decoration: const BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage("images/reflect.png"), fit: BoxFit.cover)),
//         child: Scaffold(
//           key: _globalKey,
//           drawer: const NavigationDrawer(),
//           backgroundColor: Colors.transparent,
//           body: PageView(
//             children: <Widget>[
//               // Padding(
//               //   padding: const EdgeInsets.all(15.0),
//               //   child: Row(
//               //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //     children: [
//               //       IconButton(
//               //         onPressed: () {
//               //           _globalKey.currentState?.openDrawer();
//               //         },
//               //         icon: const Icon(Icons.menu, size: FontSize.s40),
//               //         color: ColorManager.white,
//               //       ),
//               //       IconButton(
//               //         onPressed: () {
//               //           Navigator.pushNamed(context, 'homePage');
//               //         },
//               //         icon: const Icon(Icons.close_sharp, size: FontSize.s40),
//               //         color: ColorManager.white,
//               //       ),
//               //     ],
//               //   ),
//               // ),
//               Stack(
//                 children: const <Widget>[
//                   Cont1(),
//                   TextPage(text: "Is it that serious?"),
//                 ],
//               ),
//               Stack(
//                 children: const <Widget>[
//                   Cont1(),
//                   TextPage(text: "Is there a solution?"),
//                 ],
//               ),
//               Stack(
//                 children: const <Widget>[
//                   Cont1(),
//                   TextPage(text: "Is it out of your control?"),
//                 ],
//               ),
//               Stack(
//                 children: const <Widget>[
//                   Cont1(),
//                   TextPage(text: "Have you overcome worse?"),
//                 ],
//               ),
//               Stack(
//                 children: const <Widget>[
//                   Cont1(),
//                   TextPage(
//                       text:
//                           "What are the tools to help you get \n through this?"),
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

class _WorrysState extends State<Worry> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final worryData = WorryData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _globalKey,
      drawer: const NavigationDrawer(),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/3.png"), fit: BoxFit.cover),
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
                        color: ColorManager.white,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'homePage');
                        },
                        icon: const Icon(Icons.close_sharp, size: FontSize.s40),
                        color: ColorManager.white,
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: Text(
                    'Log a Worry',
                    style: TextStyle(
                      fontSize: FontSize.s40,
                      fontWeight: FontWeightManager.bold,
                      shadows: [
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
                    itemCount: worryData.worryList!.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 400,
                        child: ListTile(
                          title: SizedBox(
                            height: 350,
                            child: Container(
                              // color: ColorManager.black,
                              width: 350,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: ColorManager.purple3,
                              ),
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, left: 10, right: 5),
                                    child: Center(
                                      child: Text(
                                        worryData.worryList![index],
                                        style: TextStyle(
                                            color: ColorManager.white,
                                            fontSize: FontSize.s20,
                                            fontWeight:
                                                FontWeightManager.bold2),
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
                                            'Dive deep into your worries...',
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
