function  [output,matlabbatch]=smooth_spm(nwOut,varargin)
%{ Author Abdullah Baþ
%  26.07.18 03:36
% This script was generatad for automating SPM pre-process steps
%
%Values can be input
%
%property={'fwhm','dtype','im','prefix'}
%
%Default values
%
%nwOut=Normalise write dan çýkan sonuç
%fwhm=Blur estimates (def=[6 6 6])
%prefix=yes you're right (def=s);
%fwhm=[6 6 6];dtype=0;im=0;;prefix='s'
%value={[6 6 6],0,0,'s'}

property={'fwhm','dtype','im','prefix'};

value={[6 6 6],0,0,'s'};

% For Realignment Step
for i=1:2:length(varargin)

    for j=1:length(property)
        test=strcmp(varargin{i},property{j});
        if test==1
        value(j)=varargin(i+1);
        end   
    end
    
end


fwhm=value{1};dtype=value{2};im=value{3};prefix=value{4};


matlabbatch1{1}.spm.spatial.smooth.data=nwOut{1,1}.files;

matlabbatch1{1}.spm.spatial.smooth.fwhm=fwhm;
matlabbatch1{1}.spm.spatial.smooth.dtype=dtype;
matlabbatch1{1}.spm.spatial.smooth.im=im;
matlabbatch1{1}.spm.spatial.smooth.prefix=prefix;

matlabbatch=matlabbatch1;

 
spm('defaults','fmri');
spm_jobman('initcfg');
output=spm_jobman('run',matlabbatch1);

end