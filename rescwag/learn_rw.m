function learn_rw(inputs,ucs)

  global Weights Coeffs cr_button bkg_button

  UR = inputs*Weights';
  
  if get(cr_button,'Value') == 1
      UR = max(0, UR);
  end

  Weights = Weights + Coeffs(5)*(ucs-UR).*inputs.*Coeffs(1:4);

  if get(bkg_button,'Value') == 1
    Weights(1) = max(0, Weights(1));
  end
