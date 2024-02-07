import 'package:bue/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.title});

  final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                child: const Text(
                  "Welcome to BUE University",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              Image.asset(
                "assets/images/bueuni.jpeg",
                width: double.infinity,
                height: 160,
                fit: BoxFit.contain,
              ),
              // Image.network(
              //     "https://www.bue.edu.eg/uploads/home-slides/2023-05-02%2016-00-33.193-home-slide-d-_1920x800.Jpeg"),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Enter email",
                  hintText: "Email",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Enter your password",
                  hintText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 200,
                child: ElevatedButton(
                  onPressed: () async {
                    // try {
                    //   final String email = _emailController.text.trim();
                    //   final String password = _passwordController.text.trim();
                    //   if (email.isNotEmpty && password.isNotEmpty) {
                    //     final UserCredential userCredential =
                    //     await _auth.signInWithEmailAndPassword(
                    //       email: email,
                    //       password: password,
                    //     );
                    //     if (userCredential.user != null) {
                    //       // Navigate to the home screen on successful login
                    //       Navigator.pushReplacement(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => HomeScreen(),
                    //         ),
                    //       );
                    //     }
                    //   }
                    // } catch (e) {
                    //   print("Error signing in: $e");
                    //   // Handle login failure here
                    // }
                    final _googleSignIn = GoogleSignIn();
                    final _googleAccount = await _googleSignIn.signIn();
                    final _googleCredential =
                        await _googleAccount!.authentication;

                    final authCredentials = GoogleAuthProvider.credential(
                        idToken: _googleCredential.idToken,
                        accessToken: _googleCredential.accessToken);

                    final firebaseUser = await FirebaseAuth.instance
                        .signInWithCredential(authCredentials);

                    print(firebaseUser.user!.displayName);
                    print(firebaseUser.user!.email);
                    print(firebaseUser.user!.phoneNumber);
                    print(firebaseUser.user!.photoURL);
                    print(firebaseUser.user!.emailVerified);
                    print(firebaseUser.user!.uid);
                    print(firebaseUser.user!.isAnonymous);

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.redAccent,
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  radius: 50,
                  child: Image.network(
                      "https://avatars.githubusercontent.com/u/28203059?v=4"),
                ),
                CircleAvatar(
                  radius: 50,
                  child: Image.network(
                      "https://avatars.githubusercontent.com/u/28203059?v=4"),
                ),
              ],
              currentAccountPicture: Image.network(
                  "https://avatars.githubusercontent.com/u/28203059?v=4"),
              accountName: Text("Eslam Medhat"),
              accountEmail: Text("ieslammedhat@gmail.com"),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {},
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text("About"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text("Help"),
              onTap: () {},
            ),
          ]),
        ),
      ),
    );
  }
}
