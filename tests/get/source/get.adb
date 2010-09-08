with Ada.Text_IO;

with P9_Config;

procedure Get is

begin
   Ada.Text_IO.Put_Line (P9_Config.Get ("/config/username") );
end Get;
