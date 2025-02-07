import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:testproject/widgets/footer_navigation.dart';

class AnalyticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics and Analytics'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Monthly Overview',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                color: Colors.deepPurple[50],
                height: 200,
                padding: EdgeInsets.all(2.0),
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 5),
                          FlSpot(1, 8),
                          FlSpot(2, 6),
                          FlSpot(3, 10),
                          FlSpot(4, 15),
                          FlSpot(5, 12),
                        ],
                        isCurved: true,
                        color: Colors.blue,
                        barWidth: 3,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnalyticsCard(title: 'Total Calls', value: '150'),
                  AnalyticsCard(title: 'Blocked Scams', value: '45'),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Risk Distribution',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                color: Colors.deepPurple[50],
                height: 150,
                child: BarChart(
                  BarChartData(
                    gridData: FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    titlesData: FlTitlesData(show: false),
                    barGroups: [
                      BarChartGroupData(x: 0, barRods: [
                        BarChartRodData(toY: 20, color: Colors.red)
                      ]),
                      BarChartGroupData(x: 1, barRods: [
                        BarChartRodData(toY: 15, color: Colors.orange)
                      ]),
                      BarChartGroupData(x: 2, barRods: [
                        BarChartRodData(toY: 10, color: Colors.green)
                      ]),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Logic for exporting PDF report
                  },
                  child: Text('Export Report'),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: FooterNavigation(),
    );
  }
}

class AnalyticsCard extends StatelessWidget {
  final String title;
  final String value;

  AnalyticsCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 5)
        ],
      ),
      child: Column(
        children: [
          Text(title, style: TextStyle(fontSize: 16, color: Colors.grey)),
          SizedBox(height: 5),
          Text(value,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
