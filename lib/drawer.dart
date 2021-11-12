import 'package:day2_trip/home_page.dart';
import 'package:day2_trip/profile_screen.dart';
import 'package:flutter/material.dart';

class customDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Image(
                  height: 200,
                  width: double.infinity,
                  image: AssetImage('assets/images/one.jpg'),
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 20,
                  left: 10,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 3,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        child: ClipOval(
                          child: Image(
                              image: AssetImage(
                                'assets/images/user.jpg',
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        'Abdullah',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text("Home"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MyHomePage(),
                ),
              ),
            ),
            ListTile(
                leading: Icon(Icons.location_on),
                title: Text("Map"),
                onTap: () {}),
            ListTile(
                leading: Icon(Icons.chat), title: Text("Chat"), onTap: () {}),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("My Profile"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Profile(),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MyHomePage(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
