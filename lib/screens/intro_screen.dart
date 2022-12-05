import 'package:flutter/material.dart';
import 'package:weather_focus/network/post_client.dart';
import 'package:weather_focus/shared/bottom_nav_bar.dart';
import 'package:weather_focus/shared/menu_drawer.dart';

import '../models/post.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final List<Post> _posts = [];

  @override
  Widget build(BuildContext context) {
    final PostClient _postClient = PostClient();

    fetchPosts(_postClient);

    return Scaffold(
        appBar: AppBar(title: const Text('D Fitness')),
        drawer: const MenuDrawer(),
        bottomNavigationBar: const MenuBottomNavigation(),
        body: FutureBuilder(
          future: _postClient.fetchPosts(),
          builder: (context, AsyncSnapshot<List<Post>> snapshot) {
            if(snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data == null) {
                return const Center(child: Text('Something went wrong'));
              }

              return ListView.builder(
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {

                    return ListTile(
                      title: Text(snapshot.data![index].title ?? ""),
                      subtitle: Text(snapshot.data![index].body ?? ""),
                    );
                  });
            }

            return Container(
              padding: const EdgeInsets.all(20.0),
              child: const Center(
                child:  CircularProgressIndicator(),
              ),
            );
          },
      )
    );
  }

  void fetchPosts(PostClient postClient) async {
    List<Post> list = await postClient.fetchPosts();
    list.map((e) => {
      setState(() {
            _posts.add(e);
      })
    });
  }
}
