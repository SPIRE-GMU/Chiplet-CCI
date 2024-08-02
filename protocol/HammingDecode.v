module HammingEncode(
  input  [447:0] io_data, // @[\\src\\main\\scala\\protocol\\HammingCode.scala 10:14]
  output [63:0]  io_checksum // @[\\src\\main\\scala\\protocol\\HammingCode.scala 10:14]
);
  wire [6:0] io_checksum_p1_lo_lo_lo_lo_lo_lo_1 = {io_data[6],io_data[5],io_data[4],io_data[3],io_data[2],io_data[1],
    io_data[0]}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [13:0] io_checksum_p1_lo_lo_lo_lo_lo_1 = {io_data[13],io_data[12],io_data[11],io_data[10],io_data[9],io_data[8],
    io_data[7],io_checksum_p1_lo_lo_lo_lo_lo_lo_1}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [6:0] io_checksum_p1_lo_lo_lo_lo_hi_lo_1 = {io_data[20],io_data[19],io_data[18],io_data[17],io_data[16],io_data[
    15],io_data[14]}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [27:0] io_checksum_p1_lo_lo_lo_lo_1 = {io_data[27],io_data[26],io_data[25],io_data[24],io_data[23],io_data[22],
    io_data[21],io_checksum_p1_lo_lo_lo_lo_hi_lo_1,io_checksum_p1_lo_lo_lo_lo_lo_1}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [6:0] io_checksum_p1_lo_lo_lo_hi_lo_lo_1 = {io_data[34],io_data[33],io_data[32],io_data[31],io_data[30],io_data[
    29],io_data[28]}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [13:0] io_checksum_p1_lo_lo_lo_hi_lo_1 = {io_data[41],io_data[40],io_data[39],io_data[38],io_data[37],io_data[36]
    ,io_data[35],io_checksum_p1_lo_lo_lo_hi_lo_lo_1}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [6:0] io_checksum_p1_lo_lo_lo_hi_hi_lo_1 = {io_data[48],io_data[47],io_data[46],io_data[45],io_data[44],io_data[
    43],io_data[42]}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [55:0] io_checksum_p1_lo_lo_lo_1 = {io_data[55],io_data[54],io_data[53],io_data[52],io_data[51],io_data[50],
    io_data[49],io_checksum_p1_lo_lo_lo_hi_hi_lo_1,io_checksum_p1_lo_lo_lo_hi_lo_1,io_checksum_p1_lo_lo_lo_lo_1}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [6:0] io_checksum_p1_lo_lo_hi_lo_lo_lo_1 = {io_data[62],io_data[61],io_data[60],io_data[59],io_data[58],io_data[
    57],io_data[56]}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [13:0] io_checksum_p1_lo_lo_hi_lo_lo_1 = {io_data[69],io_data[68],io_data[67],io_data[66],io_data[65],io_data[64]
    ,io_data[63],io_checksum_p1_lo_lo_hi_lo_lo_lo_1}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [6:0] io_checksum_p1_lo_lo_hi_lo_hi_lo_1 = {io_data[76],io_data[75],io_data[74],io_data[73],io_data[72],io_data[
    71],io_data[70]}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [27:0] io_checksum_p1_lo_lo_hi_lo_1 = {io_data[83],io_data[82],io_data[81],io_data[80],io_data[79],io_data[78],
    io_data[77],io_checksum_p1_lo_lo_hi_lo_hi_lo_1,io_checksum_p1_lo_lo_hi_lo_lo_1}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [6:0] io_checksum_p1_lo_lo_hi_hi_lo_lo_1 = {io_data[90],io_data[89],io_data[88],io_data[87],io_data[86],io_data[
    85],io_data[84]}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [13:0] io_checksum_p1_lo_lo_hi_hi_lo_1 = {io_data[97],io_data[96],io_data[95],io_data[94],io_data[93],io_data[92]
    ,io_data[91],io_checksum_p1_lo_lo_hi_hi_lo_lo_1}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [6:0] io_checksum_p1_lo_lo_hi_hi_hi_lo_1 = {io_data[104],io_data[103],io_data[102],io_data[101],io_data[100],
    io_data[99],io_data[98]}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [55:0] io_checksum_p1_lo_lo_hi_1 = {io_data[111],io_data[110],io_data[109],io_data[108],io_data[107],io_data[106]
    ,io_data[105],io_checksum_p1_lo_lo_hi_hi_hi_lo_1,io_checksum_p1_lo_lo_hi_hi_lo_1,io_checksum_p1_lo_lo_hi_lo_1}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [6:0] io_checksum_p1_lo_hi_lo_lo_lo_lo_1 = {io_data[118],io_data[117],io_data[116],io_data[115],io_data[114],
    io_data[113],io_data[112]}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [13:0] io_checksum_p1_lo_hi_lo_lo_lo_1 = {io_data[125],io_data[124],io_data[123],io_data[122],io_data[121],
    io_data[120],io_data[119],io_checksum_p1_lo_hi_lo_lo_lo_lo_1}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [6:0] io_checksum_p1_lo_hi_lo_lo_hi_lo_1 = {io_data[132],io_data[131],io_data[130],io_data[129],io_data[128],
    io_data[127],io_data[126]}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [27:0] io_checksum_p1_lo_hi_lo_lo_1 = {io_data[139],io_data[138],io_data[137],io_data[136],io_data[135],io_data[
    134],io_data[133],io_checksum_p1_lo_hi_lo_lo_hi_lo_1,io_checksum_p1_lo_hi_lo_lo_lo_1}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [6:0] io_checksum_p1_lo_hi_lo_hi_lo_lo_1 = {io_data[146],io_data[145],io_data[144],io_data[143],io_data[142],
    io_data[141],io_data[140]}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [13:0] io_checksum_p1_lo_hi_lo_hi_lo_1 = {io_data[153],io_data[152],io_data[151],io_data[150],io_data[149],
    io_data[148],io_data[147],io_checksum_p1_lo_hi_lo_hi_lo_lo_1}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [6:0] io_checksum_p1_lo_hi_lo_hi_hi_lo_1 = {io_data[160],io_data[159],io_data[158],io_data[157],io_data[156],
    io_data[155],io_data[154]}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [55:0] io_checksum_p1_lo_hi_lo_1 = {io_data[167],io_data[166],io_data[165],io_data[164],io_data[163],io_data[162]
    ,io_data[161],io_checksum_p1_lo_hi_lo_hi_hi_lo_1,io_checksum_p1_lo_hi_lo_hi_lo_1,io_checksum_p1_lo_hi_lo_lo_1}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [6:0] io_checksum_p1_lo_hi_hi_lo_lo_lo_1 = {io_data[174],io_data[173],io_data[172],io_data[171],io_data[170],
    io_data[169],io_data[168]}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [13:0] io_checksum_p1_lo_hi_hi_lo_lo_1 = {io_data[181],io_data[180],io_data[179],io_data[178],io_data[177],
    io_data[176],io_data[175],io_checksum_p1_lo_hi_hi_lo_lo_lo_1}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [6:0] io_checksum_p1_lo_hi_hi_lo_hi_lo_1 = {io_data[188],io_data[187],io_data[186],io_data[185],io_data[184],
    io_data[183],io_data[182]}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [27:0] io_checksum_p1_lo_hi_hi_lo_1 = {io_data[195],io_data[194],io_data[193],io_data[192],io_data[191],io_data[
    190],io_data[189],io_checksum_p1_lo_hi_hi_lo_hi_lo_1,io_checksum_p1_lo_hi_hi_lo_lo_1}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [6:0] io_checksum_p1_lo_hi_hi_hi_lo_lo_1 = {io_data[202],io_data[201],io_data[200],io_data[199],io_data[198],
    io_data[197],io_data[196]}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [13:0] io_checksum_p1_lo_hi_hi_hi_lo_1 = {io_data[209],io_data[208],io_data[207],io_data[206],io_data[205],
    io_data[204],io_data[203],io_checksum_p1_lo_hi_hi_hi_lo_lo_1}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [6:0] io_checksum_p1_lo_hi_hi_hi_hi_lo_1 = {io_data[216],io_data[215],io_data[214],io_data[213],io_data[212],
    io_data[211],io_data[210]}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [55:0] io_checksum_p1_lo_hi_hi_1 = {io_data[223],io_data[222],io_data[221],io_data[220],io_data[219],io_data[218]
    ,io_data[217],io_checksum_p1_lo_hi_hi_hi_hi_lo_1,io_checksum_p1_lo_hi_hi_hi_lo_1,io_checksum_p1_lo_hi_hi_lo_1}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [6:0] io_checksum_p1_hi_lo_lo_lo_lo_lo_1 = {io_data[230],io_data[229],io_data[228],io_data[227],io_data[226],
    io_data[225],io_data[224]}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [13:0] io_checksum_p1_hi_lo_lo_lo_lo_1 = {io_data[237],io_data[236],io_data[235],io_data[234],io_data[233],
    io_data[232],io_data[231],io_checksum_p1_hi_lo_lo_lo_lo_lo_1}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [6:0] io_checksum_p1_hi_lo_lo_lo_hi_lo_1 = {io_data[244],io_data[243],io_data[242],io_data[241],io_data[240],
    io_data[239],io_data[238]}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [27:0] io_checksum_p1_hi_lo_lo_lo_1 = {io_data[251],io_data[250],io_data[249],io_data[248],io_data[247],io_data[
    246],io_data[245],io_checksum_p1_hi_lo_lo_lo_hi_lo_1,io_checksum_p1_hi_lo_lo_lo_lo_1}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [6:0] io_checksum_p1_hi_lo_lo_hi_lo_lo_1 = {io_data[258],io_data[257],io_data[256],io_data[255],io_data[254],
    io_data[253],io_data[252]}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [13:0] io_checksum_p1_hi_lo_lo_hi_lo_1 = {io_data[265],io_data[264],io_data[263],io_data[262],io_data[261],
    io_data[260],io_data[259],io_checksum_p1_hi_lo_lo_hi_lo_lo_1}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [6:0] io_checksum_p1_hi_lo_lo_hi_hi_lo_1 = {io_data[272],io_data[271],io_data[270],io_data[269],io_data[268],
    io_data[267],io_data[266]}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [55:0] io_checksum_p1_hi_lo_lo_1 = {io_data[279],io_data[278],io_data[277],io_data[276],io_data[275],io_data[274]
    ,io_data[273],io_checksum_p1_hi_lo_lo_hi_hi_lo_1,io_checksum_p1_hi_lo_lo_hi_lo_1,io_checksum_p1_hi_lo_lo_lo_1}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [6:0] io_checksum_p1_hi_lo_hi_lo_lo_lo_1 = {io_data[286],io_data[285],io_data[284],io_data[283],io_data[282],
    io_data[281],io_data[280]}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [13:0] io_checksum_p1_hi_lo_hi_lo_lo_1 = {io_data[293],io_data[292],io_data[291],io_data[290],io_data[289],
    io_data[288],io_data[287],io_checksum_p1_hi_lo_hi_lo_lo_lo_1}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [6:0] io_checksum_p1_hi_lo_hi_lo_hi_lo_1 = {io_data[300],io_data[299],io_data[298],io_data[297],io_data[296],
    io_data[295],io_data[294]}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [27:0] io_checksum_p1_hi_lo_hi_lo_1 = {io_data[307],io_data[306],io_data[305],io_data[304],io_data[303],io_data[
    302],io_data[301],io_checksum_p1_hi_lo_hi_lo_hi_lo_1,io_checksum_p1_hi_lo_hi_lo_lo_1}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [6:0] io_checksum_p1_hi_lo_hi_hi_lo_lo_1 = {io_data[314],io_data[313],io_data[312],io_data[311],io_data[310],
    io_data[309],io_data[308]}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [13:0] io_checksum_p1_hi_lo_hi_hi_lo_1 = {io_data[321],io_data[320],io_data[319],io_data[318],io_data[317],
    io_data[316],io_data[315],io_checksum_p1_hi_lo_hi_hi_lo_lo_1}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [6:0] io_checksum_p1_hi_lo_hi_hi_hi_lo_1 = {io_data[328],io_data[327],io_data[326],io_data[325],io_data[324],
    io_data[323],io_data[322]}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [55:0] io_checksum_p1_hi_lo_hi_1 = {io_data[335],io_data[334],io_data[333],io_data[332],io_data[331],io_data[330]
    ,io_data[329],io_checksum_p1_hi_lo_hi_hi_hi_lo_1,io_checksum_p1_hi_lo_hi_hi_lo_1,io_checksum_p1_hi_lo_hi_lo_1}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [6:0] io_checksum_p1_hi_hi_lo_lo_lo_lo_1 = {io_data[342],io_data[341],io_data[340],io_data[339],io_data[338],
    io_data[337],io_data[336]}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [13:0] io_checksum_p1_hi_hi_lo_lo_lo_1 = {io_data[349],io_data[348],io_data[347],io_data[346],io_data[345],
    io_data[344],io_data[343],io_checksum_p1_hi_hi_lo_lo_lo_lo_1}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [6:0] io_checksum_p1_hi_hi_lo_lo_hi_lo_1 = {io_data[356],io_data[355],io_data[354],io_data[353],io_data[352],
    io_data[351],io_data[350]}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [27:0] io_checksum_p1_hi_hi_lo_lo_1 = {io_data[363],io_data[362],io_data[361],io_data[360],io_data[359],io_data[
    358],io_data[357],io_checksum_p1_hi_hi_lo_lo_hi_lo_1,io_checksum_p1_hi_hi_lo_lo_lo_1}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [6:0] io_checksum_p1_hi_hi_lo_hi_lo_lo_1 = {io_data[370],io_data[369],io_data[368],io_data[367],io_data[366],
    io_data[365],io_data[364]}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [13:0] io_checksum_p1_hi_hi_lo_hi_lo_1 = {io_data[377],io_data[376],io_data[375],io_data[374],io_data[373],
    io_data[372],io_data[371],io_checksum_p1_hi_hi_lo_hi_lo_lo_1}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [6:0] io_checksum_p1_hi_hi_lo_hi_hi_lo_1 = {io_data[384],io_data[383],io_data[382],io_data[381],io_data[380],
    io_data[379],io_data[378]}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [55:0] io_checksum_p1_hi_hi_lo_1 = {io_data[391],io_data[390],io_data[389],io_data[388],io_data[387],io_data[386]
    ,io_data[385],io_checksum_p1_hi_hi_lo_hi_hi_lo_1,io_checksum_p1_hi_hi_lo_hi_lo_1,io_checksum_p1_hi_hi_lo_lo_1}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [6:0] io_checksum_p1_hi_hi_hi_lo_lo_lo_1 = {io_data[398],io_data[397],io_data[396],io_data[395],io_data[394],
    io_data[393],io_data[392]}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [13:0] io_checksum_p1_hi_hi_hi_lo_lo_1 = {io_data[405],io_data[404],io_data[403],io_data[402],io_data[401],
    io_data[400],io_data[399],io_checksum_p1_hi_hi_hi_lo_lo_lo_1}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [6:0] io_checksum_p1_hi_hi_hi_lo_hi_lo_1 = {io_data[412],io_data[411],io_data[410],io_data[409],io_data[408],
    io_data[407],io_data[406]}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [27:0] io_checksum_p1_hi_hi_hi_lo_1 = {io_data[419],io_data[418],io_data[417],io_data[416],io_data[415],io_data[
    414],io_data[413],io_checksum_p1_hi_hi_hi_lo_hi_lo_1,io_checksum_p1_hi_hi_hi_lo_lo_1}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [6:0] io_checksum_p1_hi_hi_hi_hi_lo_lo_1 = {io_data[426],io_data[425],io_data[424],io_data[423],io_data[422],
    io_data[421],io_data[420]}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [13:0] io_checksum_p1_hi_hi_hi_hi_lo_1 = {io_data[433],io_data[432],io_data[431],io_data[430],io_data[429],
    io_data[428],io_data[427],io_checksum_p1_hi_hi_hi_hi_lo_lo_1}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [6:0] io_checksum_p1_hi_hi_hi_hi_hi_lo_1 = {io_data[440],io_data[439],io_data[438],io_data[437],io_data[436],
    io_data[435],io_data[434]}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [55:0] io_checksum_p1_hi_hi_hi_1 = {io_data[447],io_data[446],io_data[445],io_data[444],io_data[443],io_data[442]
    ,io_data[441],io_checksum_p1_hi_hi_hi_hi_hi_lo_1,io_checksum_p1_hi_hi_hi_hi_lo_1,io_checksum_p1_hi_hi_hi_lo_1}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [447:0] _io_checksum_p1_T_1 = {io_checksum_p1_hi_hi_hi_1,io_checksum_p1_hi_hi_lo_1,io_checksum_p1_hi_lo_hi_1,
    io_checksum_p1_hi_lo_lo_1,io_checksum_p1_lo_hi_hi_1,io_checksum_p1_lo_hi_lo_1,io_checksum_p1_lo_lo_hi_1,
    io_checksum_p1_lo_lo_lo_1}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:34]
  wire [447:0] _io_checksum_p1_T_2 = 448'haaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
     & _io_checksum_p1_T_1; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:27]
  wire  io_checksum_p1 = ^_io_checksum_p1_T_2; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 24:42]
  wire [447:0] _io_checksum_p2_T_2 = 448'hcccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
     & _io_checksum_p1_T_1; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 33:27]
  wire  io_checksum_p2 = ^_io_checksum_p2_T_2; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 33:42]
  wire [447:0] _io_checksum_p4_T_2 = 448'hf0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0
     & _io_checksum_p1_T_1; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 42:27]
  wire  io_checksum_p4 = ^_io_checksum_p4_T_2; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 42:42]
  wire [447:0] _io_checksum_p8_T_2 = 448'hff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00
     & _io_checksum_p1_T_1; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 51:27]
  wire  io_checksum_p8 = ^_io_checksum_p8_T_2; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 51:42]
  wire [447:0] _io_checksum_p16_T_2 = 448'hffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000
     & _io_checksum_p1_T_1; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 60:29]
  wire  io_checksum_p16 = ^_io_checksum_p16_T_2; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 60:44]
  wire [447:0] _io_checksum_p32_T_2 = 448'hffffffff00000000ffffffff00000000ffffffff00000000ffffffff00000000ffffffff00000000ffffffff00000000ffffffff00000000
     & _io_checksum_p1_T_1; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 69:29]
  wire  io_checksum_p32 = ^_io_checksum_p32_T_2; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 69:44]
  wire [447:0] _io_checksum_p64_T_2 = 448'hffffffffffffffff0000000000000000ffffffffffffffff0000000000000000ffffffffffffffff0000000000000000
     & _io_checksum_p1_T_1; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 78:29]
  wire  io_checksum_p64 = ^_io_checksum_p64_T_2; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 78:44]
  wire [447:0] _io_checksum_p128_T_2 = 448'hffffffffffffffff00000000000000000000000000000000ffffffffffffffffffffffffffffffff00000000000000000000000000000000
     & _io_checksum_p1_T_1; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 87:31]
  wire  io_checksum_p128 = ^_io_checksum_p128_T_2; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 87:46]
  wire [447:0] _io_checksum_p256_T_2 = 448'hffffffffffffffffffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000
     & _io_checksum_p1_T_1; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 96:31]
  wire  io_checksum_p256 = ^_io_checksum_p256_T_2; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 96:46]
  wire [8:0] _io_checksum_T_448 = {io_checksum_p1,io_checksum_p2,io_checksum_p4,io_checksum_p8,io_checksum_p16,
    io_checksum_p32,io_checksum_p64,io_checksum_p128,io_checksum_p256}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 97:8]
  assign io_checksum = {{55'd0}, _io_checksum_T_448}; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 100:15]
endmodule
module HammingDecode(
  input          clock,
  input          reset,
  input  [447:0] io_data, // @[\\src\\main\\scala\\protocol\\HammingCode.scala 104:14]
  input  [63:0]  io_checksum, // @[\\src\\main\\scala\\protocol\\HammingCode.scala 104:14]
  output         io_matches // @[\\src\\main\\scala\\protocol\\HammingCode.scala 104:14]
);
  wire [447:0] hammingEncode_io_data; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 109:29]
  wire [63:0] hammingEncode_io_checksum; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 109:29]
  HammingEncode hammingEncode ( // @[\\src\\main\\scala\\protocol\\HammingCode.scala 109:29]
    .io_data(hammingEncode_io_data),
    .io_checksum(hammingEncode_io_checksum)
  );
  assign io_matches = hammingEncode_io_checksum == io_checksum; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 111:43]
  assign hammingEncode_io_data = io_data; // @[\\src\\main\\scala\\protocol\\HammingCode.scala 110:25]
endmodule
