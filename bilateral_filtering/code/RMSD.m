
function val = RMSD(oi,fi)

  [m,n] = size(oi);
  p = m*n;
  oi = oi(:);
  fi = fi(:);
  di = oi-fi;
  msd = dot(di,di)/p;
  val = sqrt(msd);
  

end
