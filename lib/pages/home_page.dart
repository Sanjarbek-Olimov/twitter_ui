import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter_ui/pages/tweet_model.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TweetModel> posts = [
    TweetModel(
        userImage: "assets/images/Martha.png",
        userName: "Martha Craig",
        nickName: "@craig_love",
        tweetTime: "12h",
        textContent:
            "UXR/UX: You can only bring one item to a remote island to assist your research of native use of tools and usability. What do you bring? #TellMeAboutYou",
        commentNumber: 28,
        retweetNumber: 5,
        likeNumber: 21,
        actionType: " liked",
        actionIcon: "assets/icons/heart.svg",
        actionUserNameList: ["Kieron Dotson", "Zack John"]),
    TweetModel(
        userImage: "assets/images/Joshua.png",
        userName: "Joshua Lawrence",
        nickName: "@l_joshua",
        tweetTime: "3h",
        textContent: "Y'all ready for this next post?",
        commentNumber: 46,
        retweetNumber: 18,
        likeNumber: 363,
        actionType: " liked",
        actionIcon: "assets/icons/heart.svg",
        actionUserNameList: ["Zack John"]),
    TweetModel(
        userImage: "assets/images/Martin.png",
        userName: "Martin Randolph",
        isOfficialAccount: true,
        nickName: "@martin_randolph",
        tweetTime: "14h",
        textContent: "Kobe's passing is really sticking w/me in a way I didn't expect.\n\nHe was an icon, the kind of person who wouldn't die this way. My wife compared it to Princess Di's accident.\n\nBut the end can happen for anyone at any time, & I can't help but think of anything else lately.",
        commentNumber: 7,
        retweetNumber: 1,
        likeNumber: 11,
        actionType: " Retweeted",
        actionIcon: "assets/icons/comment.svg",
        actionUserNameList: ["Kieron Dotson"]),
    TweetModel(
        userImage: "assets/images/Andrew.png",
        userName: "Andrew Parker",
        nickName: "@andrew_parker",
        tweetTime: "10h",
        textContent: "The Blues are back this weekend 🙌",
        contentImage: "assets/images/Tuchel.jpg",
        commentNumber: 7,
        retweetNumber: 1,
        likeNumber: 11,
        actionType: " Retweeted",
        actionIcon: "assets/icons/comment.svg",
        actionUserNameList: ["Kieron Dotson"]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Badge(
          padding: const EdgeInsets.all(1.5),
          position: const BadgePosition(top: 10, end: 6),
          elevation: 0,
          badgeColor: Colors.white,
          badgeContent: const CircleAvatar(
            radius: 4,
            backgroundColor: Colors.blue,
          ),
          child: const CircleAvatar(
            backgroundImage: AssetImage("assets/images/Profile.png"),
          ),
        ),
        title: Image.asset(
          "assets/images/logo.png",
          height: 50,
        ),
        centerTitle: true,
        actions: [
          SvgPicture.asset("assets/icons/action.svg"),
          const SizedBox(width: 21)
        ],
      ),
      body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index){
        return postTweet(index);
      }),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.transparent,
        items: [
          BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/home.svg"), title: Container()),
          BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/search.svg"), title: Container()),
          BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/bell.svg"), title: Container()),
          BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/mail.svg"), title: Container()),
        ],

      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}, child: SvgPicture.asset("assets/icons/add.svg"),

      ),
    );
  }

  Widget postTweet(int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.shade400))),
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // #profile_image
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 3),
              SvgPicture.asset(posts[index].actionIcon!),
              const SizedBox(
                height: 6.8,
              ),
              CircleAvatar(
                radius: 27.5,
                backgroundImage: AssetImage(posts[index].userImage),
              )
            ],
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // #reactions
              Text(
                posts[index].actionUserNameList!.length > 1
                    ? posts[index].actionUserNameList!.last +
                        " and " +
                        posts[index].actionUserNameList![
                            posts[index].actionUserNameList!.length - 2] +
                        posts[index].actionType!
                    : posts[index].actionUserNameList!.first +
                        posts[index].actionType!,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff687684)),
              ),

              // #user_name_time_post
              SizedBox(
                width: MediaQuery.of(context).size.width - 103,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 114,
                      child: Row(
                        children: [
                          Flexible(
                            flex: 9,
                            child: Text(
                              posts[index].userName,
                              maxLines: 1,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Colors.black),
                              overflow: TextOverflow.fade,
                              softWrap: false,
                            ),
                          ),
                          posts[index].isOfficialAccount?Flexible(
                              flex: 1,
                              child: SvgPicture.asset("assets/icons/tick.svg")):const SizedBox.shrink(),
                          Flexible(
                            flex: 8,
                            child: Text(
                              " " + posts[index].nickName,
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              softWrap: false,
                              style: const TextStyle(
                                  color: Color(0xff687684), fontSize: 16),
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Text(
                              " " +
                                  String.fromCharCode(0x00B7) +
                                  " " +
                                  posts[index].tweetTime,
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              softWrap: false,
                              style: const TextStyle(
                                  color: Color(0xff687684), fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset("assets/icons/down.svg")
                  ],
                ),
              ),

              // #contentPost
              Container(
                  padding: const EdgeInsets.only(bottom: 5),
                  width: MediaQuery.of(context).size.width - 103,
                  child: _convertHashtag(posts[index].textContent)),

              // #contentImage
              posts[index].contentImage != null
                  ? ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                      width: MediaQuery.of(context).size.width-105,
                      image: AssetImage(posts[index].contentImage!)))
                  : const SizedBox.shrink(),
              const SizedBox(
                height: 10,
              ),

              // #reactions_icons
              SizedBox(
                width: MediaQuery.of(context).size.width - 103,
                child: Row(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/comment.svg"),
                        Text(
                          " " + posts[index].commentNumber.toString(),
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff687684)),
                        )
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    )),
                    const SizedBox(width: 15,),
                    Expanded(
                        child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/retweet.svg"),
                        Text(
                          " " + posts[index].retweetNumber.toString(),
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff687684)),
                        )
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    )),
                    const SizedBox(width: 15,),
                    Expanded(
                        child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/like.svg"),
                        Text(
                          " " + posts[index].likeNumber.toString(),
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff687684)),
                        )
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    )),
                    const SizedBox(width: 15,),
                    Expanded(
                        child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/share.svg"),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    )),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  RichText _convertHashtag(String text) {
    List<String> split = text.split(" ");
    return RichText(
        text: TextSpan(
            style: const TextStyle(color: Colors.black, fontSize: 16),
            children: List.generate(split.length, (index) {
              return split.elementAt(index).startsWith("#") || split.elementAt(index).startsWith("@")
                  ? TextSpan(
                      text: split.elementAt(index) + " ",
                      style: const TextStyle(color: Colors.lightBlueAccent),
                    )
                  : TextSpan(text: split.elementAt(index) + " ");
            })));
  }
}
