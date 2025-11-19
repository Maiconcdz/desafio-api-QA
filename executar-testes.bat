@echo off
title Executor de Testes - ServeRest API
color 0A

echo.
echo ╔═══════════════════════════════════════════╗
echo ║          DESAFIO QA - SERVEREST API       ║
echo ║         EXECUTOR AUTOMÁTICO DE TESTES     ║
echo ╚═══════════════════════════════════════════╝
echo.

set PROJECT_PATH=C:\desafio-api-QA

echo 📁 Acessando diretório do projeto...
cd /d "%PROJECT_PATH%"

echo 📦 Verificando e instalando dependências...
if not exist "node_modules" (
    echo 🔧 Instalando Node_modules...
    npm install
) else (
    echo ✅ Dependências já instaladas
)

echo.
echo 🧪 EXECUTANDO SUÍTE DE TESTES...
echo ═══════════════════════════════════════════
echo.

echo 1. Executando testes no terminal...
call npm test

echo.
echo 2. Gerando relatório HTML completo...
call npm run test:report

echo.
echo ═══════════════════════════════════════════
echo 🎉 EXECUÇÃO CONCLUÍDA COM SUCESSO!
echo.
echo 📊 RESULTADOS:
echo    - Relatório completo: reports\newman-report.html
echo    - Para visualizar: abra o arquivo acima no navegador
echo.
echo ⏰ %date% %time%
echo.

echo Pressione qualquer tecla para abrir o relatório ou X para sair...
choice /c 1X /n /m "Opção [1-Abrir relatório, X-Sair]: "

if errorlevel 2 (
    echo Saindo...
    timeout /t 2 >nul
    exit
) else (
    echo Abrindo relatório no navegador...
    start "" "reports\newman-report.html"
)

pause