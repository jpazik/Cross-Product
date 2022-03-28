Fdir = [4, -4, -2]; %Force direction component form
F = (120 / norm(Fdir)) * Fdir; %Froce magnitude
x1 = 1; %x component vector 1
y1 = 4; %y  component vector 1
z1 = 2; %z component vector 1
x2 = 5; %x component vector 2
y2 = 0; %y component vector 2
z2 = 0; %z component vector 2
vector1 = [x1, y1, z1] %Vector 1 component form
vector2 = [x2, y2, z2] %Vector 2 component form
pBC = vectorC - vectorB %Position vector
intermediate = pBC.*pBC %Intermidiate for mathematical operation
den = sum(intermediate) %Creates denominator for following function
uBC = pBC./sqrt(den) %Unit vector
crossPrdctMat = [vectorB;F] %Matrix for determining cross product
for indx = 1:3 %for loop for determining cross product
    detMat = crossPrdctMat; 
    detMat(:, indx) = []; %detMat is set to equal the adjuct matrix of the component being solved for
    T(indx) = det(detMat); %determinant of adjunct matrix found and stored as the coresponding component of the cross product vector
end
disp("r x F = " + vectoStr(T)); %display vector in string form

function str = vectoStr(v) %function to convert a vector into a string - v2
   
    if ((size(v, 1) > 1 && size(v, 2) > 1) || length(size(v)) > 2) %error handler
        error("Input Vector, v, Must be a 1 Dimensional Array");
    end
    %start output string with a '<' character
    str = "<";
    for indx = 1:length(v)
        %add the correlating component value and a ', ' for each value present
        str = str + v(indx) + ", ";
    end
    %end output string with a '>' character
    str = extractBefore(str, strlength(str) - 1) + ">";
end
