import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sophia/api/api_service.dart';
import 'package:sophia/cards/photos_card.dart';
import 'package:sophia/custom_widgets/constants.dart';
import 'package:sophia/custom_widgets/custom_text.dart';
import 'package:sophia/models/photos.dart';
import 'package:sophia/screens/photos_list_screen.dart';

class PhotosScreen extends StatelessWidget {
  const PhotosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiService apiServices = ApiService();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: const CustomText(
          title: "SOPHIA PHOTOS GALLERY",
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<SophiaPhoto>>(
        future: apiServices.fetchPhotos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              print(snapshot.data);
              final sophiaPhotos = snapshot.data ?? [];
              print("sophiaPhotos data is ${sophiaPhotos.length}");
              return AlignedGridView.count(
                itemCount: sophiaPhotos.length,
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PhotosListScreen(id: sophiaPhotos[index].id),
                        ),
                      );
                    },
                    child: PhotosCard(
                      image: sophiaPhotos[index].image,
                      title: sophiaPhotos[index].title,
                    ),
                  );
                },
              );
            }
          } else {
            print(snapshot.connectionState);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
