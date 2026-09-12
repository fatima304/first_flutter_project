import 'package:first_flutter_project/features/auth/manager/cubit/firestore/firestore_cubit.dart';
import 'package:first_flutter_project/features/auth/manager/cubit/firestore/firestore_state.dart';
import 'package:first_flutter_project/features/auth/widgets/custom_button.dart';
import 'package:first_flutter_project/features/auth/widgets/custom_text_form_field.dart';
import 'package:first_flutter_project/features/firestore/display_records_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final hobbyController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    hobbyController.dispose();
    super.dispose();
  }

  // Validate name - required field
  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  // Validate age - required and must be a valid number
  String? validateAge(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Age is required';
    }
    final age = int.tryParse(value.trim());
    if (age == null) {
      return 'Please enter a valid number';
    }
    if (age < 0 || age > 150) {
      return 'Please enter a valid age';
    }
    return null;
  }

  // Validate favourite hobby - required field
  String? validateHobby(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Favourite hobby is required';
    }
    return null;
  }

  void _saveUser() {
    if (formKey.currentState!.validate()) {
      // Call FirestoreCubit to save user data
      context.read<FirestoreCubit>().saveUser(
        name: nameController.text.trim(),
        age: ageController.text.trim(),
        favouriteHobby: hobbyController.text.trim(),
      );
    }
  }

  void _resetForm() {
    formKey.currentState!.reset();
    nameController.clear();
    ageController.clear();
    hobbyController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<FirestoreCubit>().state is FirestoreLoading;

    return BlocListener<FirestoreCubit, FirestoreState>(
      listener: (context, state) {
        if (state is FirestoreSuccess) {
          // Show success message and reset form
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('User saved successfully!'),
              backgroundColor: Colors.green,
            ),
          );
          _resetForm();
        } else if (state is FirestoreFailure) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Name input field
            CustomTextFormField(
              label: 'Name',
              controller: nameController,
              validator: validateName,
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 16),

            // Age input field
            CustomTextFormField(
              label: 'Age',
              controller: ageController,
              validator: validateAge,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),

            // Favourite Hobby input field
            CustomTextFormField(
              label: 'Favourite Hobby',
              controller: hobbyController,
              validator: validateHobby,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 32),

            // Save button
            CustomElevatedButton(
              text: 'Save User',
              isLoading: isLoading,
              onPressed: isLoading ? () {} : _saveUser,
            ),
            const SizedBox(height: 16),

            // Display button (navigate to records page)
            OutlinedButton(
              onPressed: () {
                final cubit = context.read<FirestoreCubit>();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                      value: cubit,
                      child: const DisplayRecordsScreen(),
                    ),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
                side: const BorderSide(color: Color(0xFF6A1B9A)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'View Records',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6A1B9A),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
