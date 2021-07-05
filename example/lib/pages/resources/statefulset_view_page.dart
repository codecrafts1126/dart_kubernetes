import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kubernetes/kubernetes.dart';

class StatefulSetViewPage extends StatefulWidget {
  const StatefulSetViewPage({
    required this.statefulset,
    Key? key,
  }) : super(key: key);

  final StatefulSet statefulset;

  @override
  State<StatefulSetViewPage> createState() => _StatefulSetViewPageState();
}

class _StatefulSetViewPageState extends State<StatefulSetViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StatefulSet ${widget.statefulset.metadata?.name}'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(4.0),
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              child: Text(
                  'StatefulSet Name: ${widget.statefulset.metadata?.name}'),
            ),
          ),
        ],
      ),
    );
  }
}