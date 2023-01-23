
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Icon customIcon = Icon(Icons.search);

  Widget customSearchBar = Text("Search Delegate");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: customSearchBar,
        actions: [
          IconButton(
            icon: customIcon,
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: DataSearch(
                      cities: citiesOfNepal, recentSearches: searchedCities));
            },
          ),
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: citiesOfNepal.length,
          itemBuilder: (context, index) => ListTile(
            leading: Icon(Icons.location_city),
            title: Text(citiesOfNepal[index]),
          ),
        ),
      ),
      // drawer: Drawer(),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final List<String> cities;
  final List<String> recentSearches;

  DataSearch({this.cities, this.recentSearches});

  String result;

  @override
  List<Widget> buildActions(BuildContext context) {
    //actions for app bar eg: cross icon
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on the left of the app bar eg:arrow icon
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, "null");
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    //Show some result based on the selection
    print("I am pressed");
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        child: Card(
          color: Colors.red,
          child: Center(
            child: Text(result),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //INFO: Show when someone searches for something
    final suggestionList = query.isEmpty
        ? recentSearches
        : cities
        .where((city) => city.toLowerCase().startsWith(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          result = suggestionList[index];
          showResults(context);
        },
        leading: Icon(Icons.location_city),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey),
                )
              ]),
        ),
      ),
    );
  }
}

final citiesOfNepal = [
  'Kathmandu',
  'Pokhara',
  'Lalitpur',
  'Bharatpur',
  'Biratnagar',
  'Birganj',
  'Hetauda',
  'Itahari',
  'Dharan',
  'Butwal',
  'Nepalgunj',
  'Janakpur'
];

final searchedCities = ['Hetauda', 'Itahari', 'Dharan'];