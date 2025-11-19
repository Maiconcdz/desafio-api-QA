const newman = require('newman');
const path = require('path');

newman.run({
    collection: require('./collections/serverest-collection.json'),
    environment: require('./environments/serverest-environment.json'),
    reporters: ['htmlextra', 'cli'],
    reporter: {
        htmlextra: {
            export: './reports/html/newman-report.html',
            title: 'ServeRest API Test Report',
            titleSize: 6,
            omitHeaders: true,
            skipHeaders: "Authorization",
            showOnlyFails: false,
            noSyntaxHighlighting: false,
            testPaging: true,
            browserTitle: "ServeRest API Tests",
            title: "Relatório de Testes - ServeRest API",
            subTitle: "Automação completa da API ServeRest",
            description: "Relatório gerado automaticamente pelos testes BDD",
            dateFormat: "DD/MM/YYYY HH:mm:ss",
            timeZone: "America/Sao_Paulo",
            skipEnvironmentVars: ["authToken"],
            skipGlobalVars: [],
            displayProgressBar: true
        }
    },
    iterationCount: 1,
    timeoutRequest: 10000
}, function (err, summary) {
    if (err) { 
        console.error('❌ Erro ao executar testes:', err);
        process.exit(1);
    }
    
    console.log('✅ Testes finalizados!');
    console.log(`📊 Total de requisições: ${summary.run.stats.requests.total}`);
    console.log(`✅ Testes passados: ${summary.run.stats.assertions.passed}`);
    console.log(`❌ Testes falhados: ${summary.run.stats.assertions.failed}`);
    console.log(`📁 Relatório salvo em: ./reports/html/newman-report.html`);
});