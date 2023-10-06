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
    {
      'location': 'nuke',
      'description': 'Ramp',
      'name': 'smoke',
      'status': true,
      'position': [0.010, 0.039],
      'stands': [
        {
          'position': [-0.008, 0.122],
          'description': 'Run throw',
          'videoId': 'nLxXvy5wJ4k'
        },
      ],
    },
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
          'videoId': 'HNY3ReHKv-Y'
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
          'description': 'Left right click jump throw',
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
          'videoId': 'Len0Pq_nMJk'
        },
        {
          'position': [-0.253, -0.158],
          'description': 'Left click',
          'videoId': 'HzMU2W7lxqg'
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
          'videoId': 'AeSGHJfz2Lc'
        },
        {
          'position': [-0.032, -0.017],
          'description': 'Left click',
          'videoId': 'zUOs1tQiVm8'
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
          'videoId': 'Ivrv0R85G14'
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
          'videoId': 'aFyrfa1Cm18'
        },
        {
          'position': [-0.224, -0.099],
          'description': 'Left click',
          'videoId': 'AGEAminTsf0'
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
          'videoId': '1vki0C2F88E'
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
          'videoId': 'lsz2QDIi0s8'
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
          'videoId': 'A1h7qqpihJo'
        },
        {
          'position': [0.048, -0.183],
          'description': 'Left click',
          'videoId': 'OB2Cn4hsD6M'
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
          'videoId': '7JlVdqvY32k'
        },
        {
          'position': [-0.031, -0.181],
          'description': 'Run throw',
          'videoId': 'AQ7NMSFIf5k'
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
          'videoId': '6u_O4QulAdA'
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
          'videoId': 'bdm6nLuumZY'
        },
        {
          'position': [0.188, -0.205],
          'description': 'Left click',
          'videoId': 'IH3bTVVBsaA'
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
          'videoId': 'l4odQ0YcIPw'
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
          'description': 'Left right click',
          'videoId': 'lyGVd2UH9so'
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
          'videoId': 'k1hRKO6KYgE'
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
          'videoId': '8vwV2g-VWqg'
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
          'videoId': 'HN-DoJaE6QA'
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
          'videoId': 'IXZAbe0mxzk'
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
          'videoId': 'C4J8BEHHo_Q'
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
          'videoId': 'qkbhDsP67ag'
        },
        {
          'position': [0.178, 0.030],
          'description': 'Left click',
          'videoId': '7Su0I6tVc3c'
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Truck',
      'name': 'smoke',
      'status': true,
      'position': [-0.003, -0.265],
      'stands': [
        {
          'position': [-0.298, 0.030],
          'description': 'Jump throw',
          'videoId': 'fnowkMO9s1E'
        },
        {
          'position': [-0.027, -0.026],
          'description': 'Left click',
          'videoId': 'zzlS5FuiJlw'
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
          'videoId': 'CD8hwxVXGGY'
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
          'videoId': 'USB5VvuekFY'
        },
        {
          'position': [0.084, -0.029],
          'description': 'Left click',
          'videoId': 'aOQxGmcY-fw'
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
          'videoId': 'p81UmjF6ngY'
        },
      ],
    },
    //VERTIGO
    {
      'location': 'vertigo',
      'description': 'Connector',
      'name': 'smoke',
      'status': true,
      'position': [-0.226, -0.046],
      'stands': [
        {
          'position': [-0.416, 0.286],
          'description': 'Jump throw',
          'videoId': '-5JbGcvWCd8'
        },
        {
          'position': [-0.017, -0.154],
          'description': 'Jump throw',
          'videoId': '-5JbGcvWCd8'
        },
        {
          'position': [-0.330, 0.114],
          'description': 'Left click',
          'videoId': 'XVlkNpUfMjM'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'Mid',
      'name': 'flash',
      'status': false,
      'position': [-0.161, 0.016],
      'stands': [
        {
          'position': [-0.135, -0.047],
          'description': 'Right click jump throw',
          'videoId': 'sx1i_LTGTmA'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'Ramp and Sidewalk',
      'name': 'flash',
      'status': false,
      'position': [-0.115, 0.336],
      'stands': [
        {
          'position': [-0.031, 0.166],
          'description': 'Left click',
          'videoId': 'YJZLWMQPCRI'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'Default A',
      'name': 'molotov',
      'status': false,
      'position': [0.001, 0.208],
      'stands': [
        {
          'position': [0.028, 0.018],
          'description': 'Left click',
          'videoId': 'ekT23_TA-zs'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'Lane',
      'name': 'molotov',
      'status': false,
      'position': [-0.152, 0.193],
      'stands': [
        {
          'position': [0.057, 0.133],
          'description': 'Jump throw',
          'videoId': 'O68qhwzQ__4'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'Ramp',
      'name': 'molotov',
      'status': false,
      'position': [0.315, -0.181],
      'stands': [
        {
          'position': [-0.009, 0.236],
          'description': 'Left click',
          'videoId': 'vx5pl1AE3yg'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'Ramp',
      'name': 'molotov',
      'status': false,
      'position': [-0.089, 0.247],
      'stands': [
        {
          'position': [-0.009, 0.236],
          'description': 'Left click',
          'videoId': 'vx5pl1AE3yg'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'Sidewalk',
      'name': 'molotov',
      'status': false,
      'position': [-0.129, 0.275],
      'stands': [
        {
          'position': [-0.029, 0.163],
          'description': 'Left click',
          'videoId': 'H86kv2xOoOk'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'Ramp',
      'name': 'smoke',
      'status': false,
      'position': [0.312, -0.260],
      'stands': [
        {
          'position': [-0.118, 0.063],
          'description': 'Run throw',
          'videoId': 'cTlbkxzq84E'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'Lane',
      'name': 'smoke',
      'status': false,
      'position': [-0.039, 0.192],
      'stands': [
        {
          'position': [0.028, 0.019],
          'description': 'Left click',
          'videoId': '86mxXFdysbU'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'Ramp retake',
      'name': 'smoke',
      'status': false,
      'position': [0.013, 0.270],
      'stands': [
        {
          'position': [-0.009, 0.017],
          'description': 'Left click',
          'videoId': 'dc4nitZsV-c'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'B stairs',
      'name': 'flash',
      'status': false,
      'position': [-0.033, -0.381],
      'stands': [
        {
          'position': [-0.395, -0.040],
          'description': 'Run throw',
          'videoId': 'dz6KIYMdu2k'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'B stairs',
      'name': 'flash',
      'status': false,
      'position': [-0.438, 0.052],
      'stands': [
        {
          'position': [-0.395, -0.040],
          'description': 'Run throw',
          'videoId': 'dz6KIYMdu2k'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'B stairs',
      'name': 'molotov',
      'status': false,
      'position': [-0.006, -0.351],
      'stands': [
        {
          'position': [-0.408, -0.125],
          'description': 'Running jump throw',
          'videoId': 'ukBeLcg2IZY'
        },
        {
          'position': [-0.394, -0.039],
          'description': 'Left click',
          'videoId': 'jSKR4X0iwX4'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'B stairs',
      'name': 'molotov',
      'status': false,
      'position': [-0.409, 0.084],
      'stands': [
        {
          'position': [-0.408, -0.125],
          'description': 'Running jump throw',
          'videoId': 'ukBeLcg2IZY'
        },
        {
          'position': [-0.394, -0.039],
          'description': 'Left click',
          'videoId': 'jSKR4X0iwX4'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'Default B',
      'name': 'molotov',
      'status': false,
      'position': [-0.378, -0.114],
      'stands': [
        {
          'position': [-0.107, -0.139],
          'description': 'Jump throw',
          'videoId': 'OoloT6FpkXM'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'Catwalk',
      'name': 'smoke',
      'status': false,
      'position': [-0.461, -0.052],
      'stands': [
        {
          'position': [-0.185, -0.138],
          'description': 'Left right click jump throw',
          'videoId': 'Ps3MajcDQ40'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'B Stairs Retake',
      'name': 'smoke',
      'status': false,
      'position': [-0.406, -0.033],
      'stands': [
        {
          'position': [-0.108, -0.139],
          'description': 'Left right click jump throw',
          'videoId': 'tIND3w1_Yl8'
        },
        {
          'position': [-0.186, -0.138],
          'description': 'Left click',
          'videoId': '-JJr_VvM2Vg'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'Mid',
      'name': 'smoke',
      'status': false,
      'position': [-0.264, 0.097],
      'stands': [
        {
          'position': [-0.436, -0.131],
          'description': 'Left click',
          'videoId': '9nwN7yMalcQ'
        },
        {
          'position': [-0.196, -0.002],
          'description': 'Run throw',
          'videoId': 'a4NxZkMzH9s'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'Ramp',
      'name': 'flash',
      'status': true,
      'position': [-0.066, 0.318],
      'stands': [
        {
          'position': [-0.374, 0.231],
          'description': 'Jump throw',
          'videoId': 'kbPuVU3zv9c'
        },
        {
          'position': [0.029, -0.204],
          'description': 'Jump throw',
          'videoId': 'kbPuVU3zv9c'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'Back lane',
      'name': 'flash',
      'status': true,
      'position': [-0.067, 0.214],
      'stands': [
        {
          'position': [-0.067, 0.269],
          'description': 'Jump throw',
          'videoId': 'C9fBLBoBrFA'
        },
        {
          'position': [0.335, -0.165],
          'description': 'Jump throw',
          'videoId': 'C9fBLBoBrFA'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'Double',
      'name': 'molotov',
      'status': true,
      'position': [-0.067, 0.214],
      'stands': [
        {
          'position': [0.285, -0.099],
          'description': 'Jump throw',
          'videoId': 'v7za-pXa8Vo'
        },
        {
          'position': [-0.116, 0.336],
          'description': 'Jump throw',
          'videoId': 'v7za-pXa8Vo'
        },
        {
          'position': [-0.029, 0.304],
          'description': 'Left click',
          'videoId': 'M89J6zsUTi4'
        },
        {
          'position': [0.377, -0.130],
          'description': 'Left click',
          'videoId': 'M89J6zsUTi4'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'Sandbag',
      'name': 'molotov',
      'status': true,
      'position': [0.040, 0.348],
      'stands': [
        {
          'position': [-0.091, 0.266],
          'description': 'Run throw',
          'videoId': 'a247PPUfH0'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'Right A Site',
      'name': 'smoke',
      'status': true,
      'position': [0.018, 0.161],
      'stands': [
        {
          'position': [-0.111, 0.256],
          'description': 'Left click',
          'videoId': '0HB2BDpvT6k'
        },
        {
          'position': [0.293, -0.179],
          'description': 'Left click',
          'videoId': '0HB2BDpvT6k'
        },
        {
          'position': [-0.376, 0.325],
          'description': 'Jump throw',
          'videoId': 'jIU82-8Y3iQ'
        },
        {
          'position': [0.025, -0.110],
          'description': 'Jump throw',
          'videoId': 'jIU82-8Y3iQ'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'Elevator',
      'name': 'smoke',
      'status': true,
      'position': [-0.031, 0.110],
      'stands': [
        {
          'position': [-0.061, 0.333],
          'description': 'Run throw',
          'videoId': 'G7CXtE_y6gg'
        },
        {
          'position': [0.347, -0.099],
          'description': 'Run throw',
          'videoId': 'G7CXtE_y6gg'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'Lane',
      'name': 'smoke',
      'status': true,
      'position': [-0.137, 0.294],
      'stands': [
        {
          'position': [-0.219, 0.382],
          'description': 'Jump throw',
          'videoId': 'Mrr-ij8AbXU'
        },
        {
          'position': [0.184, -0.052],
          'description': 'Jump throw',
          'videoId': 'Mrr-ij8AbXU'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'Lane',
      'name': 'smoke',
      'status': true,
      'position': [0.262, -0.142],
      'stands': [
        {
          'position': [-0.219, 0.382],
          'description': 'Jump throw',
          'videoId': 'Mrr-ij8AbXU'
        },
        {
          'position': [0.184, -0.052],
          'description': 'Jump throw',
          'videoId': 'Mrr-ij8AbXU'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'Left A Site',
      'name': 'smoke',
      'status': true,
      'position': [-0.026, 0.164],
      'stands': [
        {
          'position': [-0.349, 0.326],
          'description': 'Jump throw',
          'videoId': 'roM5SD5t-zk'
        },
        {
          'position': [0.056, -0.108],
          'description': 'Jump throw',
          'videoId': 'roM5SD5t-zk'
        },
        {
          'position': [-0.068, 0.271],
          'description': 'Jump throw',
          'videoId': 'IcxdUhUZV0Q'
        },
        {
          'position': [0.336, -0.163],
          'description': 'Jump throw',
          'videoId': 'IcxdUhUZV0Q'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'B Site',
      'name': 'flash',
      'status': true,
      'position': [-0.376, -0.056],
      'stands': [
        {
          'position': [-0.413, 0.084],
          'description': 'Left click',
          'videoId': 'bNZiMEuFpnw'
        },
        {
          'position': [-0.011, -0.353],
          'description': 'Left click',
          'videoId': 'bNZiMEuFpnw'
        },
        {
          'position': [-0.392, 0.119],
          'description': 'Left click',
          'videoId': 'qXV1nVoB5ps'
        },
        {
          'position': [0.012, -0.314],
          'description': 'Left click',
          'videoId': 'qXV1nVoB5ps'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'B Site Stairs',
      'name': 'flash',
      'status': true,
      'position': [-0.412, 0.091],
      'stands': [
        {
          'position': [0.004, -0.246],
          'description': 'Left click',
          'videoId': 'gLk9I7jglFk'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'B Site Stairs',
      'name': 'flash',
      'status': true,
      'position': [-0.007, -0.339],
      'stands': [
        {
          'position': [0.004, -0.246],
          'description': 'Left click',
          'videoId': 'gLk9I7jglFk'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'Back B',
      'name': 'molotov',
      'status': true,
      'position': [-0.455, -0.150],
      'stands': [
        {
          'position': [-0.398, 0.077],
          'description': 'Left click',
          'videoId': '6TVd33PFuBc'
        },
        {
          'position': [0.005, -0.360],
          'description': 'Left click',
          'videoId': '6TVd33PFuBc'
        },
        {
          'position': [-0.384, 0.088],
          'description': 'Left click',
          'videoId': 'Um9E07HAMQ0'
        },
        {
          'position': [0.020, -0.348],
          'description': 'Left click',
          'videoId': 'Um9E07HAMQ0'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'Red',
      'name': 'molotov',
      'status': true,
      'position': [-0.368, -0.132],
      'stands': [
        {
          'position': [-0.384, 0.104],
          'description': 'Left click',
          'videoId': 'pQ7bI6SFGrk'
        },
        {
          'position': [0.019, -0.334],
          'description': 'Left click',
          'videoId': 'pQ7bI6SFGrk'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'Ct B Site',
      'name': 'smoke',
      'status': true,
      'position': [-0.255, -0.089],
      'stands': [
        {
          'position': [-0.434, 0.121],
          'description': 'Left click',
          'videoId': 'eraJi-fOxh0'
        },
        {
          'position': [-0.031, -0.313],
          'description': 'Left click',
          'videoId': 'eraJi-fOxh0'
        },
        {
          'position': [-0.416, 0.286],
          'description': 'Jump throw',
          'videoId': 'yw6ZD6OTlwg'
        },
        {
          'position': [-0.014, -0.156],
          'description': 'Jump throw',
          'videoId': 'yw6ZD6OTlwg'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'Left vent',
      'name': 'smoke',
      'status': true,
      'position': [-0.306, -0.126],
      'stands': [
        {
          'position': [-0.442, 0.095],
          'description': 'Left click',
          'videoId': 'Nfiodf7JDI4'
        },
        {
          'position': [-0.040, -0.339],
          'description': 'Left click',
          'videoId': 'Nfiodf7JDI4'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'Right vent',
      'name': 'smoke',
      'status': true,
      'position': [-0.308, -0.057],
      'stands': [
        {
          'position': [-0.413, 0.089],
          'description': 'Left click',
          'videoId': 'ZAdkxD8DkzY'
        },
        {
          'position': [-0.011, -0.348],
          'description': 'Left click',
          'videoId': 'ZAdkxD8DkzY'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'Mid',
      'name': 'flash',
      'status': true,
      'position': [-0.277, 0.000],
      'stands': [
        {
          'position': [-0.331, 0.180],
          'description': 'Left click',
          'videoId': 'mmIwWKb9QGQ'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'Connector',
      'name': 'molotov',
      'status': true,
      'position': [-0.228, -0.055],
      'stands': [
        {
          'position': [-0.329, 0.114],
          'description': 'Left click',
          'videoId': '3q9edy-QxgE'
        },
        {
          'position': [-0.344, 0.179],
          'description': 'Left click',
          'videoId': 'cWQRVuwMJk4'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'Mid CT',
      'name': 'smoke',
      'status': true,
      'position': [-0.155, -0.012],
      'stands': [
        {
          'position': [-0.330, 0.077],
          'description': 'Left click',
          'videoId': 'fOERTCPwuTk'
        },
      ],
    },
    {
      'location': 'vertigo',
      'description': 'Mid elevator',
      'name': 'smoke',
      'status': true,
      'position': [-0.132, 0.049],
      'stands': [
        {
          'position': [-0.329, 0.093],
          'description': 'Jump throw',
          'videoId': 'LrreBf1-RQg'
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
