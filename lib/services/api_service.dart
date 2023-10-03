import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/posts_model.dart';

class ApiServices {
  String postsAPI = "https://jsonplaceholder.typicode.com/posts";

  Future<List<PostsModel>> getPosts() async {
    var response = await http.get(Uri.parse(postsAPI));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      List<PostsModel> postModel =
          data.map((json) => PostsModel.fromJson(json)).toList();

      return postModel;
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<void> postData() async {
    PostsModel newPostMode = PostsModel(
      title: 'Flutter HTTP CRUD',
      body: 'This is a blog post about HTTP CRUD methods in Flutter',
      userId: 1,
    );

    var response =
        await http.post(Uri.parse(postsAPI), body: jsonEncode(newPostMode.toJson()));

    if (response.statusCode == 201) {
      debugPrint('Post added successfully.');
    } else {
      debugPrint("Failed to add product. Status Code: ${response.statusCode}");
    }
  }
  

}
