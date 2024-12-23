import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../studentscreen/Profile/Hadith.dart'; // Import the Hadith.dart file

class PrayerTimesPage extends StatefulWidget {
  @override
  State<PrayerTimesPage> createState() => _PrayerTimesPageState();
}

class _PrayerTimesPageState extends State<PrayerTimesPage> {
  final Map<String, String> prayerTimes = {
    'Fajr': '05:39 AM',
    'Sunrise': '06:48 AM',
    'Dhuhr': '12:15 PM',
    'Asr': '03:18 PM',
    'Maghrib': '05:40 PM',
    'Isha': '06:49 PM',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prayer Times'),
        backgroundColor: Color(0xFF5A4A75), // Set the AppBar color to the custom purple
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back navigation
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today\'s Prayer Times (DEMO)',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5A4A75), // Use the custom color for headers
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFF3F3F3), // Lighter background for the prayer times
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                children: prayerTimes.entries.map((entry) {
                  return ListTile(
                    title: Text(entry.key, style: TextStyle(color: Color(0xFF5A4A75))), // Custom color for prayer names
                    trailing: Text(entry.value, style: TextStyle(color: Colors.black)), // Black color for times
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Random Hadith',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5A4A75), // Custom color for Hadith title
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: hadiths.length, // Use hadiths from Hadith.dart
                itemBuilder: (context, index) {
                  final hadithText = hadiths[index]['text'] ?? '';
                  final hadithReference = hadiths[index]['reference'] ?? '';

                  return GestureDetector(
                    onLongPress: () {
                      // Copy the text and reference to clipboard
                      final textToCopy = '$hadithText\nReference: $hadithReference';
                      Clipboard.setData(ClipboardData(text: textToCopy));
                      // Show a confirmation message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Hadith copied to clipboard!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xFF5A4A75), // Use the custom color for the hadith container
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hadithText,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            hadithReference,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
