% 
% Set Covering Deployment in ASP.
% 
% See
% http://mathworld.wolfram.com/SetCoveringDeployment.html
% """
% Set covering deployment (sometimes written "set-covering deployment" and abbreviated 
% SCDP for "set covering deployment problem") seeks an optimal stationing of troops 
% in a set of regions so that a relatively small number of troop units can control 
% a large geographic region. ReVelle and Rosing (2000) first described this in a 
% study of Emperor Constantine the Great's mobile field army placements to secure 
% the Roman Empire. 
% """
%
% Reference:
% - ReVelle, Rosing, K. E. 
%  "Defendens Imperium Romanum: A Classical Problem in Military Strategy." 
%
% This was created by Hakan Kjellerstrand, hakank@bonetmail.com
% See also http://www.hakank.org/answer_set_programming/
%

%
% Neighbour cities in Roman Empire
%
% 1:alexandria, 2:asia_minor, 3:britain, 4:byzantium, 5:gaul, 6:iberia, 7:rome, 8:tunis
%
% 0,   1,   0,   1,   0,   0,   1,   1,
% 1,   0,   0,   1,   0,   0,   0,   0,
% 0,   0,   0,   0,   1,   1,   0,   0,
% 1,   1,   0,   0,   0,   0,   1,   0,
% 0,   0,   1,   0,   0,   1,   1,   0,
% 0,   0,   1,   0,   1,   0,   1,   1,
% 1,   0,   0,   1,   1,   1,   0,   1,
% 1,   0,   0,   0,   0,   1,   1,   0
%
matrix(1, 2).
matrix(1, 4).
matrix(1, 7).
matrix(1, 8).
matrix(2, 1).
matrix(2, 4).
matrix(3, 5).
matrix(3, 6).
matrix(4, 1).
matrix(4, 2).
matrix(4, 7).
matrix(5, 3).
matrix(5, 6).
matrix(5, 7).
matrix(6, 3).
matrix(6, 5).
matrix(6, 7).
matrix(6, 8).
matrix(7, 1).
matrix(7, 4).
matrix(7, 5).
matrix(7, 6).
matrix(7, 8).
matrix(8, 1).
matrix(8, 6).
matrix(8, 7).

% name of the cities
name(1, alexandria).
name(2, asia_minor).
name(3, britain).
name(4, byzantium).
name(5, gaul).
name(6, iberia).
name(7, rome).
name(8, tunis).

#const n=8.  % number of cities
cities(1..n).
army(0..1).

1 { x(City, Army1, Army2) : army(Army1;Army2) } 1 :- cities(City).


% Constraint 1: There is always an army in a city (+ maybe a backup)
%               Or rather: Is there is a backup, there must be an an army
:- x(City, Army1, Army2), Army1 < Army2.

% Constraint 2: There should always be an backup army near every city
:- x(City, Army11, Army12), S = #sum[ x(City2, Army21, Army22) : matrix(City, City2)  = Army22], Army11 + S < 1.

% show the selected cities with name
selected(City, Name, Army1, Army2) :- x(City, Army1, Army2), Army1 > 0, name(City, Name).

#minimize [x(City, Army1, Army2) = Army1 + Army2].

#hide.
% #show x(City, Army1, Army2).
#show selected(City, Name, Army1, Army2).
