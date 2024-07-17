import 'package:flutter/material.dart';
import 'package:my_application/components/home%20components/ad_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height / 2);
    final double itemWidth = size.width / 1.1;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: [
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: (itemWidth / itemHeight),
                  controller: ScrollController(keepScrollOffset: false),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: const [
                    AdCard(title: "Ad"),
                    AdCard(title: "Member Score"),
                    AdCard(title: "Register"),
                    AdCard(title: "Power Unit Price"),
                    AdCard(title: "Oil Price"),
                    AdCard(title: "Ad"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



