import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageView extends StatefulWidget
{

  final String imageUrl;

  ImageView({@required this.imageUrl}) ;

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Hero(
        tag: widget.imageUrl,
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.height,
                child: Image.network(widget.imageUrl,fit: BoxFit.cover,)),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.height,
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[

                  GestureDetector(
                    onTap: ()
                      {
                       Navigator.pop(context);
                      },
                      child: Text("Cancel",style: TextStyle(color: Colors.white),)),
                  SizedBox(height: 16,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _save() async
  {
    if(Platform.isAndroid){
      await _askPermission();
    }
    await _askPermission();
    var response = await Dio().get(widget.imageUrl,
        options: Options(responseType: ResponseType.bytes));
    final result =
    await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
    Navigator.pop(context);
  }

  _askPermission() async
  {
    if (Platform.isIOS)
    {
      Map<PermissionGroup, PermissionStatus> permissions =
          await PermissionHandler()
          .requestPermissions([PermissionGroup.photos]);
    } else {
      PermissionStatus permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
    }
  }


}
