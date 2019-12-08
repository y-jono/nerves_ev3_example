おそらく、 nerves.new すると、新しいバージョンのnerves 1.5.2 がインストールされてしまうので、 

```
mix.exs 
deps()
  :nerves -> "~> 1.4.0"
end
```

に書き換えて、mix.lock.ev3 を mix deps.unlock -all でロック解除して、
mix deps.get で再取得する。

```

  nerves_toolchain_armv5tejl_unknown_linux_musleabi 1.1.0
  nerves_toolchain_ctng 1.5.0
  ring_logger 0.8.0
  shoehorn 0.6.0
  system_registry 0.8.2
  uboot_env 0.1.1
All dependencies up to date

Nerves environment
  MIX_TARGET:   ev3
  MIX_ENV:      dev

==> nerves
Compiling 35 files (.ex)

== Compilation error in file lib/nerves.ex ==
** (CompileError) lib/nerves.ex:2: module Mix.Releases.Plugin is not loaded and could not be found
    (elixir) expanding macro: Kernel.use/1
    lib/nerves.ex:2: Nerves (module)
could not compile dependency :nerves, "mix compile" failed. You can recompile this dependency with "mix deps.compile nerves", update it with "mix deps.update nerves" or clean it with "mix deps.clean nerves"
mba3:nerves_ev3_sample yoshinori$ mix deps.clean nerves
* Cleaning nerves
mba3:nerves_ev3_sample yoshinori$ mix deps.get
** (Hex.Version.InvalidRequirementError) invalid requirement: "> 1.4"
    (hex) lib/hex/version.ex:134: Hex.Version.parse_requirement!/2
    (hex) lib/hex/version.ex:52: anonymous fn/3 in Hex.Version.match?/3
    (hex) lib/hex/version.ex:144: Hex.Version.cache/2
    (hex) lib/hex/remote_converger.ex:519: anonymous fn/2 in Hex.RemoteConverger.unlock_deps/2
    (elixir) lib/enum.ex:2898: Enum.filter_list/2
    (hex) lib/hex/remote_converger.ex:513: Hex.RemoteConverger.unlock_deps/2
    (hex) lib/hex/remote_converger.ex:502: Hex.RemoteConverger.prepare_locked/3
    (hex) lib/hex/remote_converger.ex:38: Hex.RemoteConverger.converge/2
mba3:nerves_ev3_sample yoshinori$ mix deps.get
Resolving Hex dependencies...

Failed to use "distillery" because
  nerves (versions 1.4.0 to 1.4.4) requires 2.0.12
  shoehorn (version 0.6.0) requires ~> 2.1


Failed to use "distillery" because
  nerves (version 1.4.5) requires ~> 2.0.0
  shoehorn (version 0.6.0) requires ~> 2.1

** (Mix) Hex dependency resolution failed, change the version requirements of your dependencies or unlock them (by using mix deps.update or mix deps.unlock). If you are unable to resolve the conflicts you can try overriding with {:dependency, "~> 1.0", override: true}
mba3:nerves_ev3_sample yoshinori$ mix deps.clean nerves
* Cleaning nerves
warning: the dependency nerves is not present in the build directory
mba3:nerves_ev3_sample yoshinori$ mix deps.get
Resolving Hex dependencies...

Failed to use "distillery" because
  nerves (versions 1.4.0 to 1.4.4) requires 2.0.12
  shoehorn (version 0.6.0) requires ~> 2.1


Failed to use "distillery" because
  nerves (version 1.4.5) requires ~> 2.0.0
  shoehorn (version 0.6.0) requires ~> 2.1

** (Mix) Hex dependency resolution failed, change the version requirements of your dependencies or unlock them (by using mix deps.update or mix deps.unlock). If you are unable to resolve the conflicts you can try overriding with {:dependency, "~> 1.0", override: true}
mba3:nerves_ev3_sample yoshinori$ mix deps.get
Resolving Hex dependencies...
Dependency resolution completed:
New:
  artificery 0.4.2
  distillery 2.0.12
  elixir_make 0.6.0
  nerves 1.4.0
  nerves_runtime 0.10.3
  nerves_system_br 1.4.5
  nerves_system_ev3 1.4.0
  nerves_system_linter 0.3.0
  nerves_toolchain_armv5tejl_unknown_linux_musleabi 1.1.0
  nerves_toolchain_ctng 1.5.0
  ring_logger 0.8.0
  shoehorn 0.5.0
  system_registry 0.8.2
  uboot_env 0.1.1
* Getting nerves (Hex package)
* Updating shoehorn (Hex package)
* Updating distillery (Hex package)

Nerves environment
  MIX_TARGET:   ev3
  MIX_ENV:      dev

==> distillery
Compiling 33 files (.ex)
Generated distillery app
==> nerves
Compiling 35 files (.ex)
Generated nerves app
==> nerves_ev3_sample
Resolving Nerves artifacts...
  Resolving nerves_system_ev3
  => Trying /Users/yoshinori/.nerves/dl/nerves_system_ev3-portable-1.4.0-2B1FE02.tar.gz
  => Success
  Resolving nerves_toolchain_armv5tejl_unknown_linux_musleabi
  => Trying /Users/yoshinori/.nerves/dl/nerves_toolchain_armv5tejl_unknown_linux_musleabi-darwin_x86_64-1.1.0-26086C7.tar.xz
  => Success
A new version of Nerves bootstrap is available(1.3.1 < 1.6.3), You can update by running
  
  mix local.nerves

mba3:nerves_ev3_sample yoshinori$ ls
README.md        config           lib              mix.lock.ev3     rootfs_overlay   try_and_error.md
_build           deps             mix.exs          rel              test
mba3:nerves_ev3_sample yoshinori$ mix firmware
==> nerves_toolchain_ctng
Compiling 1 file (.ex)
Generated nerves_toolchain_ctng app
==> nerves_toolchain_armv5tejl_unknown_linux_musleabi
Generated nerves_toolchain_armv5tejl_unknown_linux_musleabi app
==> nerves_system_ev3
Generated nerves_system_ev3 app
==> nerves_ev3_sample

Nerves environment
  MIX_TARGET:   ev3
  MIX_ENV:      dev

==> shoehorn
Compiling 7 files (.ex)
Generated shoehorn app
==> nerves_ev3_sample
** (Mix)   You are missing a release config file. Run  nerves.release.init task first

mba3:nerves_ev3_sample yoshinori$ mix nerves.release.init

Nerves environment
  MIX_TARGET:   ev3
  MIX_ENV:      dev

Compiling 2 files (.ex)
Generated nerves_ev3_sample app

An example config file has been placed in rel/config.exs, review it,
make edits as needed/desired, and then run `mix release` to build the release
mba3:nerves_ev3_sample yoshinori$ mix firmware

Nerves environment
  MIX_TARGET:   ev3
  MIX_ENV:      dev

|nerves_bootstrap| Building OTP Release...

Updating base firmware image with Erlang release...
Copying rootfs_overlay: /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/rootfs_overlay
Parallel mksquashfs: Using 12 processors
Creating 4.0 filesystem on /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_nerves-tmp/combined.squashfs, block size 131072.

Exportable Squashfs 4.0 filesystem, gzip compressed, data block size 131072
        compressed data, compressed metadata, compressed fragments,
        compressed xattrs, compressed ids
        duplicates are removed
Filesystem size 18628.30 Kbytes (18.19 Mbytes)
        49.40% of uncompressed filesystem size (37710.89 Kbytes)
Inode table size 17059 bytes (16.66 Kbytes)
        30.43% of uncompressed inode table size (56068 bytes)
Directory table size 17260 bytes (16.86 Kbytes)
        44.32% of uncompressed directory table size (38946 bytes)
Number of duplicate files found 20
Number of inodes 1702
Number of files 1373
Number of fragments 153
Number of symbolic links  138
Number of device nodes 0
Number of fifo nodes 0
Number of socket nodes 0
Number of directories 191
Number of ids (unique uids + gids) 4
Number of uids 3
        root (0)
        _appstore (33)
        yoshinori (501)
Number of gids 3
        wheel (0)
        _appstore (33)
        staff (20)
Building /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/nerves/images/nerves_ev3_sample.fw...
mba3:nerves_ev3_sample yoshinori$ mix firmware.burn

Nerves environment
  MIX_TARGET:   ev3
  MIX_ENV:      dev

|nerves_bootstrap| Building OTP Release...

Updating base firmware image with Erlang release...
Copying rootfs_overlay: /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/rootfs_overlay
Parallel mksquashfs: Using 12 processors
Creating 4.0 filesystem on /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_nerves-tmp/combined.squashfs, block size 131072.

Exportable Squashfs 4.0 filesystem, gzip compressed, data block size 131072
        compressed data, compressed metadata, compressed fragments,
        compressed xattrs, compressed ids
        duplicates are removed
Filesystem size 18628.30 Kbytes (18.19 Mbytes)
        49.40% of uncompressed filesystem size (37710.89 Kbytes)
Inode table size 17057 bytes (16.66 Kbytes)
        30.42% of uncompressed inode table size (56068 bytes)
Directory table size 17263 bytes (16.86 Kbytes)
        44.33% of uncompressed directory table size (38946 bytes)
Number of duplicate files found 20
Number of inodes 1702
Number of files 1373
Number of fragments 153
Number of symbolic links  138
Number of device nodes 0
Number of fifo nodes 0
Number of socket nodes 0
Number of directories 191
Number of ids (unique uids + gids) 4
Number of uids 3
        root (0)
        _appstore (33)
        yoshinori (501)
Number of gids 3
        wheel (0)
        _appstore (33)
        staff (20)
Building /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/nerves/images/nerves_ev3_sample.fw...
Use 29.54 GiB memory card found at /dev/rdisk3? [Yn] Y
|====================================| 100% (22.21 / 22.21) MB
Success!
Elapsed time: 1.600 s
mba3:nerves_ev3_sample yoshinori$ fish
mba3:nerves_ev3_sample yoshinori$ ssh robot@192.168.1.200
ssh: connect to host 192.168.1.200 port 22: Operation timed out
mba3:nerves_ev3_sample yoshinori$ ls
README.md        config           lib              mix.lock.ev3     rootfs_overlay   try_and_error.md
_build           deps             mix.exs          rel              test
mba3:nerves_ev3_sample yoshinori$ df
Filesystem    512-blocks      Used Available Capacity iused               ifree %iused  Mounted on
/dev/disk1s1   976490576 673014000 293685760    70% 3606017 9223372036851169790    0%   /
devfs                671       671         0   100%    1162                   0  100%   /dev
/dev/disk1s4   976490576   8388664 293685760     3%       4 9223372036854775803    0%   /private/var/vm
map -hosts             0         0         0   100%       0                   0  100%   /net
map auto_home          0         0         0   100%       0                   0  100%   /home
/dev/disk2s1       28413      5337     23076    19%     512                   0  100%   /Volumes/BOOT-A
mba3:nerves_ev3_sample yoshinori$ df -h
Filesystem      Size   Used  Avail Capacity iused               ifree %iused  Mounted on
/dev/disk1s1   466Gi  321Gi  140Gi    70% 3606016 9223372036851169791    0%   /
devfs          336Ki  336Ki    0Bi   100%    1162                   0  100%   /dev
/dev/disk1s4   466Gi  4.0Gi  140Gi     3%       4 9223372036854775803    0%   /private/var/vm
map -hosts       0Bi    0Bi    0Bi   100%       0                   0  100%   /net
map auto_home    0Bi    0Bi    0Bi   100%       0                   0  100%   /home
/dev/disk2s1    14Mi  2.6Mi   11Mi    19%     512                   0  100%   /Volumes/BOOT-A
mba3:nerves_ev3_sample yoshinori$ mix firmware.burn

Nerves environment
  MIX_TARGET:   ev3
  MIX_ENV:      dev

|nerves_bootstrap| Building OTP Release...

Updating base firmware image with Erlang release...
Copying rootfs_overlay: /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/rootfs_overlay
Parallel mksquashfs: Using 12 processors
Creating 4.0 filesystem on /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_nerves-tmp/combined.squashfs, block size 131072.

Exportable Squashfs 4.0 filesystem, gzip compressed, data block size 131072
        compressed data, compressed metadata, compressed fragments,
        compressed xattrs, compressed ids
        duplicates are removed
Filesystem size 18628.30 Kbytes (18.19 Mbytes)
        49.40% of uncompressed filesystem size (37710.89 Kbytes)
Inode table size 17057 bytes (16.66 Kbytes)
        30.42% of uncompressed inode table size (56068 bytes)
Directory table size 17263 bytes (16.86 Kbytes)
        44.33% of uncompressed directory table size (38946 bytes)
Number of duplicate files found 20
Number of inodes 1702
Number of files 1373
Number of fragments 153
Number of symbolic links  138
Number of device nodes 0
Number of fifo nodes 0
Number of socket nodes 0
Number of directories 191
Number of ids (unique uids + gids) 4
Number of uids 3
        root (0)
        _appstore (33)
        yoshinori (501)
Number of gids 3
        wheel (0)
        _appstore (33)
        staff (20)
Building /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/nerves/images/nerves_ev3_sample.fw...
Use 29.54 GiB memory card found at /dev/rdisk2? [Yn] Y
|====================================| 100% (22.21 / 22.21) MB
Success!
Elapsed time: 0.631 s
mba3:nerves_ev3_sample yoshinori$ cd ..
mba3:y-jono yoshinori$ mv nerves_ev3_sample nerves_ev3_sample2
mba3:y-jono yoshinori$ mix nerves.new nerves_ev3_sample --init-gadget
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

Fetch and install dependencies? [Yn] ^C
BREAK: (a)bort (c)ontinue (p)roc info (i)nfo (l)oaded
       (v)ersion (k)ill (D)b-tables (d)istribution
a
mba3:y-jono yoshinori$ mix nerves.new nerves_ev3_sample --init-gadget
* creating nerves_ev3_sample/config/config.exs
nerves_ev3_sample/config/config.exs already exists, overwrite? [Yn] Yn 
* creating nerves_ev3_sample/lib/nerves_ev3_sample.ex
nerves_ev3_sample/lib/nerves_ev3_sample.ex already exists, overwrite? [Yn] n
* creating nerves_ev3_sample/lib/nerves_ev3_sample/application.ex
nerves_ev3_sample/lib/nerves_ev3_sample/application.ex already exists, overwrite? [Yn] ^C
BREAK: (a)bort (c)ontinue (p)roc info (i)nfo (l)oaded
       (v)ersion (k)ill (D)b-tables (d)istribution
a
mba3:y-jono yoshinori$ rm -rf nerves_ev3_sample
mba3:y-jono yoshinori$ mix nerves.new nerves_ev3_sample --init-gadget
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

mba3:y-jono yoshinori$ export MIX_TARGET=ev3
mba3:y-jono yoshinori$ cd nerves_ev3_sample
mba3:nerves_ev3_sample yoshinori$ ls
README.md      _build         config         deps           lib            mix.exs        mix.lock.host  rel            rootfs_overlay test
mba3:nerves_ev3_sample yoshinori$ mix deps.get
Resolving Hex dependencies...
Dependency resolution completed:
New:
  artificery 0.4.2
  distillery 2.1.1
  dns 2.1.2
  elixir_make 0.6.0
  mdns 1.0.3
  muontrap 0.5.0
  nerves 1.3.2
  nerves_firmware_ssh 0.4.4
  nerves_init_gadget 0.7.0
  nerves_network 0.5.5
  nerves_network_interface 0.4.6
  nerves_runtime 0.10.3
  nerves_system_br 1.4.5
  nerves_system_ev3 1.4.0
  nerves_system_linter 0.3.0
  nerves_time 0.3.2
  nerves_toolchain_armv5tejl_unknown_linux_musleabi 1.1.0
  nerves_toolchain_ctng 1.5.0
  nerves_wpa_supplicant 0.5.2
  one_dhcpd 0.2.4
  ring_logger 0.8.0
  shoehorn 0.6.0
  socket 0.3.13
  system_registry 0.8.2
  uboot_env 0.1.1
* Getting nerves (Hex package)
* Getting shoehorn (Hex package)
* Getting ring_logger (Hex package)
* Getting nerves_runtime (Hex package)
* Getting nerves_init_gadget (Hex package)
* Getting nerves_system_ev3 (Hex package)
* Getting nerves_system_br (Hex package)
* Getting nerves_system_linter (Hex package)
* Getting nerves_toolchain_armv5tejl_unknown_linux_musleabi (Hex package)
* Getting nerves_toolchain_ctng (Hex package)
* Getting mdns (Hex package)
* Getting nerves_firmware_ssh (Hex package)
* Getting nerves_network (Hex package)
* Getting nerves_time (Hex package)
* Getting one_dhcpd (Hex package)
* Getting elixir_make (Hex package)
* Getting muontrap (Hex package)
* Getting nerves_network_interface (Hex package)
* Getting nerves_wpa_supplicant (Hex package)
* Getting system_registry (Hex package)
* Getting dns (Hex package)
* Getting socket (Hex package)
* Getting uboot_env (Hex package)
* Getting distillery (Hex package)
* Getting artificery (Hex package)

Nerves environment
  MIX_TARGET:   ev3
  MIX_ENV:      dev

==> artificery
Compiling 10 files (.ex)
Generated artificery app
==> distillery
Compiling 33 files (.ex)
Generated distillery app
==> nerves
Compiling 35 files (.ex)

== Compilation error in file lib/nerves.ex ==
** (CompileError) lib/nerves.ex:2: module Mix.Releases.Plugin is not loaded and could not be found
    (elixir) expanding macro: Kernel.use/1
    lib/nerves.ex:2: Nerves (module)
could not compile dependency :nerves, "mix compile" failed. You can recompile this dependency with "mix deps.compile nerves", update it with "mix deps.update nerves" or clean it with "mix deps.clean nerves"
mba3:nerves_ev3_sample yoshinori$ mix deps.clean
** (Mix) "mix deps.clean" expects dependencies as arguments or a flag indicating which dependencies to clean. The --all option will clean all dependencies while the --unused option cleans unused dependencies
mba3:nerves_ev3_sample yoshinori$ mix deps.clean
** (Mix) "mix deps.clean" expects dependencies as arguments or a flag indicating which dependencies to clean. The --all option will clean all dependencies while the --unused option cleans unused dependencies
mba3:nerves_ev3_sample yoshinori$ mix deps.clean --all
* Cleaning artificery
* Cleaning distillery
* Cleaning dns
warning: the dependency dns is not present in the build directory
* Cleaning elixir_make
warning: the dependency elixir_make is not present in the build directory
* Cleaning mdns
warning: the dependency mdns is not present in the build directory
* Cleaning muontrap
warning: the dependency muontrap is not present in the build directory
* Cleaning nerves
* Cleaning nerves_firmware_ssh
warning: the dependency nerves_firmware_ssh is not present in the build directory
* Cleaning nerves_init_gadget
warning: the dependency nerves_init_gadget is not present in the build directory
* Cleaning nerves_network
warning: the dependency nerves_network is not present in the build directory
* Cleaning nerves_network_interface
warning: the dependency nerves_network_interface is not present in the build directory
* Cleaning nerves_runtime
warning: the dependency nerves_runtime is not present in the build directory
* Cleaning nerves_system_br
warning: the dependency nerves_system_br is not present in the build directory
* Cleaning nerves_system_ev3
warning: the dependency nerves_system_ev3 is not present in the build directory
* Cleaning nerves_system_linter
warning: the dependency nerves_system_linter is not present in the build directory
* Cleaning nerves_time
warning: the dependency nerves_time is not present in the build directory
* Cleaning nerves_toolchain_armv5tejl_unknown_linux_musleabi
warning: the dependency nerves_toolchain_armv5tejl_unknown_linux_musleabi is not present in the build directory
* Cleaning nerves_toolchain_ctng
warning: the dependency nerves_toolchain_ctng is not present in the build directory
* Cleaning nerves_wpa_supplicant
warning: the dependency nerves_wpa_supplicant is not present in the build directory
* Cleaning one_dhcpd
warning: the dependency one_dhcpd is not present in the build directory
* Cleaning ring_logger
warning: the dependency ring_logger is not present in the build directory
* Cleaning shoehorn
warning: the dependency shoehorn is not present in the build directory
* Cleaning socket
warning: the dependency socket is not present in the build directory
* Cleaning system_registry
warning: the dependency system_registry is not present in the build directory
* Cleaning uboot_env
warning: the dependency uboot_env is not present in the build directory
mba3:nerves_ev3_sample yoshinori$ mix deps.get
Resolving Hex dependencies...
Dependency resolution completed:
Unchanged:
  artificery 0.4.2
  distillery 2.1.1
  dns 2.1.2
  elixir_make 0.6.0
  mdns 1.0.3
  muontrap 0.5.0
  nerves 1.3.2
  nerves_firmware_ssh 0.4.4
  nerves_init_gadget 0.7.0
  nerves_network 0.5.5
  nerves_network_interface 0.4.6
  nerves_runtime 0.10.3
  nerves_system_br 1.4.5
  nerves_system_ev3 1.4.0
  nerves_system_linter 0.3.0
  nerves_time 0.3.2
  nerves_toolchain_armv5tejl_unknown_linux_musleabi 1.1.0
  nerves_toolchain_ctng 1.5.0
  nerves_wpa_supplicant 0.5.2
  one_dhcpd 0.2.4
  ring_logger 0.8.0
  shoehorn 0.6.0
  socket 0.3.13
  system_registry 0.8.2
  uboot_env 0.1.1
* Getting nerves (Hex package)
* Getting shoehorn (Hex package)
* Getting ring_logger (Hex package)
* Getting nerves_runtime (Hex package)
* Getting nerves_init_gadget (Hex package)
* Getting nerves_system_ev3 (Hex package)
* Getting nerves_system_br (Hex package)
* Getting nerves_system_linter (Hex package)
* Getting nerves_toolchain_armv5tejl_unknown_linux_musleabi (Hex package)
* Getting nerves_toolchain_ctng (Hex package)
* Getting mdns (Hex package)
* Getting nerves_firmware_ssh (Hex package)
* Getting nerves_network (Hex package)
* Getting nerves_time (Hex package)
* Getting one_dhcpd (Hex package)
* Getting elixir_make (Hex package)
* Getting muontrap (Hex package)
* Getting nerves_network_interface (Hex package)
* Getting nerves_wpa_supplicant (Hex package)
* Getting system_registry (Hex package)
* Getting dns (Hex package)
* Getting socket (Hex package)
* Getting uboot_env (Hex package)
* Getting distillery (Hex package)
* Getting artificery (Hex package)

Nerves environment
  MIX_TARGET:   ev3
  MIX_ENV:      dev

==> artificery
Compiling 10 files (.ex)
Generated artificery app
==> distillery
Compiling 33 files (.ex)
Generated distillery app
==> nerves
Compiling 35 files (.ex)

== Compilation error in file lib/nerves.ex ==
** (CompileError) lib/nerves.ex:2: module Mix.Releases.Plugin is not loaded and could not be found
    (elixir) expanding macro: Kernel.use/1
    lib/nerves.ex:2: Nerves (module)
could not compile dependency :nerves, "mix compile" failed. You can recompile this dependency with "mix deps.compile nerves", update it with "mix deps.update nerves" or clean it with "mix deps.clean nerves"
mba3:nerves_ev3_sample yoshinori$ mix deps.update nerves
Resolving Hex dependencies...
Dependency resolution completed:
Unchanged:
  artificery 0.4.2
  distillery 2.1.1
  dns 2.1.2
  elixir_make 0.6.0
  mdns 1.0.3
  muontrap 0.5.0
  nerves 1.3.2
  nerves_firmware_ssh 0.4.4
  nerves_init_gadget 0.7.0
  nerves_network 0.5.5
  nerves_network_interface 0.4.6
  nerves_runtime 0.10.3
  nerves_system_br 1.4.5
  nerves_system_ev3 1.4.0
  nerves_system_linter 0.3.0
  nerves_time 0.3.2
  nerves_toolchain_armv5tejl_unknown_linux_musleabi 1.1.0
  nerves_toolchain_ctng 1.5.0
  nerves_wpa_supplicant 0.5.2
  one_dhcpd 0.2.4
  ring_logger 0.8.0
  shoehorn 0.6.0
  socket 0.3.13
  system_registry 0.8.2
  uboot_env 0.1.1

Nerves environment
  MIX_TARGET:   ev3
  MIX_ENV:      dev

==> nerves
Compiling 35 files (.ex)

== Compilation error in file lib/nerves.ex ==
** (CompileError) lib/nerves.ex:2: module Mix.Releases.Plugin is not loaded and could not be found
    (elixir) expanding macro: Kernel.use/1
    lib/nerves.ex:2: Nerves (module)
could not compile dependency :nerves, "mix compile" failed. You can recompile this dependency with "mix deps.compile nerves", update it with "mix deps.update nerves" or clean it with "mix deps.clean nerves"
mba3:nerves_ev3_sample yoshinori$ mix deps.clean --all
* Cleaning artificery
* Cleaning distillery
* Cleaning dns
warning: the dependency dns is not present in the build directory
* Cleaning elixir_make
warning: the dependency elixir_make is not present in the build directory
* Cleaning mdns
warning: the dependency mdns is not present in the build directory
* Cleaning muontrap
warning: the dependency muontrap is not present in the build directory
* Cleaning nerves
* Cleaning nerves_firmware_ssh
warning: the dependency nerves_firmware_ssh is not present in the build directory
* Cleaning nerves_init_gadget
warning: the dependency nerves_init_gadget is not present in the build directory
* Cleaning nerves_network
warning: the dependency nerves_network is not present in the build directory
* Cleaning nerves_network_interface
warning: the dependency nerves_network_interface is not present in the build directory
* Cleaning nerves_runtime
warning: the dependency nerves_runtime is not present in the build directory
* Cleaning nerves_system_br
warning: the dependency nerves_system_br is not present in the build directory
* Cleaning nerves_system_ev3
warning: the dependency nerves_system_ev3 is not present in the build directory
* Cleaning nerves_system_linter
warning: the dependency nerves_system_linter is not present in the build directory
* Cleaning nerves_time
warning: the dependency nerves_time is not present in the build directory
* Cleaning nerves_toolchain_armv5tejl_unknown_linux_musleabi
warning: the dependency nerves_toolchain_armv5tejl_unknown_linux_musleabi is not present in the build directory
* Cleaning nerves_toolchain_ctng
warning: the dependency nerves_toolchain_ctng is not present in the build directory
* Cleaning nerves_wpa_supplicant
warning: the dependency nerves_wpa_supplicant is not present in the build directory
* Cleaning one_dhcpd
warning: the dependency one_dhcpd is not present in the build directory
* Cleaning ring_logger
warning: the dependency ring_logger is not present in the build directory
* Cleaning shoehorn
warning: the dependency shoehorn is not present in the build directory
* Cleaning socket
warning: the dependency socket is not present in the build directory
* Cleaning system_registry
warning: the dependency system_registry is not present in the build directory
* Cleaning uboot_env
warning: the dependency uboot_env is not present in the build directory
mba3:nerves_ev3_sample yoshinori$ mix deps.get
Resolving Hex dependencies...
Dependency resolution completed:
Unchanged:
  artificery 0.4.2
  distillery 2.1.1
  dns 2.1.2
  elixir_make 0.6.0
  mdns 1.0.3
  muontrap 0.5.0
  nerves 1.3.2
  nerves_firmware_ssh 0.4.4
  nerves_init_gadget 0.7.0
  nerves_network 0.5.5
  nerves_network_interface 0.4.6
  nerves_runtime 0.10.3
  nerves_system_br 1.4.5
  nerves_system_ev3 1.4.0
  nerves_system_linter 0.3.0
  nerves_time 0.3.2
  nerves_toolchain_armv5tejl_unknown_linux_musleabi 1.1.0
  nerves_toolchain_ctng 1.5.0
  nerves_wpa_supplicant 0.5.2
  one_dhcpd 0.2.4
  ring_logger 0.8.0
  shoehorn 0.6.0
  socket 0.3.13
  system_registry 0.8.2
  uboot_env 0.1.1
* Getting nerves (Hex package)
* Getting shoehorn (Hex package)
* Getting ring_logger (Hex package)
* Getting nerves_runtime (Hex package)
* Getting nerves_init_gadget (Hex package)
* Getting nerves_system_ev3 (Hex package)
* Getting nerves_system_br (Hex package)
* Getting nerves_system_linter (Hex package)
* Getting nerves_toolchain_armv5tejl_unknown_linux_musleabi (Hex package)
* Getting nerves_toolchain_ctng (Hex package)
* Getting mdns (Hex package)
* Getting nerves_firmware_ssh (Hex package)
* Getting nerves_network (Hex package)
* Getting nerves_time (Hex package)
* Getting one_dhcpd (Hex package)
* Getting elixir_make (Hex package)
* Getting muontrap (Hex package)
* Getting nerves_network_interface (Hex package)
* Getting nerves_wpa_supplicant (Hex package)
* Getting system_registry (Hex package)
* Getting dns (Hex package)
* Getting socket (Hex package)
* Getting uboot_env (Hex package)
* Getting distillery (Hex package)
* Getting artificery (Hex package)

Nerves environment
  MIX_TARGET:   ev3
  MIX_ENV:      dev

==> artificery
Compiling 10 files (.ex)
Generated artificery app
==> distillery
Compiling 33 files (.ex)
Generated distillery app
==> nerves
Compiling 35 files (.ex)

== Compilation error in file lib/nerves.ex ==
** (CompileError) lib/nerves.ex:2: module Mix.Releases.Plugin is not loaded and could not be found
    (elixir) expanding macro: Kernel.use/1
    lib/nerves.ex:2: Nerves (module)
could not compile dependency :nerves, "mix compile" failed. You can recompile this dependency with "mix deps.compile nerves", update it with "mix deps.update nerves" or clean it with "mix deps.clean nerves"
mba3:nerves_ev3_sample yoshinori$ mix deps.clean
** (Mix) "mix deps.clean" expects dependencies as arguments or a flag indicating which dependencies to clean. The --all option will clean all dependencies while the --unused option cleans unused dependencies
mba3:nerves_ev3_sample yoshinori$ mix deps.get
Resolving Hex dependencies...

Failed to use "distillery" because
  nerves (versions 1.4.0 to 1.4.4) requires 2.0.12
  shoehorn (version 0.6.0) requires ~> 2.1


Failed to use "distillery" because
  nerves (version 1.4.5) requires ~> 2.0.0
  shoehorn (version 0.6.0) requires ~> 2.1

** (Mix) Hex dependency resolution failed, change the version requirements of your dependencies or unlock them (by using mix deps.update or mix deps.unlock). If you are unable to resolve the conflicts you can try overriding with {:dependency, "~> 1.0", override: true}
mba3:nerves_ev3_sample yoshinori$ mix deps.clean
** (Mix) "mix deps.clean" expects dependencies as arguments or a flag indicating which dependencies to clean. The --all option will clean all dependencies while the --unused option cleans unused dependencies
mba3:nerves_ev3_sample yoshinori$ mix deps.update nerves
Resolving Hex dependencies...

Failed to use "distillery" because
  nerves (versions 1.4.0 to 1.4.4) requires 2.0.12
  shoehorn (version 0.6.0) requires ~> 2.1


Failed to use "distillery" because
  nerves (version 1.4.5) requires ~> 2.0.0
  shoehorn (version 0.6.0) requires ~> 2.1

** (Mix) Hex dependency resolution failed, change the version requirements of your dependencies or unlock them (by using mix deps.update or mix deps.unlock). If you are unable to resolve the conflicts you can try overriding with {:dependency, "~> 1.0", override: true}
mba3:nerves_ev3_sample yoshinori$ mix deps.unlock
** (Mix) "mix deps.unlock" expects dependencies as arguments or a flag indicating which dependencies to unlock. The --all option will unlock all dependencies while the --unused option unlocks unused dependencies
mba3:nerves_ev3_sample yoshinori$ mix deps.get
Resolving Hex dependencies...
Dependency resolution completed:
New:
  artificery 0.4.2
  distillery 2.0.12
  dns 2.1.2
  elixir_make 0.6.0
  mdns 1.0.3
  muontrap 0.5.0
  nerves 1.4.0
  nerves_firmware_ssh 0.4.4
  nerves_init_gadget 0.7.0
  nerves_network 0.5.5
  nerves_network_interface 0.4.6
  nerves_runtime 0.10.3
  nerves_system_br 1.4.5
  nerves_system_ev3 1.4.0
  nerves_system_linter 0.3.0
  nerves_time 0.3.2
  nerves_toolchain_armv5tejl_unknown_linux_musleabi 1.1.0
  nerves_toolchain_ctng 1.5.0
  nerves_wpa_supplicant 0.5.2
  one_dhcpd 0.2.4
  ring_logger 0.8.0
  shoehorn 0.5.0
  socket 0.3.13
  system_registry 0.8.2
  uboot_env 0.1.1
* Updating nerves (Hex package)
* Updating shoehorn (Hex package)
* Updating distillery (Hex package)

Nerves environment
  MIX_TARGET:   ev3
  MIX_ENV:      dev

==> distillery
Compiling 33 files (.ex)
Generated distillery app
==> nerves
Compiling 35 files (.ex)
Generated nerves app
==> nerves_ev3_sample
Resolving Nerves artifacts...
  Cached nerves_system_ev3
  Cached nerves_toolchain_armv5tejl_unknown_linux_musleabi
A new version of Nerves bootstrap is available(1.3.1 < 1.6.3), You can update by running
  
  mix local.nerves

mba3:nerves_ev3_sample yoshinori$ mix firmwre
^C
BREAK: (a)bort (c)ontinue (p)roc info (i)nfo (l)oaded
       (v)ersion (k)ill (D)b-tables (d)istribution
a
mba3:nerves_ev3_sample yoshinori$ mix firmware
==> nerves_system_br
Generated nerves_system_br app
==> nerves_system_linter
Compiling 14 files (.ex)
Generated nerves_system_linter app
==> nerves_toolchain_ctng
Compiling 1 file (.ex)
Generated nerves_toolchain_ctng app
==> nerves_toolchain_armv5tejl_unknown_linux_musleabi
Generated nerves_toolchain_armv5tejl_unknown_linux_musleabi app
==> nerves_system_ev3
Generated nerves_system_ev3 app
==> nerves_ev3_sample

Nerves environment
  MIX_TARGET:   ev3
  MIX_ENV:      dev

==> socket
Compiling 11 files (.ex)
warning: ssl:ssl_accept/3: deprecated; use ssl:handshake/3 instead
  lib/socket/ssl.ex:252

warning: ssl:ssl_accept/2: deprecated; use ssl:handshake/2 instead
  lib/socket/ssl.ex:272

Generated socket app
==> uboot_env
Compiling 7 files (.ex)
Generated uboot_env app
==> ring_logger
Compiling 4 files (.ex)
Generated ring_logger app
==> dns
Compiling 7 files (.ex)
Generated dns app
==> mdns
Compiling 5 files (.ex)
Generated mdns app
==> system_registry
Compiling 13 files (.ex)
Generated system_registry app
==> elixir_make
Compiling 1 file (.ex)
Generated elixir_make app
==> nerves_runtime
mkdir -p /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_runtime/obj
mkdir -p /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_runtime/priv
/Users/yoshinori/.nerves/artifacts/nerves_toolchain_armv5tejl_unknown_linux_musleabi-darwin_x86_64-1.1.0/bin/armv5tejl-unknown-linux-musleabi-gcc -c -I/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging/usr/lib/erlang/erts-10.0.5/include -I/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging/usr/lib/erlang/lib/erl_interface-3.10.3/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os -I/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging/usr/include -std=gnu99 -o /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_runtime/obj/nerves_runtime.o src/nerves_runtime.c
/Users/yoshinori/.nerves/artifacts/nerves_toolchain_armv5tejl_unknown_linux_musleabi-darwin_x86_64-1.1.0/bin/armv5tejl-unknown-linux-musleabi-gcc -c -I/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging/usr/lib/erlang/erts-10.0.5/include -I/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging/usr/lib/erlang/lib/erl_interface-3.10.3/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os -I/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging/usr/include -std=gnu99 -o /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_runtime/obj/uevent.o src/uevent.c
/Users/yoshinori/.nerves/artifacts/nerves_toolchain_armv5tejl_unknown_linux_musleabi-darwin_x86_64-1.1.0/bin/armv5tejl-unknown-linux-musleabi-gcc -c -I/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging/usr/lib/erlang/erts-10.0.5/include -I/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging/usr/lib/erlang/lib/erl_interface-3.10.3/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os -I/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging/usr/include -std=gnu99 -o /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_runtime/obj/kmsg_tailer.o src/kmsg_tailer.c
/Users/yoshinori/.nerves/artifacts/nerves_toolchain_armv5tejl_unknown_linux_musleabi-darwin_x86_64-1.1.0/bin/armv5tejl-unknown-linux-musleabi-gcc /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_runtime/obj/nerves_runtime.o /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_runtime/obj/uevent.o /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_runtime/obj/kmsg_tailer.o -L/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging/usr/lib/erlang/erts-10.0.5/lib -L/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging/usr/lib/erlang/lib/erl_interface-3.10.3/lib -lerts -lerl_interface -lei --sysroot=/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging -lmnl -o /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_runtime/priv/nerves_runtime
Compiling 13 files (.ex)
Generated nerves_runtime app
==> nerves_firmware_ssh
Compiling 9 files (.ex)
Generated nerves_firmware_ssh app
==> one_dhcpd
mkdir -p /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/one_dhcpd/priv
mkdir -p /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/one_dhcpd/obj
/Users/yoshinori/.nerves/artifacts/nerves_toolchain_armv5tejl_unknown_linux_musleabi-darwin_x86_64-1.1.0/bin/armv5tejl-unknown-linux-musleabi-gcc -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os -I/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging/usr/include -o /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/one_dhcpd/obj/arp_set.o src/arp_set.c
/Users/yoshinori/.nerves/artifacts/nerves_toolchain_armv5tejl_unknown_linux_musleabi-darwin_x86_64-1.1.0/bin/armv5tejl-unknown-linux-musleabi-gcc -o /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/one_dhcpd/priv/arp_set --sysroot=/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/one_dhcpd/obj/arp_set.o
Compiling 9 files (.ex)
Generated one_dhcpd app
==> muontrap
/Applications/Xcode.app/Contents/Developer/usr/bin/make -C src all
mkdir -p /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/muontrap/priv
mkdir -p /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/muontrap/obj
/Users/yoshinori/.nerves/artifacts/nerves_toolchain_armv5tejl_unknown_linux_musleabi-darwin_x86_64-1.1.0/bin/armv5tejl-unknown-linux-musleabi-gcc -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os -I/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging/usr/include -std=c99 -D_GNU_SOURCE -o /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/muontrap/obj/muontrap.o muontrap.c
/Users/yoshinori/.nerves/artifacts/nerves_toolchain_armv5tejl_unknown_linux_musleabi-darwin_x86_64-1.1.0/bin/armv5tejl-unknown-linux-musleabi-gcc /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/muontrap/obj/muontrap.o --sysroot=/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging  -o /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/muontrap/priv/muontrap
if [ -f test/Makefile ]; then /Applications/Xcode.app/Contents/Developer/usr/bin/make -C test; fi
Compiling 5 files (.ex)
Generated muontrap app
==> nerves_network_interface
mkdir -p /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_network_interface/ebin/../priv
mkdir -p /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_network_interface/ebin/../obj
/Users/yoshinori/.nerves/artifacts/nerves_toolchain_armv5tejl_unknown_linux_musleabi-darwin_x86_64-1.1.0/bin/armv5tejl-unknown-linux-musleabi-gcc -c -I/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging/usr/lib/erlang/erts-10.0.5/include -I/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging/usr/lib/erlang/lib/erl_interface-3.10.3/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os -I/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging/usr/include -std=c99 -D_XOPEN_SOURCE=600 -o /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_network_interface/ebin/../obj/erlcmd.o src/erlcmd.c
/Users/yoshinori/.nerves/artifacts/nerves_toolchain_armv5tejl_unknown_linux_musleabi-darwin_x86_64-1.1.0/bin/armv5tejl-unknown-linux-musleabi-gcc -c -I/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging/usr/lib/erlang/erts-10.0.5/include -I/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging/usr/lib/erlang/lib/erl_interface-3.10.3/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os -I/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging/usr/include -std=c99 -D_XOPEN_SOURCE=600 -o /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_network_interface/ebin/../obj/netif.o src/netif.c
/Users/yoshinori/.nerves/artifacts/nerves_toolchain_armv5tejl_unknown_linux_musleabi-darwin_x86_64-1.1.0/bin/armv5tejl-unknown-linux-musleabi-gcc /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_network_interface/ebin/../obj/erlcmd.o /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_network_interface/ebin/../obj/netif.o -L/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging/usr/lib/erlang/erts-10.0.5/lib -L/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging/usr/lib/erlang/lib/erl_interface-3.10.3/lib -lerts -lerl_interface -lei --sysroot=/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging -lmnl -o /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_network_interface/ebin/../priv/netif
# setuid root net_basic so that it can configure network interfaces
SUDO_ASKPASS= true -- sh -c 'chown root:root /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_network_interface/ebin/../priv/netif; chmod +s /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_network_interface/ebin/../priv/netif'
Compiling 3 files (.ex)
Generated nerves_network_interface app
==> nerves_wpa_supplicant
mkdir -p /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_wpa_supplicant/ebin/../priv
mkdir -p /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_wpa_supplicant/ebin/../obj/wpa_ctrl
/Users/yoshinori/.nerves/artifacts/nerves_toolchain_armv5tejl_unknown_linux_musleabi-darwin_x86_64-1.1.0/bin/armv5tejl-unknown-linux-musleabi-gcc -c -DCONFIG_CTRL_IFACE -DCONFIG_CTRL_IFACE_UNIX -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os -I/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging/usr/include -o /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_wpa_supplicant/ebin/../obj/wpa_ex.o src/wpa_ex.c
/Users/yoshinori/.nerves/artifacts/nerves_toolchain_armv5tejl_unknown_linux_musleabi-darwin_x86_64-1.1.0/bin/armv5tejl-unknown-linux-musleabi-gcc -c -DCONFIG_CTRL_IFACE -DCONFIG_CTRL_IFACE_UNIX -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os -I/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging/usr/include -o /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_wpa_supplicant/ebin/../obj/wpa_ctrl/os_unix.o src/wpa_ctrl/os_unix.c
/Users/yoshinori/.nerves/artifacts/nerves_toolchain_armv5tejl_unknown_linux_musleabi-darwin_x86_64-1.1.0/bin/armv5tejl-unknown-linux-musleabi-gcc -c -DCONFIG_CTRL_IFACE -DCONFIG_CTRL_IFACE_UNIX -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os -I/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging/usr/include -o /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_wpa_supplicant/ebin/../obj/wpa_ctrl/wpa_ctrl.o src/wpa_ctrl/wpa_ctrl.c
/Users/yoshinori/.nerves/artifacts/nerves_toolchain_armv5tejl_unknown_linux_musleabi-darwin_x86_64-1.1.0/bin/armv5tejl-unknown-linux-musleabi-gcc /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_wpa_supplicant/ebin/../obj/wpa_ex.o /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_wpa_supplicant/ebin/../obj/wpa_ctrl/os_unix.o /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_wpa_supplicant/ebin/../obj/wpa_ctrl/wpa_ctrl.o --sysroot=/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging -lrt -o /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_wpa_supplicant/ebin/../priv/wpa_ex
# setuid root wpa_ex so that it can interact with the wpa_supplicant
SUDO_ASKPASS= true -- sh -c 'chown root:root /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_wpa_supplicant/ebin/../priv/wpa_ex; chmod +s /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_wpa_supplicant/ebin/../priv/wpa_ex'
Compiling 3 files (.ex)
Generated nerves_wpa_supplicant app
==> nerves_network
mkdir -p /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_network/ebin/../obj
mkdir -p /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_network/ebin/../priv
/Users/yoshinori/.nerves/artifacts/nerves_toolchain_armv5tejl_unknown_linux_musleabi-darwin_x86_64-1.1.0/bin/armv5tejl-unknown-linux-musleabi-gcc -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os -I/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging/usr/include -std=c99 -o /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_network/ebin/../obj/udhcpc_wrapper.o src/udhcpc_wrapper.c
/Users/yoshinori/.nerves/artifacts/nerves_toolchain_armv5tejl_unknown_linux_musleabi-darwin_x86_64-1.1.0/bin/armv5tejl-unknown-linux-musleabi-gcc /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_network/ebin/../obj/udhcpc_wrapper.o -L/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging/usr/lib/erlang/erts-10.0.5/lib -L/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging/usr/lib/erlang/lib/erl_interface-3.10.3/lib -lerts -lerl_interface -lei --sysroot=/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging  -o /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_network/ebin/../priv/udhcpc_wrapper
# setuid root udhcpc_wrapper so that it can call udhcpc
SUDO_ASKPASS= true -- sh -c 'chown root:root /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_network/ebin/../priv/udhcpc_wrapper; chmod +s /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_network/ebin/../priv/udhcpc_wrapper'
Compiling 12 files (.ex)
Generated nerves_network app
==> nerves_time
mkdir -p /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_time/priv
mkdir -p /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_time/obj
/Users/yoshinori/.nerves/artifacts/nerves_toolchain_armv5tejl_unknown_linux_musleabi-darwin_x86_64-1.1.0/bin/armv5tejl-unknown-linux-musleabi-gcc -c -I/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging/usr/lib/erlang/erts-10.0.5/include -I/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging/usr/lib/erlang/lib/erl_interface-3.10.3/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os -I/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging/usr/include -std=c99 -o /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_time/obj/ntpd_script.o src/ntpd_script.c
/Users/yoshinori/.nerves/artifacts/nerves_toolchain_armv5tejl_unknown_linux_musleabi-darwin_x86_64-1.1.0/bin/armv5tejl-unknown-linux-musleabi-gcc /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_time/obj/ntpd_script.o -L/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging/usr/lib/erlang/lib/erl_interface-3.10.3/lib -lei_st --sysroot=/Users/yoshinori/.nerves/artifacts/nerves_system_ev3-portable-1.4.0/staging  -o /Users/yoshinori/src/github.com/y-jono/nerves_ev3_sample/_build/ev3/dev/lib/nerves_time/priv/ntpd_script
Compiling 5 files (.ex)
Generated nerves_time app
==> nerves_init_gadget
Compiling 5 files (.ex)
Generated nerves_init_gadget app
==> shoehorn
Compiling 7 files (.ex)
Generated shoehorn app
==> nerves_ev3_sample
** (Mix)   You are missing a release config file. Run  nerves.release.init task first
```

release config がないと言われたので、 mix nerves.release.init task を言われるままに叩く。
