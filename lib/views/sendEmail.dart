import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class SendEmail extends StatefulWidget {
  @override
  _SendEmailState createState() => _SendEmailState();
}

class _SendEmailState extends State<SendEmail> {
  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerSubject = TextEditingController();
  final controllerMessage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            buildTextField(title: 'Name', controller: controllerName),
            const SizedBox(height: 16),
            buildTextField(title: 'To', controller: controllerEmail),
            const SizedBox(height: 16),
            buildTextField(title: 'Subject', controller: controllerSubject),
            const SizedBox(height: 16),
            buildTextField(
              title: 'Message',
              controller: controllerMessage,
              maxLines: 8,
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
                child: Text('Send'),
                onPressed: () {
                  try {
                    sendEmail(
                      name: controllerName.text,
                      email: controllerEmail.text,
                      subject: controllerSubject.text,
                      message: controllerMessage.text,
                    );
                    Fluttertoast.showToast(
                        msg: 'Email Send Successfully',
                        gravity: ToastGravity.TOP);
                  } catch (e) {
                    Fluttertoast.showToast(
                        msg: e.message, gravity: ToastGravity.TOP);
                  }
                })
          ],
        ),
      ),
    );
  }

  Future sendEmail({
    String name,
    String email,
    String subject,
    String message,
  }) async {
    final serviceId = 'service_06gq8av';
    final templateId = 'template_yvbhn9j';
    final userId = 'user_mt8CH5bFTGJbwpWWipx59';
    final toEmail = 'rohitpandawork@gmail.com';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name': name,
          'user_email': email,
          'to_email': toEmail,
          'user_subject': subject,
          'user_message': message,
        },
      }),
    );
    print(response.body);
  }

  Widget buildTextField({
    String title,
    TextEditingController controller,
    int maxLines = 1,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ],
      );

  Future launchEmail({String toEmail, String subject, String message}) async {
    final url =
        'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(message)}';

    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
