# Ceci est un script permettant de stocker les metadata des fichiers modèles dans un fichier Json.
# Ce dernier servira après pour gèrer les versions ds modèles Bdoc

# Le chemin vers le répertoire des modèles
$PathToDir = "D:\BDOC"
# Le chemin vers le fichier Json
$PathToJson = $PathToDir + "\bdoc-version.json"
# Les metadata des fichiers modèles
$DirHierarchy = Get-ChildItem -Path $PathToDir -Recurse -Filter *.bdoc |
        Select-Object -Property @{Name='name' ;Expression={$_.Name}},
                                @{Name='FullName' ;Expression={$_.FullName}},
                                @{Name='CreationTime' ;Expression={Get-Date $_.CreationTime -Format 'MM/dd/yyyy'}},
                                @{Name='LastAccessTime' ;Expression={Get-Date $_.LastAccessTime -Format 'MM/dd/yyyy'}},
                                @{Name='LastWriteDate';Expression={Get-Date $_.LastWriteTime -Format 'MM/dd/yyyy'}}
# Convertir l'output au format Json et générer le fichier Json
ConvertTo-Json $DirHierarchy