function RandomWalk2(M, N, S) % Might exceed the max recursive call limit if S gets too large
% author: 6515798, ZG
% input: the number of rows M, the number of columns N and the number of steps S
% output: none
RandomWalkHelper(M, N, S, [1, N]);
endfunction

function RandomWalkHelper(M, N, S, L)
% input: the number of rows M, the number of columns N, the number of steps S and the current location L
% output: none
if S == 0
	printf('the walk stopped at postion (%d, %d)\n', L(1), L(2));
elseif M == 1 && N == 1
	printf('the walk stopped at postion (%d, %d)\n', L(1), L(2));
else
	RandomWalkHelper(M, N, S - 1, nextMove(M, N, L));
endif
endfunction

function y = nextMove(M, N, L)
% input: the number of rows M, the number of columns N and the current location L
% output: the location after a valid move
do
	y = layingEggs(L);
until withinBoundary(M, N, y)
endfunction

function y = withinBoundary(M, N, L)
% input: the number of rows M, the number of columns N and a location L
% output: whether the goose is in the boundary at Location L
y = 0;
if ((1 <= L(1) && L(1) <= M) && (1 <= L(2) && L(2) <= N))
	y = 1;
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