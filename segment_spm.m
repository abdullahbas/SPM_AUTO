function segment_spm(mprageAd)


matlabbatch1{1}.spm.spatial.preproc.data{1}=mprageAd;

matlabbatch1{1}.spm.spatial.preproc.output.GM=[0 0 1];
matlabbatch1{1}.spm.spatial.preproc.output.WM=[0 0 1];
matlabbatch1{1}.spm.spatial.preproc.output.CSF=[0 0 1];
matlabbatch1{1}.spm.spatial.preproc.output.biascor=1;
matlabbatch1{1}.spm.spatial.preproc.output.cleanup=0;

matlabbatch1{1}.spm.spatial.preproc.opts.tpm{1,1}=[matlabroot '\toolbox\spm8\tpm\grey.nii'];
matlabbatch1{1}.spm.spatial.preproc.opts.tpm{2,1}=[matlabroot '\toolbox\spm8\tpm\white.nii'];
matlabbatch1{1}.spm.spatial.preproc.opts.tpm{3,1}=[matlabroot '\toolbox\spm8\tpm\csf.nii'];
matlabbatch1{1}.spm.spatial.preproc.opts.ngaus=[2;2;2;4];
matlabbatch1{1}.spm.spatial.preproc.opts.regtype='mni';
matlabbatch1{1}.spm.spatial.preproc.opts.warpreg=1;
matlabbatch1{1}.spm.spatial.preproc.opts.warpco=25;
matlabbatch1{1}.spm.spatial.preproc.opts.biasreg=1.000000000000000e-04;
matlabbatch1{1}.spm.spatial.preproc.opts.biasfwhm=60;
matlabbatch1{1}.spm.spatial.preproc.opts.samp=3;
matlabbatch1{1}.spm.spatial.preproc.opts.msk{1}='';

spm('defaults','fmri');
spm_jobman('initcfg');
spm_jobman('run',matlabbatch1);


end