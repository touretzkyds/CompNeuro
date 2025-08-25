function z = update_slider(slider_handle,text_handle,vmin,vmax,delta,fmt)

  val = get(slider_handle,'Value');

  scale = vmax - vmin;
  fixedval = floor(delta/2 + val*scale/delta)*delta/scale;
  set(slider_handle,'Value',fixedval);

  z = fixedval*scale + vmin;

  set(text_handle,'String',sprintf(fmt,z));
