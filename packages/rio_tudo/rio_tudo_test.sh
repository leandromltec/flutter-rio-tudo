
#Script de execução e geração de relatório de testes com lcov
#lcov - ferramenta front end que exibi relatórios de testes, neste script gera em uma página html

runTest(){
    flutter test --no-test-assets --coverage
}

generateTestCoverageReport(){
   genhtml coverage/lcov.info -o coverage
}

openCoverageReport(){
   open coverage/index.html
}

echo "Tests started" 
echo "Testes iniciados" 
runTest
generateTestCoverageReport
openCoverageReport
echo "Finished tests"
echo "Testes Finalizados"
