import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_project/providers/PTVShows.dart';
import 'package:uni_project/providers/PTVShowsJson.dart';
import 'package:uni_project/widgets/CustomCard.dart';

class FavoriteTVShows extends StatefulWidget {
  @override
  State<FavoriteTVShows> createState() => _FavoriteTVShowsState();
}

class _FavoriteTVShowsState extends State<FavoriteTVShows> {
  @override
  Widget build(BuildContext context) {
    List<Results> favorites = Provider.of<PTVShows>(context).favorites;
    final size = MediaQuery.of(context).size;
    return Container(
      child: favorites.isEmpty
          ? Center(
              child: Text(
              "No favorite is added yet, try adding some!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width < 500 ? 16 : 20,
                  fontWeight: FontWeight.bold),
            ))
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (ctx, index) {
                return CustomCard(
                  id: favorites[index].id,
                  title: favorites[index].name,
                  image: favorites[index].posterPath,
                  description: favorites[index].overview,
                );
              },
            ),
    );
  }
}
