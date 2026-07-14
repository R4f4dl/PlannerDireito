# Conexão com o Firestore

1. No Firebase Console, abra **Configurações do projeto > Seus apps** e crie ou selecione o app da Web (`</>`).
2. Copie somente o objeto `firebaseConfig` e preencha os campos de `firebase-config.js`.
3. Nas regras do Firestore, libere exclusivamente o documento usado pelo planner. Para um uso individual temporário, a regra abaixo permite acesso apenas a esse documento:

```js
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /planners/oab48-principal {
      allow read, write: if true;
    }
  }
}
```

Essa regra é adequada apenas para um planner sem informações sensíveis e cujo link não será compartilhado. Para uso com mais de uma pessoa ou dados privados, o próximo passo é adicionar Firebase Authentication e restringir o documento a `request.auth.uid`.

O planner guarda os dados no documento `planners/oab48-principal` e mantém uma cópia local para funcionar offline. Ao abrir, a versão do Firestore é carregada antes do conteúdo ser montado; cada alteração é enviada após uma breve pausa.
