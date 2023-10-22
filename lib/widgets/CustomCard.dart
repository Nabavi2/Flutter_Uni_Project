import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_project/providers/PTVShows.dart';
import 'package:uni_project/providers/PTVShowsJson.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({
    Key? key,
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  }) : super(key: key);
  final int id;
  final String image;
  final String title;
  final String description;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PTVShows>(context);
    List<Results> favorites = provider.favorites;
    bool isFavorite = favorites.any((element) => element.id == widget.id);
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.width < 500 ? 18 : 30),
      width: size.width,
      height: size.width < 500 ? size.height * 0.24 : size.height * 0.42,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Card(
            margin: EdgeInsets.only(
                right: size.width < 500 ? 15 : 35,
                left: size.width < 500 ? 15 : 35,
                top: size.width < 500 ? 15 : 35),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
            color: Color(0xff28304a),
            child: Container(
              width: size.width,
              height:
                  size.width < 500 ? size.height * 0.23 : size.height * 0.30,
              child: ListTile(
                title: Container(
                  margin: EdgeInsets.only(
                      left: size.width < 500
                          ? size.width * 0.28
                          : size.width * 0.18,
                      top: 10),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width < 500 ? 16 : 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle: Row(
                  children: [
                    Container(
                      width: size.width * 0.52,
                      height: size.width < 500
                          ? size.height * 0.125
                          : size.height * 0.18,
                      margin: EdgeInsets.only(
                        left: size.width < 500
                            ? size.width * 0.28
                            : size.width * 0.18,
                        right: size.width < 500 ? 10 : 0,
                        top: 5,
                        bottom: 10,
                      ),
                      child: Text(
                        widget.description,
                        maxLines: 6,
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: size.width < 500 ? 12 : 20,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            width: size.width < 500 ? size.width * 0.27 : size.width * 0.16,
            height: size.width < 500 ? size.height * 0.27 : size.height * 0.38,
            top: size.width < 500 ? -45 : 0,
            left: size.width < 500 ? 22 : size.width * 0.04,
            child: Image.network(
                "https://image.tmdb.org/t/p/w500${widget.image}",
                fit: BoxFit.cover),
          ),
          Positioned(
            right: size.width < 500 ? 20 : 60,
            bottom: size.width < 500 ? 3 : 20,
            child: IconButton(
              splashRadius: 1,
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                color: Color(0xffe4c94d),
                size: 30,
              ),
              onPressed: () => setState(() => {
                    if (isFavorite)
                      {
                        provider.removeFromFavorites(favorites
                            .firstWhere((element) => element.id == widget.id))
                      }
                    else
                      {
                        if (provider.showList
                            .any((element) => element.id == widget.id))
                          {
                            provider.addToFavorites(provider.showList
                                .firstWhere(
                                    (element) => element.id == widget.id))
                          }
                        else
                          {
                            provider.addToFavorites(provider.searchedTVShows
                                .firstWhere(
                                    (element) => element.id == widget.id))
                          }
                      }
                  }),
            ),
          )
        ],
      ),
    );
  }
}
