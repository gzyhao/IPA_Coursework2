function y = SARandomWalk(M, N)
% author: 6515798, ZG
% input: the number of rows M and the number of columns N
% output: none
y = SARandomWalkHelper(M, N, zeros(M, N), [1, N], 1);
endfunction

function y = SARandomWalkHelper(M, N, X, L, S)
% input: the number of rows M, the number of columns N, the map matrix X, the current location L and the number of steps used S
% output: none
X(L(1), L(2)) = S;
if (isAvailable(M, N, X, L))
	y = SARandomWalkHelper(M, N, X, nextMoveWMat(M, N, X, L), S + 1);
else
	X
	printf('The walk stopped at position (%d, %d), after %d steps\n', L(1), L(2), S - 1);
	y = S - 1;
endif
endfunction

function y = nextMoveWMat(M, N, X, L)
% input: the number of rows M, the number of columns N, the map matrix X and the current location L
% output: the location after a valid move
do
	y = layingEggs(L);
until canItMoveHere(M, N, X, y)
endfunction

function y = canItMoveHere(M, N, X, L)
% input: the number of rows M, the number of columns N, the map matrix X and a location L
% output: whether the goose can move to the location
y = 0;
if (1 <= L(1) && L(1) <= M)
	if (1 <= L(2) && L(2) <= N)
		if X(L(1), L(2)) == 0
			y = 1;
		endif
	endif
endif
endfunction

function y = layingEggs(L)
% input: the current location L
% output: the location after the move
value = rand() * 4;
if (value > 0 && value < 1)
	L(1) = L(1) - 1; %Moving north
elseif (value > 1 && value < 2)
	L(1) = L(1) + 1; %Moving south
elseif (value > 2 && value < 3)
	L(2) = L(2) + 1; %Moving east
elseif (value > 3 && value < 4)
	L(2) = L(2) - 1; %Moving west
endif
y = L;
endfunction

function y = isAvailable(M, N, X, L)
% input: the number of rows M, the number of columns N, the map matrix and the current location
% output: whether the goose could move
y = 0;
%South
if L(1) < M
	if X(L(1) + 1, L(2)) == 0
		y = 1;
	endif
endif
%North
if L(1) > 1
	if X(L(1) - 1, L(2)) == 0
		y = 1;
	endif
endif
%East
if L(2) < N
	if X(L(1), L(2) + 1) == 0
		y = 1;
	endif
endif
%West
if L(2) > 1
	if X(L(1), L(2) - 1) == 0
		y = 1;
	endif
endif
endfunction