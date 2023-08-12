# Получаем текущую директорию приложения
$currentDirectory = (Get-Location).Path

# Путь к папке с обновлениями
$launcherUpdateFolderPath = Join-Path -Path $currentDirectory -ChildPath "LauncherUpdate\ASK-main"

try {
    # Перемещение файлов из папки обновлений
    Get-ChildItem -Path $launcherUpdateFolderPath | ForEach-Object {
        $destinationFilePath = Join-Path -Path $currentDirectory -ChildPath $_.Name
        if (Test-Path $destinationFilePath) {
            Remove-Item -Path $destinationFilePath -Force
        }
        Move-Item -Path $_.FullName -Destination $destinationFilePath
    }

    Write-Host "Файлы успешно перемещены в папку Debug."

    # Запуск приложения
    Start-Process -FilePath "$currentDirectory\ASKLauncher.exe"

    # Завершение текущего процесса
    Stop-Process -Id $PID