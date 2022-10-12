import 'package:flutter/material.dart';
import 'package:kalahok_mobile/src/models/admin.model.dart';
import 'package:kalahok_mobile/src/repositories/admin/admin.repo.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key, required this.title});

  final String title;

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  late List<Admin>? _adminModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _adminModel = (await AdminRepository().getAdmins())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Survey'),
      ),
      body: _adminModel == null || _adminModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _adminModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_adminModel![index].id.toString()),
                          Text(_adminModel![index].name),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_adminModel![index].username),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
