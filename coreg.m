function  [output,matlabbatch]=coreg(reOut,ref_dir,varargin)
%{ Author Abdullah Baþ
%  26.07.18 03:36
% This script was generatad for automating SPM pre-process steps
%
%Values can be input
%property={'cost_fun','sep','fwhm','tol','interp'
%,'wrap','mask','prefix'}
%
%Default values
%reOut=realign kodundan alýnan cýktý 
%ref_dir=reference image direction (mprage)
%cost_fun=Optimization algorithm(def=nmi)
%prefix=you know what it is (def=c)
%
%value={'nmi',[4 2],[7 7],[0.0200000000000000 0.0200000000000000 
%   0.0200000000000000 0.00100000000000000 0.00100000000000000 
%   0.00100000000000000 0.0100000000000000 
%   0.0100000000000000 0.0100000000000000 
%   0.00100000000000000 
%  0.00100000000000000 
%   0.00100000000000000],1,[0 0 0],0,'c'}

reOut=reOut{1,1}.sess.rfiles;
property={'cost_fun','sep','fwhm','tol','interp'...
    ,'wrap','mask','prefix'};
value={'nmi',[4 2],[7 7],[0.0200000000000000 0.0200000000000000 ...
    0.0200000000000000 0.00100000000000000 0.00100000000000000 ...
    0.00100000000000000 0.0100000000000000 ...
    0.0100000000000000 0.0100000000000000 ...
    0.00100000000000000 ...
    0.00100000000000000 ...
    0.00100000000000000],1,[0 0 0],0,'c'};

% For Realignment Step
for i=1:2:length(varargin)

    for j=1:length(property)
        test=strcmp(varargin{i},property{j});
        if test==1
        value(j)=varargin(i+1);
        end   
    end
    
end


cost_fun=value{1};sep=value{2};fwhm=value{3};tol=value{4};interp=value{5};...
    wrap=value{6}; mask=value{7};prefix=value{8};


matlabbatch1{1}.spm.spatial.coreg.estwrite.ref{1}=ref_dir;
matlabbatch1{1}.spm.spatial.coreg.estwrite.source{1}=reOut{1};
reOut2=reOut;
reOut2(1,:)=[];
matlabbatch1{1}.spm.spatial.coreg.estwrite.other=reOut2;

matlabbatch1{1}.spm.spatial.coreg.estwrite.eoptions.cost_fun=cost_fun;
matlabbatch1{1}.spm.spatial.coreg.estwrite.eoptions.sep=sep;
matlabbatch1{1}.spm.spatial.coreg.estwrite.eoptions.tol=tol;
matlabbatch1{1}.spm.spatial.coreg.estwrite.eoptions.fwhm=fwhm;



matlabbatch1{1}.spm.spatial.coreg.estwrite.roptions.interp=interp;
matlabbatch1{1}.spm.spatial.coreg.estwrite.roptions.wrap=wrap;
matlabbatch1{1}.spm.spatial.coreg.estwrite.roptions.mask=mask;
matlabbatch1{1}.spm.spatial.coreg.estwrite.roptions.prefix=prefix;
matlabbatch=matlabbatch1;
 
spm('defaults','fmri');
spm_jobman('initcfg');
output=spm_jobman('run',matlabbatch1);

end