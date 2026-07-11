$path = 'c:\Users\Usuario\Downloads\Agora\OAB 48\Planner_Estudos_30_Dias.html'
$text = [System.IO.File]::ReadAllText($path, [System.Text.UTF8Encoding]::new($false))
$pattern = '<strong>11:00 às 12:00</strong><ul><li>Revisar as anotações.</li><li>Complementar o resumo.</li><li>Pesquisar dúvidas.</li></ul>'
$text = [System.Text.RegularExpressions.Regex]::Replace($text, [System.Text.RegularExpressions.Regex]::Escape($pattern), '$&<hr>')
[System.IO.File]::WriteAllText($path, $text, [System.Text.UTF8Encoding]::new($false))
Write-Output 'Atualizado'
