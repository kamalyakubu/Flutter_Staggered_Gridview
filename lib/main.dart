import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:staggered_gridview_flutter/details_view.dart';

void main() => runApp(
      DevicePreview(
        builder: (context) => const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      useInheritedMediaQuery: true,
      title: 'Flutter StaggeredGridView',
      home: MyHomePage(
        imageList: '',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String imageList;

  const MyHomePage({
    Key? key,
    required this.imageList,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Create List of Images to display from the network
  List<String> imageList = [
    'https://images.unsplash.com/photo-1638454668466-e8dbd5462f20?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    'https://images.unsplash.com/photo-1633114128729-0a8dc13406b9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    'https://images.unsplash.com/photo-1638385583493-484240554d5e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    'https://images.unsplash.com/photo-1638330285473-c4a93373a8e0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    'https://images.unsplash.com/photo-1638425793674-32119fffb3d5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyM3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1638444395657-92fc4b8df17f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    'https://images.unsplash.com/photo-1638376851565-42db4491b05b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Wrap body with SafeArea to take care of notifications bar and bottom notch
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(12),
          //Call the Staggered Grid from the package
          child: StaggeredGridView.countBuilder(
              //Number of images to display in a row
              crossAxisCount: 2,
              //Horizontal spacing between images
              crossAxisSpacing: 8,
              //Vertical spacing between images
              mainAxisSpacing: 8,
              itemCount: imageList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // print('Image tapped: $index');
                    //Parse the image to Second Screen
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => DetailsPage(
                          imageList: imageList[index],
                        ),
                      ),
                    );
                    //Parse the image to Bottom Sheet
                    // showModalBottomSheet(
                    //     context: context,
                    //     builder: (context) => Container(
                    //           height: MediaQuery.of(context).size.height,
                    //           width: MediaQuery.of(context).size.width,
                    //           child: Image.network(
                    //             imageList[index],
                    //             fit: BoxFit.cover,
                    //           ),
                    //         ),
                    //         );
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: imageList[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
              staggeredTileBuilder: (index) {
                return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
              }),
        ),
      ),
    );
  }
}
