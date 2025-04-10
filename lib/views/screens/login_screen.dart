import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/login_bloc.dart';
import 'payment_selection_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const PaymentSelectionScreen(),
              ),
            );
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_mavi.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 32),
                                Center(
                                  child: SizedBox(
                                    height: 32,
                                    child: Image.asset(
                                      'assets/images/beyaz_logo.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 32),
                                const Text(
                                  'Aramıza Hoşgeldiniz',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Bayiler arası ödeme kontrol\nsistemime hoş geldin.',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(height: 40),
                                const Spacer(),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            top: 200,
                            child: SingleChildScrollView(
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 32, 30, 32),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(24),
                                    topRight: Radius.circular(24),
                                  ),
                                  border: const Border(
                                    top: BorderSide(
                                      color: Color(0xFFF88100),
                                      width: 3,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Form(
                                      key: _formKey,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          TextFormField(
                                            controller: _emailController,
                                            decoration: InputDecoration(
                                              labelText: 'Mail Adresiniz',
                                              labelStyle: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: 14,
                                              ),
                                              prefixIcon: Icon(
                                                Icons.email_outlined,
                                                color: Colors.grey[600],
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                  color: Colors.grey[300]!,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                  color: Colors.grey[400]!,
                                                ),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: const BorderSide(
                                                  color: Colors.red,
                                                ),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: const BorderSide(
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Lütfen mail adresinizi girin';
                                              }
                                              return null;
                                            },
                                          ),
                                          const SizedBox(height: 16),
                                          TextFormField(
                                            controller: _passwordController,
                                            obscureText: true,
                                            decoration: InputDecoration(
                                              labelText: 'Şifreniz',
                                              labelStyle: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: 14,
                                              ),
                                              prefixIcon: Icon(
                                                Icons.lock_outline,
                                                color: Colors.grey[600],
                                              ),
                                              suffixIcon: Icon(
                                                Icons.visibility_off_outlined,
                                                color: Colors.grey[600],
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                  color: Colors.grey[300]!,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                  color: Colors.grey[400]!,
                                                ),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: const BorderSide(
                                                  color: Colors.red,
                                                ),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: const BorderSide(
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Lütfen şifrenizi girin';
                                              }
                                              return null;
                                            },
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    height: 24,
                                                    width: 24,
                                                    child: Checkbox(
                                                      value: _rememberMe,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _rememberMe =
                                                              value ?? false;
                                                        });
                                                      },
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Text(
                                                    'Beni Hatırla',
                                                    style: TextStyle(
                                                      color: Colors.grey[700],
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              TextButton(
                                                onPressed: () {},
                                                style: TextButton.styleFrom(
                                                  padding: EdgeInsets.zero,
                                                  minimumSize: const Size(0, 0),
                                                  tapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                ),
                                                child: Text(
                                                  'Şifremi Unuttum',
                                                  style: TextStyle(
                                                    color: Colors.orange[700],
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 120),
                                          BlocBuilder<LoginBloc, LoginState>(
                                            builder: (context, state) {
                                              return ElevatedButton(
                                                onPressed: state is LoginLoading
                                                    ? null
                                                    : () {
                                                        if (_formKey
                                                            .currentState!
                                                            .validate()) {
                                                          context
                                                              .read<LoginBloc>()
                                                              .add(
                                                                LoginButtonPressed(
                                                                  email:
                                                                      _emailController
                                                                          .text,
                                                                  password:
                                                                      _passwordController
                                                                          .text,
                                                                ),
                                                              );
                                                        }
                                                      },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      const Color(0xFF00538E),
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 18,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  elevation: 0,
                                                  minimumSize: const Size(
                                                      double.infinity, 50),
                                                ),
                                                child: state is LoginLoading
                                                    ? const SizedBox(
                                                        height: 24,
                                                        width: 24,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: Colors.white,
                                                          strokeWidth: 2,
                                                        ),
                                                      )
                                                    : const Text(
                                                        'Giriş Yap',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 24),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Hala Vallet'a Başvurmadın mı?",
                                          style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            fontSize: 13,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                            padding:
                                                const EdgeInsets.only(left: 8),
                                            minimumSize: const Size(0, 0),
                                            tapTargetSize: MaterialTapTargetSize
                                                .shrinkWrap,
                                          ),
                                          child: Text(
                                            'HEMEN BAŞVUR',
                                            style: TextStyle(
                                              color: Colors.orange[700],
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
