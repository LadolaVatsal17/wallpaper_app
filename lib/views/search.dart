import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/data/data.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/widget/widget.dart';
import 'package:http/http.dart' as http;
class Search extends StatefulWidget
{
  final String searchQuery;
  Search({this.searchQuery});



  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search>
{
  TextEditingController serachController =new TextEditingController();
  List<WallpaperModel> wallpapers = new List();

  getSearchWallpapers(String query) async
  {
    var response = await http.get("https://api.pexels.com/v1/search?query=$query&per_page=30&page=1",
        headers: {
          "Authorization": apiKey});

    // print(response.body.toString());

    Map<String,dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element)
    {
      //print(element);
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.forMap(element);
      wallpapers.add(wallpaperModel);
    });

    setState(() {});

  }



  @override
  void initState()
  {
    getSearchWallpapers(widget.searchQuery);
    super.initState();
    serachController.text = widget.searchQuery;
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Color(0xfff5f8fd),
                    borderRadius: BorderRadius.circular(30)
                ),
                padding: EdgeInsets.symmetric(horizontal: 25),
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: Row(children:<Widget>[
                  Expanded(
                    child:TextField(
                      controller: serachController,
                      decoration: InputDecoration(
                          hintText: "Search wallpaper",
                          border: InputBorder.none
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      getSearchWallpapers(serachController.text);
                    },
                    child: Container(child: Icon(Icons.search)),
                  )
                ],
                ),
              ),
              SizedBox(height: 16,),
              wallpaperList(wallpapers: wallpapers,context: context)
            ],
          ),
        ),
      ),
    );
  }
}
