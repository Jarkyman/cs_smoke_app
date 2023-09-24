import 'package:flutter/material.dart';

abstract class Global {
  static const Color bgColor = Color(0xFF02010F);
  static const Color blue = Color(0xFF4A64FE);

  static const List smokes = [
    {
      'location': 'overpass',
      'description': 'dumpstor',
      'name': 'smoke',
      'status': true,
      'position': [0.036, -0.339],
      'stands': [
        [-0.034, -0.012],
        [0.002, -0.052],
        [-0.031, 0.074],
      ],
      'tile': 1,
    },
    {
      'location': 'overpass',
      'description': 'bridge',
      'name': 'smoke',
      'status': true,
      'position': [0.178, -0.124],
      'stands': [
        [0.105, -0.025],
        [0.268, 0.110],
      ],
      'tile': 1,
    },
    {
      'location': 'overpass',
      'description': 'bank',
      'name': 'fire',
      'status': true,
      'position': [-0.055, -0.397],
      'stands': [
        [-0.022, -0.067],
        [-0.212, -0.150],
      ],
      'tile': 1,
    },
    {
      'location': 'overpass',
      'description': 'heaven',
      'name': 'smoke',
      'status': true,
      'position': [0.088, -0.256],
      'stands': [
        [0.105, -0.023],
        [0.268, 0.197],
      ],
      'tile': 1,
    },
    {
      'location': 'overpass',
      'description': 'monster',
      'name': 'smoke',
      'status': false,
      'position': [0.312, -0.031],
      'stands': [
        [0.007, -0.319],
      ],
      'tile': 1,
    },
    {
      'location': 'overpass',
      'description': 'monster',
      'name': 'flash',
      'status': true,
      'position': [0.370, -0.153],
      'stands': [
        [0.253, 0.114],
        [0.283, 0.020],
      ],
      'tile': 1,
    },
    {
      'location': 'overpass',
      'description': 'short',
      'name': 'flash',
      'status': true,
      'position': [0.171, 0.047],
      'stands': [
        [0.272, 0.126],
        [0.349, 0.038],
      ],
      'tile': 1,
    },
  ];
}
