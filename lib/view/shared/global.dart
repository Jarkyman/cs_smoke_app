import 'package:flutter/material.dart';

abstract class Global {
  static const Color bgColor = Color(0xFF02010F);
  static const Color blue = Color(0xFF4A64FE);

  static const List<String> maps = [
    'Ancient',
    'Anubis',
    //'Cache',
    'Dust2',
    'Inferno',
    //'Italy',
    'Mirage',
    'Nuke',
    //'Office',
    'Overpass',
    'Train',
    'Vertigo',
  ];

  static const List allUtils = [
    //ANCIENT
    {
      'location': 'ancient',
      'description': 'Top mid',
      'name': 'smoke',
      'status': true,
      'position': [-0.026, -0.118],
      'stands': [
        {
          'position': [-0.049, 0.320],
          'description': 'Jump throw',
          'videoId': 'tUIVjytkxW4'
        },
        {
          'position': [0.008, 0.321],
          'description': 'Jump throw',
          'videoId': 'LGnOpPMCcHU'
        },
        {
          'position': [0.090, 0.095],
          'description': 'Left click',
          'videoId': 'aIyBhNJoYtU'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'Mid donut',
      'name': 'smoke',
      'status': true,
      'position': [-0.090, -0.042],
      'stands': [
        {
          'position': [-0.061, 0.390],
          'description': 'Run jump throw',
          'videoId': 'lBse-jq_4g0'
        },
        {
          'position': [0.315, 0.213],
          'description': 'Jump throw',
          'videoId': 'UyBRzYID3ng'
        },
        {
          'position': [-0.049, 0.320],
          'description': 'Jump throw',
          'videoId': 'wcbBTr4VGK4'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'Alley smoke',
      'name': 'smoke',
      'status': true,
      'position': [0.070, -0.222],
      'stands': [
        {
          'position': [-0.097, 0.082],
          'description': 'Jump throw',
          'videoId': 'elr6dPa8mV4'
        },
        {
          'position': [-0.068, 0.091],
          'description': 'Jump throw',
          'videoId': 'N6ajiNysvPI'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'Donut',
      'name': 'molotov',
      'status': true,
      'position': [-0.230, -0.044],
      'stands': [
        {
          'position': [-0.054, -0.029],
          'description': 'Run throw',
          'videoId': 'f_PiFuTKw-M'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'Mid',
      'name': 'flash',
      'status': true,
      'position': [-0.030, 0.100],
      'stands': [
        {
          'position': [-0.062, 0.365],
          'description': 'W jump throw',
          'videoId': 'lEaqskxxn8o'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'Lamp room',
      'name': 'smoke',
      'status': true,
      'position': [0.114, 0.069],
      'stands': [
        {
          'position': [-0.062, 0.365],
          'description': 'W jump throw',
          'videoId': 'tAtLKGqitII'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'Short',
      'name': 'smoke',
      'status': true,
      'position': [0.211, -0.156],
      'stands': [
        {
          'position': [0.314, 0.212],
          'description': 'Jump throw',
          'videoId': 'Hvs7vZJ7bbQ'
        },
        {
          'position': [0.270, 0.090],
          'description': 'Left click',
          'videoId': 'K0f3zd7sCnk'
        },
        {
          'position': [0.281, 0.113],
          'description': 'Left click',
          'videoId': '1Fkqh4t7Fh8'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'Long',
      'name': 'smoke',
      'status': true,
      'position': [0.303, -0.138],
      'stands': [
        {
          'position': [0.314, 0.212],
          'description': 'Jump throw',
          'videoId': 'Ds_Qaorb9M4'
        },
        {
          'position': [0.284, 0.195],
          'description': 'Jump throw',
          'videoId': '6vVO933fC6I'
        },
        {
          'position': [0.167, 0.096],
          'description': 'Left click',
          'videoId': 'DXh6CbLbs0A'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'Cave',
      'name': 'smoke',
      'status': true,
      'position': [0.187, -0.115],
      'stands': [
        {
          'position': [0.314, 0.212],
          'description': 'Jump throw',
          'videoId': 'NIfrbZdttZM'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'Cave',
      'name': 'molotov',
      'status': true,
      'position': [0.204, -0.114],
      'stands': [
        {
          'position': [0.280, 0.108],
          'description': 'Left click',
          'videoId': 'agYJapEUEYQ'
        },
        {
          'position': [0.248, 0.084],
          'description': 'Left click',
          'videoId': 'FnTkzDqUVmw'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'Ninja',
      'name': 'molotov',
      'status': true,
      'position': [0.213, -0.024],
      'stands': [
        {
          'position': [0.314, 0.212],
          'description': 'Jump throw',
          'videoId': 'bL-r7oDbL1s'
        },
        {
          'position': [0.201, 0.061],
          'description': 'Left click',
          'videoId': 'Zt7TD5VQVII'
        },
        {
          'position': [0.302, 0.184],
          'description': 'Left click',
          'videoId': 'XlZ3MVqaekg'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'Long',
      'name': 'molotov',
      'status': true,
      'position': [0.322, -0.173],
      'stands': [
        {
          'position': [0.300, 0.098],
          'description': 'Jump throw',
          'videoId': 'yKlUj-fEUs4'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'Lamp room',
      'name': 'molotov',
      'status': true,
      'position': [0.155, 0.022],
      'stands': [
        {
          'position': [0.165, 0.091],
          'description': 'Run throw',
          'videoId': 'b4JVvo2XJDI'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'Lamp room',
      'name': 'flash',
      'status': true,
      'position': [0.113, 0.067],
      'stands': [
        {
          'position': [0.278, 0.095],
          'description': 'Left click',
          'videoId': 'HTbMVqWzr5o'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'B site',
      'name': 'flash',
      'status': true,
      'position': [0.243, -0.030],
      'stands': [
        {
          'position': [0.314, 0.210],
          'description': 'Run jump throw',
          'videoId': 'q2qZ-mdTljY'
        },
        {
          'position': [0.299, 0.189],
          'description': 'Jump throw',
          'videoId': 'oHXo3p03ZGM'
        },
        {
          'position': [0.282, 0.108],
          'description': 'Jump throw',
          'videoId': 'SuE8q2RRoVE'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'Temple',
      'name': 'smoke',
      'status': true,
      'position': [-0.234, -0.302],
      'stands': [
        {
          'position': [-0.338, 0.114],
          'description': 'Crouch jump throw',
          'videoId': 'GKK_xsfCwMI'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'Ct',
      'name': 'smoke',
      'status': true,
      'position': [-0.139, -0.284],
      'stands': [
        {
          'position': [0.021, 0.084],
          'description': 'Jump throw',
          'videoId': '3VOsZQUXGns'
        },
        {
          'position': [-0.338, 0.114],
          'description': 'Crouch jump throw',
          'videoId': 'nAf3E48gz6g'
        },
        {
          'position': [-0.148, 0.207],
          'description': 'Jump throw',
          'videoId': 'RkM6ned5m-E'
        },
        {
          'position': [-0.100, -0.034],
          'description': 'Left click',
          'videoId': 'uFue_uo1CHE'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'A Donut',
      'name': 'smoke',
      'status': true,
      'position': [-0.192, -0.165],
      'stands': [
        {
          'position': [-0.338, 0.114],
          'description': 'W crouch jump throw',
          'videoId': 'q0L_U2hb_P0'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'Tripple box',
      'name': 'molotov',
      'status': true,
      'position': [-0.148, -0.234],
      'stands': [
        {
          'position': [-0.328, -0.128],
          'description': 'Run throw',
          'videoId': 'wjVRjVzl9Ws'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'A site',
      'name': 'flash',
      'status': true,
      'position': [-0.260, -0.196],
      'stands': [
        {
          'position': [-0.275, 0.004],
          'description': 'Left click',
          'videoId': 'tFfSapoMu2o'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'A site',
      'name': 'flash',
      'status': true,
      'position': [-0.354, -0.186],
      'stands': [
        {
          'position': [-0.317, -0.111],
          'description': 'Run throw',
          'videoId': 'ue3UhQl2NK0'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'A site',
      'name': 'flash',
      'status': true,
      'position': [-0.363, -0.259],
      'stands': [
        {
          'position': [-0.317, -0.111],
          'description': 'Run throw',
          'videoId': 'XtJ-kVTbjiY'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'Elbow',
      'name': 'smoke',
      'status': false,
      'position': [-0.113, 0.077],
      'stands': [
        {
          'position': [0.098, -0.256],
          'description': 'Jump throw',
          'videoId': 'MpMA6yPIUhQ'
        },
        {
          'position': [0.059, -0.418],
          'description': 'Walk jump throw',
          'videoId': 'zYZlytYrVuo'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'Mid',
      'name': 'flash',
      'status': false,
      'position': [0.014, -0.056],
      'stands': [
        {
          'position': [0.103, -0.236],
          'description': 'Left click',
          'videoId': 'vyBA7_na9x4'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'Mid',
      'name': 'flash',
      'status': false,
      'position': [-0.037, -0.117],
      'stands': [
        {
          'position': [-0.206, -0.217],
          'description': 'Run jump throw',
          'videoId': '9hchrjl2DAY'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'Elbow',
      'name': 'molotov',
      'status': false,
      'position': [-0.105, 0.073],
      'stands': [
        {
          'position': [-0.022, -0.162],
          'description': 'Run throw',
          'videoId': 'Qkvi-cwmNUM'
        },
        {
          'position': [0.050, -0.030],
          'description': 'Left click',
          'videoId': 'EAp0dOVpASs'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'Cave',
      'name': 'smoke',
      'status': false,
      'position': [0.187, -0.115],
      'stands': [
        {
          'position': [0.275, -0.265],
          'description': 'Left right click jump throw',
          'videoId': '68WYcyzuHaI'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'Cave',
      'name': 'smoke',
      'status': false,
      'position': [0.308, -0.041],
      'stands': [
        {
          'position': [0.275, -0.265],
          'description': 'Left right click jump throw',
          'videoId': 'PUps-AeMzE8'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'Doors',
      'name': 'smoke',
      'status': false,
      'position': [0.284, 0.110],
      'stands': [
        {
          'position': [0.034, -0.417],
          'description': 'Left right click jump throw',
          'videoId': 'cUsKsbHyZyg'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'Ramp',
      'name': 'molotov',
      'status': false,
      'position': [0.323, 0.012],
      'stands': [
        {
          'position': [0.191, -0.234],
          'description': 'Jump throw',
          'videoId': 'ZpJgMtgHovE'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'Default',
      'name': 'molotov',
      'status': false,
      'position': [0.246, -0.076],
      'stands': [
        {
          'position': [0.277, -0.265],
          'description': 'Left right click jump throw',
          'videoId': 'FGphiDOt4Mg'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'Ramp',
      'name': 'flash',
      'status': false,
      'position': [0.327, -0.049],
      'stands': [
        {
          'position': [0.337, -0.180],
          'description': 'Left right click jump throw',
          'videoId': 'GbxdJ2h_VpI'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'B site',
      'name': 'flash',
      'status': false,
      'position': [0.263, -0.197],
      'stands': [
        {
          'position': [0.017, -0.306],
          'description': 'Run jump throw',
          'videoId': 'XoNd8hYYYfk'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'A main',
      'name': 'smoke',
      'status': false,
      'position': [-0.327, -0.131],
      'stands': [
        {
          'position': [0.059, -0.418],
          'description': 'Jump throw',
          'videoId': 'Dowv2uyH-os'
        },
        {
          'position': [-0.313, -0.289],
          'description': 'Left right click',
          'videoId': '_PfREZJyV1A'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'A Site',
      'name': 'molotov',
      'status': false,
      'position': [-0.187, -0.231],
      'stands': [
        {
          'position': [-0.049, -0.303],
          'description': 'Left right click',
          'videoId': 'SlWDiu5Lmwo'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'A Main',
      'name': 'flash',
      'status': false,
      'position': [-0.338, -0.264],
      'stands': [
        {
          'position': [-0.312, -0.289],
          'description': 'Left click',
          'videoId': '7zYc0Jdya00'
        },
      ],
    },
    {
      'location': 'ancient',
      'description': 'A Main',
      'name': 'flash',
      'status': false,
      'position': [-0.153, -0.204],
      'stands': [
        {
          'position': [-0.016, -0.009],
          'description': 'Run jump throw',
          'videoId': 'u_yVqX0WsfQ'
        },
      ],
    },
    //ANUBIS
    {
      'location': 'anubis',
      'description': 'House',
      'name': 'smoke',
      'status': true,
      'position': [0.007, -0.024],
      'stands': [
        {
          'position': [0.046, 0.449],
          'description': 'Jump throw',
          'videoId': 'kk8GUkQwIi4'
        },
        {
          'position': [-0.105, 0.243],
          'description': 'Left click',
          'videoId': 'nm7peiBkapo'
        },
        {
          'position': [0.040, 0.197],
          'description': 'Run throw',
          'videoId': '3M4gal7xPGI'
        },
        {
          'position': [-0.015, 0.444],
          'description': 'Jump throw',
          'videoId': 'nmDVUQcRs3c'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'Ct mid',
      'name': 'smoke',
      'status': true,
      'position': [0.042, -0.170],
      'stands': [
        {
          'position': [-0.062, 0.212],
          'description': 'Jump throw',
          'videoId': 'PvGp0yed3h8'
        },
        {
          'position': [0.010, -0.018],
          'description': 'Run throw',
          'videoId': '-ZeJqnPTt-Q'
        },
        {
          'position': [0.000, 0.202],
          'description': 'Jump throw',
          'videoId': 'KSq0QNoWtf4'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'B mid connector',
      'name': 'smoke',
      'status': true,
      'position': [-0.056, 0.103],
      'stands': [
        {
          'position': [0.040, 0.448],
          'description': 'Jump throw',
          'videoId': '6U30gEbtFDw'
        },
        {
          'position': [0.180, 0.264],
          'description': 'Jump throw',
          'videoId': 'IWhvIFEQZYs'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'House',
      'name': 'molotov',
      'status': true,
      'position': [0.009, -0.020],
      'stands': [
        {
          'position': [-0.077, 0.190],
          'description': 'Left click',
          'videoId': 'KbKjBz7pkHo'
        },
        {
          'position': [-0.135, 0.286],
          'description': 'Run throw',
          'videoId': 'H8dLrzTqxak'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'Mid doors',
      'name': 'molotov',
      'status': true,
      'position': [0.069, 0.013],
      'stands': [
        {
          'position': [-0.122, 0.236],
          'description': 'Run jump throw',
          'videoId': 'Y-DkKO1m3qE'
        },
        {
          'position': [0.300, 0.031],
          'description': 'Jump throw',
          'videoId': 'hePUfn41D5E'
        },
        {
          'position': [-0.021, 0.145],
          'description': 'Left click',
          'videoId': 'KVfenQfqgAE'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'Bridge',
      'name': 'flash',
      'status': true,
      'position': [0.002, 0.024],
      'stands': [
        {
          'position': [-0.057, 0.206],
          'description': 'Left click',
          'videoId': 'e1ka3t7AKX0'
        },
        {
          'position': [0.067, 0.254],
          'description': 'W Jump throw',
          'videoId': '-UwJlQrDE1I'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'Mid',
      'name': 'flash',
      'status': true,
      'position': [0.068, -0.032],
      'stands': [
        {
          'position': [-0.017, 0.198],
          'description': 'Run jump throw',
          'videoId': 'iHkbo3U66tM'
        },
        {
          'position': [0.222, 0.217],
          'description': 'Run Jump throw',
          'videoId': 'ADZ4rPs3Ryg'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'Street',
      'name': 'smoke',
      'status': true,
      'position': [-0.207, -0.073],
      'stands': [
        {
          'position': [-0.235, 0.203],
          'description': 'Left click',
          'videoId': 'VHWTKAprTFo'
        },
        {
          'position': [-0.213, 0.181],
          'description': 'Crouch left click',
          'videoId': 'AF242DKU2a4'
        },
        {
          'position': [-0.189, 0.208],
          'description': 'Left click',
          'videoId': 'ZmgSo_J4lOc'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'Left B site',
      'name': 'smoke',
      'status': true,
      'position': [-0.206, -0.022],
      'stands': [
        {
          'position': [-0.241, 0.154],
          'description': 'Left right jump throw',
          'videoId': 'K21VwstLmUk'
        },
        {
          'position': [-0.207, 0.187],
          'description': 'Jump throw',
          'videoId': 'cd12u4H5kA8'
        },
        {
          'position': [-0.152, 0.375],
          'description': 'Jump throw',
          'videoId': 'GI9y0_shBSk'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'Right B site',
      'name': 'smoke',
      'status': true,
      'position': [-0.140, 0.012],
      'stands': [
        {
          'position': [-0.241, 0.152],
          'description': 'Left right jump throw',
          'videoId': 'V92ledrLRvc'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'Palace',
      'name': 'smoke',
      'status': true,
      'position': [-0.150, -0.083],
      'stands': [
        {
          'position': [-0.217, 0.215],
          'description': 'Left click',
          'videoId': 'IfrDiGBEcq0'
        },
        {
          'position': [-0.185, 0.209],
          'description': 'Left click',
          'videoId': '5h0jqsJJhRc'
        },
        {
          'position': [-0.163, 0.324],
          'description': 'Jump throw',
          'videoId': '1FvWbSvv0Fk'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'B connector',
      'name': 'smoke',
      'status': true,
      'position': [-0.132, 0.059],
      'stands': [
        {
          'position': [-0.172, 0.172],
          'description': 'Left click',
          'videoId': 'RiOU9e9W8Z8'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'Ninja',
      'name': 'molotov',
      'status': true,
      'position': [-0.101, 0.013],
      'stands': [
        {
          'position': [-0.106, 0.062],
          'description': 'Run throw',
          'videoId': 'Zhe3LL4wcVo'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'B connector',
      'name': 'molotov',
      'status': true,
      'position': [-0.145, 0.059],
      'stands': [
        {
          'position': [-0.217, 0.139],
          'description': 'Jump throw',
          'videoId': 'aaz46VwcGxM'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'B connector',
      'name': 'molotov',
      'status': true,
      'position': [-0.105, 0.072],
      'stands': [
        {
          'position': [-0.043, 0.072],
          'description': 'Run throw',
          'videoId': 'FVyHlNZmNNM'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'B site',
      'name': 'flash',
      'status': true,
      'position': [-0.251, -0.022],
      'stands': [
        {
          'position': [-0.276, 0.101],
          'description': 'Left click',
          'videoId': 'nyZ4dY-X_go'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'B site',
      'name': 'flash',
      'status': true,
      'position': [-0.251, -0.022],
      'stands': [
        {
          'position': [-0.276, 0.101],
          'description': 'Left click',
          'videoId': 'nyZ4dY-X_go'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'B site',
      'name': 'flash',
      'status': true,
      'position': [-0.187, 0.029],
      'stands': [
        {
          'position': [-0.186, 0.211],
          'description': 'Left click',
          'videoId': 'TlnevHHAywQ'
        },
        {
          'position': [-0.242, 0.154],
          'description': 'Left click',
          'videoId': 'hi76FIG5kZ0'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'B Connector',
      'name': 'flash',
      'status': true,
      'position': [-0.093, 0.103],
      'stands': [
        {
          'position': [0.155, 0.074],
          'description': 'Run throw',
          'videoId': '-f2rmtfbKDs'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'Plateau',
      'name': 'smoke',
      'status': true,
      'position': [0.173, -0.184],
      'stands': [
        {
          'position': [0.238, 0.008],
          'description': 'Left click',
          'videoId': 'mKp5vz9SzJY'
        },
        {
          'position': [0.248, 0.027],
          'description': 'Jump throw',
          'videoId': 'ONnHc1GnuNg'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'Heaven',
      'name': 'smoke',
      'status': true,
      'position': [0.212, -0.284],
      'stands': [
        {
          'position': [0.183, 0.093],
          'description': 'Jump throw',
          'videoId': '4tguudviiv0'
        },
        {
          'position': [0.271, 0.101],
          'description': 'Jump throw',
          'videoId': 'RJP7tjiIjIQ'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'A connector',
      'name': 'smoke',
      'status': true,
      'position': [0.134, -0.122],
      'stands': [
        {
          'position': [0.254, 0.017],
          'description': 'Left click',
          'videoId': '2lqPYz2iEAw'
        },
        {
          'position': [0.269, 0.019],
          'description': 'Left click',
          'videoId': 'X84TvY9GK3k'
        },
        {
          'position': [0.178, 0.134],
          'description': 'Jump throw',
          'videoId': 'og-ayfaLUSo'
        },
        {
          'position': [0.219, 0.216],
          'description': 'Jump throw',
          'videoId': 'nRRKyGZ0XJY'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'Plateau',
      'name': 'molotov',
      'status': true,
      'position': [0.173, -0.186],
      'stands': [
        {
          'position': [0.237, 0.006],
          'description': 'Jump throw',
          'videoId': '3OXjH2osSGI'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'Heaven',
      'name': 'molotov',
      'status': true,
      'position': [0.211, -0.284],
      'stands': [
        {
          'position': [0.258, 0.026],
          'description': 'Run throw',
          'videoId': 'v7thduLdHPY'
        },
        {
          'position': [0.165, 0.024],
          'description': 'Run jump throw',
          'videoId': '4jb5jdm_gHc'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'Fountain',
      'name': 'molotov',
      'status': true,
      'position': [0.340, -0.228],
      'stands': [
        {
          'position': [0.313, -0.046],
          'description': 'Run throw',
          'videoId': 'AtmhiuLIWpM'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'A site',
      'name': 'molotov',
      'status': true,
      'position': [0.230, -0.253],
      'stands': [
        {
          'position': [0.262, 0.023],
          'description': 'Run throw',
          'videoId': 'HnNgJRsjceY'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'A site',
      'name': 'molotov',
      'status': true,
      'position': [0.153, -0.123],
      'stands': [
        {
          'position': [0.262, 0.023],
          'description': 'Run throw',
          'videoId': 'AAclyPZFDEY'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'Fountain',
      'name': 'flash',
      'status': true,
      'position': [0.324, -0.237],
      'stands': [
        {
          'position': [0.322, -0.070],
          'description': 'Run throw',
          'videoId': 'kHC7k-_kdnY'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'A site',
      'name': 'flash',
      'status': true,
      'position': [0.245, -0.168],
      'stands': [
        {
          'position': [0.237, 0.007],
          'description': 'Left click',
          'videoId': '32HYa_xJSjI'
        },
        {
          'position': [0.164, 0.025],
          'description': 'Jump throw',
          'videoId': 'jTLdzs0nyis'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'A Main',
      'name': 'flash',
      'status': true,
      'position': [0.329, -0.052],
      'stands': [
        {
          'position': [0.281, 0.173],
          'description': 'Jump throw',
          'videoId': 'sUphdefMZVI'
        },
        {
          'position': [0.165, 0.022],
          'description': 'Crouch throw',
          'videoId': 'k9P7jzudrW0'
        },
        {
          'position': [0.272, 0.100],
          'description': 'Left click',
          'videoId': 'qTxrmHE9vU8'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'Stairs',
      'name': 'smoke',
      'status': false,
      'position': [0.172, 0.144],
      'stands': [
        {
          'position': [-0.092, -0.304],
          'description': 'Jump throw',
          'videoId': 'TGsfJD9SmKI'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'Bridge',
      'name': 'smoke',
      'status': false,
      'position': [0.001, 0.096],
      'stands': [
        {
          'position': [0.062, -0.047],
          'description': 'Run throw',
          'videoId': 'Mcd3YnlxuLQ'
        },
        {
          'position': [-0.024, -0.326],
          'description': 'Jump throw',
          'videoId': 'x-o-FiLw8-o'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'Water',
      'name': 'flash',
      'status': false,
      'position': [0.065, 0.079],
      'stands': [
        {
          'position': [0.089, 0.014],
          'description': 'Run throw',
          'videoId': 'SryGDINS6FM'
        },
        {
          'position': [0.056, -0.026],
          'description': 'Run right click jump throw',
          'videoId': '_HN0isbog_M'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'Water',
      'name': 'flash',
      'status': false,
      'position': [-0.045, 0.077],
      'stands': [
        {
          'position': [-0.150, 0.048],
          'description': 'Run throw',
          'videoId': 'qan9qcXuJh8'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'Top Mid',
      'name': 'flash',
      'status': false,
      'position': [0.048, 0.143],
      'stands': [
        {
          'position': [0.062, -0.033],
          'description': 'Left click',
          'videoId': '-Eh9QnUqfJI'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'B main',
      'name': 'smoke',
      'status': false,
      'position': [-0.264, 0.052],
      'stands': [
        {
          'position': [-0.183, -0.151],
          'description': 'Left click',
          'videoId': 'CmqlP5xCU4A'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'B Site',
      'name': 'molotov',
      'status': false,
      'position': [-0.188, 0.012],
      'stands': [
        {
          'position': [-0.190, -0.210],
          'description': 'Left click',
          'videoId': 'Hoj_5pCPzbs'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'B main',
      'name': 'flash',
      'status': false,
      'position': [-0.287, 0.099],
      'stands': [
        {
          'position': [-0.135, -0.052],
          'description': 'Left click',
          'videoId': '3NbPaE3F9yo'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'B main',
      'name': 'flash',
      'status': false,
      'position': [-0.224, 0.127],
      'stands': [
        {
          'position': [-0.135, -0.052],
          'description': 'Jump throw',
          'videoId': 'ErQOO7vPhPU'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'Upper',
      'name': 'smoke',
      'status': false,
      'position': [0.265, 0.024],
      'stands': [
        {
          'position': [0.166, -0.137],
          'description': 'Left click',
          'videoId': '2wXwCUep7FI'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'Upper',
      'name': 'molotov',
      'status': false,
      'position': [0.265, 0.024],
      'stands': [
        {
          'position': [0.166, -0.137],
          'description': 'Left click',
          'videoId': 'oQHWQF0p2i0'
        },
      ],
    },
    {
      'location': 'anubis',
      'description': 'A main',
      'name': 'smoke',
      'status': false,
      'position': [0.250, -0.039],
      'stands': [
        {
          'position': [-0.088, -0.303],
          'description': 'Jump throw',
          'videoId': 'Yvgzodq95p8'
        },
      ],
    },
    //DUST 2
    {
      'location': 'dust2',
      'description': 'Cross',
      'name': 'smoke',
      'status': true,
      'position': [0.312, -0.257],
      'stands': [
        {
          'position': [0.227, -0.015],
          'description': 'Jump throw',
          'videoId': 'c8q1BjtHNXU'
        },
      ],
    },
    {
      'location': 'dust2',
      'description': 'A Short',
      'name': 'smoke',
      'status': true,
      'position': [0.161, -0.258],
      'stands': [
        {
          'position': [0.156, -0.135],
          'description': 'Left click',
          'videoId': 'rCcywBSA6_0'
        },
      ],
    },
    {
      'location': 'dust2',
      'description': 'A Site',
      'name': 'molotov',
      'status': true,
      'position': [0.314, -0.338],
      'stands': [
        {
          'position': [0.110, -0.198],
          'description': 'Left click',
          'videoId': 'NxtnUAKCXVs'
        },
        {
          'position': [0.440, 0.057],
          'description': '1 step jump throw',
          'videoId': 'Xt2TN39M1VY'
        },
      ],
    },
    {
      'location': 'dust2',
      'description': 'B Doors',
      'name': 'smoke',
      'status': true,
      'position': [-0.238, -0.271],
      'stands': [
        {
          'position': [-0.239, 0.111],
          'description': 'Jump throw',
          'videoId': 'zfnZazt65YU'
        },
        {
          'position': [-0.347, -0.009],
          'description': 'Left click',
          'videoId': 'sonGX2WJhvs'
        },
      ],
    },
    {
      'location': 'dust2',
      'description': 'B plat',
      'name': 'molotov',
      'status': false,
      'position': [-0.407, -0.458],
      'stands': [
        {
          'position': [-0.186, -0.241],
          'description': 'Jump throw',
          'videoId': 'NopKPVlxwoE'
        },
      ],
    },
    {
      'location': 'dust2',
      'description': 'Long door',
      'name': 'flash',
      'status': false,
      'position': [0.296, -0.052],
      'stands': [
        {
          'position': [0.411, -0.213],
          'description': 'Left click',
          'videoId': 'zcG8yYmDFWc'
        },
      ],
    },
    {
      'location': 'dust2',
      'description': 'B Site',
      'name': 'flash',
      'status': true,
      'position': [-0.348, -0.240],
      'stands': [
        {
          'position': [-0.355, 0.001],
          'description': 'Jump throw',
          'videoId': 'oTNrGFKgXNg'
        },
        {
          'position': [-0.319, 0.023],
          'description': 'Left click',
          'videoId': 'xq4x6rsM6_Y'
        },
      ],
    },
    {
      'location': 'dust2',
      'description': 'B Site',
      'name': 'molotov',
      'status': false,
      'position': [-0.289, -0.378],
      'stands': [
        {
          'position': [-0.231, -0.341],
          'description': 'Jump throw',
          'videoId': 'NF7Z3bitLjM'
        },
      ],
    },
    {
      'location': 'dust2',
      'description': 'B tunnel',
      'name': 'smoke',
      'status': false,
      'position': [-0.388, -0.157],
      'stands': [
        {
          'position': [-0.201, -0.379],
          'description': 'left click',
          'videoId': 'CHm5ao4dizo'
        },
      ],
    },
    {
      'location': 'dust2',
      'description': 'B window',
      'name': 'smoke',
      'status': true,
      'position': [-0.247, -0.368],
      'stands': [
        {
          'position': [-0.246, 0.115],
          'description': 'Jump throw',
          'videoId': 'BLeN-35Kqz4'
        },
      ],
    },
    {
      'location': 'dust2',
      'description': 'Car',
      'name': 'molotov',
      'status': true,
      'position': [0.434, -0.225],
      'stands': [
        {
          'position': [0.234, 0.042],
          'description': 'W jump throw',
          'videoId': 'AayOJl74-ag'
        },
      ],
    },
    {
      'location': 'dust2',
      'description': 'Ct',
      'name': 'smoke',
      'status': true,
      'position': [0.186, -0.265],
      'stands': [
        {
          'position': [-0.094, 0.113],
          'description': 'Jump throw',
          'videoId': '7BrGDS13oak'
        },
      ],
    },
    {
      'location': 'dust2',
      'description': 'Goose',
      'name': 'molotov',
      'status': true,
      'position': [0.297, -0.435],
      'stands': [
        {
          'position': [0.146, -0.208],
          'description': 'Left click',
          'videoId': '2fzrxtK525Y'
        },
      ],
    },
    {
      'location': 'dust2',
      'description': 'Long corner',
      'name': 'smoke',
      'status': true,
      'position': [0.334, -0.033],
      'stands': [
        {
          'position': [0.048, 0.370],
          'description': 'Jump throw',
          'videoId': '5kIHS3KJGXw'
        },
      ],
    },
    {
      'location': 'dust2',
      'description': 'Long doors',
      'name': 'smoke',
      'status': false,
      'position': [0.192, 0.057],
      'stands': [
        {
          'position': [0.441, -0.259],
          'description': 'Jump throw',
          'videoId': 'cDjuh8df6Dg'
        },
        {
          'position': [0.214, -0.298],
          'description': 'Jump throw',
          'videoId': 'PvST-ZaYPbY'
        },
      ],
    },
    {
      'location': 'dust2',
      'description': 'Long',
      'name': 'flash',
      'status': true,
      'position': [0.290, 0.084],
      'stands': [
        {
          'position': [0.128, 0.308],
          'description': 'Jump throw',
          'videoId': '8P-EC4aruQ8'
        },
      ],
    },
    {
      'location': 'dust2',
      'description': 'Long',
      'name': 'flash',
      'status': true,
      'position': [0.193, 0.025],
      'stands': [
        {
          'position': [0.195, 0.262],
          'description': 'Left click',
          'videoId': '9fvoOaLB4HM'
        },
      ],
    },
    {
      'location': 'dust2',
      'description': 'Long corner',
      'name': 'flash',
      'status': false,
      'position': [0.382, -0.030],
      'stands': [
        {
          'position': [0.331, -0.223],
          'description': 'Left click',
          'videoId': '2lMD8nzxew0'
        },
      ],
    },
    {
      'location': 'dust2',
      'description': 'Blue',
      'name': 'flash',
      'status': false,
      'position': [0.229, -0.023],
      'stands': [
        {
          'position': [0.408, -0.229],
          'description': 'Jump throw',
          'videoId': 'RpYUyzy8Zvo'
        },
      ],
    },
    {
      'location': 'dust2',
      'description': 'Mid cross',
      'name': 'smoke',
      'status': false,
      'position': [-0.048, -0.268],
      'stands': [
        {
          'position': [0.102, -0.291],
          'description': 'Left click',
          'videoId': 'hOxVEsZDEYU'
        },
      ],
    },
    {
      'location': 'dust2',
      'description': 'Xbox',
      'name': 'smoke',
      'status': true,
      'position': [-0.022, -0.096],
      'stands': [
        {
          'position': [-0.204, 0.378],
          'description': 'Jump throw',
          'videoId': 'SrnkbuJUCN8'
        },
        {
          'position': [-0.058, 0.369],
          'description': 'Jump throw',
          'videoId': 'T7o02RP7mRU'
        },
      ],
    },
    {
      'location': 'dust2',
      'description': 'Mid doors',
      'name': 'smoke',
      'status': true,
      'position': [-0.044, -0.140],
      'stands': [
        {
          'position': [-0.059, -0.127],
          'description': 'Left right click',
          'videoId': '5SsWtJ2-H7Q'
        },
      ],
    },
    {
      'location': 'dust2',
      'description': 'Mid',
      'name': 'smoke',
      'status': false,
      'position': [-0.037, -0.047],
      'stands': [
        {
          'position': [-0.005, -0.283],
          'description': 'Left click',
          'videoId': 'VH1ts0bxPm0'
        },
      ],
    },
    {
      'location': 'dust2',
      'description': 'Mid to B',
      'name': 'smoke',
      'status': true,
      'position': [0.009, -0.254],
      'stands': [
        {
          'position': [0.202, 0.302],
          'description': 'Run Jump throw',
          'videoId': '2z7vJajQrUk'
        },
        {
          'position': [-0.013, -0.079],
          'description': 'Left click',
          'videoId': '7dkQ_OMQIx4'
        },
        {
          'position': [-0.013, -0.056],
          'description': 'Jump throw',
          'videoId': 'BIg-myPPsZo'
        },
      ],
    },
    {
      'location': 'dust2',
      'description': 'Short',
      'name': 'flash',
      'status': false,
      'position': [0.125, -0.215],
      'stands': [
        {
          'position': [0.351, -0.368],
          'description': 'Run throw',
          'videoId': 'XQhKBK0bHGk'
        },
      ],
    },
    {
      'location': 'dust2',
      'description': 'Short',
      'name': 'flash',
      'status': true,
      'position': [0.124, -0.192],
      'stands': [
        {
          'position': [-0.069, -0.089],
          'description': 'Jump throw',
          'videoId': 'yfeNhZM8kWA'
        },
      ],
    },
    {
      'location': 'dust2',
      'description': 'A Short',
      'name': 'smoke',
      'status': true,
      'position': [0.161, -0.258],
      'stands': [
        {
          'position': [0.156, -0.135],
          'description': 'Left click',
          'videoId': 'rCcywBSA6_0'
        },
      ],
    },
    //INFERNO
    {
      'location': 'inferno',
      'description': 'CT',
      'name': 'smoke',
      'status': true,
      'position': [0.108, -0.270],
      'stands': [
        {
          'position': [-0.252, 0.181],
          'description': 'Walk jump throw',
          'videoId': 'mW4XdLmCe7M'
        },
        {
          'position': [-0.004, -0.076],
          'description': 'Left click',
          'videoId': '2FBD_En3OPU'
        },
        {
          'position': [-0.032, -0.045],
          'description': 'Left click',
          'videoId': 'wmEaR_qOXQg'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'Deep CT',
      'name': 'smoke',
      'status': true,
      'position': [0.211, -0.286],
      'stands': [
        {
          'position': [0.010, -0.130],
          'description': 'Left click',
          'videoId': 'ya7QUSC-B4U'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'Coffins',
      'name': 'smoke',
      'status': true,
      'position': [0.008, -0.348],
      'stands': [
        {
          'position': [-0.004, -0.082],
          'description': 'Left click',
          'videoId': 'cHsS7jzpRfs'
        },
        {
          'position': [-0.032, -0.045],
          'description': 'Left click',
          'videoId': 'IlF-XOKzp1g'
        },
        {
          'position': [-0.203, 0.184],
          'description': 'Run jump throw',
          'videoId': 'fptkVxsSqhQ'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'Deep Coffins',
      'name': 'smoke',
      'status': true,
      'position': [0.012, -0.398],
      'stands': [
        {
          'position': [-0.028, -0.046],
          'description': 'Left click',
          'videoId': '3_B9NZB9mFw'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'Quad',
      'name': 'molotov',
      'status': true,
      'position': [-0.071, -0.239],
      'stands': [
        {
          'position': [0.013, -0.129],
          'description': 'Left click',
          'videoId': '34ONKJKCrFU'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'Dark',
      'name': 'molotov',
      'status': true,
      'position': [-0.073, -0.356],
      'stands': [
        {
          'position': [-0.003, -0.094],
          'description': 'Left click',
          'videoId': 'q1a8KVdKgiw'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'Coffins',
      'name': 'molotov',
      'status': true,
      'position': [0.015, -0.345],
      'stands': [
        {
          'position': [0.000, -0.080],
          'description': 'Jump throw',
          'videoId': '9UJZtX_9pTU'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'Banana',
      'name': 'flash',
      'status': true,
      'position': [-0.069, -0.002],
      'stands': [
        {
          'position': [-0.206, 0.174],
          'description': 'Jump throw',
          'videoId': 'FSOQoEOQXno'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'Top Banana',
      'name': 'flash',
      'status': true,
      'position': [0.000, -0.107],
      'stands': [
        {
          'position': [-0.066, 0.070],
          'description': 'Crouch left click',
          'videoId': 'tw2yNQHzED0'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'B Site',
      'name': 'flash',
      'status': true,
      'position': [0.028, -0.266],
      'stands': [
        {
          'position': [0.022, -0.106],
          'description': 'Run left right click jump throw',
          'videoId': 'vavJJXEOhts'
        },
        {
          'position': [-0.009, -0.062],
          'description': 'Left click',
          'videoId': 'ZEBlVXjAVDE'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'Short',
      'name': 'smoke',
      'status': true,
      'position': [0.195, 0.215],
      'stands': [
        {
          'position': [0.064, 0.257],
          'description': 'Left right click jump throw',
          'videoId': '_gTedZRXwjg'
        },
        {
          'position': [0.034, 0.321],
          'description': 'Left right click jump throw',
          'videoId': 'zeN5uHYJYgM'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'Pit',
      'name': 'smoke',
      'status': true,
      'position': [0.347, 0.258],
      'stands': [
        {
          'position': [0.048, 0.284],
          'description': 'Left click',
          'videoId': 'dc9P7Aps2_c'
        },
        {
          'position': [-0.034, 0.284],
          'description': 'Jump throw',
          'videoId': 'E7KXTqjlNUg'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'Moto',
      'name': 'smoke',
      'status': true,
      'position': [0.371, 0.097],
      'stands': [
        {
          'position': [-0.018, 0.328],
          'description': 'Jump throw',
          'videoId': '-IUoC_BiW50'
        },
        {
          'position': [0.026, 0.175],
          'description': 'Jump throw',
          'videoId': 'aUhtIFZD8vw'
        },
        {
          'position': [0.120, 0.179],
          'description': 'Jump throw',
          'videoId': 'mgN4UQxodfo'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'Long',
      'name': 'smoke',
      'status': true,
      'position': [0.195, 0.125],
      'stands': [
        {
          'position': [0.064, 0.256],
          'description': 'Left click',
          'videoId': '3zeGk24nK7k'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'Long',
      'name': 'smoke',
      'status': true,
      'position': [0.204, 0.076],
      'stands': [
        {
          'position': [-0.135, 0.320],
          'description': 'Jump throw',
          'videoId': 'YBHWZlo2Moo'
        },
        {
          'position': [-0.024, 0.325],
          'description': 'Jump throw',
          'videoId': '_5_wBy61B2M'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'Library',
      'name': 'smoke',
      'status': true,
      'position': [0.331, 0.046],
      'stands': [
        {
          'position': [0.006, 0.176],
          'description': 'Jump throw',
          'videoId': 'asQTDOY4Chg'
        },
        {
          'position': [0.218, 0.089],
          'description': 'Jump throw',
          'videoId': 'XJzJoZvj5FA'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'Car assist',
      'name': 'smoke',
      'status': true,
      'position': [0.311, 0.288],
      'stands': [
        {
          'position': [-0.026, 0.127],
          'description': 'Jump throw',
          'videoId': 'WHtSyYpfY1U'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'Long corner',
      'name': 'molotov',
      'status': true,
      'position': [0.192, 0.035],
      'stands': [
        {
          'position': [0.155, 0.182],
          'description': 'Left click',
          'videoId': 'yPz54fYWHMQ'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'Pit',
      'name': 'molotov',
      'status': true,
      'position': [0.418, 0.299],
      'stands': [
        {
          'position': [0.257, 0.334],
          'description': 'Crouch throw',
          'videoId': 'pb7FbTofNFk'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'Top mid',
      'name': 'flash',
      'status': true,
      'position': [0.178, 0.159],
      'stands': [
        {
          'position': [-0.030, 0.175],
          'description': 'Left click',
          'videoId': '1ndS7tgWsho'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'A Site',
      'name': 'flash',
      'status': true,
      'position': [0.353, 0.355],
      'stands': [
        {
          'position': [0.243, 0.336],
          'description': 'Left click',
          'videoId': '2ijw-Emk_5A'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'Bedroom',
      'name': 'molotov',
      'status': true,
      'position': [0.150, 0.270],
      'stands': [
        {
          'position': [-0.175, 0.279],
          'description': 'Run jump throw',
          'videoId': 'DJsboozK7og'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'Mid',
      'name': 'smoke',
      'status': false,
      'position': [0.155, 0.170],
      'stands': [
        {
          'position': [0.419, -0.188],
          'description': 'Jump throw',
          'videoId': '3o-JZWm8XeI'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'T ramp',
      'name': 'smoke',
      'status': false,
      'position': [-0.070, 0.106],
      'stands': [
        {
          'position': [0.419, -0.188],
          'description': 'Run jump throw',
          'videoId': 'BYfyhfTdFGQ'
        },
        {
          'position': [0.353, -0.111],
          'description': 'Run jump throw',
          'videoId': 'Eoj5rX186ds'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'Deep banana',
      'name': 'smoke',
      'status': false,
      'position': [-0.060, 0.062],
      'stands': [
        {
          'position': [0.202, -0.321],
          'description': 'Jump throw',
          'videoId': 'Wk1i_4ofaHE'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'Banana',
      'name': 'smoke',
      'status': false,
      'position': [0.072, -0.197],
      'stands': [
        {
          'position': [-0.002, -0.443],
          'description': 'Left click',
          'videoId': 'mO8R1VSI-xM'
        },
        {
          'position': [0.136, -0.279],
          'description': 'Left click',
          'videoId': 'zn7uD4eUjqU'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'Car',
      'name': 'molotov',
      'status': false,
      'position': [0.017, -0.138],
      'stands': [
        {
          'position': [0.022, -0.235],
          'description': 'Left click',
          'videoId': 'vd4A9aX-WVs'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'B Site Default',
      'name': 'molotov',
      'status': false,
      'position': [0.024, -0.316],
      'stands': [
        {
          'position': [0.202, -0.323],
          'description': 'Jump throw',
          'videoId': 'S5fPWMUarxU'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'Top banana',
      'name': 'flash',
      'status': false,
      'position': [0.038, -0.146],
      'stands': [
        {
          'position': [0.023, -0.349],
          'description': 'Left click',
          'videoId': 'dqTivm39ibY'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'Banana',
      'name': 'flash',
      'status': false,
      'position': [-0.012, -0.160],
      'stands': [
        {
          'position': [0.146, -0.286],
          'description': 'Left click',
          'videoId': 'SBRABh8RDj8'
        },
        {
          'position': [0.111, -0.281],
          'description': 'Left right click jump throw',
          'videoId': 'UGcPSJrLVX0'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'Top Banana',
      'name': 'flash',
      'status': false,
      'position': [0.020, -0.323],
      'stands': [
        {
          'position': [0.022, -0.393],
          'description': 'Ritgh click jump throw',
          'videoId': '1zgjOrP-SPA'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'A Site',
      'name': 'smoke',
      'status': false,
      'position': [0.304, 0.224],
      'stands': [
        {
          'position': [0.421, -0.196],
          'description': 'Jump throw',
          'videoId': 'KyB7Nl2e698'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'Short',
      'name': 'molotov',
      'status': false,
      'position': [0.205, 0.258],
      'stands': [
        {
          'position': [0.437, 0.307],
          'description': 'Run throw',
          'videoId': 'qtGhrqbpBK0'
        },
        {
          'position': [0.325, 0.210],
          'description': 'Left click',
          'videoId': 'YQVJ5XBd9Hk'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'Aps',
      'name': 'molotov',
      'status': false,
      'position': [0.292, 0.325],
      'stands': [
        {
          'position': [0.437, 0.307],
          'description': 'Crouch left click',
          'videoId': 'vu4dABefiMM'
        },
        {
          'position': [0.348, 0.175],
          'description': 'Left click',
          'videoId': 'Po2rGhnikCo'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'A Site Default',
      'name': 'molotov',
      'status': false,
      'position': [0.332, 0.227],
      'stands': [
        {
          'position': [0.330, 0.028],
          'description': 'W left right click jump throw',
          'videoId': 'U_EWH5A_A_k'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'Second mid',
      'name': 'flash',
      'status': false,
      'position': [0.072, 0.305],
      'stands': [
        {
          'position': [0.215, 0.106],
          'description': 'Jump throw',
          'videoId': 'VEpxc3Gh_lY'
        },
        {
          'position': [0.309, 0.275],
          'description': 'Run jump throw',
          'videoId': '0buuYd7NtWs'
        },
      ],
    },
    {
      'location': 'inferno',
      'description': 'Mid',
      'name': 'flash',
      'status': false,
      'position': [0.147, 0.168],
      'stands': [
        {
          'position': [0.175, 0.116],
          'description': 'Left click',
          'videoId': 'V4fLh-xMQgM'
        },
        {
          'position': [0.216, 0.219],
          'description': 'Left click',
          'videoId': 'cRNGHYCWDtc'
        },
      ],
    },
    //MIRAGE
    {
      'location': 'mirage',
      'description': 'Mid window',
      'name': 'smoke',
      'status': true,
      'position': [-0.117, -0.056],
      'stands': [
        {
          'position': [0.452, -0.156],
          'description': 'Crouch walk jump throw',
          'videoId': 'gztCjs7cQrk'
        },
        {
          'position': [0.240, -0.045],
          'description': 'Run throw',
          'videoId': 'Un__T9R0cJ0'
        },
        {
          'position': [0.449, -0.196],
          'description': 'Hold D (right) jump throw',
          'videoId': 'wGXViUgqnEk'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'B Site window',
      'name': 'smoke',
      'status': true,
      'position': [-0.288, -0.135],
      'stands': [
        {
          'position': [0.101, -0.384],
          'description': 'Jump throw',
          'videoId': 'f0XgNob0K8U'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'B Site',
      'name': 'flash',
      'status': false,
      'position': [-0.273, -0.144],
      'stands': [
        {
          'position': [-0.329, -0.083],
          'description': 'Left click',
          'videoId': '_8A0zciATHI'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Under wood',
      'name': 'molotov',
      'status': true,
      'position': [0.152, 0.251],
      'stands': [
        {
          'position': [0.269, 0.301],
          'description': 'Run throw',
          'videoId': 'frdDySr8ydE'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Top mid',
      'name': 'smoke',
      'status': true,
      'position': [0.167, -0.093],
      'stands': [
        {
          'position': [0.450, -0.195],
          'description': 'Left click',
          'videoId': 'J9X_dYMY2fg'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Top mid',
      'name': 'flash',
      'status': false,
      'position': [0.164, 0.011],
      'stands': [
        {
          'position': [0.042, 0.322],
          'description': 'Running jump throw',
          'videoId': 'jdljUiGuGl0'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Mid',
      'name': 'flash',
      'status': false,
      'position': [0.042, -0.123],
      'stands': [
        {
          'position': [-0.073, -0.253],
          'description': 'Left click',
          'videoId': '2Apn23y9pB8'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Top connector',
      'name': 'smoke',
      'status': true,
      'position': [-0.009, 0.097],
      'stands': [
        {
          'position': [0.405, 0.060],
          'description': 'Jump throw',
          'videoId': 'ED3xJSK6cPQ'
        },
        {
          'position': [0.189, -0.221],
          'description': 'Jump throw',
          'videoId': 'WqHbqcU7qns'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Tetris',
      'name': 'molotov',
      'status': false,
      'position': [0.114, 0.142],
      'stands': [
        {
          'position': [-0.106, 0.144],
          'description': 'Left click',
          'videoId': 'PAnc7i43pZA'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Stairs',
      'name': 'smoke',
      'status': true,
      'position': [0.038, 0.154],
      'stands': [
        {
          'position': [0.392, 0.067],
          'description': 'Left click',
          'videoId': 'VLudY7u_wd8'
        },
        {
          'position': [0.337, 0.039],
          'description': 'Jump throw',
          'videoId': 'EydBeY-zMhY'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Short',
      'name': 'smoke',
      'status': true,
      'position': [-0.047, -0.151],
      'stands': [
        {
          'position': [0.218, -0.037],
          'description': 'Left click',
          'videoId': 'ODl5YgqJizk'
        },
        {
          'position': [0.449, -0.138],
          'description': 'Jump throw',
          'videoId': 'oFOgFDcgsnU'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Short',
      'name': 'smoke',
      'status': true,
      'position': [-0.050, -0.192],
      'stands': [
        {
          'position': [0.447, -0.131],
          'description': 'Jump throw',
          'videoId': 'r1HN1oAo43s'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Sandwich',
      'name': 'molotov',
      'status': true,
      'position': [0.063, 0.152],
      'stands': [
        {
          'position': [0.320, 0.082],
          'description': 'Left click',
          'videoId': 'MspnEcMdsJc'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Ramp',
      'name': 'smoke',
      'status': false,
      'position': [0.191, 0.141],
      'stands': [
        {
          'position': [-0.065, 0.321],
          'description': 'Left click',
          'videoId': 'LGv0HEOJnYM'
        },
        {
          'position': [-0.121, 0.126],
          'description': 'Left click',
          'videoId': 'NQkCZ-AexsE'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Ramp',
      'name': 'molotov',
      'status': false,
      'position': [0.191, 0.141],
      'stands': [
        {
          'position': [-0.040, 0.301],
          'description': 'Left click',
          'videoId': 'FXibnJNQhPA'
        },
        {
          'position': [-0.108, 0.142],
          'description': 'Left click',
          'videoId': '9H0bNDVp9D0'
        },
        {
          'position': [-0.073, 0.332],
          'description': 'Run throw',
          'videoId': 'tf4bjAGvauY'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Ramp',
      'name': 'flash',
      'status': false,
      'position': [0.140, 0.152],
      'stands': [
        {
          'position': [0.166, 0.234],
          'description': 'Jump throw',
          'videoId': '3C_OiTXoNhA'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Ramp',
      'name': 'flash',
      'status': false,
      'position': [0.203, 0.148],
      'stands': [
        {
          'position': [0.014, 0.273],
          'description': 'Left click',
          'videoId': 'GlH6I0X0NHo'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Palace',
      'name': 'smoke',
      'status': false,
      'position': [0.150, 0.292],
      'stands': [
        {
          'position': [-0.041, 0.098],
          'description': 'Left click',
          'videoId': 'dD3G8eGH3JQ'
        },
        {
          'position': [-0.238, 0.078],
          'description': 'Jump throw',
          'videoId': '6AJhUxXVAH4'
        },
        {
          'position': [-0.064, -0.182],
          'description': 'Jump throw',
          'videoId': '2dT-tQWt5Mk'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Palace',
      'name': 'molotov',
      'status': false,
      'position': [0.150, 0.292],
      'stands': [
        {
          'position': [-0.025, 0.099],
          'description': 'Left click',
          'videoId': '3ladxaNjwiw'
        },
        {
          'position': [0.165, 0.261],
          'description': 'Run throw',
          'videoId': 'k42AoHBG-fI'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Mid',
      'name': 'flash',
      'status': false,
      'position': [-0.027, -0.027],
      'stands': [
        {
          'position': [-0.039, 0.080],
          'description': 'Left click',
          'videoId': 'mzoFTNOqK-o'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Mid',
      'name': 'flash',
      'status': false,
      'position': [-0.096, -0.049],
      'stands': [
        {
          'position': [-0.127, -0.001],
          'description': 'Left click',
          'videoId': 'aPYWX07bcos'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Lamp A Site',
      'name': 'flash',
      'status': true,
      'position': [0.179, 0.116],
      'stands': [
        {
          'position': [0.320, 0.039],
          'description': 'Left click',
          'videoId': 'Vd4ddEFYY3M'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'palace A Site',
      'name': 'flash',
      'status': true,
      'position': [0.125, 0.275],
      'stands': [
        {
          'position': [0.214, 0.284],
          'description': 'Left click',
          'videoId': '2VYU4eWZ8pQ'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Jungle',
      'name': 'molotov',
      'status': true,
      'position': [-0.132, 0.108],
      'stands': [
        {
          'position': [0.173, 0.184],
          'description': 'Run throw',
          'videoId': 'T7Gi6XwD2Us'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Jungle connector',
      'name': 'smoke',
      'status': true,
      'position': [-0.011, 0.163],
      'stands': [
        {
          'position': [0.311, 0.134],
          'description': 'Left click',
          'videoId': 'scpyqKXat3c'
        },
        {
          'position': [0.331, 0.039],
          'description': 'Jump throw',
          'videoId': 'swrEFf721vU'
        },
        {
          'position': [0.142, 0.330],
          'description': 'Run throw',
          'videoId': 'fA2WVyAX-YQ'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Deep top mid',
      'name': 'smoke',
      'status': true,
      'position': [0.116, -0.091],
      'stands': [
        {
          'position': [0.449, -0.205],
          'description': 'Left click',
          'videoId': 'x7UWLNJXhiE'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Deep Aps',
      'name': 'molotov',
      'status': false,
      'position': [-0.115, -0.352],
      'stands': [
        {
          'position': [-0.324, -0.283],
          'description': 'Left click',
          'videoId': 'MIxqw4qwBgg'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Ct smoke',
      'name': 'smoke',
      'status': true,
      'position': [-0.058, 0.330],
      'stands': [
        {
          'position': [0.413, -0.046],
          'description': 'Jump throw',
          'videoId': 'ASEglGdgK4c'
        },
        {
          'position': [0.324, 0.037],
          'description': 'Jump throw',
          'videoId': 'IPCkZ4SXMbU'
        },
        {
          'position': [0.170, 0.329],
          'description': 'Run jump throw',
          'videoId': '86wxfzxSYTM'
        },
        {
          'position': [0.375, 0.032],
          'description': 'Jump throw',
          'videoId': 'aSDwf1RGsfw'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Connector',
      'name': 'smoke',
      'status': true,
      'position': [-0.011, 0.001],
      'stands': [
        {
          'position': [0.383, -0.334],
          'description': 'Jump throw',
          'videoId': 'QttEbb14dII'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Connector',
      'name': 'flash',
      'status': true,
      'position': [-0.013, -0.009],
      'stands': [
        {
          'position': [0.213, -0.054],
          'description': 'Left click',
          'videoId': 'veSXhX-s6rk'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Balk and car',
      'name': 'molotov',
      'status': true,
      'position': [-0.331, -0.361],
      'stands': [
        {
          'position': [-0.163, -0.342],
          'description': 'Left click',
          'videoId': '_hTxZNTv4WE'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Bench',
      'name': 'molotov',
      'status': true,
      'position': [-0.429, -0.270],
      'stands': [
        {
          'position': [-0.193, -0.349],
          'description': 'Left click',
          'videoId': 'Qk5qJ2QwGlc'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'B Site',
      'name': 'flash',
      'status': true,
      'position': [-0.218, -0.307],
      'stands': [
        {
          'position': [0.032, -0.330],
          'description': 'Jump throw',
          'videoId': 'wqAQ83JqnmE'
        },
        {
          'position': [-0.107, -0.330],
          'description': 'Run throw',
          'videoId': 'WIBWkMbY26k'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Arches right',
      'name': 'smoke',
      'status': true,
      'position': [-0.184, -0.231],
      'stands': [
        {
          'position': [0.244, -0.340],
          'description': 'Jump throw',
          'videoId': 'gJgH1NkfC6M'
        },
        {
          'position': [-0.025, -0.308],
          'description': 'Jump throw',
          'videoId': '84qQDY1KOGA'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Arches left',
      'name': 'smoke',
      'status': true,
      'position': [-0.185, -0.293],
      'stands': [
        {
          'position': [0.244, -0.322],
          'description': 'Jump throw',
          'videoId': 'XYX7BWl_DGA'
        },
        {
          'position': [-0.019, -0.323],
          'description': 'Left click',
          'videoId': 'b9O4Nbgmxjw'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Door B Site',
      'name': 'smoke',
      'status': true,
      'position': [-0.378, -0.136],
      'stands': [
        {
          'position': [0.099, -0.321],
          'description': 'Jump throw',
          'videoId': 'U88vjWj2PL8'
        },
        {
          'position': [0.099, -0.384],
          'description': 'Jump throw',
          'videoId': 'oDiUToR7w3U'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'B Aps',
      'name': 'smoke',
      'status': false,
      'position': [-0.231, -0.359],
      'stands': [
        {
          'position': [-0.214, 0.073],
          'description': 'Jump throw',
          'videoId': 'PC7-I4H_7W0'
        },
        {
          'position': [-0.372, -0.367],
          'description': 'Crouch throw',
          'videoId': 's82YJhn_sPo'
        },
        {
          'position': [-0.312, -0.140],
          'description': 'Left click',
          'videoId': 'ehmHvPpLfLw'
        },
        {
          'position': [-0.394, -0.164],
          'description': 'Left click',
          'videoId': '6Jgf-nMYbhk'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Arches right',
      'name': 'smoke',
      'status': false,
      'position': [-0.191, -0.229],
      'stands': [
        {
          'position': [-0.182, 0.008],
          'description': 'Jump throw',
          'videoId': 'iGdXv9mp0kA'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Arches left',
      'name': 'smoke',
      'status': false,
      'position': [-0.187, -0.291],
      'stands': [
        {
          'position': [-0.225, 0.053],
          'description': 'Jump throw',
          'videoId': 'TGuJvfd6L18'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'B Aps',
      'name': 'molotov',
      'status': false,
      'position': [-0.252, -0.356],
      'stands': [
        {
          'position': [-0.372, -0.367],
          'description': 'Crouch throw',
          'videoId': 'v6HxFNS5PPY'
        },
        {
          'position': [-0.185, -0.277],
          'description': 'Left click',
          'videoId': 'Xe77Cr9XGSc'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Sandwitch',
      'name': 'molotov',
      'status': false,
      'position': [0.065, 0.154],
      'stands': [
        {
          'position': [-0.069, 0.370],
          'description': 'Left click',
          'videoId': 'm-upBc5T0QA'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'Ninja',
      'name': 'molotov',
      'status': false,
      'position': [0.095, 0.327],
      'stands': [
        {
          'position': [-0.170, 0.303],
          'description': 'Jump throw',
          'videoId': 'y0NFkpgOk7w'
        },
      ],
    },
    {
      'location': 'mirage',
      'description': 'A Site',
      'name': 'flash',
      'status': true,
      'position': [-0.014, 0.116],
      'stands': [
        {
          'position': [0.041, -0.116],
          'description': 'Jump throw',
          'videoId': 'IfnX1rM7Z18'
        },
      ],
    },
    //NUKE
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
    {
      'location': 'nuke',
      'description': 'Ramp',
      'name': 'flash',
      'status': true,
      'position': [-0.001, 0.061],
      'stands': [
        {
          'position': [-0.061, 0.155],
          'description': 'Left click',
          'videoId': 'T7M6fJsj1us'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'Third outside',
      'name': 'smoke',
      'status': true,
      'position': [0.117, 0.391],
      'stands': [
        {
          'position': [-0.189, 0.204],
          'description': 'Jump throw',
          'videoId': 'ghRVMbMXLPk'
        },
        {
          'position': [-0.038, 0.363],
          'description': 'Left click',
          'videoId': 'FOzrUYa1WGQ'
        },
        {
          'position': [-0.173, 0.231],
          'description': 'Jump throw',
          'videoId': 'r3vhbubhzqc'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'Second outside',
      'name': 'smoke',
      'status': true,
      'position': [0.090, 0.392],
      'stands': [
        {
          'position': [-0.225, 0.240],
          'description': 'Jump throw',
          'videoId': 'tT6kWqEj4Zo'
        },
        {
          'position': [-0.055, 0.339],
          'description': 'Left click',
          'videoId': 'nz_HX3KLi_M'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'Main cross',
      'name': 'smoke',
      'status': true,
      'position': [0.098, 0.314],
      'stands': [
        {
          'position': [-0.085, 0.349],
          'description': 'Jump throw',
          'videoId': 's7-qi8YmfO8'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'Blue cross',
      'name': 'smoke',
      'status': true,
      'position': [0.127, 0.311],
      'stands': [
        {
          'position': [-0.037, 0.364],
          'description': 'Left click',
          'videoId': 'D6ofE1mFwUs'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'Main cross',
      'name': 'smoke',
      'status': true,
      'position': [0.162, 0.348],
      'stands': [
        {
          'position': [-0.054, 0.353],
          'description': 'Left click',
          'videoId': 'QDg8PIKS0Iw'
        },
        {
          'position': [-0.093, 0.277],
          'description': 'Left click',
          'videoId': 'xdKtSO1L3kQ'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'First outside',
      'name': 'smoke',
      'status': true,
      'position': [0.016, 0.377],
      'stands': [
        {
          'position': [-0.104, 0.298],
          'description': 'Run throw',
          'videoId': 'wieQjZQg-No'
        },
        {
          'position': [-0.205, 0.241],
          'description': 'Jump throw',
          'videoId': 'mSX4QL8ZcS4'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'Secret',
      'name': 'molotov',
      'status': true,
      'position': [0.159, 0.418],
      'stands': [
        {
          'position': [-0.019, 0.362],
          'description': 'Left click',
          'videoId': 'bA5K5QHTn_k'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'Red',
      'name': 'molotov',
      'status': true,
      'position': [0.056, 0.377],
      'stands': [
        {
          'position': [-0.097, 0.323],
          'description': 'Left click',
          'videoId': '0eHsjKTtkkM'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'Outside',
      'name': 'flash',
      'status': true,
      'position': [0.053, 0.374],
      'stands': [
        {
          'position': [-0.103, 0.306],
          'description': 'Run throw',
          'videoId': 'Iz0etrWjiSs'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'Heaven',
      'name': 'smoke',
      'status': true,
      'position': [0.118, 0.128],
      'stands': [
        {
          'position': [-0.026, 0.275],
          'description': 'Left click',
          'videoId': 'bG2iecjo4yM'
        },
        {
          'position': [-0.046, 0.266],
          'description': 'Left click',
          'videoId': 'XjvR6y_bKO0'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'Door',
      'name': 'smoke',
      'status': true,
      'position': [0.035, 0.261],
      'stands': [
        {
          'position': [-0.165, 0.209],
          'description': 'Jump throw',
          'videoId': 'SeaesQrr94w'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'Left b site',
      'name': 'smoke',
      'status': false,
      'position': [-0.259, -0.229],
      'stands': [
        {
          'position': [-0.264, -0.312],
          'description': 'Left click',
          'videoId': 'x0q9A-IPdSA'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'Right b site',
      'name': 'smoke',
      'status': false,
      'position': [-0.298, -0.223],
      'stands': [
        {
          'position': [-0.292, -0.313],
          'description': 'Left click',
          'videoId': 'XRaHTiapfgQ'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'Top hut',
      'name': 'molotov',
      'status': true,
      'position': [0.014, 0.223],
      'stands': [
        {
          'position': [0.264, -0.134],
          'description': 'Left click',
          'videoId': 'U0hRHI3L9pw'
        },
        {
          'position': [0.188, -0.112],
          'description': 'Running jump throw',
          'videoId': 'rpcM-KmZOlU'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'A Site',
      'name': 'flash',
      'status': true,
      'position': [0.049, 0.249],
      'stands': [
        {
          'position': [0.189, -0.112],
          'description': 'Running jump throw',
          'videoId': '0XMz8xJjHv4'
        },
        {
          'position': [0.264, -0.155],
          'description': 'Run throw',
          'videoId': 'M5cni6tYibQ'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'A Site',
      'name': 'flash',
      'status': true,
      'position': [0.060, 0.169],
      'stands': [
        {
          'position': [0.262, -0.155],
          'description': 'Left click',
          'videoId': 'orP0rRHyJd4'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'A Site',
      'name': 'flash',
      'status': true,
      'position': [0.031, 0.194],
      'stands': [
        {
          'position': [-0.013, 0.230],
          'description': 'Run throw',
          'videoId': 'zzr_G3SxKZY'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'Main',
      'name': 'smoke',
      'status': true,
      'position': [0.051, 0.295],
      'stands': [
        {
          'position': [0.246, -0.237],
          'description': 'Left right click jump throw',
          'videoId': '4WYqd-Yg2Uw'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'Ramp',
      'name': 'smoke',
      'status': false,
      'position': [-0.017, 0.088],
      'stands': [
        {
          'position': [0.061, -0.010],
          'description': 'Left click',
          'videoId': 'geVgRZBRzrc'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'Trophy',
      'name': 'molotov',
      'status': false,
      'position': [-0.018, 0.114],
      'stands': [
        {
          'position': [0.052, -0.016],
          'description': 'Left click',
          'videoId': 'Lblf4-c9nmc'
        },
        {
          'position': [0.053, 0.059],
          'description': 'Run throw',
          'videoId': 'Vy7U2MO0JHA'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'Outside cross',
      'name': 'smoke',
      'status': false,
      'position': [0.059, 0.355],
      'stands': [
        {
          'position': [0.145, 0.260],
          'description': 'Run throw',
          'videoId': '-h5VmHllLCY'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'Control',
      'name': 'smoke',
      'status': false,
      'position': [-0.228, -0.224],
      'stands': [
        {
          'position': [0.032, -0.050],
          'description': 'Left click',
          'videoId': 'MbUXAo4h67M'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'Dark',
      'name': 'molotov',
      'status': false,
      'position': [-0.245, -0.238],
      'stands': [
        {
          'position': [-0.252, -0.302],
          'description': 'Left right click',
          'videoId': 'o1XtRQyLxpI'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'Blue site',
      'name': 'molotov',
      'status': false,
      'position': [-0.254, -0.113],
      'stands': [
        {
          'position': [-0.252, -0.302],
          'description': 'Run throw',
          'videoId': 'CfnuuDY-J5w'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'Vent',
      'name': 'flash',
      'status': false,
      'position': [-0.301, -0.090],
      'stands': [
        {
          'position': [0.044, 0.230],
          'description': 'Jump throw',
          'videoId': 'w5lU_6VMqjc'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'Hut',
      'name': 'smoke',
      'status': false,
      'position': [0.015, 0.198],
      'stands': [
        {
          'position': [0.137, 0.118],
          'description': 'Left click',
          'videoId': 'YkApTVE0p7k'
        },
        {
          'position': [0.098, 0.116],
          'description': 'Left right click',
          'videoId': 'n2RaaU-YXkI'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'Hut',
      'name': 'molotov',
      'status': false,
      'position': [0.008, 0.224],
      'stands': [
        {
          'position': [0.110, 0.116],
          'description': 'Left click',
          'videoId': 'MvKzC7tFuBw'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'Door',
      'name': 'molotov',
      'status': false,
      'position': [0.014, 0.261],
      'stands': [
        {
          'position': [0.106, 0.127],
          'description': 'Run throw',
          'videoId': 'sG_EXKQ6dW8'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'Outside',
      'name': 'molotov',
      'status': false,
      'position': [-0.013, 0.388],
      'stands': [
        {
          'position': [0.207, 0.254],
          'description': 'Running jump throw',
          'videoId': 'BaHodXqcmTE'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'Ramp',
      'name': 'flash',
      'status': false,
      'position': [-0.011, 0.053],
      'stands': [
        {
          'position': [0.041, 0.026],
          'description': 'Left click',
          'videoId': 'ybWn_zIaP_4'
        },
        {
          'position': [0.046, -0.058],
          'description': 'Left click',
          'videoId': 'tKQP7a47ZJI'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'Outside',
      'name': 'flash',
      'status': false,
      'position': [0.158, 0.368],
      'stands': [
        {
          'position': [0.145, 0.254],
          'description': 'Run thorw',
          'videoId': 'rsWQ52klVwc'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'Outside',
      'name': 'flash',
      'status': false,
      'position': [0.062, 0.414],
      'stands': [
        {
          'position': [0.140, 0.255],
          'description': 'Run thorw',
          'videoId': '4ulAGGJWhuI'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'Outside',
      'name': 'flash',
      'status': false,
      'position': [0.048, 0.312],
      'stands': [
        {
          'position': [0.082, 0.169],
          'description': 'Jump thorw',
          'videoId': 'eQcBTBSgIkM'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'A site',
      'name': 'flash',
      'status': false,
      'position': [0.085, 0.127],
      'stands': [
        {
          'position': [0.131, 0.116],
          'description': 'Left click',
          'videoId': '6wK6FozB_Pw'
        },
        {
          'position': [0.132, 0.136],
          'description': 'Left click',
          'videoId': '2Ixql3oyj2g'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'A Site Blue box',
      'name': 'molotov',
      'status': false,
      'position': [0.019, 0.125],
      'stands': [
        {
          'position': [0.135, 0.135],
          'description': 'Left click',
          'videoId': 'S-EijUqvBTU'
        },
      ],
    },
    {
      'location': 'nuke',
      'description': 'A Site Drop',
      'name': 'molotov',
      'status': false,
      'position': [0.088, 0.126],
      'stands': [
        {
          'position': [0.135, 0.135],
          'description': 'Left click',
          'videoId': '803DEyZin00'
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
        {
          'position': [-0.033, -0.002],
          'description': 'Jump throw',
          'videoId': 'U2AXbIk9qhI'
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
      'description': 'A site',
      'name': 'flash',
      'status': true,
      'position': [-0.009, -0.262],
      'stands': [
        {
          'position': [-0.029, -0.043],
          'description': 'Jump throw',
          'videoId': 'y0atcvinFso'
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Long',
      'name': 'flash',
      'status': true,
      'position': [-0.297, 0.054],
      'stands': [
        {
          'position': [-0.137, 0.329],
          'description': 'Run throw',
          'videoId': 'friVNZYXcgs'
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
      'description': 'Banana',
      'name': 'smoke',
      'status': false,
      'position': [-0.058, -0.173],
      'stands': [
        {
          'position': [0.074, -0.411],
          'description': 'Left right click jump throw',
          'videoId': 'F21GfBbeFUc'
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Toilets',
      'name': 'smoke',
      'status': false,
      'position': [-0.097, -0.160],
      'stands': [
        {
          'position': [0.006, -0.412],
          'description': 'Left right click jump throw',
          'videoId': 'kXdW5w_R3Dw'
        },
        {
          'position': [0.074, -0.411],
          'description': 'Left right click jump throw',
          'videoId': 'l9bdFFoaFp4'
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Long',
      'name': 'smoke',
      'status': false,
      'position': [-0.161, -0.278],
      'stands': [
        {
          'position': [0.076, -0.394],
          'description': 'Left right click jump throw',
          'videoId': 'Y2itK8Lsrj8'
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'Short',
      'name': 'smoke',
      'status': false,
      'position': [0.228, -0.094],
      'stands': [
        {
          'position': [0.050, -0.214],
          'description': 'Left click',
          'videoId': '3WmZKG-WVIA'
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'A site',
      'name': 'flash',
      'status': false,
      'position': [0.043, -0.300],
      'stands': [
        {
          'position': [0.076, -0.412],
          'description': 'Left right click jump throw',
          'videoId': 'uJzGB-G29Uk'
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'A site',
      'name': 'flash',
      'status': false,
      'position': [-0.029, -0.321],
      'stands': [
        {
          'position': [-0.098, -0.465],
          'description': 'Left click',
          'videoId': 'NW7jqP737HU'
        },
      ],
    },
    {
      'location': 'overpass',
      'description': 'B site',
      'name': 'flash',
      'status': false,
      'position': [0.191, -0.123],
      'stands': [
        {
          'position': [0.173, 0.026],
          'description': 'Left click',
          'videoId': '_rAJIbqMF3k'
        },
        {
          'position': [0.033, -0.202],
          'description': 'Jump throw',
          'videoId': 'qhoqYMvsxjU'
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
    //TRAIN
    {
      'location': 'train',
      'description': 'Connector',
      'name': 'smoke',
      'status': true,
      'position': [0.115, 0.105],
      'stands': [
        {
          'position': [-0.307, -0.338],
          'description': 'Jump Throw',
          'videoId': 'RxGtwdFdv5Q'
        },
        {
          'position': [-0.044, -0.405],
          'description': 'Jump Throw',
          'videoId': '8ix4nWV1e7c'
        },
        {
          'position': [0.052, -0.387],
          'description': 'Jump Throw',
          'videoId': 'WZDJlfHutIU'
        },
        {
          'position': [-0.272, -0.334],
          'description': 'Jump Throw',
          'videoId': '3olQ-HYFoLk'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'B Connector',
      'name': 'smoke',
      'status': true,
      'position': [0.217, 0.196],
      'stands': [
        {
          'position': [-0.054, -0.316],
          'description': 'Jump Throw',
          'videoId': 'AsZxfCJIqKI'
        },
        {
          'position': [-0.103, 0.143],
          'description': 'Crouch Throw',
          'videoId': 'n678ysih1HE'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'Camera',
      'name': 'smoke',
      'status': true,
      'position': [0.241, -0.024],
      'stands': [
        {
          'position': [-0.119, 0.159],
          'description': 'Throw',
          'videoId': 'ZYu_X5e2sfI'
        },
        {
          'position': [-0.308, -0.337],
          'description': 'Jump Throw',
          'videoId': 'uxJ2v04CWRg'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'Short',
      'name': 'smoke',
      'status': true,
      'position': [0.030, 0.231],
      'stands': [
        {
          'position': [-0.195, 0.305],
          'description': 'Jump Throw',
          'videoId': 'QrZq6U97ELA'
        },
        {
          'position': [-0.222, 0.197],
          'description': 'Crouch Throw',
          'videoId': 'vMyp8swnlRE'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'Pop dog',
      'name': 'smoke',
      'status': true,
      'position': [-0.048, 0.099],
      'stands': [
        {
          'position': [-0.033, -0.317],
          'description': 'Throw',
          'videoId': 'nQpZn_3Zw2Y'
        },
        {
          'position': [0.051, -0.386],
          'description': 'Jump Throw',
          'videoId': 'gDwc8vD0QuU'
        },
        {
          'position': [-0.045, -0.404],
          'description': 'Jump Throw',
          'videoId': 'iQR6If6QOcE'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'Red and wall',
      'name': 'smoke',
      'status': true,
      'position': [-0.045, -0.026],
      'stands': [
        {
          'position': [-0.035, -0.315],
          'description': 'Throw',
          'videoId': 'zS95f0de8j8'
        },
        {
          'position': [-0.044, -0.406],
          'description': 'Jump Throw',
          'videoId': 'w-zhBAFSrtc'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'Main',
      'name': 'smoke',
      'status': true,
      'position': [0.008, -0.086],
      'stands': [
        {
          'position': [-0.074, -0.360],
          'description': 'Throw',
          'videoId': 'cp6b4Ng1wtQ'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'Sandwich',
      'name': 'smoke',
      'status': true,
      'position': [0.125, -0.108],
      'stands': [
        {
          'position': [-0.143, -0.293],
          'description': 'Throw',
          'videoId': 'oU9_TgQoabI'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'Sandwich',
      'name': 'smoke',
      'status': true,
      'position': [0.106, -0.075],
      'stands': [
        {
          'position': [-0.143, -0.293],
          'description': 'Jump Throw',
          'videoId': '3e6999EijHI'
        },
        {
          'position': [-0.370, -0.335],
          'description': 'Crouch Jump Throw',
          'videoId': 'f_PnFj79a-c'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'Sandwich',
      'name': 'smoke',
      'status': true,
      'position': [-0.044, 0.413],
      'stands': [
        {
          'position': [-0.097, 0.422],
          'description': 'Throw',
          'videoId': 'd5LZNU3fkwY'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'Ivy',
      'name': 'molotov',
      'status': true,
      'position': [0.320, -0.136],
      'stands': [
        {
          'position': [0.342, -0.374],
          'description': 'Run Throw',
          'videoId': 'tm3mj_N303A'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'E box',
      'name': 'molotov',
      'status': true,
      'position': [0.031, 0.017],
      'stands': [
        {
          'position': [-0.071, 0.112],
          'description': 'Crouch Throw',
          'videoId': 'uthOK0Fwrak'
        },
        {
          'position': [-0.152, -0.121],
          'description': 'Run Jump Throw',
          'videoId': 'd6qom_7uqnE'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'A2/Ivy',
      'name': 'molotov',
      'status': true,
      'position': [0.248, -0.111],
      'stands': [
        {
          'position': [-0.060, -0.131],
          'description': 'Jump Throw',
          'videoId': 'I3Z5qpjrwNQ'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'Back site a',
      'name': 'molotov',
      'status': true,
      'position': [0.208, 0.044],
      'stands': [
        {
          'position': [-0.089, -0.098],
          'description': 'Run Throw',
          'videoId': 'jBBU_NJSZlU'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'Blue train',
      'name': 'molotov',
      'status': true,
      'position': [0.032, 0.266],
      'stands': [
        {
          'position': [-0.204, 0.266],
          'description': 'Throw',
          'videoId': 'edsGYTsL4cg'
        },
        {
          'position': [-0.222, 0.305],
          'description': 'Throw',
          'videoId': 'mrw9zZa5Byo'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'Ladder',
      'name': 'molotov',
      'status': true,
      'position': [-0.008, 0.389],
      'stands': [
        {
          'position': [-0.096, 0.420],
          'description': 'Crouch Throw',
          'videoId': 'xrSa0nwEpV4'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'e box',
      'name': 'flash',
      'status': true,
      'position': [0.031, 0.039],
      'stands': [
        {
          'position': [-0.072, 0.114],
          'description': 'Crouch Left Right Throw',
          'videoId': 'iHkE7iCkh5A'
        },
        {
          'position': [-0.121, 0.082],
          'description': 'Throw',
          'videoId': 'X3nwGAv_KJM'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'A site',
      'name': 'flash',
      'status': true,
      'position': [-0.014, -0.091],
      'stands': [
        {
          'position': [-0.091, -0.336],
          'description': 'Jump Throw',
          'videoId': '9N6LRbpOE84'
        },
        {
          'position': [-0.143, -0.293],
          'description': 'Jump Throw',
          'videoId': 'AlFjmmR20xo'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'Ivy',
      'name': 'flash',
      'status': true,
      'position': [0.322, -0.141],
      'stands': [
        {
          'position': [0.343, -0.375],
          'description': 'Run Throw',
          'videoId': 'Y5ZNBT1yMqY'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'Hall',
      'name': 'flash',
      'status': true,
      'position': [-0.180, 0.224],
      'stands': [
        {
          'position': [-0.162, -0.158],
          'description': 'Run Throw',
          'videoId': '87r024WLOY4'
        },
        {
          'position': [-0.180, -0.060],
          'description': 'Run Right Throw',
          'videoId': '-_Z3EQRJjaI'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'Ivy',
      'name': 'flash',
      'status': true,
      'position': [-0.026, -0.025],
      'stands': [
        {
          'position': [-0.154, -0.131],
          'description': 'Jump Throw',
          'videoId': 'S_FBj_FAfl4'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'B site',
      'name': 'flash',
      'status': true,
      'position': [-0.011, 0.233],
      'stands': [
        {
          'position': [-0.191, 0.306],
          'description': 'Left Right Jump Throw',
          'videoId': 'tYJ8wf_eSeQ'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'B site',
      'name': 'flash',
      'status': true,
      'position': [-0.056, 0.257],
      'stands': [
        {
          'position': [-0.221, 0.250],
          'description': 'Throw',
          'videoId': 'yHf501nR0jE'
        },
        {
          'position': [-0.194, 0.284],
          'description': 'Left Right Jump Throw',
          'videoId': 'T8KbsuhCymg'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'Ladder',
      'name': 'flash',
      'status': true,
      'position': [-0.028, 0.399],
      'stands': [
        {
          'position': [-0.098, 0.421],
          'description': 'Throw',
          'videoId': 'gpVm50Due_0'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'Long halls',
      'name': 'smoke',
      'status': false,
      'position': [-0.177, 0.067],
      'stands': [
        {
          'position': [0.103, 0.189],
          'description': 'Left Right Jump Throw',
          'videoId': 'gDnGwPQxRZM'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'Deep main',
      'name': 'smoke',
      'status': false,
      'position': [-0.139, -0.116],
      'stands': [
        {
          'position': [0.476, 0.278],
          'description': 'Run Jump Throw',
          'videoId': '7s6HSl6Kwpg'
        },
        {
          'position': [0.298, 0.072],
          'description': 'Jump Throw',
          'videoId': 'niVyVFDX104'
        },
        {
          'position': [0.222, 0.071],
          'description': 'Jump Throw',
          'videoId': 'ZdcvnNwtcRU'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'Main',
      'name': 'smoke',
      'status': false,
      'position': [-0.063, -0.090],
      'stands': [
        {
          'position': [0.476, 0.278],
          'description': 'Walk Jump Throw',
          'videoId': 'c1Ex2WYuL-c'
        },
        {
          'position': [0.401, -0.122],
          'description': 'Run Throw',
          'videoId': 'KIH_0nUs3_8'
        },
        {
          'position': [0.222, 0.072],
          'description': 'Throw',
          'videoId': '4y-1_p2FYQ8'
        },
        {
          'position': [0.230, 0.182],
          'description': 'Jump Throw',
          'videoId': 'VHT62Ul91sI'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'Upper',
      'name': 'smoke',
      'status': false,
      'position': [-0.070, 0.430],
      'stands': [
        {
          'position': [0.288, 0.211],
          'description': 'Jump Throw',
          'videoId': '22yA6KuE1zA'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'Stairs',
      'name': 'smoke',
      'status': false,
      'position': [-0.078, 0.225],
      'stands': [
        {
          'position': [0.288, 0.211],
          'description': 'Throw',
          'videoId': 'InapKSQahXo'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'Stairs',
      'name': 'smoke',
      'status': false,
      'position': [-0.047, 0.089],
      'stands': [
        {
          'position': [0.115, 0.069],
          'description': 'Throw',
          'videoId': 'koTqtvU7zh4'
        },
        {
          'position': [0.167, -0.158],
          'description': 'Jump Throw',
          'videoId': 'Gx2VUjlpyvM'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'Ivy',
      'name': 'molotov',
      'status': false,
      'position': [0.318, -0.128],
      'stands': [
        {
          'position': [0.091, 0.153],
          'description': 'Run Throw',
          'videoId': '2b2n64gHdFI'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'B default',
      'name': 'molotov',
      'status': false,
      'position': [-0.038, 0.327],
      'stands': [
        {
          'position': [0.308, 0.211],
          'description': 'Run Throw',
          'videoId': '7TPP74LQ08I'
        },
        {
          'position': [0.247, 0.438],
          'description': 'Throw',
          'videoId': 'h5LXANziE_A'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'Main',
      'name': 'molotov',
      'status': false,
      'position': [-0.118, -0.095],
      'stands': [
        {
          'position': [0.108, 0.102],
          'description': 'Jump Throw',
          'videoId': 'w0rOO82jg14'
        },
        {
          'position': [0.135, 0.157],
          'description': 'Run Jump Throw',
          'videoId': '08SfZA-GnHo'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'E box',
      'name': 'molotov',
      'status': false,
      'position': [-0.009, 0.016],
      'stands': [
        {
          'position': [0.181, 0.188],
          'description': 'Walk Jump Throw',
          'videoId': 'ZgMFbXbSrBI'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'Pop dog',
      'name': 'molotov',
      'status': false,
      'position': [-0.049, 0.101],
      'stands': [
        {
          'position': [0.167, -0.158],
          'description': 'Jump Throw',
          'videoId': 'd0dnlQr4cng'
        },
        {
          'position': [0.223, 0.068],
          'description': 'Jump Throw',
          'videoId': '6o6E1rCObAY'
        },
        {
          'position': [0.158, 0.019],
          'description': 'Throw',
          'videoId': 'MdvEu-NVe10'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'Main',
      'name': 'flash',
      'status': false,
      'position': [-0.070, -0.092],
      'stands': [
        {
          'position': [0.112, 0.067],
          'description': 'Jump Throw',
          'videoId': 'NKq5_G4jEMQ'
        },
        {
          'position': [0.116, 0.104],
          'description': 'Run Throw',
          'videoId': 'O74pBISGgOQ'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'Sandwich',
      'name': 'flash',
      'status': false,
      'position': [0.124, -0.100],
      'stands': [
        {
          'position': [0.110, 0.108],
          'description': 'Throw',
          'videoId': 'eJV6AFkYt_c'
        },
        {
          'position': [0.394, -0.120],
          'description': 'Run Throw',
          'videoId': 'Je2LHl2uCSY'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'Ivy',
      'name': 'flash',
      'status': false,
      'position': [0.318, -0.126],
      'stands': [
        {
          'position': [0.169, 0.068],
          'description': 'Throw',
          'videoId': 'eDWpAGPASI0'
        },
        {
          'position': [0.250, -0.075],
          'description': 'Right Jump Throw',
          'videoId': 'dAvFRUDpxck'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'A2',
      'name': 'flash',
      'status': false,
      'position': [0.388, -0.072],
      'stands': [
        {
          'position': [0.467, 0.158],
          'description': 'Throw',
          'videoId': 'UlFGg9GKke0'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'A site',
      'name': 'flash',
      'status': false,
      'position': [0.209, 0.027],
      'stands': [
        {
          'position': [0.477, 0.091],
          'description': 'Jump Throw',
          'videoId': 'iPNXMx6e318'
        },
        {
          'position': [0.294, 0.073],
          'description': 'Left Right Throw',
          'videoId': 'mzsiZzsMEFk'
        },
        {
          'position': [0.460, 0.021],
          'description': 'Jump Throw',
          'videoId': 'KB7DGO4L71A'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'Main / hell',
      'name': 'flash',
      'status': false,
      'position': [0.176, -0.120],
      'stands': [
        {
          'position': [0.400, -0.121],
          'description': 'Jump Throw',
          'videoId': 'Z8WQ37FVO6E'
        },
      ],
    },
    {
      'location': 'train',
      'description': 'Pop dog',
      'name': 'flash',
      'status': false,
      'position': [-0.043, 0.100],
      'stands': [
        {
          'position': [0.117, 0.067],
          'description': 'Throw',
          'videoId': '2MMa84s1_VQ'
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
