%Create initial vectors - part 1
%create and display vector r (vector that points from the origin to the
%point the force is applied)
r = [1, 4, 2]; %format: [x comp, y comp, z comp]
disp("r = " + vectorToStr(r));
%create and display vector F (vector with a magnitude of 120 pounds that
%points in the direction of Fdir)
Fdir = [4, -4, -2];
F = (120 / norm(Fdir)) * Fdir;
disp("F = " + vectorToStr(F));
%Adds formating + clears up a now obsolete variable)
disp(" ");
clear Fdir;

%Calculate Cross Product - part 2
crossPrdctMat = [r; F]; %Creates a matrix with one vector matrix on top of the other; used for calculating r x F
T = zeros(1, 3); %Creates empty 3d vector for storing the Cross Product
for indx = 1:3
    detMat = crossPrdctMat;
    detMat(:, indx) = []; %detMat is set to equal the adjuct matrix of the component being solved for
    T(indx) = det(detMat); %determinant of adjunct matrix found and stored as the coresponding component of the cross product vector
end

%Display Output - part 3
disp("r x F = " + vectorToStr(T));

%function to convert a vector into a string - v2
function str = vectorToStr(v)
    %Check to make sure inputted matrix is one dimensional (a vector).
    %Otherwise, throw an error
    if ((size(v, 1) > 1 && size(v, 2) > 1) || length(size(v)) > 2)
        error("Input Vector, v, Must be a 1 Dimensional Array");
    end
    %start output string with a '<' character
    str = "<";
    for indx = 1:length(v)
        %add the coresponding number and a ', ' for each value present
        str = str + v(indx) + ", ";
    end
    %end output string with a '>' character
    str = extractBefore(str, strlength(str) - 1) + ">";
end