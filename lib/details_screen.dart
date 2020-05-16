import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_courses/constants.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFF5F4EF),
            image: DecorationImage(
                image: AssetImage("assets/images/ux_big.png"),
                alignment: Alignment.topRight),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10, top: 50, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            color: Colors.grey,
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                        SvgPicture.asset("assets/icons/more-vertical.svg")
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ClipPath(
                      clipper: BestSellerClipper(),
                      child: Container(
                        color: kBestSellerColor,
                        padding: EdgeInsets.only(
                            left: 10, top: 5, right: 20, bottom: 5),
                        child: Text(
                          "Best Seller".toUpperCase(),
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Design Thinking",
                      style: kHeadingextStyle,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: <Widget>[
                        SvgPicture.asset("assets/icons/person.svg"),
                        SizedBox(
                          width: 5,
                        ),
                        Text("18k"),
                        SizedBox(
                          width: 20,
                        ),
                        SvgPicture.asset("assets/icons/star.svg"),
                        SizedBox(
                          width: 5,
                        ),
                        Text("4.8"),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "\$50",
                          style: kHeadingextStyle.copyWith(fontSize: 32)),
                      TextSpan(
                          text: "\$80",
                          style: TextStyle(
                              color: kTextColor.withOpacity(0.5),
                              decoration: TextDecoration.lineThrough)),
                    ]))
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Course Content",
                                  style: kTitleTextStyle,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                CourseContent(
                                  number: "01",
                                  duration: 5.35,
                                  title: "Welcome to the course",
                                  isDone: true,
                                ),
                                CourseContent(
                                  number: "01",
                                  duration: 5.35,
                                  title: "Welcome to the course",
                                  isDone: true,
                                ),
                                CourseContent(
                                  number: "21",
                                  duration: 7.8,
                                  title: "Welcome to the course",
                                  isDone: true,
                                ),
                                CourseContent(
                                  number: "03",
                                  duration: 5.5,
                                  title: "Welcome to the course",
                                  isDone: false,
                                ),
                              ],
                            )),
                        Positioned(
                            right: 0,
                            left: 0,
                            bottom: 0,
                            child: Container(
                              padding: EdgeInsets.all(20),
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(40),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 4),
                                        blurRadius: 50,
                                        color: kTextColor.withOpacity(0.1))
                                  ]),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(14),
                                    height: 50,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFFFEDEE),
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    child: SvgPicture.asset(
                                        "assets/icons/shopping-bag.svg"),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                      child: Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        color: kBlueColor),
                                    child: Text("Buy Now",
                                        style: kSubtitleTextSyule.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ))
                                ],
                              ),
                            ))
                      ],
                    )),
              )),
            ],
          )),
    );
  }
}

class CourseContent extends StatelessWidget {
  final String number;
  final double duration;
  final String title;
  final bool isDone;

  const CourseContent(
      {Key key, this.number, this.duration, this.title, this.isDone = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 30),
        child: Row(
          children: <Widget>[
            Text(
              number,
              style: kHeadingextStyle.copyWith(
                  color: kTextColor.withOpacity(0.2), fontSize: 25),
            ),
            SizedBox(
              width: 20,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "$duration mins\n",
                  style: TextStyle(
                      color: kTextColor.withOpacity(0.5), fontSize: 16)),
              TextSpan(
                  text: title,
                  style: kSubheadingextStyle.copyWith(
                      fontWeight: FontWeight.w600, height: 1.2))
            ])),
            Spacer(),
            Container(
              margin: EdgeInsets.only(left: 20),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kGreenColor.withOpacity(isDone ? 1 : 0.5)),
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
            )
          ],
        ));
  }
}

class BestSellerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
