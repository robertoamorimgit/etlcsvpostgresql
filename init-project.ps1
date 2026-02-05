# Caminho base do projeto
$projectPath = "C:\projeto\SpringBatch\etlcsvpostgresql"

Write-Host "Inicializando estrutura do projeto em:" $projectPath -ForegroundColor Cyan

# Garante que está no diretório correto
Set-Location $projectPath

# Criação de arquivos básicos
$files = @(
    "README.md",
    ".gitignore",
    "docker-compose.yml"
)

foreach ($file in $files) {
    if (-Not (Test-Path $file)) {
        New-Item -ItemType File -Name $file | Out-Null
        Write-Host "Arquivo criado:" $file -ForegroundColor Green
    } else {
        Write-Host "Arquivo já existe:" $file -ForegroundColor Yellow
    }
}

# Conteúdo do README.md
$readmeContent = @"
# PoC Spring Batch - CSV para PostgreSQL

Projeto de prova de conceito usando Spring Batch para importar dados de um arquivo CSV para um banco PostgreSQL, utilizando Docker.

## Objetivo
- Entender a arquitetura do Spring Batch
- Trabalhar com Jobs, Steps, ItemReader e ItemWriter
- Usar Docker para facilitar o setup local
"@

Set-Content -Path "README.md" -Value $readmeContent -Encoding UTF8
Write-Host "README.md atualizado" -ForegroundColor Green

# Conteúdo do .gitignore
$gitignoreContent = @"
# Java
target/
*.class

# IDE
.vscode/
.idea/

# Logs
*.log

# OS
.DS_Store
Thumbs.db
"@

Set-Content -Path ".gitignore" -Value $gitignoreContent -Encoding UTF8
Write-Host ".gitignore atualizado" -ForegroundColor Green

Write-Host "`nEstrutura inicial criada com sucesso 🚀" -ForegroundColor Cyan
