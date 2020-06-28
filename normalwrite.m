function  [output,matlabbatch]=normalwrite(neOut,coOut,varargin)
%{ Author Abdullah Baþ
%  26.07.18 03:36
% This script was generatad for automating SPM pre-process steps
%
%Values can be input
%
%property={'preserve','bb','vox','interp','wrap','prefix'}
%
%Default deðerler
%neOut=normalise estimate output
%coOut=coreg est&write output
%vox=voxel size (def=[2 2 2])
%prefix=You should already learned this(def='n')
%value={0,[-78 -112 -50;78 76 85],[2 2 2],1,[0 0 0],'n'}

property={'preserve','bb','vox','interp','wrap'...
    ,'prefix'};
value={0,[-78 -112 -50;78 76 85],[2 2 2],1,[0 0 0],'n'};

% For Realignment Step
for i=1:2:length(varargin)

    for j=1:length(property)
        test=strcmp(varargin{i},property{j});
        if test==1
        value(j)=varargin(i+1);
        end   
    end
    
end


preserve=value{1};bb=value{2};vox=value{3};interp=value{4};wrap=value{5};...
    prefix=value{6}; 


matlabbatch1{1}.spm.spatial.normalise.write.subj.matname{1}=neOut{1,1}.params{1};

try
matlabbatch1{1}.spm.spatial.normalise.write.subj.resample=coOut{1,1}.rfiles;
catch
matlabbatch1{1}.spm.spatial.normalise.write.subj.resample{1}=coOut;    
end

matlabbatch1{1}.spm.spatial.normalise.write.roptions.preserve=preserve;
matlabbatch1{1}.spm.spatial.normalise.write.roptions.bb=bb;
matlabbatch1{1}.spm.spatial.normalise.write.roptions.vox=vox;
matlabbatch1{1}.spm.spatial.normalise.write.roptions.interp=interp;
matlabbatch1{1}.spm.spatial.normalise.write.roptions.wrap=wrap;
matlabbatch1{1}.spm.spatial.normalise.write.roptions.prefix=prefix;
matlabbatch=matlabbatch1;

 
spm('defaults','fmri');
spm_jobman('initcfg');
output=spm_jobman('run',matlabbatch1);

end