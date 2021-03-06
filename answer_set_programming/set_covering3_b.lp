%
% Another set_covering problem in ASP.
% 
% Problem from 
% Katta G. Murty: "Optimization Models for Decision Making", page 302f
% http://ioe.engin.umich.edu/people/fac/books/murty/opti_model/junior-7.pdf
% 
% 10 senators making a committee, where there must at least be one 
% representative from each group:
% group:        senators:
% southern      1 2 3 4 5
% northern      6 7 8 9 10
% liberals      2 3 8 9 10
% conservative  1 5 6 7
% democrats     3 4 5 6 7 9
% republicans   1 2 8 10
%
%
% This was created by Hakan Kjellerstrand, hakank@bonetmail.com
% See also http://www.hakank.org/answer_set_programming/
%

% This is a symbolic version of set_covering3.lp

% 5 answers:
%  $  clingo --opt-all set_covering3_b.lp
% selected(senator6) selected(senator2) 
% selected(senator7) selected(senator2) 
% selected(senator8) selected(senator5) 
% selected(senator9) selected(senator1) 
% selected(senator10) selected(senator5) 


% what group does a senator belong to
%  1  2  3  4  5  6  7  8  9 10
%  ---------------------------------
%  1, 1, 1, 1, 1, 0, 0, 0, 0, 0,   % 1 southern
%  0, 0, 0, 0, 0, 1, 1, 1, 1, 1,   % 2 northern
%  0, 1, 1, 0, 0, 0, 0, 1, 1, 1,   % 3 liberals
%  1, 0, 0, 0, 1, 1, 1, 0, 0, 0,   % 4 conservative
%  0, 0, 1, 1, 1, 1, 1, 0, 1, 0,   % 5 democrats
%  1, 1, 0, 0, 0, 0, 0, 1, 0, 1    % 6 republicans

senator(senator1, southern;conservative;republicans).
senator(senator2, southern;liberals;republicans).
senator(senator3, southern;liberals;democrats).
senator(senator4, southern;democrats).
senator(senator5, southern;conservative;democrats).
senator(senator6, northern;conservative;democrats).
senator(senator7, northern;conservative;democrats).
senator(senator8, northern;liberals;republicans).
senator(senator9, northern;liberals;democrats).
senator(senator10, northern;liberals;republicans).


senators(senator1;senator2;senator3;senator4;senator5;senator6;senator7;senator8;senator9;senator10).
groups(southern;northern;liberals;conservative;democrats;republicans).

% Which senators are selected?
% select(Senator) -> senator Senator is selected
% 1 { selected(Senator) : senators(Senator) }. % at least one senator is selected

% All groups must be represented by at least one selected senators.
1 { selected(Senator) : senators(Senator) : senator(Senator, Group) } :- groups(Group).
% :- { selected(Senator) : senators(Senator) : senator(Senator, Group) } 0, groups(Group).

% minimize the number of senators
#minimize [selected(Senator) : senators(Senator) ].

#hide.
#show selected(Senator).