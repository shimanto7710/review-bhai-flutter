import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reviewbahi/core/MyColor.dart';
import 'package:reviewbahi/ui/profile_screen/bloc/profile_bloc.dart';
import 'package:reviewbahi/ui/profile_screen/bloc/profile_state.dart';
import 'package:reviewbahi/ui/profile_screen/bloc/profile_state.dart';
import 'package:reviewbahi/ui/profile_screen/bloc/profile_state.dart';
import 'package:reviewbahi/ui/review_detail_screen/review_detail_screen.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profileScreen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileBloc _bloc;

  // view pager
  final _viewPagerController = new PageController();
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  final _kArrowColor = Colors.black.withOpacity(0.8);



  double _pagerIndex = 0.0;

  List<String> _imageList = [];
  bool isHelpful = false;
  bool isLike = false;

  int desLength = 150;

  @override
  void initState() {
    _bloc = ProfileBloc();

    _imageList.add("1");
    _imageList.add("2");
  }

  @override
  void dispose() {
    _bloc.close();
  }

  void _updatePosition(double position) {
    setState(() => _pagerIndex = position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: BlocProvider<ProfileBloc>(
          create: (_) => _bloc,
          // ignore: missing_return
          child: BlocConsumer<ProfileBloc, ProfileState>(
              listener: (BuildContext context, ProfileState state) {
            // ignore: missing_return
          },
              // ignore: missing_return
              builder: (BuildContext context, ProfileState state) {
            return SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: Image.asset(
                        'assets/imgs/james.jpg',
                        width: 80.0,
                        height: 80,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "James Rodriguez",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "The Best",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "250",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: CustomColors.primaryColor),
                              ),
                              Text(
                                "Reviews",
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xff707070)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 30,
                          width: .5,
                          color: CustomColors.fontLight,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "250",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: CustomColors.primaryColor),
                              ),
                              Text(
                                "Followers",
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xff707070)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 30,
                          width: .5,
                          color: CustomColors.fontLight,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "250",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: CustomColors.primaryColor),
                              ),
                              Text(
                                "Following",
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xff707070)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Spacer(),
                        MaterialButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          minWidth: 130,
                          child: Text(
                            "Edit Profile",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: CustomColors.primaryColor,
                        ),
                        SizedBox(width: 20,),
                        MaterialButton(
                          onPressed: () {},
                          minWidth: 130,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: CustomColors.fontLight),
                              borderRadius:
                              BorderRadius.circular(5.0)),
                          child: Text(
                            "Settings",
                          ),

                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      color: Colors.black12,
                      child: new ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: 10,
                        // ignore: missing_return
                        itemBuilder: (BuildContext context, int index) {
                          return listItem(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          })),
    );
  }

  Widget listItem(BuildContext context) {
    String des =
        "পাঠাও ফুডে আগামি ১ সপ্তাহ ব্যাপী চলবে ডাবল ডাবল কাচ্চির উৎসব। আগামিকাল থেকে পাচ্ছেন ২৫০ টাকার কাচ্চির প্যাকেজের সাথে আরও ২৫০ টাকার কাচ্চি ফ্রি। আর দেরী না করে পাঠাও - এ অর্ডার করুন সেরা স্বাদের কাচ্চির ২৫০ টাকার প্যাকেজ।";
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: _navigateToReviewDetailScreen,
      child: Container(
        margin: EdgeInsets.only(top: 5),
        color: Colors.white,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: Image.asset(
                        'assets/imgs/james.jpg',
                        width: 50.0,
                        height: 50,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Wrap(
                        children: [

                          Text("James Rodriguez",
                              style: TextStyle(
                                  fontSize: 18, color: CustomColors.fontDark)),
                          Text(" is reviewing",
                              style: TextStyle(
                                  fontSize: 18, color: CustomColors.fontLight)),
                          items(),
                          Text(" at",
                              style: TextStyle(
                                  fontSize: 18, color: CustomColors.fontDark)),
                          Text(" Sultan Dine",
                              style: TextStyle(
                                  fontSize: 18, color: CustomColors.fontDark)),
                          Container(
                            color: CustomColors.ratingBg,
                            child: Wrap(
                              children: [
                                Text(" 4.5",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: CustomColors.fontDark)),
                                Container(
                                  height: 10,
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.yellow[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              height: 20,
                              width: 110,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  gradient: new LinearGradient(
                                    end: const Alignment(0.0, -1),
                                    begin: const Alignment(0.0, 0.6),
                                    colors: <Color>[
                                      const Color(0xffFFAE7F),
                                      const Color(0xffFF97A1),
                                    ],
                                  ),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                              child: Text(
                                "Recommended",
                                style: TextStyle(color: Colors.white),
                              )),
                          Container(
                              height: 20,
                              width: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color(0xff6C63FF),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                              child: Text(
                                "Offer",
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Icon(
                      Icons.more_vert,
                      color: CustomColors.iconColorOnWhite,
                    ),
                    height: 20,
                    width: 20,
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  "Sultan's Dine-এ চলছে অফারের উৎসব। এই বসন্তে সংযোজন হল আরও একটি ধামাকা অফার।",
                  style: TextStyle(color: CustomColors.fontDark, fontSize: 15),
                )),
            Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                          text: (des.length > desLength)
                              ? des.substring(0, desLength)
                              : des,
                          style: TextStyle(
                              color: CustomColors.fontDark, fontSize: 15)),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _navigateToReviewDetailScreen();
                            print("on resend click");
                          },
                        text: (des.length > desLength) ? "...show more" : "",
                        style: TextStyle(
                            color: CustomColors.fontDark, fontSize: 15),
                      ),
                    ],
                  ),
                )),
            Container(
              margin: EdgeInsets.only(top: 8),
              height: 250,
              width: size.width,
              child: _imagePager(),
            ),
            // Container(width: size.width,height: 1,color: Colors.black12,),
            Container(
                margin: EdgeInsets.only(left: 10), child: _reactionWidget()),
          ],
        ),
      ),
    );
  }

  Widget _reactionWidget() {
    return Container(
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                isLike = !isLike;
              });
            },
            child: Icon(
              (isLike) ? Icons.favorite : Icons.favorite_border,
              color: CustomColors.primaryColor,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Text(
              ' 25',
              style: TextStyle(color: CustomColors.fontDark),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isHelpful = !isHelpful;
              });
            },
            child: Icon(
              (isHelpful) ? Icons.verified : Icons.verified_outlined,
              color: CustomColors.primaryColor,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 30),
            child: Text(
              ' 13',
              style: TextStyle(color: CustomColors.fontDark),
            ),
          ),
          Spacer(),
          Text(
            "26 Comment",
            style: TextStyle(
              color: CustomColors.fontDark,
              decoration: TextDecoration.underline,
            ),
          )
        ],
      ),
      margin: EdgeInsets.only(left: 15, top: 10, bottom: 10, right: 20),
    );
  }

  Widget _imagePager() {
    return Stack(
      children: [
        PageView.builder(
          physics: new AlwaysScrollableScrollPhysics(),
          controller: _viewPagerController,
          itemCount: _imageList.length,
          onPageChanged: (int pos) {
            _updatePosition(pos.ceilToDouble());
          },
          itemBuilder: (BuildContext context, int index) {
            return _imagePagerItem(context, index);
          },
        ),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: new Container(
            padding: const EdgeInsets.all(20.0),
            child: new Center(
                child: new DotsIndicator(
                  dotsCount: _imageList.length,
                  position: _pagerIndex,
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                )),
          ),
        ),
      ],
    );
  }

  Widget _imagePagerItem(BuildContext context, int index) {
    String item = _imageList[index];
    return Container(
      child: Center(
          child: Image.asset(
            "assets/imgs/$item.jpg",
            fit: BoxFit.cover,
            alignment: Alignment.center,
            width: double.maxFinite,
          )),
    );
  }

  Widget items() {
    List<int> text = [1, 2];
    return Wrap(
      children: [
        for (var i in text)
          Wrap(
            children: [
              Text(" Kacchi ",
                  style: TextStyle(fontSize: 18, color: CustomColors.fontDark)),
              Container(
                color: CustomColors.ratingBg,
                child: Wrap(
                  children: [
                    Text(" 4.5",
                        style: TextStyle(
                            fontSize: 18, color: CustomColors.fontDark)),
                    Container(
                      height: 10,
                      child: Icon(
                        Icons.star,
                        color: Colors.yellow[700],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
      ],
    );
  }

  _navigateToReviewDetailScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ReviewDetailScreen(),
        ));
  }
}
