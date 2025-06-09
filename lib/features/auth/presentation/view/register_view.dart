import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:student_management/features/batch/domain/entity/batch_entity.dart';
import 'package:student_management/features/course/domain/entity/course_entity.dart';

// class RegisterView extends StatelessWidget {
//   RegisterView({super.key});

//   final _gap = const SizedBox(height: 8);
//   final _key = GlobalKey<FormState>();
//   final _fnameController = TextEditingController(text: 'kiran');
//   final _lnameController = TextEditingController(text: 'rana');
//   final _phoneController = TextEditingController(text: '123456789');
//   final _usernameController = TextEditingController(text: 'kiran');
//   final _passwordController = TextEditingController(text: 'kiran123');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(8),
//             child: Form(
//               key: _key,
//               child: Column(
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       showModalBottomSheet(
//                         backgroundColor: Colors.grey[300],
//                         context: context,
//                         isScrollControlled: true,
//                         shape: const RoundedRectangleBorder(
//                           borderRadius: BorderRadius.vertical(
//                             top: Radius.circular(20),
//                           ),
//                         ),
//                         builder: (context) => Padding(
//                           padding: const EdgeInsets.all(20),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               ElevatedButton.icon(
//                                 onPressed: () {},
//                                 icon: const Icon(Icons.camera),
//                                 label: const Text('Camera'),
//                               ),
//                               ElevatedButton.icon(
//                                 onPressed: () {},
//                                 icon: const Icon(Icons.image),
//                                 label: const Text('Gallery'),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                     child: SizedBox(
//                       height: 200,
//                       width: 200,
//                       child: CircleAvatar(
//                         radius: 50,
//                         // backgroundImage: _img != null
//                         //     ? FileImage(_img!)
//                         //     : const AssetImage('assets/images/profile.png')
//                         //         as ImageProvider,
//                         backgroundImage:
//                             const AssetImage('assets/images/profile.png')
//                                 as ImageProvider,
//                       ),
//                     ),
//                   ),
//                   _gap,
//                   TextFormField(
//                     controller: _fnameController,
//                     decoration: const InputDecoration(labelText: 'First Name'),
//                     validator: ((value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter first name';
//                       }
//                       return null;
//                     }),
//                   ),
//                   _gap,
//                   TextFormField(
//                     controller: _lnameController,
//                     decoration: const InputDecoration(labelText: 'Last Name'),
//                     validator: ((value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter last name';
//                       }
//                       return null;
//                     }),
//                   ),
//                   _gap,
//                   TextFormField(
//                     controller: _phoneController,
//                     decoration: const InputDecoration(labelText: 'Phone No'),
//                     validator: ((value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter phoneNo';
//                       }
//                       return null;
//                     }),
//                   ),
//                   // _gap,
//                   // BlocBuilder<BatchBloc, BatchState>(builder: (context, state) {
//                   //   return DropdownButtonFormField<BatchEntity>(
//                   //     items: state.batches
//                   //         .map((e) => DropdownMenuItem<BatchEntity>(
//                   //               value: e,
//                   //               child: Text(e.batchName),
//                   //             ))
//                   //         .toList(),
//                   //     onChanged: (value) {
//                   //       _dropDownValue = value;
//                   //     },
//                   //     value: _dropDownValue,
//                   //     decoration: const InputDecoration(
//                   //       labelText: 'Select Batch',
//                   //     ),
//                   //     validator: ((value) {
//                   //       if (value == null) {
//                   //         return 'Please select batch';
//                   //       }
//                   //       return null;
//                   //     }),
//                   //   );
//                   // }),
//                   _gap,
//                   // BlocBuilder<CourseBloc, CourseState>(
//                   //     builder: (context, courseState) {
//                   //   if (courseState.isLoading) {
//                   //     return const CircularProgressIndicator();
//                   //   } else {
//                   //     return MultiSelectDialogField(
//                   //       title: const Text('Select course'),
//                   //       items: courseState.courses
//                   //           .map(
//                   //             (course) => MultiSelectItem(
//                   //               course,
//                   //               course.courseName,
//                   //             ),
//                   //           )
//                   //           .toList(),
//                   //       listType: MultiSelectListType.CHIP,
//                   //       buttonText: const Text(
//                   //         'Select course',
//                   //         style: TextStyle(color: Colors.black),
//                   //       ),
//                   //       buttonIcon: const Icon(Icons.search),
//                   //       onConfirm: (values) {
//                   //         _lstCourseSelected.clear();
//                   //         _lstCourseSelected.addAll(values);
//                   //       },
//                   //       decoration: BoxDecoration(
//                   //         border: Border.all(
//                   //           color: Colors.black87,
//                   //         ),
//                   //         borderRadius: BorderRadius.circular(5),
//                   //       ),
//                   //       validator: ((value) {
//                   //         if (value == null || value.isEmpty) {
//                   //           return 'Please select courses';
//                   //         }
//                   //         return null;
//                   //       }),
//                   //     );
//                   //   }
//                   // }),
//                   _gap,
//                   TextFormField(
//                     controller: _usernameController,
//                     decoration: const InputDecoration(labelText: 'Username'),
//                     validator: ((value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter username';
//                       }
//                       return null;
//                     }),
//                   ),
//                   _gap,
//                   TextFormField(
//                     controller: _passwordController,
//                     obscureText: true,
//                     decoration: InputDecoration(labelText: 'Password'),
//                     validator: ((value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter password';
//                       }
//                       return null;
//                     }),
//                   ),
//                   _gap,
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         if (_key.currentState!.validate()) {}
//                       },
//                       child: const Text('Register'),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final _gap = const SizedBox(height: 8);
  final _key = GlobalKey<FormState>();

  final _fnameController = TextEditingController(text: 'kiran');
  final _lnameController = TextEditingController(text: 'rana');
  final _phoneController = TextEditingController(text: '123456789');
  final _usernameController = TextEditingController(text: 'kiran');
  final _passwordController = TextEditingController(text: 'kiran123');

  final List<CourseEntity> _lstCourseSelected = [];
  BatchEntity? _dropDownValue;

  final List<BatchEntity> dummyBatches = [
    BatchEntity(batchId: '1', batchName: 'Batch A'),
    BatchEntity(batchId: '2', batchName: 'Batch B'),
  ];

  final List<CourseEntity> dummyCourses = [
    CourseEntity(courseId: '1', courseName: 'Flutter'),
    CourseEntity(courseId: '2', courseName: 'React'),
    CourseEntity(courseId: '3', courseName: 'Spring Boot'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Register'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.grey[300],
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (context) => Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.camera),
                                label: const Text('Camera'),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.image),
                                label: const Text('Gallery'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: const AssetImage(
                          'assets/images/profile.png',
                        ),
                      ),
                    ),
                  ),
                  _gap,
                  TextFormField(
                    controller: _fnameController,
                    decoration: const InputDecoration(labelText: 'First Name'),
                    validator: (value) => value == null || value.isEmpty
                        ? 'Please enter first name'
                        : null,
                  ),
                  _gap,
                  TextFormField(
                    controller: _lnameController,
                    decoration: const InputDecoration(labelText: 'Last Name'),
                    validator: (value) => value == null || value.isEmpty
                        ? 'Please enter last name'
                        : null,
                  ),
                  _gap,
                  TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(labelText: 'Phone No'),
                    validator: (value) => value == null || value.isEmpty
                        ? 'Please enter phone number'
                        : null,
                  ),
                  _gap,
                  DropdownButtonFormField<BatchEntity>(
                    items: dummyBatches.map((e) {
                      return DropdownMenuItem<BatchEntity>(
                        value: e,
                        child: Text(e.batchName),
                      );
                    }).toList(),
                    onChanged: (value) {
                      _dropDownValue = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Select Batch',
                    ),
                    validator: (value) =>
                        value == null ? 'Please select batch' : null,
                  ),
                  _gap,
                  MultiSelectDialogField<CourseEntity>(
                    title: const Text('Select Courses'),
                    items: dummyCourses
                        .map(
                          (course) =>
                              MultiSelectItem(course, course.courseName),
                        )
                        .toList(),
                    listType: MultiSelectListType.CHIP,
                    buttonText: const Text(
                      'Select Course',
                      style: TextStyle(color: Colors.black),
                    ),
                    buttonIcon: const Icon(Icons.search),
                    onConfirm: (values) {
                      _lstCourseSelected.clear();
                      _lstCourseSelected.addAll(values);
                    },
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black87),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    validator: (value) => value == null || value.isEmpty
                        ? 'Please select courses'
                        : null,
                  ),
                  _gap,
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(labelText: 'Username'),
                    validator: (value) => value == null || value.isEmpty
                        ? 'Please enter username'
                        : null,
                  ),
                  _gap,
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Password'),
                    validator: (value) => value == null || value.isEmpty
                        ? 'Please enter password'
                        : null,
                  ),
                  _gap,
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          // Trigger registration logic here
                        }
                      },
                      child: const Text('Register'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
