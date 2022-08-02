

class Info {
  String name;
  String imgSrc;
  int subscribers;
  String description;
  Info({required this.name, required this.imgSrc, required this.subscribers, required this.description});

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
        name: json['subreddit']['display_name_prefixed'].replaceAll("&amp;", "&").replaceAll("&lt;", "<").replaceAll("&gt;", ">"),
        imgSrc: json['subreddit']['icon_img'].replaceAll("&amp;", "&").replaceAll("&lt;", "<").replaceAll("&gt;", ">"),
        subscribers: json['subreddit']['subscribers'],
        description: json['subreddit']['public_description'].replaceAll("&amp;#x200B;", "").replaceAll("&amp;", "&").replaceAll("&lt;", "<").replaceAll("&gt;", ">"));
  }
}
