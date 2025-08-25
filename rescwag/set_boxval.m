function set_boxval(obj)

global Coeffs

v = get(obj,'Value');
s = get(obj,'String');
u = get(obj,'UserData');
nv = str2num(s);

if isempty(nv)
    nv = v;
end

set(obj,'String',num2str(nv))
set(obj,'Value',nv)

Coeffs(u) = nv;
