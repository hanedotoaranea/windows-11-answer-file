cd "C:\Program Files (x86)\Microsoft"
Remove-Item -Path "Edge" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "EdgeCore" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "EdgeUpdate" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "EdgeWebView" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "Temp" -Recurse -Force -ErrorAction SilentlyContinue
