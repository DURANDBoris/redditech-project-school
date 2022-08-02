class Sub {
  String subredditName;
  String selftext;
  String title;
  String author;
  int ups;
  String name;

  Sub({
    required this.subredditName,
    required this.selftext,
    required this.title,
    required this.author,
    required this.ups,
    required this.name,
  });

  factory Sub.fromJson(dynamic json) {
    return Sub(
      subredditName: json['data']['subreddit_name_prefixed'].replaceAll("&amp;", "&").replaceAll("&lt;", "<").replaceAll("&gt;", ">"),
      selftext: json['data']['selftext'].replaceAll("&amp;#x200B;", "").replaceAll("&amp;", "&").replaceAll("&lt;", "<").replaceAll("&gt;", ">"),
      title: json['data']['title'].replaceAll("&amp;", "&").replaceAll("&lt;", "<").replaceAll("&gt;", ">"),
      author: json['data']['author'].replaceAll("&amp;", "&").replaceAll("&lt;", "<").replaceAll("&gt;", ">"),
      ups: json['data']['ups'],
      name: json['data']['name'].replaceAll("&amp;", "&").replaceAll("&lt;", "<").replaceAll("&gt;", ">"),
    );
  }
}
