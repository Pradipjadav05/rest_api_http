import "package:flutter/material.dart";
import "package:rest_api_http/services/api_service.dart";

import "model/posts_model.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Rest api using http",
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<PostsModel>> getData() async {
    return ApiServices().getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rest Api using http"),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.hasError}");
          }
          final List<PostsModel>? postModels = snapshot.data;
          return ListView.builder(
            itemBuilder: (context, index) {
              PostsModel postModel = postModels![index];
              return Card(
                child: ListTile(
                  title: Text("${postModel.title}"),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete),
                  ),
                  onTap: (){
                    ApiServices().putData();
                  },
                ),
              );
            },
            itemCount: 10,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ApiServices().postData();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
