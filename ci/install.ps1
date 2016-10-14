if ($Env:TARGET -Match 'gnu') {
    $Env:HOST = 'x86_64-pc-windows-gnu'

    if ($Env:TARGET -Match 'x86_64') {
        $Env:PATH += ';C:\msys64\mingw64\bin'
    } else {
        $Env:PATH += ';C:\msys64\mingw32\bin'
    }
} else {
    $Env:HOST = 'x86_64-pc-windows-msvc'
}

invoke 'curl' '-sSf' '-o' 'rustup-init.exe' 'https://win.rustup.rs'

.\rustup-init --default-host $Env:HOST --default-toolchain $Env:RUST_VERSION -y

$Env:PATH = 'C:\Users\appveyor\.cargo\bin;' + $Env:PATH

if ($Env:TARGET -ne $Env:HOST) {
    rustup target add $Env:TARGET
}

rustc -Vv

cargo -V
