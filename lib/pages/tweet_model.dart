class TweetModel {
  String? actionType;
  String? actionIcon;
  List<String>? actionUserNameList;
  String userImage;
  String userName;
  bool isOfficialAccount;
  String nickName;
  String tweetTime;
  String textContent;
  String? contentImage;
  int commentNumber = 0;
  int retweetNumber = 0;
  int likeNumber = 0;

  TweetModel({
    this.actionType,
    this.actionIcon,
    this.actionUserNameList,
    required this.userImage,
    required this.userName,
    this.isOfficialAccount=false,
    required this.nickName,
    required this.tweetTime,
    required this.textContent,
    this.contentImage,
    required this.commentNumber,
    required this.retweetNumber,
    required this.likeNumber,
  });
}