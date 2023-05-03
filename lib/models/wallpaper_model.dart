class Wallpapers{

  String? title;


Wallpapers({this.title});

    factory Wallpapers.fromMap(dynamic json) {
    return Wallpapers(
      title: json["title"],
      
    );
  }
}