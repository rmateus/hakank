% 
% Kidney exchange in MiniZinc.
% 
% A simple model of kidney exchange, inspired by Pascal Van Hentenryck's
% introduction of Discrete Optimization.
%
% The objective is to maximize the number of exchanges.
%
% Note that we are looking for cycles, or at least that anyone
% that give a kidney also receive a kidney.
%

%
% - kidney_exchange_1000_0.1.dzn:
%   num_people = 1000 (probability of compatibility is 0.1)
%   * or-tools using first_fail/indomain_reverse_split
%     z: 1000
%     Total time including flattening: 1:26:47.43hours
%     (Flattening takes about 60s)
%     or-tools statistics:
%        total runtime:        99030 ms
%        build time:           6602 ms
%        failures:             5570
% 
%     z: 1000
%     x: [544, 39, 951, 977, 115, 261, 994, 842, 784, 841, 652, 562, 964, 598, 825, 139, 375, 739, 595, 906, 892, 900, 114, 728, 979, 586, 861, 564, 252, 770, 80, 636, 622, 772, 877, 788, 406, 151, 577, 345, 665, 415, 186, 996, 808, 228, 392, 84, 742, 508, 35, 719, 371, 801, 667, 472, 328, 495, 536, 202, 870, 331, 419, 634, 642, 416, 335, 554, 755, 353, 948, 637, 875, 922, 609, 677, 255, 515, 137, 506, 417, 612, 271, 532, 360, 737, 619, 973, 494, 592, 549, 61, 72, 853, 727, 526, 135, 262, 505, 882, 192, 226, 635, 698, 473, 17, 132, 888, 277, 51, 721, 509, 176, 620, 738, 845, 219, 916, 805, 866, 848, 1000, 301, 533, 514, 991, 684, 105, 238, 941, 780, 55, 158, 520, 862, 153, 382, 709, 525, 895, 224, 431, 482, 455, 978, 190, 931, 484, 193, 319, 688, 71, 367, 237, 185, 341, 897, 230, 587, 374, 98, 377, 513, 945, 924, 731, 774, 822, 528, 263, 806, 267, 27, 64, 776, 644, 90, 305, 218, 693, 448, 272, 68, 259, 934, 103, 409, 580, 961, 361, 563, 63, 874, 111, 456, 446, 643, 880, 908, 614, 669, 647, 421, 75, 764, 668, 163, 123, 787, 209, 36, 25, 107, 432, 859, 702, 427, 791, 893, 175, 356, 336, 975, 496, 307, 43, 713, 384, 917, 122, 878, 956, 264, 726, 655, 21, 276, 282, 11, 756, 662, 385, 326, 147, 433, 359, 217, 73, 627, 690, 200, 703, 783, 275, 857, 245, 451, 439, 711, 565, 553, 362, 150, 914, 884, 678, 459, 187, 625, 284, 41, 904, 210, 561, 989, 800, 905, 919, 844, 970, 618, 110, 248, 752, 749, 920, 686, 119, 910, 253, 493, 499, 967, 462, 118, 304, 980, 697, 706, 256, 57, 611, 352, 144, 486, 943, 257, 976, 672, 476, 407, 907, 56, 998, 182, 327, 529, 258, 680, 869, 293, 480, 204, 396, 675, 443, 393, 968, 281, 607, 48, 309, 974, 775, 4, 736, 152, 106, 585, 141, 233, 395, 504, 464, 354, 222, 308, 449, 743, 782, 591, 492, 700, 740, 750, 659, 251, 285, 109, 503, 478, 246, 125, 234, 349, 546, 60, 318, 435, 942, 840, 501, 216, 777, 681, 616, 804, 650, 765, 81, 946, 325, 649, 923, 593, 45, 329, 606, 581, 298, 418, 850, 95, 769, 793, 52, 168, 710, 846, 712, 44, 313, 965, 134, 387, 839, 247, 708, 231, 610, 899, 434, 871, 458, 279, 40, 405, 378, 952, 208, 128, 969, 733, 957, 789, 410, 575, 548, 855, 656, 500, 720, 426, 915, 894, 992, 69, 645, 692, 444, 206, 730, 117, 818, 584, 332, 290, 927, 856, 773, 83, 143, 50, 615, 608, 851, 403, 463, 631, 959, 46, 729, 858, 913, 49, 346, 300, 121, 936, 140, 747, 829, 803, 885, 966, 949, 759, 477, 320, 155, 340, 732, 59, 837, 266, 497, 116, 428, 716, 355, 753, 781, 104, 715, 981, 22, 337, 181, 30, 179, 466, 241, 291, 330, 317, 424, 124, 605, 191, 597, 460, 639, 386, 292, 741, 751, 471, 802, 879, 972, 901, 582, 274, 999, 278, 886, 995, 286, 94, 254, 734, 993, 933, 196, 78, 963, 450, 827, 138, 517, 364, 381, 799, 648, 630, 195, 661, 324, 932, 826, 14, 511, 519, 663, 127, 990, 394, 896, 567, 102, 289, 149, 521, 423, 306, 699, 490, 315, 198, 390, 683, 178, 935, 778, 569, 120, 130, 74, 524, 670, 552, 89, 167, 962, 437, 344, 413, 288, 824, 902, 438, 512, 242, 470, 321, 221, 792, 912, 66, 203, 32, 372, 260, 583, 31, 735, 833, 522, 166, 707, 953, 99, 701, 590, 810, 629, 447, 816, 854, 714, 467, 92, 9, 23, 70, 342, 297, 388, 28, 88, 334, 294, 797, 400, 100, 570, 704, 452, 160, 982, 465, 868, 758, 744, 632, 566, 694, 8, 571, 295, 555, 718, 197, 653, 366, 86, 947, 889, 239, 87, 623, 343, 483, 194, 547, 38, 626, 779, 389, 717, 748, 925, 26, 474, 876, 556, 180, 303, 398, 404, 347, 929, 112, 188, 828, 671, 898, 815, 441, 383, 785, 763, 243, 542, 108, 18, 843, 287, 864, 165, 599, 312, 939, 85, 594, 302, 937, 280, 588, 172, 847, 369, 654, 601, 761, 918, 6, 402, 82, 412, 101, 265, 560, 131, 5, 988, 689, 891, 436, 215, 537, 96, 881, 133, 148, 376, 798, 578, 29, 269, 53, 244, 628, 613, 411, 944, 211, 926, 126, 955, 429, 171, 811, 679, 796, 602, 574, 461, 170, 368, 890, 535, 527, 624, 12, 365, 523, 790, 821, 76, 333, 240, 621, 453, 314, 705, 722, 673, 940, 676, 20, 573, 13, 754, 558, 173, 212, 457, 723, 268, 813, 65, 795, 502, 113, 762, 62, 225, 860, 540, 401, 487, 531, 142, 685, 430, 960, 323, 488, 852, 666, 883, 454, 725, 771, 145, 397, 157, 724, 873, 468, 232, 518, 903, 538, 872, 658, 838, 559, 469, 617, 283, 183, 296, 58, 938, 19, 154, 696, 510, 576, 545, 311, 34, 93, 660, 958, 37, 534, 863, 543, 24, 985, 146, 820, 207, 831, 746, 249, 380, 814, 786, 338, 7, 445, 162, 539, 339, 77, 310, 91, 220, 159, 987, 766, 682, 322, 646, 1, 812, 33, 15, 971, 691, 507, 633, 184, 809, 136, 273, 54, 201, 408, 603, 695, 485, 3, 921, 156, 865, 223, 604, 687, 67, 640, 530, 391, 950, 235, 227, 768, 481, 807, 425, 832, 250, 475, 984, 440, 638, 348, 867, 928, 363, 794, 420, 350, 760, 414, 579, 491, 229, 97, 498, 177, 373, 189, 541, 651, 986, 379, 42, 479, 757, 550, 836, 997, 664, 213, 236, 357, 983, 489, 572, 835, 10, 745, 557, 370, 164, 830, 930, 161, 442, 214, 169, 351, 887, 174, 129, 674, 849, 600, 299, 819, 596, 516, 909, 767, 657, 568, 270, 823, 911, 551, 817, 422, 834, 47, 358, 79, 205, 199, 2, 589, 316, 399, 954, 641, 16]
%



