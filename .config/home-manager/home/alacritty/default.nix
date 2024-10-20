programs.alacritty = {
  enable = true;
  settings = {
    cursor = {
      unfocused_hollow = false;
      style = {
        blinking = "On";
        shape = "Block";
      };
    };
  env = {
      TERM = "alacritty";

    };
  };
};
