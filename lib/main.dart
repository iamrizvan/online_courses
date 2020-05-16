import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_courses/model/category.dart';
import './constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course App',
      theme: ThemeData(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SvgPicture.asset("assets/icons/menu.svg"),
              Image.asset("assets/images/user.png"),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Hey Alex,",
            style: kHeadingextStyle,
          ),
          Text(
            "Find courses of your interest!",
            style: kSubheadingextStyle,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xFFF5F5F7),
                borderRadius: BorderRadius.circular(30)),
            child: Row(
              children: <Widget>[
                SvgPicture.asset("assets/icons/search.svg"),
                SizedBox(
                  width: 16,
                ),
                Text(
                  "Search for anything",
                  style: TextStyle(fontSize: 18, color: Color(0xFFA0A5BD)),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Category", style: kTitleTextStyle),
              Text(
                "See All",
                style: kSubtitleTextSyule.copyWith(color: kBlueColor),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
              child: StaggeredGridView.countBuilder(
                  padding: EdgeInsets.all(0),
                  crossAxisCount: 2,
                  itemCount: categories.length,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(15),
                      height: index.isEven ? 200 : 240,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: AssetImage(categories[index].image),
                              fit: BoxFit.fill)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            categories[index].name,
                            style: kTitleTextStyle,
                          ),
                          Text(
                            '${categories[index].numOfCourse} Courses',
                            style:
                                TextStyle(color: kTextColor.withOpacity(0.5)),
                          )
                        ],
                      ),
                    );
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1)))
        ],
      ),
    ));
  }
}
