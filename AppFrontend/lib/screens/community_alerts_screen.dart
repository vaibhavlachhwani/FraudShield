import 'package:flutter/material.dart';
import 'package:testproject/screens/user_profile_screen.dart';
import 'package:testproject/widgets/footer_navigation.dart';

class CommunityAlertsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CommunityAlertsScreen(),
    );
  }
}

class CommunityAlertsScreen extends StatefulWidget {
  @override
  _CommunityAlertsScreenState createState() => _CommunityAlertsScreenState();
}

class _CommunityAlertsScreenState extends State<CommunityAlertsScreen> {
  bool pushNotifications = true;
  String areaCoverage = '5 miles';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Alerts'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white, // Overall background remains white
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.deepPurple[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.location_pin, color: Colors.deepPurple),
                    SizedBox(width: 8),
                    Text(
                      'Showing alerts for: New York Area',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple[900]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Recent Alerts',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
              SizedBox(height: 16),
              alertCard(
                context,
                'Bank Verification Scam',
                'Multiple reports in Brooklyn area',
                '2 hours ago',
                Colors.deepPurple[50]!,
                Colors.deepPurple,
              ),
              SizedBox(height: 12),
              alertCard(
                context,
                'Tech Support Scam',
                'Multiple reports in Manhattan',
                '5 hours ago',
                Colors.deepPurple[50]!,
                Colors.orange,
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle "Report New Scams"
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 12.0),
                    child: Text('Report New Scams',
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Alerts Settings',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Push Notifications',
                    style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                  ),
                  Switch(
                    value: pushNotifications,
                    activeColor: Colors.deepPurple,
                    onChanged: (value) {
                      setState(() {
                        pushNotifications = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Area Coverage',
                    style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                  ),
                  DropdownButton<String>(
                    value: areaCoverage,
                    items:
                        ['1 mile', '5 miles', '10 miles'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        areaCoverage = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: FooterNavigation(),
    );
  }

  Widget alertCard(BuildContext context, String title, String subtitle,
      String time, Color bgColor, Color iconColor) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.error, color: iconColor),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.deepPurple),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey[800]),
                ),
                SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
