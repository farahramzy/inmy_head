import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inmy_head/data/repositories/blog_provider.dart';
import 'package:share/share.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  BlogPageState createState() => BlogPageState();
}

class BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: Colors.grey[200],
                child: IconButton(
                  icon: const Icon(
                    Icons.book_online,
                    size: 20,
                  ),
                  color: Colors.grey,
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: Consumer(
          builder: (_, ref, __) {
            return ref.watch(blogProvider).when(
              data: (data) {
                final document = data.docs.first;
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Center(
                            child: Text((document.data() as Map)['title'],
                                style: GoogleFonts.roboto(
                                    fontSize: 32,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),

                        // child: Center(
                        //     child: Text((document.data() as Map)['title'],
                        //         style: GoogleFonts.yourFontName(
                        //           fontSize: 32,
                        //           color: Colors.black,

                        //         )),
                        //   ),

                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                const Icon(
                                  Icons.calendar_month,
                                  color: Colors.grey,
                                  size: 18,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  (document.data() as Map)['date'],
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // const Divider(
                        //   color: Colors.grey, // divider color
                        //   thickness: 0.7, // divider thickness
                        //   height: 15,
                        //   indent: 70,
                        //   endIndent: 70, // height of the divider
                        // ),
                        const SizedBox(
                          height: 15,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                              (document.data() as Map)['image_url']),
                        ),

                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text((document.data() as Map)['subtitle'],
                              style: GoogleFonts.roboto(
                                fontSize: 22,
                                color: const Color.fromARGB(255, 76, 73, 73),
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text((document.data() as Map)['content'],
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                color: Colors.black,
                              )),
                        ),
                        const Divider(
                          color: Colors.grey, // divider color
                          thickness: 0.7, // divider thickness
                          height: 15,
                          indent: 70,
                          endIndent: 70, // height of the divider
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: ClipRRect(
                              //     borderRadius: BorderRadius.circular(8),
                              //     child: Container(
                              //       color: Colors.grey[200],
                              //       child: IconButton(
                              //         icon: const Icon(
                              //           Icons.bookmark_outline,
                              //           size: 20,
                              //         ),
                              //         color: Colors.grey,
                              //         onPressed: () {},
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: ClipRRect(
                              //     borderRadius: BorderRadius.circular(8),
                              //     child: Container(
                              //       color: Colors.grey[200],
                              //       child: IconButton(
                              //         icon: const Icon(
                              //           Icons.favorite_outline,
                              //           size: 20,
                              //         ),
                              //         color: Colors.grey,
                              //         onPressed: () {},
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    color: Colors.grey[200],
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.share_outlined,
                                        size: 20,
                                      ),
                                      color: Colors.grey,
                                      onPressed: () {
                                        Share.share(
                                            "https://play.google.com/store/apps/details?id=bassem.inmyhead");
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              error: (Object error, StackTrace err) {
                // print(err.toString());
                return const Text("Error loading your blogs");
              },
              loading: () {
                return const Center(child: CircularProgressIndicator());
              },
            );
          },
        ),
      ),
    );
  }
}
