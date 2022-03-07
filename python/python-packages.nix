# Generated by pip2nix 0.8.0.dev1
# See https://github.com/nix-community/pip2nix

{ pkgs, fetchurl, fetchgit, fetchhg }:

self: super: {
  "alohomora" = super.buildPythonPackage rec {
    pname = "alohomora";
    version = "2.4.0";
    src = ./../../../Library/Caches/pip/wheels/7b/83/f5/6badfbbaf8d9a9ae4896870ae2877847192160dd39a6a6897e/alohomora-2.4.0-py3-none-any.whl;
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."beautifulsoup4"
      self."boto3"
      self."requests"
    ];
  };
  "beautifulsoup4" = super.buildPythonPackage rec {
    pname = "beautifulsoup4";
    version = "4.10.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/69/bf/f0f194d3379d3f3347478bd267f754fc68c11cbf2fe302a6ab69447b1417/beautifulsoup4-4.10.0-py3-none-any.whl";
      sha256 = "1gs9w76lzb85ha2zqdhxa90cj06p9fy5ah1aayj0x4j903kmqccs";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."soupsieve"
    ];
  };
  "boto3" = super.buildPythonPackage rec {
    pname = "boto3";
    version = "1.20.23";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/d7/24/4b70d13b553f7ca14efaa652f5b61e8a1fc63d5a98a0b4eed74eca5c9a16/boto3-1.20.23-py3-none-any.whl";
      sha256 = "17ip74842g6x4nbnds3m3rp6z67fy4lwsr68ichwjq6q3l6yxcvn";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."botocore"
      self."jmespath"
      self."s3transfer"
    ];
  };
  "botocore" = super.buildPythonPackage rec {
    pname = "botocore";
    version = "1.23.23";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/06/75/72b9236e2ff5ff7d24d1a04dae90cc5974f1cb830ddfe61ba8a18df4664d/botocore-1.23.23-py3-none-any.whl";
      sha256 = "111frhlnafc8wjd9qzgbrdm4iin61lzzj4w0gs3viwwl8mn7cnbl";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."jmespath"
      self."python-dateutil"
      self."urllib3"
    ];
  };
  "certifi" = super.buildPythonPackage rec {
    pname = "certifi";
    version = "2021.10.8";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/37/45/946c02767aabb873146011e665728b680884cd8fe70dde973c640e45b775/certifi-2021.10.8-py2.py3-none-any.whl";
      sha256 = "0scm6gbbk4gfwb1flivxihnim9wragvvvcia0jn488scxdih2ann";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
  };
  "charset-normalizer" = super.buildPythonPackage rec {
    pname = "charset-normalizer";
    version = "2.0.9";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/47/84/b06f6729fac8108c5fa3e13cde19b0b3de66ba5538c325496dbe39f5ff8e/charset_normalizer-2.0.9-py3-none-any.whl";
      sha256 = "089pvy5xah5sg22q7myfz43bscvc9rk6bz6p56gbxd9d884smv0y";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
  };
  "idna" = super.buildPythonPackage rec {
    pname = "idna";
    version = "3.3";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/04/a2/d918dcd22354d8958fe113e1a3630137e0fc8b44859ade3063982eacd2a4/idna-3.3-py3-none-any.whl";
      sha256 = "1zrm4xnjas13byafi11ma2q8h5rr1fmjwvi41xp5k07sgw2dvnc4";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
  };
  "jmespath" = super.buildPythonPackage rec {
    pname = "jmespath";
    version = "0.10.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/07/cb/5f001272b6faeb23c1c9e0acc04d48eaaf5c862c17709d20e3469c6e0139/jmespath-0.10.0-py2.py3-none-any.whl";
      sha256 = "0bxp1hnjrb4vaksa43s2ghjwr3jb5rpv6q8x2hq7fnfc0icm5xnd";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
  };
  "python-dateutil" = super.buildPythonPackage rec {
    pname = "python-dateutil";
    version = "2.8.2";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/36/7a/87837f39d0296e723bb9b62bbb257d0355c7f6128853c78955f57342a56d/python_dateutil-2.8.2-py2.py3-none-any.whl";
      sha256 = "1aaxjfp4lrz8c6qls3vdhw554lan3khy9afyvdcvrssk6kf067cn";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."six"
    ];
  };
  "requests" = super.buildPythonPackage rec {
    pname = "requests";
    version = "2.26.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/92/96/144f70b972a9c0eabbd4391ef93ccd49d0f2747f4f6a2a2738e99e5adc65/requests-2.26.0-py2.py3-none-any.whl";
      sha256 = "097xdqddqm6ikzf30867irmrq3wg1s8nz450512wspnd7r8lc4kc";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."certifi"
      self."charset-normalizer"
      self."idna"
      self."urllib3"
    ];
  };
  "s3transfer" = super.buildPythonPackage rec {
    pname = "s3transfer";
    version = "0.5.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/ab/84/fc3717a7b7f0f6bb08af593127171f08e3e0087c197922da09c01bfe7c3a/s3transfer-0.5.0-py3-none-any.whl";
      sha256 = "00r8mwb4jf5zaq455an9j82n6d0g1avz9fqflaysd4a3h5lw67cw";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."botocore"
    ];
  };
  "six" = super.buildPythonPackage rec {
    pname = "six";
    version = "1.16.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/d9/5a/e7c31adbe875f2abbb91bd84cf2dc52d792b5a01506781dbcf25c91daf11/six-1.16.0-py2.py3-none-any.whl";
      sha256 = "0m02dsi8lvrjf4bi20ab6lm7rr6krz7pg6lzk3xjs2l9hqfjzfwa";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
  };
  "soupsieve" = super.buildPythonPackage rec {
    pname = "soupsieve";
    version = "2.3.1";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/72/a6/fd01694427f1c3fcadfdc5f1de901b813b9ac756f0806ef470cfed1de281/soupsieve-2.3.1-py3-none-any.whl";
      sha256 = "1yzy3q502f0kkyyj5znlazr3fmnyllginrpd8c1qrcy62wkclg0s";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
  };
  "urllib3" = super.buildPythonPackage rec {
    pname = "urllib3";
    version = "1.26.7";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/af/f4/524415c0744552cce7d8bf3669af78e8a069514405ea4fcbd0cc44733744/urllib3-1.26.7-py2.py3-none-any.whl";
      sha256 = "0i68pdi0mfnfjphp6ycsf1rzibjdzv4ipq1p6r1fbdh5jq0z9zf4";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
  };
}