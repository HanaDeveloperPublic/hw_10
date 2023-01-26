import 'package:flutter/material.dart';
import 'package:hw_10/pages/blog.dart';

class AddBlog extends StatefulWidget {
  final Function(BlogClass) addBlog;
  const AddBlog(this.addBlog, {super.key});
  @override
  State<AddBlog> createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  TextEditingController tasknameController = TextEditingController();
  TextEditingController taskDesController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 350,
      width: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Add Blog',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.blueGrey,
              ),
            ),
            buildTextField('Blog Name', tasknameController),
            buildTextField('Description', taskDesController),
            buildTextField('Image Url', imageUrlController),
            ElevatedButton(
              onPressed: () {
                final blog = BlogClass(tasknameController.text, taskDesController.text, imageUrlController.text);
                widget.addBlog(blog);
                Navigator.of(context).pop();
              },
              child: const Text('Add Blog'),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildTextField(String hint, TextEditingController controller) {
  return Container(
    margin: const EdgeInsets.all(4),
    child: TextField(
      decoration: InputDecoration(
        labelText: hint,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
      ),
      controller: controller,
    ),
  );
}
