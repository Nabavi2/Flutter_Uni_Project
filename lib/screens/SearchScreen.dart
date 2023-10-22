import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_project/providers/PTVShows.dart';
import 'package:uni_project/widgets/CustomCard.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Widget customSearchBar = const Text('Start searching');

  TextEditingController _title = TextEditingController();
  bool _isLoading = false;

  Future<void> _saveform() async {
    String searchTitle = _title.text;
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<PTVShows>(context, listen: false)
          .searchByName(searchTitle)
          .then((value) {
        setState(() {
          _isLoading = false;
        });
        return value;
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final searchedList = Provider.of<PTVShows>(context).searchedTVShows;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff18162e),
        automaticallyImplyLeading: false,
        title: Row(
            mainAxisAlignment: size.width < 700
                ? MainAxisAlignment.center
                : MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.only(
                    left: size.width < 500 ? 10 : 15,
                    right: size.width < 500 ? 0 : 10),
                decoration: BoxDecoration(
                  color: Color(0xff848dad),
                  borderRadius: size.width < 500
                      ? BorderRadius.circular(7)
                      : BorderRadius.circular(25),
                ),
                width: size.width < 700 ? size.width * 0.91 : 400,
                child: TextField(
                  cursorColor: Color(0xffe4c94d),
                  controller: _title,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: size.width < 500 ? 35 : 25,
                      ),
                      onPressed: () => _saveform(),
                    ),
                    hintText: 'Type show name',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                    ),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ]),
      ),
      backgroundColor: Color(0xff18162e),
      body: _title.text.length > 0
          ? _isLoading
              ? Center(
                  child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ))
              : ListView.builder(
                  itemCount: searchedList.length,
                  itemBuilder: (ctx, index) {
                    return CustomCard(
                      id: searchedList[index].id,
                      title: searchedList[index].name,
                      image: searchedList[index].posterPath,
                      description: searchedList[index].overview,
                    );
                  },
                )
          : Center(
              child: Text('No Movie found'),
            ),
    );
  }
}
