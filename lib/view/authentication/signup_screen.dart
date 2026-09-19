import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random/common/utils/Round_Button.dart';
import 'package:random/common/utils/general_utils.dart';
import 'package:random/routes/routes_names.dart';
import 'package:random/view_model/auth/auth_viewModel.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final ValueNotifier<bool> eyenotifier = ValueNotifier<bool>(true);
  final formkey = GlobalKey<FormState>();
  final FocusNode _emailfocus = FocusNode();
  final FocusNode _passwordfocus = FocusNode();

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    _emailfocus.dispose();
    _passwordfocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authprovider = Provider.of<AuthViewmodel>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Signup", style: TextStyle(fontSize: 22))),
      body: Form(
        key: formkey,
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                focusNode: _emailfocus,
                controller: emailcontroller,
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onFieldSubmitted: (val) {
                  GeneralUtils.fieldFocusChange(
                    context,
                    _emailfocus,
                    _passwordfocus,
                  );
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    GeneralUtils.flushbarmessage(context, "Enter your email");
                  }
                  if (!value!.contains('@')) {
                    GeneralUtils.flushbarmessage(
                      context,
                      "Enter your complete gmail",
                    );
                    return null;
                  }
                },
              ),
              SizedBox(height: 10),
              ValueListenableBuilder(
                valueListenable: eyenotifier,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: passwordcontroller,
                    focusNode: _passwordfocus,
                    obscureText: eyenotifier.value,
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock_open),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          eyenotifier.value = !eyenotifier.value;
                        },
                        child: Icon(
                          eyenotifier.value
                              ? Icons.remove_red_eye
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        GeneralUtils.flushbarmessage(
                          context,
                          "Enter your password",
                        );
                        return null;
                      }
                    },
                  );
                },
              ),
              SizedBox(height: 40),
              RoundButton(
                title: "Sign Up",
                onPress: () {
                  if (formkey.currentState!.validate()) {
                    authprovider.signup(
                      emailcontroller.text.toString(),
                      passwordcontroller.text.toString(),
                      context,
                    );
                  }
                },
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.purple),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.g_mobiledata),
                        SizedBox(width: 5),
                        Text("Continue With Google"),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already had an account"),
                  SizedBox(width: 5),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        RoutesNames.loginScreen,
                      );
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 17, color: Colors.purple),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
