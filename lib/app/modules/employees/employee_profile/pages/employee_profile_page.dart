import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../views/common_text_field_view.dart';
import '../controllers/employee_profile_controller.dart';

class EmployeeProfilePage extends GetView<EmployeeProfileController> {
  const EmployeeProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Employee',
                style: TextStyle(fontSize: 28, color: Color(0xFF140F29)),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Admin | Partner | SubPartners',
                style: TextStyle(fontSize: 16, color: Color(0xFF625E70)),
              ),
              const SizedBox(
                height: 8,
              ),
              Card(
                margin: EdgeInsets.zero,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('Employee Profile',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF140F29),
                          )),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          ClipOval(
                            child: Image.network(
                              'https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                              width: 50, // Set the desired width
                              height: 50, // Set the desired height
                              fit: BoxFit.cover, // Choose the fitting strategy
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Teena Datt'),
                              Text('Associate ',
                                  style: TextStyle(color: Color(0xFF93919D)))
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Form(
                          child: Column(
                        children: [
                          Wrap(
                            spacing: 24,
                            runSpacing: 24,
                            children: [
                              CommonTextFormField(
                                title: 'Employee name *',
                                initialValue: 'Vikash',
                                readOnly: true,
                              ),
                              CommonTextFormField(
                                title: 'Mobile *',
                                initialValue: '986746738',
                                readOnly: true,
                              ),
                              CommonTextFormField(
                                title: 'Email *',
                                initialValue: 'Vikash@1233',
                                readOnly: true,
                              ),
                              CommonTextFormField(
                                title: 'Business Type *',
                                initialValue: 'Firm',
                                readOnly: true,
                              ),
                              CommonTextFormField(
                                title: 'Date of Joining',
                                initialValue: '10/04/2022',
                                readOnly: true,
                              ),
                              CommonTextFormField(
                                title: 'Experience *',
                                initialValue: '10',
                                readOnly: true,
                              ),
                              CommonTextFormField(
                                title: 'Work location *',
                                initialValue: 'Gurgaon',
                                readOnly: true,
                              ),
                              CommonTextFormField(
                                title: 'Pin Code *',
                                initialValue: '102022',
                                readOnly: true,
                              ),
                              CommonTextFormField(
                                title: 'Latitude *',
                                initialValue: '102022.00',
                                readOnly: true,
                              ),
                              CommonTextFormField(
                                title: 'Longitude *',
                                initialValue: '102022.90',
                                readOnly: true,
                              ),
                            ],
                          ),
                        ],
                      )),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
