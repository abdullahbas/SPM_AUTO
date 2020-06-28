function  [output,matlabbatch]=normalEst(source_dir,varargin)
%{ Author Abdullah Baþ
%  26.07.18 03:36
% This script was generatad for automating SPM pre-process steps
%
%Values can be input
%
%property={'wtsrc','template','weight','smosrc','smoref'
%,'regtype','cutoff','nits','reg'}
%
%Default values
%source_dir=Directory of mprage(def=pwd)
%template=template image (def=T1.nii,1)
%value={'','T1.nii,1','',8,0,'mni','25','16','1'}

property={'wtsrc','template','weight','smosrc','smoref'...
    ,'regtype','cutoff','nits','reg'};
top_dir_temp='C:\Program Files\MATLAB\MATLAB Production Server\R2015a\toolbox\spm8\templates\';
value={'','T1.nii,1','',8,0,'mni',25,16,1};

% For Realignment Step
for i=1:2:length(varargin)

    for j=1:length(property)
        test=strcmp(varargin{i},property{j});
        if test==1
        value(j)=varargin(i+1);
        end   
    end
    
end


wtsrc=value{1};template=[top_dir_temp value{2}];weight=value{3};smosrc=value{4};smoref=value{5};...
    regtype=value{6}; cutoff=value{7};nits=value{8};reg=value{9};



matlabbatch1{1}.spm.spatial.normalise.est.subj.source{1}=source_dir;
matlabbatch1{1}.spm.spatial.normalise.est.subj.wtsrc=wtsrc;

matlabbatch1{1}.spm.spatial.normalise.est.eoptions.template{1}=template;
matlabbatch1{1}.spm.spatial.normalise.est.eoptions.weight=weight;
matlabbatch1{1}.spm.spatial.normalise.est.eoptions.smosrc=smosrc;
matlabbatch1{1}.spm.spatial.normalise.est.eoptions.smoref=smoref;
matlabbatch1{1}.spm.spatial.normalise.est.eoptions.regtype=regtype;
matlabbatch1{1}.spm.spatial.normalise.est.eoptions.cutoff=cutoff;
matlabbatch1{1}.spm.spatial.normalise.est.eoptions.nits=nits;
matlabbatch1{1}.spm.spatial.normalise.est.eoptions.reg=reg;
matlabbatch=matlabbatch1;


 
spm('defaults','fmri');
spm_jobman('initcfg');
output=spm_jobman('run',matlabbatch1);

end