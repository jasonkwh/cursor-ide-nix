rec {
  pname = "cursor";
  version = "3.31.15";
  commit = "3eb8c13390837371c7c2f2013dc57fdbc802c753";

  archives = {
    aarch64-linux = {
      url = "https://downloads.cursor.com/production/${commit}/linux/arm64/Cursor-${version}-aarch64.AppImage";
      hash = "sha256-B9bPu8pec2wiSnwEsBCqQz5kXn3wHI9O+hPlRw4T1q0=";
    };
    x86_64-linux = {
      url = "https://downloads.cursor.com/production/${commit}/linux/x64/Cursor-${version}-x86_64.AppImage";
      hash = "sha256-ZGgK+FrcBp+JDVF8Il7KmAX4BpYbdn4PYBMLP3ajIF0=";
    };
    aarch64-darwin = {
      url = "https://downloads.cursor.com/production/${commit}/darwin/arm64/Cursor-darwin-arm64.zip";
      hash = "sha256-CiWjc8qPT7w2XsRmHaaKzYwppBIxlctGYLF7vwZaxU8=";
    };
  };
}
