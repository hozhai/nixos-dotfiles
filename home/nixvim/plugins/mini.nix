{...}: {
  programs.nixvim = {
    plugins = {
      mini = {
        enable = true;
        modules = {
          indentscope = {
            symbol = "|";
          };
        };
      };
    };
  };
}
