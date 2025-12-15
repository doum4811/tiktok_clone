import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          stretch: true,
          pinned: true,
          snap: true,
          floating: true,
          backgroundColor: Colors.teal,
          // title: Text("Hello!"),
          collapsedHeight: 80,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: [
              StretchMode.blurBackground,
              // StretchMode.fadeTitle,
              StretchMode.zoomBackground,
            ],
            background: Image.asset(
              "assets/images/IMG_3363.PNG",
              fit: BoxFit.cover,
            ),
            title: Text("Hello!"),
          ),
        ),
        SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate(
            childCount: 50,
            (context, index) => Container(
              color: Colors.amber[100 * (index % 9)],
              child: Align(
                alignment: Alignment.center,
                child: Text("Item $index"),
              ),
            ),
          ),
          itemExtent: 100,
        ),
      ],
    );
  }
}
