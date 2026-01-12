{ lib, ... }:
{
  programs.starship = {
    enable = true;

    settings = {
      "$schema" = "https://starship.rs/config-schema.json";

      palette = "catppuccin_mocha";
      add_newline = false;

      format = lib.concatStrings [
        "[](blue)"
        "$username"
        "[](bg:green fg:blue)"
        "$directory"
        "[](bg:yellow fg:green)"
        "$git_branch"
        "$git_status"
        "[](bg:red fg:yellow)"
        "$cmd_duration"
        "[](bg:lavender fg:red)"
        "$time"
        "[](lavender)"
        "$line_break"
        "$character"
      ];

      username = {
        show_always = true;
        style_user = "bg:blue fg:crust";
        style_root = "bg:blue fg:crust";
        format = "[ $user ]($style)";
      };

      directory = {
        style = "bg:green fg:crust";
        format = "[ $path ]($style)";
        truncation_length = 0;
        truncate_to_repo = false;
      };

      git_branch = {
        symbol = "";
        style = "bg:yellow";
        format = "[[ $symbol $branch ](fg:crust bg:yellow)]($style)";
      };

      git_status = {
        style = "bg:yellow";
        format = "[[($all_status$ahead_behind )](fg:crust bg:yellow)]($style)";
      };

      time = {
        disabled = false;
        time_format = "%T";
        style = "bg:lavender";
        format = "[[ $time ](fg:crust bg:lavender)]($style)";
      };

      cmd_duration = {
        show_milliseconds = true;
        format = "[ $duration ]($style)";
        style = "fg:crust bg:red";
        disabled = false;
        show_notifications = true;
        min_time_to_notify = 30000;
      };

      line_break.disabled = false;

      character = {
        disabled = false;
        success_symbol = "[](fg:green)";
        error_symbol = "[](fg:red)";
        vimcmd_symbol = "[](fg:green)";
        vimcmd_replace_one_symbol = "[](fg:lavender)";
        vimcmd_replace_symbol = "[](fg:lavender)";
        vimcmd_visual_symbol = "[](fg:yellow)";
      };

      battery.disabled = true;
      docker_context.disabled = true;

      palettes = {
        catppuccin_mocha = {
          rosewater = "#f5e0dc";
          flamingo = "#f2cdcd";
          pink = "#f5c2e7";
          mauve = "#cba6f7";
          red = "#f38ba8";
          maroon = "#eba0ac";
          peach = "#fab387";
          yellow = "#f9e2af";
          green = "#a6e3a1";
          teal = "#94e2d5";
          sky = "#89dceb";
          sapphire = "#74c7ec";
          blue = "#89b4fa";
          lavender = "#b4befe";
          text = "#cdd6f4";
          subtext1 = "#bac2de";
          subtext0 = "#a6adc8";
          overlay2 = "#9399b2";
          overlay1 = "#7f849c";
          overlay0 = "#6c7086";
          surface2 = "#585b70";
          surface1 = "#45475a";
          surface0 = "#313244";
          base = "#1e1e2e";
          mantle = "#181825";
          crust = "#11111b";
        };
      };
    };
  };
}