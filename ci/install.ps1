if ($Env:TARGET -Match 'gnu') {
    if ($Env:TARGET -Match 'x86_64') {
        $Env:PATH += ';C:\msys64\mingw64\bin'
    } else {
        $Env:PATH += ';C:\msys64\mingw32\bin'
    }
}

[Net.ServicePointManager]::SecurityProtocol = 'Ssl3, Tls, Tls12'
Start-FileDownload 'https://win.rustup.rs' 'rustup-init.exe'

.\rustup-init --default-host $Env:TARGET --default-toolchain $Env:RUST_VERSION -y

$Env:PATH = 'C:\Users\appveyor\.cargo\bin;' + $Env:PATH

rustc -Vv

cargo -V
