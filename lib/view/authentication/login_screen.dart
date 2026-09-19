import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random/common/utils/Round_Button.dart';
import 'package:random/common/utils/general_utils.dart';
import 'package:random/routes/routes_names.dart';
import 'package:random/view_model/auth/auth_viewModel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final ValueNotifier<bool> eyenotifire = ValueNotifier<bool>(true);
  final formkey = GlobalKey<FormState>();
  final FocusNode emialfocus = FocusNode();
  final FocusNode passwordfocus = FocusNode();

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    eyenotifire.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authprovider = Provider.of<AuthViewmodel>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Login", style: TextStyle(fontSize: 22))),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                focusNode: emialfocus,
                controller: emailcontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Enter Your Email",
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onFieldSubmitted: (val) {
                  GeneralUtils.fieldFocusChange(
                    context,
                    emialfocus,
                    passwordfocus,
                  );
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    GeneralUtils.flushbarmessage(context, "Enter your email");
                  }
                  if (!value!.contains('@')) {
                    GeneralUtils.flushbarmessage(
                      context,
                      "Enter complete Gmail",
                    );
                    return null;
                  }
                },
              ),
              SizedBox(height: 10),
              ValueListenableBuilder(
                valueListenable: eyenotifire,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: passwordcontroller,
                    obscureText: eyenotifire.value,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_open),

                      hintText: "Enter your password",
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          eyenotifire.value = !eyenotifire.value;
                        },
                        child: Icon(
                          eyenotifire.value
                              ? Icons.visibility
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
                      }
                      return null;
                    },
                  );
                },
              ),
              SizedBox(height: 30),
              RoundButton(
                title: "Login",
                onPress: () {
                  if (formkey.currentState!.validate()) {
                    authprovider.loginwithemail(
                      emailcontroller.text.toString(),
                      passwordcontroller.text.toString(),
                      context,
                    );
                  }
                },
              ),

              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Colors.purple),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.g_mobiledata_rounded),
                        SizedBox(width: 5),
                        Text("Continue with Google"),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Didn't had an account"),
                  SizedBox(width: 5),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        RoutesNames.SignupScreen,
                      );
                    },
                    child: Text(
                      "SignUp",
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
