function get_f_d_by_fitting(W,expect_d);

	N=size(W,1);
	W[isnan(W)]=0;
	dark_bins=find(sum(W,1).==0);
	num_dark=length(dark_bins);
	N_eff=N-num_dark;
	f_W=zeros(size(W));#what's f_W? it's a generation of ones(size(W));

	x=collect(1:length(expect_d));
	gamma,K=fit_expect_d(expect_d);
	expect_d2=K*x.^gamma;
	
	#this step is added for Ren's data..
	#expect_d2[1]=expect_d[1];
	#miss this thought..

	for d=0:N-1
		f_W[1+d:N+1:end-d*N]=expect_d2[d+1];
	end
	tmp=f_W-diagm(diag(f_W));
	f_W=f_W+tmp';
	#sum(f_W[1,:])=1 here..

	f_W[dark_bins,:]=0;
	f_W[:,dark_bins]=0;
	f_W=f_W/sum(f_W)*N_eff.^2;

	return f_W;

end
