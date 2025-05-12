import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctors_appointment/widgets/web_view.dart';

void showPathologyBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: const Color(0xFFedf9fc),
    builder: (_) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.local_hospital, color: Color(0xFF005792)),
            title: const Text("Dr. Lal PathLabs"),
            onTap: () => _launchURL(
                context, "https://www.lalpathlabs.com", "Dr. Lal PathLabs"),
          ),
          Divider(height: 1.h, color: Colors.black12),
          ListTile(
            leading: const Icon(Icons.local_hospital, color: Color(0xFF005792)),
            title: const Text("Max lab"),
            onTap: () => _launchURL(context,
                "https://www.maxlab.co.in/full-body-health-checkup", "Max Lab"),
          ),
          Divider(height: 1.h, color: Colors.black12),
          ListTile(
            leading: const Icon(Icons.local_hospital, color: Color(0xFF005792)),
            title: const Text("Metropolis Healthcare"),
            onTap: () => _launchURL(context, "https://www.metropolisindia.com",
                "Metropolis Healthcare"),
          ),
          Divider(height: 1.h, color: Colors.black12),
          ListTile(
            leading: const Icon(Icons.local_hospital, color: Color(0xFF005792)),
            title: const Text("Apollo 24/7"),
            onTap: () => _launchURL(
                context, "https://www.apollo247.com/lab-tests", "Apollo 24/7"),
          ),
        ],
      );
    },
  );
}

void _launchURL(BuildContext context, String url, String title) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => WebViewScreen(url: url, title: title),
    ),
  );
}
