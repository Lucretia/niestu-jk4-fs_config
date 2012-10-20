
package FS_Config is

   subtype Base is String;

   Default_Base : Base := ".";

   function Get (Name : String) return String;
   procedure Set
     (Name  : String;
      Value : String);

   function Get (B : Base; Name : String) return String;
   procedure Set
     (B     : Base;
      Name  : String;
      Value : String);

end FS_Config;
