import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;

  // Controllers for input fields
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cardIDController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
        backgroundColor: Colors.blue[700],
        automaticallyImplyLeading: false, // Remove back button
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  const SizedBox(height: 20),

                  // Full Name
                  TextFormField(
                    controller: _fullNameController,
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Password
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Card ID
                  TextFormField(
                    controller: _cardIDController,
                    decoration: const InputDecoration(
                      labelText: 'Card ID',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.card_membership),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your card ID';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Email
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Mobile Number
                  TextFormField(
                    controller: _mobileController,
                    decoration: const InputDecoration(
                      labelText: 'Mobile Number',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.phone),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your mobile number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Date of Birth
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: AbsorbPointer(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Date of Birth',
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(Icons.calendar_today),
                          hintText: _selectedDate != null
                              ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
                              : 'Select your DOB',
                        ),
                        validator: (value) {
                          if (_selectedDate == null) {
                            return 'Please select your date of birth';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Department
                  TextFormField(
                    controller: _departmentController,
                    decoration: const InputDecoration(
                      labelText: 'Department',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.apartment),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your department';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Handle signup logic here
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Signup successful')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Signup'),
                  ),
                  const SizedBox(height: 10),

                  // Back to Login button
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context); // Navigate back to the login page
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Back to Login'),
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
