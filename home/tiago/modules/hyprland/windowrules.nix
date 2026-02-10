{
  wayland.windowManager.hyprland.settings.windowrule = [
    {
      name = "File picker";
      "match:class" = "xdg-desktop-portal-gtk";
      "match:title" = "Open Files";
      float = true;
      center = true;
      size = "800 600";
    }
    {
      name = "Calculator";
      "match:class" = "org.gnome.Calculator";
      float = true;
      size = "380 620";
    }
    {
      "name" = "DBeaver splash";
      "match:class" = "java";
      "match:title" = "Dbeaver";
      float = true;
      center = true;
      workspace = "7";
    }
    {
      name = "DBeaver";
      "match:class" = "DBeaver";
      workspace = "7";
    }
    {
      name = "Obsidian";
      "match:class" = "obsidian";
      workspace = "9";
    }
  ];
}