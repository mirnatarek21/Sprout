import 'package:flutter/material.dart';

// Model class for a single setting
class Setting {
  final String title;
  bool value;

  Setting({required this.title, this.value = true});
}

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  // Separate common and other settings
  final List<Setting> _commonSettings = [
    Setting(title: 'General Notification'),
    Setting(title: 'Sound'),
    Setting(title: 'Sound Call'),
    Setting(title: 'Vibrate'),
  ];

  final List<Setting> _otherSettings = [
    Setting(title: 'New Updates'),
    Setting(title: 'New Service Available'),
    Setting(title: 'Discount Available'),
  ];

  String? _selectedMethod = 'email';

  // Toggle method to switch on/off a setting
  void _toggleSetting(Setting setting) {
    setState(() {
      setting.value = !setting.value;
    });
  }

  // Method to select notification method (email or in-app)
  void _selectMethod(String? method) {
    setState(() {
      _selectedMethod = method;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildHeader(),
            _buildSection('Common', _commonSettings),
            const Divider(height: 4, thickness: 1, color: Color(0xffCCCCCC)),
            _buildSection('Others', _otherSettings),
            const Divider(height: 4, thickness: 1, color: Color(0xffCCCCCC)),
            _buildReceiveOnSection(),
          ],
        ),
      ),
    );
  }

  // Header widget with back button and profile image
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            const Text(
              'Notification Settings',
              style: TextStyle(
                color: Color(0xff2D3142),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset("assets/images/prof_img.png", width: 42, height: 42, fit: BoxFit.cover),
        ),
      ],
    );
  }

  // Builds sections (Common or Others) and dynamically creates settings
  Widget _buildSection(String title, List<Setting> settings) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xff2D3142),
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        ...settings.map((setting) => _buildSettingRow(setting)).toList(),
      ],
    );
  }

  // Widget for each setting row with a toggle switch
  Widget _buildSettingRow(Setting setting) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          setting.title,
          style: const TextStyle(
            color: Color(0xff2D3142),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        Transform.scale(
          scale: 0.7,
          child: Switch(
            value: setting.value,
            onChanged: (val) => _toggleSetting(setting),
            activeTrackColor: const Color(0xff79B9A4),
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: const Color(0xff999999),
          ),
        ),
      ],
    );
  }

  // Widget for radio selection of notification method (email or in-app)
  Widget _buildReceiveOnSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Receive on',
          style: TextStyle(
            color: Color(0xff2D3142),
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        _buildRadioOption('Email'),
        _buildRadioOption('In-app Notification'),
      ],
    );
  }

  // Reusable widget for radio options
  Widget _buildRadioOption(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xff2D3142),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        Radio<String>(
          value: title.toLowerCase().replaceAll(' ', '_'),
          groupValue: _selectedMethod,
          onChanged: _selectMethod,
          activeColor: const Color(0xff79B9A4),
        ),
      ],
    );
  }
}
