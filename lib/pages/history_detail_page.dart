import 'package:covidapp/models/history_confirm_model.dart';
import 'package:covidapp/providers/history_confirm_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HistoryDetailPage extends StatefulWidget {
  final String country;
  final String flag;
  HistoryDetailPage({Key? key, required this.country, required this.flag})
      : super(key: key);

  @override
  _HistoryDetailPageState createState() => _HistoryDetailPageState();
}

class _HistoryDetailPageState extends State<HistoryDetailPage> {
  @override
  Widget build(BuildContext context) {
    Future<Confirmed> getConfirmed(String country) {
      return Provider.of<ConfirmedProvider>(context).getConfirmed(country);
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('History Covid'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12),
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
                  Image.asset('icons/flags/png/${widget.flag}.png',
                      package: 'country_icons'),
                  SizedBox(
                    height: 8,
                  ),
                  Text(widget.country),
                ]),
              ),
              FutureBuilder<Confirmed>(
                  future: getConfirmed(widget.country),
                  builder: (BuildContext context,
                      AsyncSnapshot<Confirmed> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        if (snapshot.data != null) {
                          Confirmed? confirmed = snapshot.data;
                          // DateTime tempDate =
                          //     new DateFormat("yyyy/MM/dd hh:mm:ss").parse(covid.updated);
                          // String update =
                          //     DateFormat('d MMMM yyyy HH:mm').format(tempDate);
                          return Column(
                            children: confirmed!.dates.entries
                                .map((confirm) => confirmedCard(
                                    date: DateFormat('d MMM yyyy').format(
                                        new DateFormat("yyyy-MM-dd")
                                            .parse(confirm.key)),
                                    confirm: confirm.value.toString()))
                                .toList(),
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
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class confirmedCard extends StatelessWidget {
  final String date;
  final String confirm;
  const confirmedCard({Key? key, required this.date, required this.confirm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              date,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Icon(
              Icons.sick,
              color: Colors.lightBlue,
            ),
            Text(
              confirm,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
