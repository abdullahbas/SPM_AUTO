function folderCreate(varargin)
%It takes only string 
%folderCreate('s1','s2','s3'...'sN');
if length(varargin{1})>1
vax=varargin{1};
for i=1:length(vax)
mkdir([ vax{i} ]);
mkdir([ vax{i} '\BATCH']);
mkdir([ vax{i} '\BOLD']);
mkdir([ vax{i} '\FIGURE']);
mkdir([ vax{i} '\MPRAGE']);
end

else    
for i=1:length(varargin)
mkdir(['SPM\' varargin{i}]);
mkdir(['SPM\' varargin{i} '\BATCH']);
mkdir(['SPM\' varargin{i} '\BOLD']);
mkdir(['SPM\' varargin{i} '\FIGURE']);
mkdir(['SPM\' varargin{i} '\MPRAGE']);
end
end
end