with Ada.Directories;
with Ada.Text_IO;

package body FS_Config is

   function Get (Name : String) return String is
   begin
      return Get (B => Default_Base, Name => Name);
   end Get;

   procedure Set (Name : String; Value : String) is
   begin
      Set (B => Default_Base, Name => Name, Value => Value);
   end Set;

   function Get (B : Base; Name : String) return String is
      File : Ada.Text_IO.File_Type;

      Full_Path : constant String := B & Name;

      Data : String (1 .. 100);
      Last : Natural;
   begin
      if Ada.Directories.Exists (Full_Path) then
         Ada.Text_IO.Open
           (File => File,
            Mode => Ada.Text_IO.In_File,
            Name => Full_Path);

         Ada.Text_IO.Get_Line (File => File, Item => Data, Last => Last);

         Ada.Text_IO.Close (File => File);

         return Data (1 .. Last);
      else
         raise Constraint_Error with "file " & Full_Path & " does not exist.";
      end if;
   end Get;

   procedure Set
     (B     : Base;
      Name  : String;
      Value : String)
   is
      Full_Path : constant String := B & Name;

      File : Ada.Text_IO.File_Type;
   begin
      if Ada.Directories.Exists (Full_Path) then
         Ada.Text_IO.Open
           (File => File,
            Mode => Ada.Text_IO.Out_File,
            Name => Full_Path);

         Ada.Text_IO.Put_Line (File => File, Item => Value);

         Ada.Text_IO.Close (File => File);
      end if;
   end Set;

end FS_Config;
