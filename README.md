# DeClang

<sub>[日本語はこちら](https://github.com/DeNA/DeClang/blob/declang-8.0.1/README_JP.md)</sub>

## Introduction

DeClang is an anti-hacking compiler based on LLVM project and extented the OSS project ollvm (https://github.com/obfuscator-llvm/obfuscator). 

We open sourced some of the obfuscation features of DeClang for now. Some other features might be open sourced in the future.

![難読化](https://user-images.githubusercontent.com/1781263/97404801-02c20780-193a-11eb-9a28-1870375e03fe.png "難読化")

DeClang is a compiler based anti-hack solution and has a lot of advantages over packer based solution. For the detailed comparision, please refer to the following document.
https://www.slideshare.net/dena_tech/declang-clang-dena-techcon-2020

## Supported Architecture

Supported host architecture

- x64 macOS
- x64 Linux
- x64 Windows

Supported target architecture

- arm / arm64 ELF (Android)
- arm / arm64 Mach-O (iPhone)
- x86 / x64 ELF (Linux)
- x86 / x64 Mach-O (macOS)

## Build

```
$ git clone https://github.com/DeNA/DeClang
$ cd DeClang/script
$ bash build.sh
...
$ bash build_tools.sh
...
$ bash android_release.sh v1.0.0
...
```
Then you have a Release-v1.0.0 folder in the root directory of DeClang. 

If you are building DeClang on Windows, you have to install MYSYS2 and run
the above script in MYSYS2 shell. Also, Visual Studio 2017 is required for build.

## Installation & Setup

- Define DECLANG_HOME environment variable
  ```
  export DECLANG_HOME=/path/to/declang_home/
  ```

- Copy Release folder to $DECLAHG_HOME
  - If you built DeClang by yourself
    - Copy Release-v1.0.0 to $DECLANG_HOME/.DeClang. 
    ```
    mv Release-v1.0.0 $DECLANG_HOME/.DeClang
    ```
  - If you downloaded pre-built binary from Releases page.
    - Decompress the zip file and copy the Release folder to $DECLANG_HOME/.DeClang.
    ```
    mv Release/ $DECLANG_HOME/.DeClang
    ```

- Setup DeClang for android-ndk:
  ```
  bash $DECLANG_HOME/.DeClang/script/ndk_setup.sh {/path/to/ndk_root}
  ```
  Recover the original NDK:
  ```
  bash $DECLANG_HOME/.DeClang/script/ndk_unset.sh {/path/to/ndk_root}
  ```


- Setup DeClang for Xcode:
  ```
  bash $DECLANG_HOME/.DeClang/script/xcode_setup.sh -x {/path/to/Xcode.app} -p {/path/to/xcodeproject.xcodeproj}
  ```
  Recover the original xcode project file:
  ```
  bash $DECLANG_HOME/.DeClang/script/xcode_unset.sh {/path/to/xcodeproject.xcodeproj}
  ```

- Now you can build your project using your usual build pipeline.

## Configuration

- Edit config.pre.json in $DECLANG_HOME/.DeClang/ folder:
  ```
  vi $DECLANG_HOME/.DeClang/config.pre.json
  ```
- Generate config.json from config.pre.json:
  ```
  $DECLANG_HOME/.DeClang/gen_config_mac -path $DECLANG_HOME/.DeClang/ -seed {your seed}
  ```
  "seed" can be any string. You should change "seed" for each build.

## Unity Support

If you are building your Unity project using command line then set the DECLANG_HOME in comand line is sufficient.
But if you are building a Unity project using GUI, you should set the DECLANG_HOME environment variable in your build script:
```
System.Environment.SetEnvironmentVariable("DECLANG_HOME", "/path/to/DeClang/");
```

## Notes

- If you do not set DECLANG_HOME, DeClang will use the default directory `~/.DeClang/`
- Note that usually DeClang for NDK and DeClang for Xcode might not be compatitable with each other so when you install & setup DeClang 
for different architecture please make sure you are using the correct DeClang version.

