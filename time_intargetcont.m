function t = time_intargetcont(xvec,yvec,targpos,lrad)

%find the time the hand was in target located at targpos (x,y) and with 
%logical radius lrad using a vector of x (xvec) and y (yvec) hand position.

d_x = xvec - targpos(1); %distance from center of target in x
d_y = yvec - targpos(2);

dist = sqrt(d_x.^2 + d_y.^2); %distance from center of the target
intarget = dist > lrad; %returns 1 when out of target and 0 when within target

for t = 2:length(intarget)-1 %using a loop to figure out first contiguous time when in target
    if intarget(t) == 1 && intarget(t+1) == 1 %make sure not an abberation
        break
    end
end
if t < 5
    fprintf('\r')
    fprintf('Warning: time in target very short')
elseif t == length(intarget) - 1
    fprintf('\r')
    fprintf('Warning: time in target may be cut off')
end
