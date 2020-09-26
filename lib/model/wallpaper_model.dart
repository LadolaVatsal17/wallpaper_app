class WallpaperModel
{
  String photographer;
  String photographer_url;
  int photographer_id;
  SrcModel src;

  WallpaperModel({this.photographer,this.photographer_id,this.photographer_url,this.src});


  factory WallpaperModel.forMap(Map<String,dynamic> jsonData){
    return WallpaperModel(
      src: SrcModel.forMap(jsonData["src"]),
      photographer_url: jsonData["photographer_url"],
      photographer_id: jsonData["photographer_id"],
      photographer: jsonData["photographer"]
    );
  }
}

class SrcModel
{
  String original;
  String small;
  String portrait;

  SrcModel({this.portrait,this.original,this.small});

  factory SrcModel.forMap(Map<String,dynamic> jsonData){
    return SrcModel(
      original: jsonData["original"],
      small: jsonData["small"],
      portrait: jsonData["portrait"]
    );
  }



}