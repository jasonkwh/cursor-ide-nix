rec {
  pname = "cursor";
  version = "3.30.14";
  commit = "5f54c8173e5552412beb40702adac16275677fa0";

  archives = {
    aarch64-linux = {
      url = "https://downloads.cursor.com/production/${commit}/linux/arm64/Cursor-${version}-aarch64.AppImage";
      hash = "sha256-tkNWA6fCu05hovGHen4UxqG3zlSPmSH2xIl7jLXoJeM=";
    };
    x86_64-linux = {
      url = "https://downloads.cursor.com/production/${commit}/linux/x64/Cursor-${version}-x86_64.AppImage";
      hash = "sha256-6gfkPW9kEnXIhd4LqzZXVBEMVyH+hSTNuDtoUIDoq7k=";
    };
    aarch64-darwin = {
      url = "https://downloads.cursor.com/production/${commit}/darwin/arm64/Cursor-darwin-arm64.zip";
      hash = "sha256-CQgJBBZJ2iexI1p/OpvazbNfIK44/QttbPafGRihRa8=";
    };
  };
}
