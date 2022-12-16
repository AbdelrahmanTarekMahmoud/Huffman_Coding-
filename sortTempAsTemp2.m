function y = sortTempAsTemp2(x, a)
%This function takes an array x and an array of indices a and sorts the elements in x by the order by indices dictated in a.
%we sort temp according to temp2
n = length(x); 
y = cell(1, n);
for i = 1:n
    y(i) = x(a(i));
end 
end