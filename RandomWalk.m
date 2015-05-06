function RandomWalk(M, N, S)
% author: 6515798, ZG
% input: the number of rows M, the number of columns N and the number of steps S
% output: none
L = [1, N]; %not clean
for i = 1:S %a while loop may replace the for loop here as well
	L = nextMove(M, N, L);
endfor
printf('the walk stopped at postion (%d, %d)\n', L(1), L(2));
endfunction

function y = nextMove(M, N, L)
% input: the number of rows M, the number of columns N and the current location L
% output: the location after a valid move
if M == 1 && N == 1
	y = [1, 1];
else
	do
		y = layingEggs(L);
	until withinBoundary(M, N, y)
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

function y = withinBoundary(M, N, L)
% input: the number of rows M, the number of columns N and a location L
% output: whether the goose is in the boundary at Location L
y = 0;
if ((1 <= L(1) && L(1) <= M) && (1 <= L(2) && L(2) <= N))
	y = 1;
endif
endfunction