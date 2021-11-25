import 'package:covidapp/constant.dart';
import 'package:covidapp/models/covid_model.dart';
import 'package:covidapp/providers/covid_provider.dart';
import 'package:covidapp/widgets/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class LiveDetailPage extends StatefulWidget {
  final String country;
  final String icon;
  const LiveDetailPage({Key? key, required this.country, required this.icon})
      : super(key: key);

  @override
  State<LiveDetailPage> createState() => _LiveDetailPageState();
}

class _LiveDetailPageState extends State<LiveDetailPage> {
  @override
  Widget build(BuildContext context) {
    Future<Covid> getCovidData(String country) {
      return Provider.of<CovidProvider>(context).getCovid(country);
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Live Covid'),
      ),
      body: FutureBuilder<Covid>(
        future: getCovidData(widget.country),
        builder: (BuildContext context, AsyncSnapshot<Covid> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              if (snapshot.data != null) {
                Covid? covid = snapshot.data;
                String countr = covid!.country;
                int confirmed = covid.confirmed;
                int recovered = covid.recovered;
                int deaths = covid.deaths;
                // DateTime tempDate =
                //     new DateFormat("yyyy/MM/dd hh:mm:ss").parse(covid.updated);
                // String update =
                //     DateFormat('d MMMM yyyy HH:mm').format(tempDate);
                DateTime now = DateTime.now();
                String update = DateFormat('dd MMMM yyyy').format(now);

                return SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          padding: EdgeInsets.all(20),
                          child: Column(children: [
                            Image.asset('icons/flags/png/${widget.icon}.png',
                                package: 'country_icons'),
                            SizedBox(
                              height: 8,
                            ),
                            Text(countr),
                          ]),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Case Update\n",
                                          style: kTitleTextstyle,
                                        ),
                                        TextSpan(
                                          text: "Newest update ($update)",
                                          style: TextStyle(
                                            color: kTextLightColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 4),
                                      blurRadius: 30,
                                      color: kShadowColor,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Counter(
                                      color: kInfectedColor,
                                      number: confirmed,
                                      title: "Confirmed",
                                    ),
                                    Divider(),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Counter(
                                      color: kDeathColor,
                                      number: deaths,
                                      title: "Deaths",
                                    ),
                                    Divider(),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Counter(
                                      color: kRecovercolor,
                                      number: recovered,
                                      title: "Recovered",
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Spread of Virus",
                                    style: kTitleTextstyle,
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                padding: EdgeInsets.all(20),
                                height: 178,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 10),
                                      blurRadius: 30,
                                      color: kShadowColor,
                                    ),
                                  ],
                                ),
                                child: Image.asset(
                                  "assets/images/map.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Scaffold(
                  body: Center(
                    child: Text("Data not found"),
                  ),
                );
              }
            }
          }
        },
      ),
    );
  }
}
