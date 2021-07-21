import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reap_frontend_challenge/util/api_util.dart';

import 'login_cubit.dart';
import 'login_state.dart';

class Login extends StatelessWidget {
  final LoginCubit? loginCubit;

  Login([this.loginCubit]);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          loginCubit ?? LoginCubit(NotAuthorized()),
      child: _Login(),
    );
  }
}

class _Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<_Login> {
  final _formKey = GlobalKey<FormState>();

  bool _enable = true;
  bool _enableSubmit = false;
  String? _username;
  String? _password;

  @override
  void initState() {
    super.initState();

    _enable = true;
    _enableSubmit = false;
    _username = '';
    _password = '';
  }

  String? Function(String?) _validate(
      String label, int minLength, int maxLength) {
    return (value) {
      if (value?.isEmpty ?? true) {
        return '$label cannot be empty';
      }

      if (value!.length < minLength || value.length > maxLength) {
        return '$label should be between $minLength and $maxLength characters';
      }

      return null;
    };
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (_, __) => true,
      listener: (BuildContext context, LoginState state) {
        if (state is NotAuthorized) {
          if (state.reason != null) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Fail to login: error = ${state.reason}')));
          }
        } else if (state is Authorized) {
          try {
            ApiUtil.loggedIn(state.token);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            Navigator.of(context).pushReplacementNamed('authorized');
          } catch (e) {
            print('e = $e');
          }
        }
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8),
          child: Form(
            key: _formKey,
            onChanged: () => setState(() {
              _enableSubmit = _formKey.currentState!.validate();
            }),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                  width: 200,
                ),
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: _username,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(8),
                        labelText: 'username',
                        hintText: 'allowed characters A-Za-z0-9',
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[A-Za-z0-9]')),
                        LengthLimitingTextInputFormatter(20),
                      ],
                      validator: _validate('username', 4, 20),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      enabled: _enable,
                      maxLength: 20,
                      onSaved: (value) {
                        this._username = value;
                      },
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      initialValue: this._password,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(8),
                        labelText: 'password',
                        hintText: 'allowed characters A-Za-z0-9!@#\$%^&*()-_+=',
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[A-Za-z0-9!@#\$%^&*()-_+=]')),
                        LengthLimitingTextInputFormatter(20),
                      ],
                      validator: _validate('password', 4, 20),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: true,
                      maxLength: 20,
                      enabled: _enable,
                      onSaved: (value) {
                        this._password = value;
                      },
                    ),
                    SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: _enableSubmit
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                setState(() {
                                  _enable = false;
                                  _enableSubmit = false;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Logging In')));
                                  BlocProvider.of<LoginCubit>(context)
                                      .login(this._username!, this._password!);
                                });
                              }
                            }
                          : null,
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
