# Documentation du projet

## Architecture du Système

Ce projet repose sur une architecture en **deux clusters**.

## Outils Utilisés

Le projet utilise plusieurs outils pour gérer l'infrastructure et automatiser certaines tâches :

- **Git** : Gestion du code source et versionnement.
- **Terraform** : Outil pour l’infrastructure as code (IaC) afin de provisionner et gérer l'infrastructure dans Azure.
- **Azure CLI** : Interface en ligne de commande pour interagir avec Azure, notamment pour gérer les ressources Azure, les comptes de service, etc.

## Cloner ce Dépôt

Pour cloner ce dépôt, utilisez la commande suivante dans votre terminal :

```bash
git clone https://github.com/sakanokoh/LabCloud-terraform.git

```

Une fois cloné, vous pouvez commencer à travailler sur le projet localement pour faire de modifications de personalisation si possible.

## Connexion à Azure CLI et Création d’un Service Principal (SP)

Avant de pouvoir interagir avec Azure, vous devez vous connecter à votre compte Azure à l'aide de la **Azure CLI**.

### Se connecter à votre compte Azure

1. Ouvrez votre terminal et exécutez la commande suivante pour vous connecter :
    
    ```bash
    az login
    
    ```
    
2. Cela ouvrira une fenêtre de navigateur pour vous permettre de vous authentifier. Une fois connecté, vous serez redirigé vers votre terminal avec un message de confirmation.

### Créer un Service Principal avec des Droits sur un Abonnement ou un Groupe de Ressources

Un **Service Principal** est un identifiant qui permet à votre application (Azure CLI) de s'authentifier et d'agir sur les ressources Azure.

### Créer un SP avec des droits sur l’abonnement

1. Créez un Service Principal avec les permissions sur l'abonnement Azure :
    
    ```bash
    az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/{subscription_id}"
    
    ```
    
    Remplacez `{subscription_id}` par l'ID de votre abonnement Azure. Cette commande retournera les informations nécessaires, comme l'ID du client (client ID), le secret, et l'ID du locataire (tenant ID).
    

### Créer un SP avec des droits sur un groupe de ressources

Si vous préférez accorder des droits sur un **groupe de ressources** spécifique, vous pouvez utiliser la commande suivante :

```bash
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/{subscription_id}/resourceGroups/{resource_group_name}"

```

### Alternative pour la création Service Principal via le Portail Azure

1. Allez sur **Azure Portal** et dans ***Azure Active Directory -> App registrations -> New registration***.
2. Créez une application en définissant un nom et l'URI de redirection.
3. Une fois l'application créée, allez dans ***Certificates & secrets***, puis ***New client secret*** pour obtenir un client secret.
4. Allez dans ***API permissions*** et assignez le rôle `Contributor` à l'application pour l'accès au groupe de ressources ou à l'abonnement.

### Stocker les Crédentiels dans les Variables d'Environnement

Pour sécuriser les informations de connexion, On peut stocker less **crédentiels** (client ID, secret, tenant ID) dans les variables d'environnement de votre système.

1. Définissez les variables d'environnement :
    
    **Windows**
    
    ```powershell
    $Env:ARM_CLIENT_ID = "<APPID_VALUE>"
    $Env:ARM_CLIENT_SECRET = "<PASSWORD_VALUE>"
    $Env:ARM_SUBSCRIPTION_ID = "<SUBSCRIPTION_ID>"
    $Env:ARM_TENANT_ID = "<TENANT_VALUE>"
    ```
    
    **Linux**
    
    ```bash
    export ARM_CLIENT_ID="<APPID_VALUE>"
    export ARM_CLIENT_SECRET="<PASSWORD_VALUE>"
    export ARM_SUBSCRIPTION_ID="<SUBSCRIPTION_ID>"
    export ARM_TENANT_ID="<TENANT_VALUE>"
    ```
    
    Remplacez `<APPID_VALUE>`, `<PASSWORD_VALUE>`,  `<SUBSCRIPTION_ID>`et `<TENANT_VALUE>` par les valeurs retournées par la commande de création du Service Principal.
    

## Résultats

Voici un aperçu des résultats obtenus de l'exécution du projet avec des captures d'écran pour visualiser l'état de l'infrastructure ou des processus :

- Plan avec 
``` shell
    terraform plan
```
<img src="imgDemo\tf_plan1.png" width="1200" height="300">

<img src="imgDemo\tf_plan2.png" width="1200" height="300">

- **Apply** avec 
``` shell
    terraform apply
```

<img src="imgDemo\apply1.png" width="1200" height="300">

- **Resultat**
Le groupe de ressources `hamsak-terraform-aks-rg` créés et ceux liés avec 
<img src="imgDemo\result.png" width="1200" height="300">

Il y a une un dépassement du limit de cpu avec mon compte Azure for Student c'est la raison pour laquelle il y a qu'un cluster `hamsak-terraform-aks-rg` dans notre groupe de ressources `hamsak-terraform-aks-rg`

 - Erreur en image
 <img src="imgDemo\error.png" width="1200" height="300">

Details result dans `hamsak-terraform-aks-rg`

<img src="imgDemo\resultDetails.png" width="1200" height="300">

**Après avoir diminué le nombre de chaque cluster en 1 pour éviter de dépasser les capacités de cpu**
Voilà les résultats

- Apply 
<img src="imgDemo\apply2.png" width="1200" height="300">


- Les groupes de ressources (`hamsak-terraform-aks-rg` et les autres associés)
<img src="imgDemo\Resultat.png" width="1200" height="300">


- Dans `hamsak-terraform-aks-rg`
<img src="imgDemo\InRg.png" width="1200" height="300">


- Cluster 1 en Détails
<img src="imgDemo\ResultatDetailsC1.png" width="1200" height="300">


- Cluster 2 en Détails
<img src="imgDemo\ResultatDetailsC2.png" width="1200" height="300">