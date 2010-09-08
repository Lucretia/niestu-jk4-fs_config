with Ada.Directories;
with Ada.Text_IO;

package body FS_Config is

   function Get (Name : String) return String is
      File : Ada.Text_IO.File_Type;

      Data : String (1 .. 100);
      Last : Natural;
   begin
      if Ada.Directories.Exists (Ada.Directories.Current_Directory & Name) then
         Ada.Text_IO.Open
           (File => File,
            Mode => Ada.Text_IO.In_File,
            Name => Ada.Directories.Current_Directory & Name);

         Ada.Text_IO.Get_Line (File => File, Item => Data, Last => Last);

         Ada.Text_IO.Close (File => File);

         return Data (1 .. Last);
      else
         raise Constraint_Error with "file " & Ada.Directories.Current_Directory & Name & " does not exist.";
      end if;
   end Get;

   procedure Set
     (Name  : String;
      Value : String)
   is
      File : Ada.Text_IO.File_Type;
   begin
      if Ada.Directories.Exists (Ada.Directories.Current_Directory & Name) then
         Ada.Text_IO.Open
           (File => File,
            Mode => Ada.Text_IO.Out_File,
            Name => Ada.Directories.Current_Directory & Name);

         Ada.Text_IO.Put_Line (File => File, Item => Value);

         Ada.Text_IO.Close (File => File);
      end if;
   end Set;

end FS_Config;
