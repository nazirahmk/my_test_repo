function n=hist2(A,B,L,HistMin,HistMax)
%HIST2 Calculates the joint histogram of two images or signals
%
%   n=hist2(A,B,L) is the joint histogram of matrices A and B, using L
%   bins for each matrix.
%
%   See also MI, HIST.

%   jfd, 15-11-2006, working
%        27-11-2006, memory usage reduced (sub2ind)
%        22-10-2008, added support for 1D matrices
%        01-09-2009, commented specific code for sensorimotor signals
%        24-08-2011, speed improvements by Andrew Hill

if nargin<4
    ma=min(A(:));MA=max(A(:));
    mb=min(B(:));MB=max(B(:));
else
    ma=HistMin;MA=HistMax;
    mb=HistMin;MB=HistMax;
end
% For sensorimotor variables, in [-pi,pi]
% ma=-pi;
% MA=pi;
% mb=-pi;
% MB=pi;

% Scale and round to fit in {0,...,L-1}
A=round((A-ma)*(L-1)/(MA-ma+eps));
B=round((B-mb)*(L-1)/(MB-mb+eps));
n=zeros(L,L);
x=0:L-1;
for i=0:L-1
    m = histc(B(A==i),x,1);
    if numel(m) == 0
        m = zeros(L,1);
    end
    n(i+1,:) = m;
end
end
