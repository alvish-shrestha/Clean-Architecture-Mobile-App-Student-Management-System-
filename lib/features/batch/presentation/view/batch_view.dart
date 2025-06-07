import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_management/core/common/snackbar/my_snackbar.dart';
import 'package:student_management/features/batch/presentation/view_model/batch_event.dart';
import 'package:student_management/features/batch/presentation/view_model/batch_state.dart';
import 'package:student_management/features/batch/presentation/view_model/batch_view_model.dart';

class BatchView extends StatelessWidget {
  BatchView({super.key});
  final batchNameController = TextEditingController();

  final _batchViewFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _batchViewFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: batchNameController,
                decoration: const InputDecoration(labelText: 'Batch Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter batch name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_batchViewFormKey.currentState!.validate()) {
                    context.read<BatchViewModel>().add(
                      AddBatch(batchNameController.text),
                    );
                  }
                },
                child: Text('Add Batch'),
              ),
              SizedBox(height: 10),
              BlocBuilder<BatchViewModel, BatchState>(
                builder: (context, state) {
                  if (state.batches.isEmpty) {
                    return Center(child: Text("No batches Added yet"));
                  } else if (state.isLoading) {
                    return CircularProgressIndicator();
                  } else if (state.error != null) {
                    return showMySnackBar(
                      context: context,
                      message: state.error!,
                      color: Colors.red,
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.batches.length,
                        itemBuilder: (BuildContext context, index) {
                          return ListTile(
                            title: Text(state.batches[index].batchName),
                            subtitle: Text(state.batches[index].batchId!),
                            trailing: IconButton(
                              onPressed: () {
                                context.read<BatchViewModel>().add(
                                  DeleteBatch(state.batches[index].batchId!),
                                );
                              },
                              icon: Icon(Icons.delete),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
