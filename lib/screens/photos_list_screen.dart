import 'package:flutter/material.dart';
import 'package:sophia/api/api_service.dart';
import 'package:sophia/cards/photos_lis_list_card.dart';
import 'package:sophia/custom_widgets/constants.dart';
import 'package:sophia/custom_widgets/custom_text.dart';
import 'package:sophia/models/photosList.dart';

class PhotosListScreen extends StatelessWidget {
  final String id;

  const PhotosListScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiService apiService = ApiService();
    print("id is $id");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: const CustomText(
          title: "SOPHIA PHOTOS LIST",
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<PhotosList>>(
        future: apiService.fetchPhotosList(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              print("imran ${snapshot.data}");
              final imagesList = snapshot.data ?? [];
              return ListView.builder(
                itemCount: imagesList.length,
                itemBuilder: (context, index) {
                  print('photo of 1"${imagesList[index].image}"');
                  return PhotosListCard(
                    image: imagesList[index].image,
                  );
                },
              );
            }
          } else {
            print(snapshot.connectionState);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
