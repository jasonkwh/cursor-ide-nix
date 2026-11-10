rec {
  pname = "cursor";
  version = "3.29.15";
  commit = "86776fcb52ca505783155631089b65d646f9b03f";

  archives = {
    aarch64-linux = {
      url = "https://downloads.cursor.com/production/${commit}/linux/arm64/Cursor-${version}-aarch64.AppImage";
      hash = "sha256-4DdEXR8VXKVEkKIOCiY4d0zee5OTttkQtiNZ3AiQxFU=";
    };
    x86_64-linux = {
      url = "https://downloads.cursor.com/production/${commit}/linux/x64/Cursor-${version}-x86_64.AppImage";
      hash = "sha256-rvFuzyfb6ohiXQbU+UXG0RUsSJ8v7dUDLJeNaW+UF9E=";
    };
    aarch64-darwin = {
      url = "https://downloads.cursor.com/production/${commit}/darwin/arm64/Cursor-darwin-arm64.zip";
      hash = "sha256-j6JeUKY7BOjYqGRYNOdHHQ0QKyKbjBa/ngbdYj5pSYY=";
    };
  };
}
