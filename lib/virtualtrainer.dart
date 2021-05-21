import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:yogafit/services/camera.dart';
import 'dart:async';
import 'dart:io';



class virtualtrainer extends StatefulWidget {

  final CameraDescription camera;

  const virtualtrainer({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  _virtualtrainerState createState() => _virtualtrainerState();
}

class _virtualtrainerState extends State<virtualtrainer> {

  CameraController _controller;
  Future<void> _initializeControllerFuture;

  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.transparent,
         elevation: 0,
         leading: IconButton(
           icon: Icon(Icons.arrow_back_ios , color: Colors.white,),
         ),
       ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),

    );
  }
}
