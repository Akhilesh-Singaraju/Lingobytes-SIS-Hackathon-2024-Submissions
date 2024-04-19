import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_tts/flutter_tts.dart';


class Mainscreen extends StatefulWidget {
  @override
  _MainscreenState createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  // User? user = FirebaseAuth.instance.currentUser;
  bool showQuiz = false;
  // late var user_email = user?.email;
  final FlutterTts flutterTts = FlutterTts();
  final List<Story> stories = [
    Story(
      title: "The Three Little Pigs",
      pages: [
        "Once upon a time, there were three little pigs. The first little pig was lazy. He built a house of straw.",
        "The second little pig was a little bit more careful. He built a house of sticks.",
        "The third little pig was the smartest of them all. He built a house of bricks.",
        "A big, bad wolf came along and wanted to blow down their houses. He huffed and he puffed, and blew down the straw house!",
        "The first little pig ran to his brother's house of sticks. The wolf came along and huffed and he puffed, and blew down the stick house!",
        "The two little pigs ran to their smartest brother's house of bricks. The wolf came along and huffed and he puffed, but he couldn't blow down the brick house!",
        "The wolf was so angry, he climbed on top of the roof to get in. But the third little pig had a pot of boiling water on the stove. The wolf fell in and squealed and ran away!",
        "The three little pigs learned a valuable lesson that day. It's always better to work hard and build a strong house!",
      ],
      imagePaths: [
        "assets/images/BookImages/3LittlePigs/1.png",
        "assets/images/BookImages/3LittlePigs/1.png",
        "assets/images/BookImages/3LittlePigs/1.png",
        "assets/images/BookImages/3LittlePigs/1.png",
        "assets/images/BookImages/3LittlePigs/1.png",
        "assets/images/BookImages/3LittlePigs/1.png",
        "assets/images/BookImages/3LittlePigs/1.png",
        "assets/images/BookImages/3LittlePigs/1.png",
      ],
      soundPaths: [
        "assets/sounds/BookSounds/3LittlePigs/1.mp3",
      ],
    ),
    Story(
      title: "The Little Red Riding Hood",
      pages: [
        "In a small village...",
      ],
      imagePaths: [
        "assets/images/lingobytes-icon.png",
      ],
      soundPaths: [
        "assets/images/BookImages/3LittlePigs/1.caf",
      ],
    ),
  ];

  int currentStory = 0;
  int currentPage = 0;
  final _questions = const [
    {
      'questionText': 'Q1. What material did the first little pig use to build his house??',
      'answers': [
        {'text': 'Sticks', 'score': 0},
        {'text': 'Bricks', 'score': 0},
        {'text': 'Straw', 'score': 1},
      ],
    },
    {
      'questionText': 'Q2. How did the second little pig\'s house differ from the first little pig\'s house?',
      'answers': [
        {'text': 'It was made of bricks', 'score': 0},
        {'text': 'It was made of sticks', 'score': 1},
        {'text': 'It was made of straw', 'score': 0},
      ],
    },
    {
      'questionText': ' Q3. Who were the antagonists in the story, and what were their motivations?',
      'answers': [
        {'text': 'The three little pigs, to build their houses', 'score': 0},
        {'text': 'The big bad wolf, to eat the pigs', 'score': 1},
        {'text': 'The farmers, to protect their crops', 'score': 0},
      ],
    },
  ];

  @override
  void initState() {
    super.initState();
    flutterTts.setLanguage("en-US");
  }
  Widget build(BuildContext context) {
    Widget _bookContent() {
      return Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  stories[currentStory].imagePaths[currentPage],
                  width: double.infinity,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    stories[currentStory].pages[currentPage],
                    style: TextStyle(fontSize: 20),
                  ),)
              ],
            ),
          ),
          Positioned(
            bottom: 20.0, // Adjust spacing as needed
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: currentPage > 0 ? () => setState(() {
                      currentPage--;
                    }): null,
                    child: Text("Previous"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color(0xffECFDF5)),
                      foregroundColor: MaterialStateProperty.all(
                          Color(0xff064E3B)),
                      shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    )
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: currentPage <
                      stories[currentStory].pages.length - 1
                      ? () {
                    setState(() {
                      currentPage++;
                    });
                    flutterTts.speak(stories[currentStory].pages[currentPage]);
                  }
                      : null,
                  child: Text("Next"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color(0xffECFDF5)),
                    foregroundColor: MaterialStateProperty.all(
                        Color(0xff064E3B)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                  ),),
              ],
            ),
          ),
        ],
      );
    }
    return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xffECFDF5),
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Color(0xff064E3B)),
          ),
        ),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffECFDF5),
            title: Text(stories[currentStory].title),
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                // UserAccountsDrawerHeader(
                //   currentAccountPicture: CircleAvatar(
                //     backgroundImage: NetworkImage(
                //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbBqkzkIZcbJ--7JT_4uRYCsW32sRec3jJcnWwzhbjCw&s'),
                //   ),
                //   accountEmail: Text(user_email!),
                //   accountName: Text(
                //     user_email!,
                //     style: TextStyle(fontSize: 24.0),
                //   ),
                //   decoration: BoxDecoration(
                //     color: Colors.black87,
                //   ),
                // ),
                ExpansionTile(
                  title: Text("Section 1; Starting Out"),
                  children: [
                    ListTile(
                      title: Text("The Three Little Pigs"),
                      onTap: () {
                        setState(() {
                          currentStory = 0;
                          currentPage = 0;
                        });
                      },
                    ),
                    ListTile(
                      title: Text("The Little Red Riding Hood"),
                      onTap: () {
                        setState(() {
                          currentStory = 1;
                          currentPage = 0;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: _bookContent()
        )
    );
  }
}

class Story {
  final String title;
  final List<String> pages;
  final List<String> imagePaths;
  final List<String> soundPaths;

  Story({required this.title, required this.pages, required this.imagePaths, required this.soundPaths});
}
