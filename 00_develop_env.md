[EV3サポート終了のおしらせ](https://elixirforum.com/t/remove-nerves-lego-ev3-support/16661)

```
fhunleth
Co-author of Nerves
Sep '18 -> 2018/09
Over the past couple years we’ve had a few cool projects using Nerves on the Lego EV3. Justin and I have kept the EV3 support going even though neither one of us actively uses it anymore. Lately, it seems like no one is using it. It also needs some TLC. I’d love it if someone wanted to take over the task of keeping it synchronized to ev3dev and improve the docs. I’m certainly not going anywhere, and I’d be quite happy to bring someone up to speed on ev3dev and the Nerves support. I just don’t have time to be the primary maintainer any longer.
```

elixir v1.7.3
@josevalim josevalim released this on 25 Aug 2018 ? 1605 commits to master since this release

以下のバージョンをインストール

elixir
x  1.7.3
erlang
x  22.0.7

  
  mix local.hex
  mix local.rebar
  mix archive.install hex nerves_bootstrap
  
  
** (Mix) Nerves Bootstrap v1.6.3 creates projects that require Elixir ~> 1.9.

You have Elixir 1.7.3. Please update your Elixir version or downgrade
the version of Nerves Bootstrap that you're using.

See https://hexdocs.pm/nerves/installation.html for more information on
setting up your environment.


nerves_bootstrapも当時のものをインストール

nerves_bootstrap v1.3.1
@mobileoverlord mobileoverlord released this on 22 Sep 2018 ? 60 commits to master since this release

mix archive.install hex nerves_bootstrap 1.3.1


$ mix nerves.new nerves_ev3_sample
 
* creating nerves_ev3_sample/config/config.exs
* creating nerves_ev3_sample/lib/nerves_ev3_sample.ex
* creating nerves_ev3_sample/lib/nerves_ev3_sample/application.ex
* creating nerves_ev3_sample/test/test_helper.exs
* creating nerves_ev3_sample/test/nerves_ev3_sample_test.exs
* creating nerves_ev3_sample/rel/vm.args
* creating nerves_ev3_sample/rootfs_overlay/etc/iex.exs
* creating nerves_ev3_sample/.gitignore
* creating nerves_ev3_sample/.formatter.exs
* creating nerves_ev3_sample/mix.exs
* creating nerves_ev3_sample/README.md

Fetch and install dependencies? [Yn] Y
* running mix deps.get
* running mix nerves.release.init
Your Nerves project was created successfully.

You should now pick a target. See https://hexdocs.pm/nerves/targets.html#content
for supported targets. If your target is on the list, set `MIX_TARGET`
to its tag name:

For example, for the Raspberry Pi 3 you can either
  $ export MIX_TARGET=rpi3
Or prefix `mix` commands like the following:
  $ MIX_TARGET=rpi3 mix firmware

If you will be using a custom system, update the `mix.exs`
dependencies to point to desired system's package.

Now download the dependencies and build a firmware archive:
  $ cd nerves_ev3_sample
  $ mix deps.get
  $ mix firmware

If your target boots up using an SDCard (like the Raspberry Pi 3),
then insert an SDCard into a reader on your computer and run:
  $ mix firmware.burn

Plug the SDCard into the target and power it up. See target documentation
above for more information and other targets.

```
Fetch and install dependencies? [Yn] Y
* running mix deps.get
* running mix nerves.release.init
Your Nerves project was created successfully.

You should now pick a target. See https://hexdocs.pm/nerves/targets.html#content
for supported targets. If your target is on the list, set `MIX_TARGET`
to its tag name:

For example, for the Raspberry Pi 3 you can either
  $ export MIX_TARGET=rpi3
Or prefix `mix` commands like the following:
  $ MIX_TARGET=rpi3 mix firmware

If you will be using a custom system, update the `mix.exs`
dependencies to point to desired system's package.

Now download the dependencies and build a firmware archive:
  $ cd nerves_ev3_sample
  $ mix deps.get
  $ mix firmware
```


export MIX_TARGET=ev3
$ mix deps.get


Resolving Hex dependencies...
Dependency resolution completed:
New:
  elixir_make 0.6.0
  nerves 1.5.2
  nerves_runtime 0.10.3
  nerves_system_br 1.4.5
  nerves_system_ev3 1.4.0
  nerves_system_linter 0.3.0
  nerves_toolchain_armv5tejl_unknown_linux_musleabi 1.1.0
  nerves_toolchain_ctng 1.5.0
  ring_logger 0.8.0
  shoehorn 0.6.0
  system_registry 0.8.2
  uboot_env 0.1.1
* Getting nerves (Hex package)
* Getting shoehorn (Hex package)
* Getting ring_logger (Hex package)
* Getting nerves_runtime (Hex package)
* Getting nerves_system_ev3 (Hex package)
* Getting nerves_system_br (Hex package)
* Getting nerves_system_linter (Hex package)
* Getting nerves_toolchain_armv5tejl_unknown_linux_musleabi (Hex package)
* Getting nerves_toolchain_ctng (Hex package)
* Getting elixir_make (Hex package)
* Getting system_registry (Hex package)
* Getting uboot_env (Hex package)

Nerves environment
  MIX_TARGET:   ev3
  MIX_ENV:      dev

==> nerves
Compiling 39 files (.ex)
Generated nerves app
==> nerves_ev3_sample
Resolving Nerves artifacts...
  Resolving nerves_system_ev3
  => Trying https://github.com/nerves-project/nerves_system_ev3/releases/download/v1.4.0/nerves_system_ev3-portable-1.4.0-2B1FE02.tar.gz
  
  


$ mix firmware
```
==> nerves_system_br
Generated nerves_system_br app
==> nerves_toolchain_ctng
Compiling 1 file (.ex)
Generated nerves_toolchain_ctng app
==> nerves_system_linter
Compiling 14 files (.ex)
Generated nerves_system_linter app
==> nerves_toolchain_armv5tejl_unknown_linux_musleabi
Generated nerves_toolchain_armv5tejl_unknown_linux_musleabi app
==> nerves_system_ev3
Generated nerves_system_ev3 app
==> nerves_ev3_sample

Nerves environment
  MIX_TARGET:   ev3
  MIX_ENV:      dev

** (Mix) Major version mismatch between host and target Erlang/OTP versions
  Host version: 22
  Target version: 21

This will likely cause Erlang code compiled for the target to fail in
unexpected ways. Install an Erlang OTP release that matches the target
version before continuing.
```

```
vagrant@vagrant:~/src/github.com/y-jono/nerves_ev3_sample$ asdf install elixir 1.7.3-otp-22
==> Checking whether specified Elixir release/reference exists...
==> Downloading 1.7.3-otp-22 to /tmp/elixir_build_jFnL4W/elixir-precompiled-1.7.3-otp-22.zip
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 4930k  100 4930k    0     0  13.6M      0 --:--:-- --:--:-- --:--:-- 13.6M
==> Copying release into place
```

vagrant@vagrant:~/src/github.com/y-jono/nerves_ev3_sample$ asdf global elixir 1.7.3-otp-22

vagrant@vagrant:~/src/github.com/y-jono/nerves_ev3_sample$ mix firmware

Nerves environment
  MIX_TARGET:   ev3
  MIX_ENV:      dev

** (Mix) Major version mismatch between host and target Erlang/OTP versions
  Host version: 22
  Target version: 21

This will likely cause Erlang code compiled for the target to fail in
unexpected ways. Install an Erlang OTP release that matches the target
version before continuing.

次にやること。

erlang 21.3.8.11をインストールして、mix firmwareする


