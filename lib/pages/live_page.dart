import 'package:covidapp/models/country_model.dart';
import 'package:covidapp/pages/live_detail_page.dart';
import 'package:covidapp/providers/country_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LivePage extends StatelessWidget {
  const LivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<Country>> getCountry() async {
      return Provider.of<CountryProvider>(context).getCountry();
    }

    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Center(
                child: Text(
              "Live Data Covid",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )),
            FutureBuilder<List<Country>>(
              future: getCountry(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Country>> snapshot) {
                // AsyncSnapshot<Your object type>
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return Column(
                      children: snapshot.data!
                          .map((country) =>
                              countryCard(context, country.flag, country.name))
                          .toList(),
                    );
                  } // snapshot.data  :- get your object which is pass from your downloadData() function
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Card countryCard(BuildContext context, String flag, String name) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.indigo[100],
      elevation: 5,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LiveDetailPage(
                        country: name,
                        icon: flag,
                      )));
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(children: [
            Image.asset('icons/flags/png/$flag.png', package: 'country_icons'),
            SizedBox(
              height: 8,
            ),
            Text(name),
          ]),
        ),
      ),
    );
  }
}
