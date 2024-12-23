import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';
import '../providers/settings.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool value,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      subtitle: Text(
        description,
      ),
      onChanged: (bool newValue) {
        updateValue(
            newValue); // Ensure the callback matches the expected signature
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your app settings',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Consumer<Settings>(
            builder: (ctx, settings, child) => Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                    'Selecting Page Points',
                    'Let me select and correct the points defining the region-of-interest of the image',
                    settings.allowSelectPoints == true,
                    (newValue) {
                      settings.toggleAllowSelectPoints();
                    },
                  ),
                  _buildSwitchListTile(
                    'Dark Theme',
                    'Change the application theme',
                    settings.darkTheme == true,
                    (newValue) {
                      settings.toggleDarkTheme();
                    },
                  ),
                  FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Change font size:'),
                          Slider(
                            value: settings.fontSizeFactor ?? 0,
                            min: 1,
                            max: 1.4,
                            divisions: 5,
                            label: null,
                            activeColor: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(0.8),
                            onChanged: (value) {
                              settings.setFontSize(value);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
