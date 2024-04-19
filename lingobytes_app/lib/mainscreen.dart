import 'package:flutter/material.dart';
class Mainscreen extends StatefulWidget {
  @override
  _MainscreenState createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
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
    ),
    Story(
      title: "The Little Red Riding Hood",
      pages: [
        "In a small village...",
      ],
      imagePaths: [
        "assets/images/lingobytes-icon.png",
      ],
    ),
  ];

  int currentStory = 0;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
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
              builder: (context) =>
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
            ),
          ),
          drawer: Drawer(
            child: ListView.builder(
              itemCount: stories.length,
              itemBuilder: (context, index) =>
                  ListTile(
                    title: Text(stories[index].title),
                    onTap: () {
                      setState(() {
                        currentStory = index;
                        currentPage = 0;
                      });
                      Navigator.pop(context);
                    },
                  ),
            ),
          ),
          body: Stack(
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
              // Position buttons at the bottom
              Positioned(
                bottom: 20.0, // Adjust spacing as needed
                left: 0.0,
                right: 0.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: currentPage > 0 ? () =>
                            setState(() => currentPage--) : null,
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
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: currentPage <
                          stories[currentStory].pages.length - 1
                          ? () => setState(() => currentPage++)
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
          ),
        )
    );
  }
}

class Story {
  final String title;
  final List<String> pages;
  final List<String> imagePaths;

  Story({required this.title, required this.pages, required this.imagePaths});
}