%
% This MiniZinc model was created by Hakan Kjellerstrand, hakank@gmail.com
% See also my MiniZinc page: http://www.hakank.org/minizinc/
%

include "globals.mzn"; 

int: num_people;
array[1..num_people] of set of int: compatible;

% decision variables

% which kidney does person p get (or 0 if he/she gets no kidney)
array[1..num_people] of var 0..num_people: x;

% matrix version of the exchange (dual model)
% it take some more space (and time for flattening) 
% but it seems to be worth it
array[1..num_people, 1..num_people] of var 0..1: y;

var 0..num_people: z = sum([bool2int(x[i] > 0) | i in 1..num_people]);
% var 0..num_people: z = sum([y[i,j]| i,j in 1..num_people]);

% solve satisfy;
% solve maximize z;
solve :: int_search(
      x ++ [y[p,i] | p,i in 1..num_people], 
      first_fail, 
      indomain_random, % indomain_reverse_split, 
      complete) 
maximize z;

% TODO:
% - Think more about detecting cycles/subcircuits
% - how can x[x[p]] be stated in the y matrix?
%
constraint
   alldifferent_except_0(x) % :: domain
   /\
   forall(p in 1..num_people) (
     % either this person don't get a kidney
     (
      x[p] = 0 /\ 
      sum([y[p,i] | i in 1..num_people]) = 0 /\
      sum([y[i,p] | i in 1..num_people]) = 0
     ) 
     \/
     % or he/she does and the donor also receive a kidney
     (
       x[p] in compatible[p] /\ % who's the donor?
       x[x[p]] > 0 % the donor must also receive a kidney
       /\
       sum([y[p,i] | i in 1..num_people]) = 1 /\
       sum([y[i,p] | i in 1..num_people]) = 1 
     )

   )
   % /\ z = sum([y[i,j]| i,j in 1..num_people])
;


output [
  "z: " ++ show(z) ++ "\n" ++
  "x: " ++ show(x) ++ "\n"
]
++
[
  "person: donor\n"
]
++
[
  if fix(x[i] = 0) then 
     show_int(3, i) ++ ":   -\n"
  else 
     show_int(3, i) ++ ": " ++  show_int(3, x[i]) ++ "\n"
  endif
  
  | i in 1..num_people
];


%
% data
%

% The compatibility matrix 
% (from Pascal's introduction lecture)
% who can give a kidney to person p
% This is a directed graph
% num_people = 8;
% compatible = 
%   [
%     {2,3}, % 1
%     {1,6}, % 2
%     {1,4,7}, % 3
%     {2}, % 4  
%     {2}, % 5
%     {5}, % 6
%     {8}, % 7
%     {3}, % 8
%   ];
