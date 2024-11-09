import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;
  String clickWord = "Clicks";
  
  @override
  void initState() {
    super.initState();

    _loadInstalledApps();
  }

  List<AppInfo> _installedapps = [];

  Future<void> _loadInstalledApps() async {
    try {
      List<AppInfo> apps = await InstalledApps.getInstalledApps(
        false,
        false
      );

      List<String> preInstalledApps = [
        'com.google.android.youtube',
        'com.google.android.gm', // Gmail
        'com.google.android.apps.maps', // Google Maps
      ];

      var userApps = apps.map((app) async {

        bool? isSystem = await InstalledApps.isSystemApp(app.packageName);
        

        print(app.packageName);
        print(isSystem);
      });

      setState(() {
        _installedapps = apps;
      });
    } catch (e) {
      print("Error getting the apps: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter functions')
        ),
        body: Center(
          child: _installedapps.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
            itemCount: _installedapps.length,
            itemBuilder: (context, index) {
              AppInfo app = _installedapps[index];
              return ListTile(
                title: Text(app.name)
              );
            },
          )
        ));
  }
}
