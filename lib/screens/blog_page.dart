import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Blog", style: TextStyle(color: Colors.black)),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('blog').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          DocumentSnapshot document = snapshot.data!.docs.first;
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Image.network((document.data() as Map)['image_url']),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text((document.data() as Map)['title'],
                      style: Theme.of(context).textTheme.headline3),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text((document.data() as Map)['subtitle'],
                      style: Theme.of(context).textTheme.subtitle1),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text((document.data() as Map)['content'],
                      style: Theme.of(context).textTheme.bodyText2),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}




















// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class BlogPage extends StatefulWidget {
//   const BlogPage({required Key key}) : super(key: key);

//   @override
//   _BlogPageState createState() => _BlogPageState();
// }

// class _BlogPageState extends State<BlogPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('blog').snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(child: CircularProgressIndicator());
//           }
//           return SizedBox(
//             height: MediaQuery.of(context).size.height * 0.9,
//             child: Column(
//               children: <Widget>[
//                 //display the title of the blog
//                 Text(
//                   (snapshot.data!.docs[0].data() as Map)['title'],
//                   style: Theme.of(context).textTheme.headline1,
//                 ),
//                 //display the subtitle of the blog
//                 Text(
//                   (snapshot.data!.docs[0].data() as Map)['subtitle'],
//                   style: Theme.of(context).textTheme.subtitle1,
//                 ),
//                 //display the Image of the blog
//                 Image.network(
//                     (snapshot.data!.docs[0].data() as Map)['image_url']),
//                 //display the content of the blog
//                 Expanded(
//                   child: Text((snapshot.data!.docs[0].data() as Map)['content'],
//                       style: Theme.of(context).textTheme.bodyText2),
//                 )
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }




// // import 'package:flutter/material.dart';

// // class BlogPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Column(
// //         children: [
// //           Image.network('https://via.placeholder.com/800x400'),
// //           Container(
// //             padding: const EdgeInsets.all(16),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text('Blog Title',
// //                     style: Theme.of(context).textTheme.headline5),
// //                 const SizedBox(height: 8),
// //                 Text('Blog Subtitle',
// //                     style: Theme.of(context).textTheme.subtitle1),
// //                 const SizedBox(height: 16),
// //                 Text('Blog Content goes here...',
// //                     style: Theme.of(context).textTheme.bodyText2),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

