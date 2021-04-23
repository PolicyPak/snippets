# Wait for DNS to settle after VPN connects
Start-Sleep -s 10

# Map G Drive
if (-not(get-psdrive -name "G" -ErrorAction SilentlyContinue)) {
New-PSDrive -name "G" -PSProvider FileSystem -Root \\Server\share1 -Persist
}

# Map H Drive
if (-not(get-psdrive -name "H" -ErrorAction SilentlyContinue)) {
New-PSDrive -name "H" -PSProvider FileSystem -Root \\Server\Share2 -Persist
} 
