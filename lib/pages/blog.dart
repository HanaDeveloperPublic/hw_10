import 'package:flutter/material.dart';
import 'package:hw_10/pages/add_blog.dart';

import 'settings.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget body;
    if (currentIndex == 0) {
      body = const Task();
    } else {
      body = const SettingsPage();
    }
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (newIndex) {
              currentIndex = newIndex;
              setState(() {});
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home", backgroundColor: Colors.green),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings", backgroundColor: Colors.yellow),
            ]),
        // appBar: AppBar(title: const Text('Home Work 8')),
        body: Container(child: body));
  }
}

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  final List<BlogClass> blog_list = [
    BlogClass(
        "Feeling Conflicted About AI as a Content Writer ",
        "In this personal essay, I attempt to tackle my complicated feelings about AI head-on and discuss how Buffer is approaching this technology",
        "https://buffer.com/resources/content/images/size/w1200/2023/01/possessed-photography-U3sOwViXhkY-unsplash--1-.jpg"),
    BlogClass(
        "The Moz Blog",
        "The industry's top wizards, doctors, and other experts offer their best advice, research, how-tos, and insights—all in the name of helping you level-up your SEO and online marketing skills. ",
        "https://moz.com/images/blog/banners/Moz_LBR-Survey_blog-header.png?w=1280&auto=compress%2Cformat&fit=crop&dm=1668568262&s=a294e2956d824a0cd1df58898754e59c"),
    BlogClass(
        "How our Support Team Contributes to Product Launches",
        "Launching a new feature is an exciting time at Buffer. It's the culmination of days, weeks and sometimes even months of the work that goes into building something new.r ",
        "https://buffer.com/resources/content/images/size/w1200/2023/01/nasa-dCgbRAQmTQA-unsplash.jpg"),
    BlogClass("THE BEHANCE BLOG ", "Updates, inspiration, and more from the Behance community ",
        "https://behance.directus.app/assets/aaaa1458-c9b5-4ae6-8918-8e9477a3fad1?format=webp&quality=90&width=1400"),
  ];

  @override
  Widget build(BuildContext context) {
    void addBlog(BlogClass blogClass) {
      setState(() {
        blog_list.add(blogClass);
      });
    }

    void showUserDialog() {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            content: AddBlog(addBlog),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Blog",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 24),
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: blog_list.length,
          itemBuilder: (context, index) {
            return Card(
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Image.network(
                              blog_list[index].imageUrl,
                              scale: 5,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  blog_list[index].title,
                                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                                ),
                                const Divider(),
                                Text(
                                  blog_list[index].description,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showUserDialog();
        },
        label: const Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }
}

class BlogClass {
  final String title;
  final String description;
  final String imageUrl;

  BlogClass(this.title, this.description, this.imageUrl);
}
