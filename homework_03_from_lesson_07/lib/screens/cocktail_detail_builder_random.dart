import 'package:cocktail/core/src/repository/async_cocktail_repository.dart';
import 'package:flutter/material.dart';
import './cocktail_detail_page.dart';

class CocktailDetailBuilderRandom extends StatefulWidget {
  @override
  _CocktailDetailBuilderRandomState createState() =>
      _CocktailDetailBuilderRandomState();
}

class _CocktailDetailBuilderRandomState
    extends State<CocktailDetailBuilderRandom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Cocktail'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {});
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: AsyncCocktailRepository().getRandomCocktail(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
                child: Text(
              snapshot.error.toString(),
              style: TextStyle(color: Colors.red),
            ));
          }

          if (snapshot.hasData) {
            return CocktailDetailPage(snapshot.data);
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
