function  [output matlabbatch]=realign(varargin)
%{ Author Abdullah Baþ
%  26.07.18 03:36
% This script was generatad for automating SPM pre-process steps
%
%Values can be input
%property={'bold_dir','ftype','slcn','quality','sep','fwhm','rtm','interp'
%  %  ,'wrap','weights','which','interp2','wrap2','mask','prefix'}
%
%Default values
% bold_dir=pwd;ftype='nii';slcn=[6:236]
%quality=0.9;sep=4;fwhm=5;rtm=1;interp=2;wrap=[0 0 0];weights=''
%which=[2 0];interp2=4;wrap2=[0 0 0];mask=1;prefix='r'
%
%bold_dir= Folder of epi files (def=pwd)
%ftype= Type of files e.g(nii,img..vs)(def=nii)
%slcn= Slices to be pre-processed (def=[6:236])
%prefix=you know what it is (def='r')

property={'bold_dir','ftype','slcn','quality','sep','fwhm','rtm','interp'...
    ,'wrap','weights','which','interp2','wrap2','mask','prefix'};
value={pwd,'nii',[6 236],0.9,4,5,1,2,[0 0 0],'',[2 0],4,[0 0 0],1,'r'};
for i=1:2:length(varargin)

    for j=1:length(property)
        test=strcmp(varargin{i},property{j});
        if test==1
        value(j)=varargin(i+1);
        end   
    end
    
end
% For Realignment Step
bold_dir=value{1};ftype=value{2};slcn=value{3};
quality=value{4};sep=value{5};fwhm=value{6};rtm=value{7};interp=value{8};...
wrap=value{9};weights=value{10};
which=value{11};interp2=value{12};wrap2=value{13};mask=value{14};prefix=value{15};
adress=dir([bold_dir,'/*.' ftype]);
disp(['Ana Dosya Yolu=' bold_dir])
if (ftype=='nii')
test1=0;
for i=slcn(1):slcn(end)
    try
        buffer{i+1-slcn(1),1}=[bold_dir '\' adress.name ',' num2str(i)];
        f0=exist(buffer{i+1-slcn(1),1});
        
    if(f0==0 & i==slcn(1))
    num2str(buffer)
    elseif(test1==1)
    num2str(buffer)
    elseif(f0==0 & test1==0)    
    disp(['Slice sayýsý= ' num2str(i-1)] );
    break; 
    end
    catch
        test1=1;
        buffer{i+1-slcn(1),1}= [bold_dir '\' adress(i).name];
    end
end
else
for i=slcn(1):slcn(end)
    try
        buffer{i+1-slcn(1),1}= [bold_dir '\' adress(i).name];

    catch
        disp(['Slice sayýsý= ' num2str(i-1)] );
        break;
    end
end
end

matlabbatch1{1}.spm.spatial.realign.estwrite.data{1}=buffer;
matlabbatch1{1}.spm.spatial.realign.estwrite.eoptions.quality=quality;
matlabbatch1{1}.spm.spatial.realign.estwrite.eoptions.sep=sep;
matlabbatch1{1}.spm.spatial.realign.estwrite.eoptions.fwhm=fwhm;
matlabbatch1{1}.spm.spatial.realign.estwrite.eoptions.rtm=rtm;
matlabbatch1{1}.spm.spatial.realign.estwrite.eoptions.interp=interp;
matlabbatch1{1}.spm.spatial.realign.estwrite.eoptions.wrap=wrap;
matlabbatch1{1}.spm.spatial.realign.estwrite.eoptions.weight=weights;


matlabbatch1{1}.spm.spatial.realign.estwrite.roptions.which=which;
matlabbatch1{1}.spm.spatial.realign.estwrite.roptions.interp=interp2;
matlabbatch1{1}.spm.spatial.realign.estwrite.roptions.wrap=wrap2;
matlabbatch1{1}.spm.spatial.realign.estwrite.roptions.mask=mask;
matlabbatch1{1}.spm.spatial.realign.estwrite.roptions.prefix=prefix;
matlabbatch=matlabbatch1;

spm('defaults','fmri');
spm_jobman('initcfg');
output=spm_jobman('run',matlabbatch1);
matlabbatch=matlabbatch1;

end