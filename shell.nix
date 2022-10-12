let
  mach-nix = import
    (builtins.fetchGit {
      url = "https://github.com/DavHau/mach-nix";
      ref = "refs/tags/3.5.0";
    })
    {
      python = "python310";
      # get lastest commit from https://github.com/DavHau/pypi-deps-db
      # pypiDataRev = "79628e26a3f912400da74b49c7390493cb82610b";
      pypiDataRev = "da4ad12130b249a2d7c205a832dcea71452e8ae7";
      # nix-prefetch-url --unpack https://github.com/DavHau/pypi-deps-db/tarball/{commit}
      # pypiDataSha256 = "05v33iiymj54d6qmrlxlcsfmlkvh4pj9dqbcz5jzvzslfvfprs3a";
      pypiDataSha256 = "0jzh9528lj1b75xscm8ipnmd6rxxn9g0amyf7rbzfkrpn7bzkm7s";
    };
in
mach-nix.mkPythonShell {
  requirements = builtins.readFile ./requirements.txt;
}