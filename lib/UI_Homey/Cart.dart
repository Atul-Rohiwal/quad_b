import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quad_b/UI_Homey/Search.dart';
import 'dart:convert';

import 'Model_for_APi/Model_01.dart';

class TvShowList extends StatefulWidget {
  @override
  _TvShowListState createState() => _TvShowListState();
}

class _TvShowListState extends State<TvShowList> {
  late List<TvShow> tvShows;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));

    if (response.statusCode == 200) {
      final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(json.decode(response.body));
      setState(() {
        tvShows = data.map((item) => TvShow.fromJson(item)).toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: tvShows != null
          ? ListView.builder(
        itemCount: tvShows.length,
        itemBuilder: (context, index) {

          //you have to come here for details
          return TvShowCard(tvShow: tvShows[index]);
        },
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
class TvShowCard extends StatelessWidget {
  final TvShow tvShow;

  TvShowCard({required this.tvShow});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(tvShow.imageUrl),
        title: Text(tvShow.name,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
        subtitle: Text(tvShow.summary,style: TextStyle(color: Colors.grey),),
        onTap: () {
          // Navigate to the details screen when the card is tapped
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(tvShow: tvShow),
            ),
          );
        },
      ),
    );
  }
}




class DetailsScreen extends StatelessWidget {
  final TvShow tvShow;

  DetailsScreen({required this.tvShow});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
      title:  Text(tvShow.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(tvShow.imageUrl),
            SizedBox(height: 16),
            Text(
              'Summary:',
              style: TextStyle(color:Colors.red,fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(tvShow.summary,style: TextStyle(color:Colors.white),),
          ],
        ),
      ),
    );
  }
}
