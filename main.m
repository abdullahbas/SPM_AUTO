


start=tic;
f=figure(1);

spm('fmri')

for ii=1:length(listM)
subj=tic
top_dir=[listM{ii} '\'];
bold_dir=[top_dir 'BOLD'];
if isempty( dir([top_dir '*.nii']))==0
spm_file_split([top_dir 'rest.nii'],[bold_dir])
a=dir([bold_dir '/*.nii'])
out=size(a,1)
%copyfile ([top_dir 'mprage_noface.nii'],[top_dir 'MPRAGE\mprage_noface.nii'],'f') 
end
mprageAd=[top_dir 'MPRAGE\mprage_noface.nii'];

tic
[reOut,reBatch]=realign('bold_dir',bold_dir,'slcn',[5:out]);
pause(1);
savefig([top_dir 'FIGURE\Realign.fig'])
matlabbatch=reBatch;
save([top_dir 'BATCH\reBatch.mat'],'matlabbatch')
toc
crg=tic
[coOut,coBatch]=coreg(reOut,mprageAd);
savefig([top_dir 'FIGURE\Coregist.fig'])
matlabbatch=coBatch;
save([top_dir 'BATCH\coBatch.mat'],'matlabbatch')
elpCr=toc(crg)

tic
[neOut,neBatch]=normalEst(mprageAd);
savefig([top_dir 'FIGURE\NormaliseEst.fig'])
matlabbatch=neBatch;

save([top_dir 'BATCH\neBatch.mat'],'matlabbatch')
toc

tic
[nwMpra,nwBatMpra]=normalwrite(neOut,mprageAd);
[nwOut,nwBatch]=normalwrite(neOut,coOut);
savefig([top_dir 'FIGURE\NormaliseWri.fig'])
matlabbatch=nwBatch;

save([top_dir 'BATCH\nwBatch.mat'],'matlabbatch')
toc

tic
[smOut,smBatch]=smooth_spm(nwOut);
savefig([top_dir 'FIGURE\Smoothing.fig'])
matlabbatch=smBatch;

save([top_dir 'BATCH\smBatch.mat'],'matlabbatch')
toc
%}
segment_spm([top_dir 'MPRAGE\nmprage_noface.nii']);
elpSub=toc(subj)
end
elaps=toc(start);