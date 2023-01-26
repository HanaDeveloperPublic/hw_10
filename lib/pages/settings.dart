import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const SettingsPage(),
  );
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextStyle headingStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.red);

  bool lockAppSwitchVal = true;
  bool fingerprintSwitchVal = false;
  bool changePassSwitchVal = true;

  TextStyle headingStyleIOS = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: CupertinoColors.inactiveGray,
  );
  TextStyle descStyleIOS = const TextStyle(color: CupertinoColors.inactiveGray);

  @override
  Widget build(BuildContext context) {
    return (Platform.isAndroid)
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: Colors.white,
                secondary: Colors.white,
              ),
            ),
            home: Scaffold(
              appBar: AppBar(
                title: const Text("Settings UI"),
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Common",
                            style: headingStyle,
                          ),
                        ],
                      ),
                      const ListTile(
                        leading: Icon(Icons.language),
                        title: Text("Language"),
                        subtitle: Text("English"),
                      ),
                      const Divider(),
                      const ListTile(
                        leading: Icon(Icons.cloud),
                        title: Text("Environment"),
                        subtitle: Text("Production"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Account", style: headingStyle),
                        ],
                      ),
                      const ListTile(
                        leading: Icon(Icons.phone),
                        title: Text("Phone Number"),
                      ),
                      const Divider(),
                      const ListTile(
                        leading: Icon(Icons.mail),
                        title: Text("Email"),
                      ),
                      const Divider(),
                      const ListTile(
                        leading: Icon(Icons.exit_to_app),
                        title: Text("Sign Out"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Security", style: headingStyle),
                        ],
                      ),
                      ListTile(
                        leading: const Icon(Icons.phonelink_lock_outlined),
                        title: const Text("Lock app in background"),
                        trailing: Switch(
                            value: lockAppSwitchVal,
                            activeColor: Colors.redAccent,
                            onChanged: (val) {
                              setState(() {
                                lockAppSwitchVal = val;
                              });
                            }),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.fingerprint),
                        title: const Text("Use fingerprint"),
                        trailing: Switch(
                            value: fingerprintSwitchVal,
                            activeColor: Colors.redAccent,
                            onChanged: (val) {
                              setState(() {
                                fingerprintSwitchVal = val;
                              });
                            }),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.lock),
                        title: const Text("Change Password"),
                        trailing: Switch(
                            value: changePassSwitchVal,
                            activeColor: Colors.redAccent,
                            onChanged: (val) {
                              setState(() {
                                changePassSwitchVal = val;
                              });
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Misc", style: headingStyle),
                        ],
                      ),
                      const ListTile(
                        leading: Icon(Icons.file_open_outlined),
                        title: Text("Terms of Service"),
                      ),
                      const Divider(),
                      const ListTile(
                        leading: Icon(Icons.file_copy_outlined),
                        title: Text("Open Source and Licences"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : CupertinoApp(
            debugShowCheckedModeBanner: false,
            home: CupertinoPageScaffold(
              navigationBar: const CupertinoNavigationBar(
                backgroundColor: CupertinoColors.white,
                middle: Text("Settings "),
              ),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: CupertinoColors.extraLightBackgroundGray,
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: CupertinoColors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            )),
                        width: double.infinity,
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: 70,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(width: 12),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.star,
                                        color: Colors.brown,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 12),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: const [
                                            Text("Todoist Pro"),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: const [
                                          Text(
                                            "Until Jul 8 2020",
                                            style: TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  const SizedBox(width: 5),
                                  const Icon(
                                    CupertinoIcons.right_chevron,
                                    color: CupertinoColors.inactiveGray,
                                  ),
                                  const SizedBox(width: 8),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: CupertinoColors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              )),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                height: 38,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    SizedBox(width: 12),
                                    Icon(
                                      Icons.person,
                                      color: Colors.brown,
                                    ),
                                    SizedBox(width: 12),
                                    Text("Account"),
                                    Spacer(),
                                    SizedBox(width: 5),
                                    Icon(
                                      CupertinoIcons.right_chevron,
                                      color: CupertinoColors.inactiveGray,
                                    ),
                                    SizedBox(width: 8),
                                  ],
                                ),
                              ),
                              const Divider(),
                              Container(
                                width: double.infinity,
                                height: 38,
                                alignment: Alignment.center,
                                child: Row(
                                  children: const [
                                    SizedBox(width: 12),
                                    Icon(
                                      Icons.settings,
                                      color: Colors.brown,
                                    ),
                                    SizedBox(width: 12),
                                    Text("General"),
                                    Spacer(),
                                    SizedBox(width: 5),
                                    Icon(
                                      CupertinoIcons.right_chevron,
                                      color: CupertinoColors.inactiveGray,
                                    ),
                                    SizedBox(width: 8),
                                  ],
                                ),
                              ),
                              const Divider(),
                              Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                height: 38,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    SizedBox(width: 12),
                                    Icon(
                                      Icons.draw,
                                      color: Colors.brown,
                                    ),
                                    SizedBox(width: 12),
                                    Text("Theme"),
                                    Spacer(),
                                    Text("Todoist", style: TextStyle(color: Colors.grey)),
                                    SizedBox(width: 5),
                                    Icon(
                                      CupertinoIcons.right_chevron,
                                      color: CupertinoColors.inactiveGray,
                                    ),
                                    SizedBox(width: 8),
                                  ],
                                ),
                              ),
                              const Divider(),
                              Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                height: 38,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    SizedBox(width: 12),
                                    Icon(
                                      Icons.app_blocking,
                                      color: Colors.brown,
                                    ),
                                    SizedBox(width: 12),
                                    Text("App Icon"),
                                    Spacer(),
                                    Text("Todoist", style: TextStyle(color: Colors.grey)),
                                    SizedBox(width: 5),
                                    Icon(
                                      CupertinoIcons.right_chevron,
                                      color: CupertinoColors.inactiveGray,
                                    ),
                                    SizedBox(width: 8),
                                  ],
                                ),
                              ),
                              const Divider(),
                              Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                height: 38,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    SizedBox(width: 12),
                                    Icon(
                                      Icons.swipe_up_alt,
                                      color: Colors.brown,
                                    ),
                                    SizedBox(width: 12),
                                    Text("Productivity"),
                                    Spacer(),
                                    SizedBox(width: 5),
                                    Icon(
                                      CupertinoIcons.right_chevron,
                                      color: CupertinoColors.inactiveGray,
                                    ),
                                    SizedBox(width: 8),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                    //Account
                    const SizedBox(height: 14),

                    const SizedBox(height: 8),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: CupertinoColors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              )),
                          width: double.infinity,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                height: 38,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    SizedBox(width: 12),
                                    Icon(
                                      Icons.lock_clock,
                                      color: Colors.brown,
                                    ),
                                    SizedBox(width: 12),
                                    Text("Reminder "),
                                    Spacer(),
                                    Icon(
                                      CupertinoIcons.right_chevron,
                                      color: CupertinoColors.inactiveGray,
                                    ),
                                    SizedBox(width: 8),
                                  ],
                                ),
                              ),
                              const Divider(),
                              Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                height: 38,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    SizedBox(width: 12),
                                    Icon(
                                      Icons.notification_add,
                                      color: Colors.brown,
                                    ),
                                    SizedBox(width: 12),
                                    Text("Notification"),
                                    Spacer(),
                                    Icon(
                                      CupertinoIcons.right_chevron,
                                      color: CupertinoColors.inactiveGray,
                                    ),
                                    SizedBox(width: 8),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                    const SizedBox(height: 8),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: CupertinoColors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              )),
                          width: double.infinity,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                height: 38,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    SizedBox(width: 12),
                                    Icon(
                                      Icons.lock_clock,
                                      color: Colors.brown,
                                    ),
                                    SizedBox(width: 12),
                                    Text("Siri "),
                                    Spacer(),
                                    Icon(
                                      CupertinoIcons.right_chevron,
                                      color: CupertinoColors.inactiveGray,
                                    ),
                                    SizedBox(width: 8),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                    const SizedBox(height: 8),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: CupertinoColors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              )),
                          width: double.infinity,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                height: 38,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    SizedBox(width: 12),
                                    Icon(
                                      Icons.help,
                                      color: Colors.brown,
                                    ),
                                    SizedBox(width: 12),
                                    Text("Help & Feedback "),
                                    Spacer(),
                                    Icon(
                                      CupertinoIcons.right_chevron,
                                      color: CupertinoColors.inactiveGray,
                                    ),
                                    SizedBox(width: 8),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          );
  }
}
