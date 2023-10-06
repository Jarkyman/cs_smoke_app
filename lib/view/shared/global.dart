import 'package:flutter/material.dart';

abstract class Global {
  static const Color bgColor = Color(0xFF02010F);
  static const Color blue = Color(0xFF4A64FE);

  static const List<String> maps = [
    'Ancient',
    'Anubis',
    //'Dust2',
    'Inferno',
    //'Italy',
    'Mirage',
    'Nuke',
    //'Office',
    'Overpass',
    'Vertigo',
  ];

  static const List allUtils = [
    //OVERPASS
    {
      'location': 'overpass',
      'description': 'Barrels',
      'name': 'molotov',
      'status': true,
      'position': [0.247, -0.245],
      'stands': [
        {
          'position': [0.079, -0.061],
          'description': 'Left click',
          'videoId': 'tzNYCum9f5Q'
        },
        {
          'position': [0.330, 0.127],
          'description': 'Running jump throw',
          'videoId': ''
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'B Short',
      'name': 'molotov',
      'status': true,
      'position': [0.229, -0.097],
      'stands': [
        {
          'position': [0.287, 0.177],
          'description': 'Left and right click jump throw',
          'videoId': 'ICKI7X8ji8o'
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Monster',
      'name': 'flash',
      'status': true,
      'position': [0.311, -0.104],
      'stands': [
        {
          'position': [0.284, 0.086],
          'description': 'Left click',
          'videoId': 'lcBVI826T2c'
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'B site',
      'name': 'flash',
      'status': true,
      'position': [0.249, -0.123],
      'stands': [
        {
          'position': [0.299, 0.047],
          'description': 'Left click',
          'videoId': 'I5vuPlpZW9M'
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Bridge',
      'name': 'smoke',
      'status': true,
      'position': [0.179, -0.122],
      'stands': [
        {
          'position': [0.292, 0.110],
          'description': 'Crouch Throw',
          'videoId': 'HtzigXipFS4'
        },
        {
          'position': [0.175, 0.034],
          'description': 'Left click',
          'videoId': '7q19j86cFVc'
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Heaven',
      'name': 'smoke',
      'status': true,
      'position': [0.083, -0.264],
      'stands': [
        {
          'position': [0.296, 0.216],
          'description': 'Running jump throw',
          'videoId': 'rn6gXeF1-n8'
        },
        {
          'position': [0.117, -0.023],
          'description': 'Left click',
          'videoId': '847ynMPmRjI'
        },
        {
          'position': [0.079, -0.036],
          'description': 'Left click',
          'videoId': 'NI7t15K1h8k'
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Water',
      'name': 'flash',
      'status': true,
      'position': [0.101, 0.016],
      'stands': [
        {
          'position': [0.064, 0.039],
          'description': 'Crouch left click',
          'videoId': 'yh-ct0M9RNk'
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Water',
      'name': 'flash',
      'status': true,
      'position': [0.161, 0.016],
      'stands': [
        {
          'position': [0.358, -0.033],
          'description': 'Left click',
          'videoId': 'HUoe6w5nkiU'
        },
        {
          'position': [0.299, 0.136],
          'description': 'Left click',
          'videoId': 'GIp6Euj49YY'
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Water',
      'name': 'flash',
      'status': true,
      'position': [0.161, 0.016],
      'stands': [
        {
          'position': [0.358, -0.033],
          'description': 'Left click',
          'videoId': 'HUoe6w5nkiU'
        },
        {
          'position': [0.299, 0.136],
          'description': 'Left click',
          'videoId': 'GIp6Euj49YY'
        },
        {
          'position': [-0.060, 0.028],
          'description': 'Left click',
          'videoId': 'D0gGsMKvaOk'
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Mid',
      'name': 'smoke',
      'status': true,
      'position': [-0.093, 0.014],
      'stands': [
        {
          'position': [-0.040, 0.292],
          'description': 'Left click',
          'videoId': 'sbhHIvVrZwo'
        },
        {
          'position': [0.056, 0.241],
          'description': 'Left click',
          'videoId': 'SJ_kxjaVtrU'
        },
        {
          'position': [0.330, 0.341],
          'description': 'Walk jump throw',
          'videoId': 'HO3qs7OFPzE'
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Divider',
      'name': 'smoke',
      'status': true,
      'position': [-0.060, -0.046],
      'stands': [
        {
          'position': [0.277, 0.357],
          'description': 'Walk jump throw',
          'videoId': 'T9xgB8uXL78'
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Mid a site',
      'name': 'smoke',
      'status': true,
      'position': [-0.030, -0.283],
      'stands': [
        {
          'position': [-0.033, -0.018],
          'description': 'Left click',
          'videoId': ''
        },
        {
          'position': [-0.253, -0.158],
          'description': 'Left click',
          'videoId': ''
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Dumpster',
      'name': 'smoke',
      'status': true,
      'position': [0.037, -0.342],
      'stands': [
        {
          'position': [-0.289, 0.041],
          'description': 'Jump Throw',
          'videoId': ''
        },
        {
          'position': [-0.032, -0.017],
          'description': 'Left click',
          'videoId': ''
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Dices',
      'name': 'smoke',
      'status': true,
      'position': [-0.087, -0.325],
      'stands': [
        {
          'position': [-0.227, -0.101],
          'description': 'Left click',
          'videoId': ''
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Bank',
      'name': 'smoke',
      'status': true,
      'position': [-0.054, -0.401],
      'stands': [
        {
          'position': [-0.289, 0.040],
          'description': 'Jump throw',
          'videoId': ''
        },
        {
          'position': [-0.224, -0.099],
          'description': 'Left click',
          'videoId': ''
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Default',
      'name': 'molotov',
      'status': true,
      'position': [-0.067, -0.279],
      'stands': [
        {
          'position': [-0.024, -0.051],
          'description': 'Left click',
          'videoId': ''
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Bank',
      'name': 'molotov',
      'status': true,
      'position': [-0.054, -0.398],
      'stands': [
        {
          'position': [-0.192, -0.250],
          'description': 'Left click',
          'videoId': ''
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Water',
      'name': 'smoke',
      'status': false,
      'position': [0.184, 0.015],
      'stands': [
        {
          'position': [0.036, -0.322],
          'description': 'Left click',
          'videoId': ''
        },
        {
          'position': [0.048, -0.183],
          'description': 'Left click',
          'videoId': ''
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Water',
      'name': 'molotov',
      'status': false,
      'position': [0.184, 0.015],
      'stands': [
        {
          'position': [0.048, -0.183],
          'description': 'Left click',
          'videoId': ''
        },
        {
          'position': [-0.031, -0.181],
          'description': 'Run throw',
          'videoId': ''
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Water',
      'name': 'flash',
      'status': false,
      'position': [0.140, -0.059],
      'stands': [
        {
          'position': [0.199, -0.218],
          'description': 'Left click',
          'videoId': ''
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Monster',
      'name': 'smoke',
      'status': false,
      'position': [0.312, -0.038],
      'stands': [
        {
          'position': [0.008, -0.352],
          'description': 'Crouch jump throw',
          'videoId': ''
        },
        {
          'position': [0.188, -0.205],
          'description': 'Left click',
          'videoId': ''
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Monster',
      'name': 'molotov',
      'status': false,
      'position': [0.319, -0.122],
      'stands': [
        {
          'position': [0.205, -0.226],
          'description': 'Left click',
          'videoId': ''
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Jail',
      'name': 'flash',
      'status': false,
      'position': [0.306, -0.217],
      'stands': [
        {
          'position': [0.171, -0.221],
          'description': 'Left and right click',
          'videoId': ''
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Party',
      'name': 'smoke',
      'status': false,
      'position': [-0.179, 0.161],
      'stands': [
        {
          'position': [-0.002, -0.108],
          'description': 'Left click',
          'videoId': ''
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Mid',
      'name': 'smoke',
      'status': false,
      'position': [-0.092, 0.170],
      'stands': [
        {
          'position': [-0.002, -0.108],
          'description': 'Left click',
          'videoId': ''
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Mid',
      'name': 'smoke',
      'status': false,
      'position': [-0.092, 0.170],
      'stands': [
        {
          'position': [-0.002, -0.108],
          'description': 'Left click',
          'videoId': ''
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'T stairs',
      'name': 'molotov',
      'status': false,
      'position': [0.050, 0.277],
      'stands': [
        {
          'position': [-0.032, -0.103],
          'description': 'Running jump throw',
          'videoId': ''
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Long',
      'name': 'flash',
      'status': false,
      'position': [-0.132, -0.382],
      'stands': [
        {
          'position': [-0.080, -0.375],
          'description': 'Right click',
          'videoId': ''
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Top connector',
      'name': 'smoke',
      'status': true,
      'position': [-0.028, 0.080],
      'stands': [
        {
          'position': [-0.176, 0.305],
          'description': 'Left click',
          'videoId': ''
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Walkway',
      'name': 'smoke',
      'status': true,
      'position': [0.084, -0.136],
      'stands': [
        {
          'position': [0.302, 0.222],
          'description': 'Jump throw',
          'videoId': ''
        },
        {
          'position': [0.178, 0.030],
          'description': 'Left click',
          'videoId': ''
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Car',
      'name': 'smoke',
      'status': true,
      'position': [-0.003, -0.265],
      'stands': [
        {
          'position': [-0.298, 0.030],
          'description': 'Jump throw',
          'videoId': ''
        },
        {
          'position': [-0.027, -0.026],
          'description': 'Left click',
          'videoId': ''
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Barrels',
      'name': 'smoke',
      'status': true,
      'position': [0.240, -0.218],
      'stands': [
        {
          'position': [0.115, -0.046],
          'description': 'Left click',
          'videoId': ''
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Mid b site',
      'name': 'smoke',
      'status': true,
      'position': [0.182, -0.187],
      'stands': [
        {
          'position': [0.296, 0.122],
          'description': 'Left click',
          'videoId': ''
        },
        {
          'position': [0.084, -0.029],
          'description': 'Left click',
          'videoId': ''
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Pit',
      'name': 'molotov',
      'status': true,
      'position': [0.207, -0.230],
      'stands': [
        {
          'position': [0.080, -0.039],
          'description': 'Left click',
          'videoId': ''
        },
      ],
    },
  ];
}

/*
{
      'location': '',
      'description': '',
      'name': '',
      'status': true,
      'position': ,
      'stands': [
        {
          'position': ,
          'description': '',
          'videoId': ''
        },
      ],
    },
 */
