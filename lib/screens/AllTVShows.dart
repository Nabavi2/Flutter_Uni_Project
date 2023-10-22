import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_project/providers/PTVShows.dart';
import 'package:uni_project/widgets/CustomCard.dart';

class AllTVShows extends StatefulWidget {
  @override
  State<AllTVShows> createState() => _AllTVShowsState();
}

class _AllTVShowsState extends State<AllTVShows> {
  final int _nextPageThreshold = 5;
  int _page = 2;
  final int _totalPages = 6617;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PTVShows>(context);

    final ptvShowsList = provider.showList;

    var size = MediaQuery.of(context).size;

    return ListView.builder(
      itemCount: ptvShowsList.length + (_page != _totalPages ? 1 : 0),
      itemBuilder: (ctx, index) {
        if (_totalPages == 6617) {
          provider.getItems(_page);
          _page++;
        }

        return index < ptvShowsList.length
            ? CustomCard(
                id: ptvShowsList[index].id,
                title: ptvShowsList[index].name,
                image: ptvShowsList[index].posterPath,
                description: ptvShowsList[index].overview,
              )
            : Container(
                margin:
                    EdgeInsets.symmetric(vertical: size.width < 500 ? 18 : 30),
                width: size.width,
                height:
                    size.width < 500 ? size.height * 0.12 : size.height * 0.24,
                child: Center(
                    child: CircularProgressIndicator(
                        // color: Colors.white,
                        )),
              );
      },
    );
  }
}
