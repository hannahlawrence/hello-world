using JLD
using MAT

function expectICD_to_mat(names,matfilename)
  display("here0")
  f=open(names)
  display("here1")
  matf=matopen(matfilename,"w")
  display("here2")
  for ln in eachline(f)
    display("here3")
    d=load(ln[1:length(ln)-1])
    keys(d)
    display("here4")
    varname=ln[1:length(ln)-11];
    varname=replace(varname,'-','_')
    varname=varname*"ICD"
    ICD=d["inter_chr_expect"];
    write(matf,varname,ICD);
  end
  close(f)
  close(matf)
end
    
function expect_to_mat(names,matfilename)
  display("here0")
  f=open(names)
  display("here1")
  matf=matopen(matfilename,"w")
  display("here2")
  for ln in eachline(f)
    d=load(ln[1:length(ln)-1]);
    varname=ln[1:length(ln)-5];
    varname=replace(varname,'-','_')
    expect_d=d["expect_d"];
    write(matf,varname,expect_d);
  end
  close(f)
  close(matf)
end
  
function GPC_to_mat(names,matfilename)
  display("here0")
  f=open(names)
  display("here1")
  matf=matopen(matfilename,"w")
  display("here2")
  for ln in eachline(f)
    display("here3")
    d=load(ln[1:leng);
    display("here4")
    varname=ln[1:length(ln)-5];
    varname=replace(varname,'-','_')
    GPC=d["GPC"];
    write(matf,varname,GPC);
  end
  close(f)
  close(matf)
end

# function dict_to_cellarr(dict) (unnecessary: just write loops w/key
  
  
  #need to check if MAT can write multiple variables to file at one time
  #need to check that varname is what I'd like it to be
  
  
  
  
    
