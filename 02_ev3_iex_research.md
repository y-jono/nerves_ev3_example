# ElixirからアクセスできるUARTデバイスを調べるコマンド 

```
iex(6)> Circuits.UART.enumerate
%{
  "ttyS0" => %{},
  "ttyS1" => %{},
  "ttyS2" => %{},
  "ttySU0" => %{},
  "ttySU1" => %{}
}
```

Usage
Port	Use
UART0	Input port 2 UART sensors.
UART1	Input port 1 UART sensors. Also debugging terminal (starts at boot).
UART2	Bluetooth.
PRU0/SUART0	Input port 4 UART sensors.
PRU0/SUART1	Input port 3 UART sensors.

# シリアルポート

fhunleth/nerves_ev3_example のリポジトリを参考に、ttyS1をデバッガを使う
ただし、このリポジトリは nerves の古いバージョンの物なの。
バージョンが異なることを考慮する。

rootfs_additions は rootfs_overlay へ変更された。 
[Add commented-out instructions for enabling rootfs_additions #123](https://github.com/nerves-project/nerves/commit/4605a65cf2e1b06011e4ae8ae067ac47dcc7e8eb)

rootfs_overlay/etc/erlinit.config

```
# tty1 goes to the  EV3's LCD display
# ttyS1 goes to port 1
# -c tty1
-c ttyS1
```

# firmware up スクリプト

ファーム生成コードに

```
mix firmware.gen.script
./upload.sh
```

