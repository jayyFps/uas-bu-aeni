# Script untuk menginstal Imagick di Windows
$tempDir = "C:\temp\imagick"
$phpExtDir = "C:\xampp\php\ext"
$phpDir = "C:\xampp\php"

# Buat direktori temporary jika belum ada
if (-not (Test-Path $tempDir)) {
    New-Item -ItemType Directory -Path $tempDir -Force
}

# Download Imagick DLL dari sumber yang benar
$url = "https://github.com/mkoppanen/imagick/raw/master/php_imagick.dll"
$output = "$tempDir\php_imagick.dll"

Write-Host "Downloading Imagick DLL..."
try {
    Invoke-WebRequest -Uri $url -OutFile $output
    Write-Host "Download successful!"
} catch {
    Write-Host "Error downloading from primary source, trying alternative..."
    # URL alternatif
    $altUrl = "https://pecl.php.net/get/imagick-3.7.0.tgz"
    $altOutput = "$tempDir\imagick.tgz"
    Invoke-WebRequest -Uri $altUrl -OutFile $altOutput
    
    # Ekstrak file TGZ
    Write-Host "Extracting files..."
    tar -xf $altOutput -C $tempDir
}

# Copy DLL ke folder ekstensi PHP
Write-Host "Copying files to PHP directory..."
Copy-Item "$tempDir\php_imagick.dll" -Destination $phpExtDir -Force

# Download ImageMagick DLLs
$imDlls = @(
    "CORE_RL_MagickWand_.dll",
    "CORE_RL_MagickCore_.dll",
    "CORE_RL_Magick++_.dll",
    "CORE_RL_Magick++_Q8_.dll",
    "CORE_RL_Magick++_Q16_.dll",
    "CORE_RL_Magick++_Q16HDRI_.dll",
    "CORE_RL_Magick++_Q8HDRI_.dll",
    "CORE_RL_MagickCore_Q8_.dll",
    "CORE_RL_MagickCore_Q16_.dll",
    "CORE_RL_MagickCore_Q16HDRI_.dll",
    "CORE_RL_MagickCore_Q8HDRI_.dll",
    "CORE_RL_MagickWand_Q8_.dll",
    "CORE_RL_MagickWand_Q16_.dll",
    "CORE_RL_MagickWand_Q16HDRI_.dll",
    "CORE_RL_MagickWand_Q8HDRI_.dll"
)

foreach ($dll in $imDlls) {
    $dllUrl = "https://github.com/ImageMagick/ImageMagick/raw/main/VisualMagick/dll/$dll"
    $dllOutput = "$tempDir\$dll"
    try {
        Invoke-WebRequest -Uri $dllUrl -OutFile $dllOutput
        Copy-Item $dllOutput -Destination $phpDir -Force
        Write-Host "Downloaded and copied $dll"
    } catch {
        Write-Host "Warning: Could not download $dll"
    }
}

# Edit php.ini
$phpIni = "$phpDir\php.ini"
$iniContent = Get-Content $phpIni
if (-not ($iniContent -match "extension=imagick")) {
    Add-Content $phpIni "`nextension=imagick"
    Write-Host "Added extension=imagick to php.ini"
}

# Verifikasi instalasi
Write-Host "`nVerifying installation..."
$phpModuleCheck = php -m | Select-String "imagick"
if ($phpModuleCheck) {
    Write-Host "Imagick has been installed successfully!"
} else {
    Write-Host "Warning: Imagick module not found. Please check the installation manually."
}

Write-Host "`nPlease restart Apache in XAMPP Control Panel"
Write-Host "After restarting, run 'php -m | findstr imagick' to verify the installation" 