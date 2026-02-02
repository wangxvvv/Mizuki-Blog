flowchart TD
    %% ===== Nodes =====
    CodePush["🧑‍💻 Code Repo<br/>Push / PR"]
    ContentPush["📝 Content Repo<br/>Push"]
    Dispatch["📡 repository_dispatch"]

    CI["🔵 CI · GitHub Hosted Runner<br/><small>Check & Build</small>"]
    CheckoutCode["📥 Checkout Code"]
    CheckoutContent["📥 Checkout Content"]
    Sync["🔗 Sync Content<br/>(sync-content.js)"]
    Check["🧪 Astro Check"]
    BuildCI["🏗 Astro Build"]

    Gate{"🚦 main branch ?"}
    Stop["🛑 Stop"]

    Deploy["🟢 Deploy · Self-hosted Runner"]
    BuildProd["🏗 Build Production"]
    Rsync["📦 rsync → releases/<timestamp>"]
    Switch["🔁 Switch symlink<br/>current → new"]
    Nginx["🌍 Nginx serves<br/>new version"]

    %% ===== Flow =====
    CodePush --> CI
    ContentPush --> Dispatch --> CI

    CI --> CheckoutCode
    CheckoutCode --> CheckoutContent
    CheckoutContent --> Sync
    Sync --> Check
    Check --> BuildCI
    BuildCI --> Gate

    Gate -->|No| Stop
    Gate -->|Yes| Deploy

    Deploy --> BuildProd
    BuildProd --> Rsync
    Rsync --> Switch
    Switch --> Nginx

    %% ===== Styles =====
    classDef trigger fill:#fef3c7,stroke:#f59e0b,color:#92400e;
    classDef ci fill:#e0f2fe,stroke:#0284c7,color:#075985;
    classDef deploy fill:#dcfce7,stroke:#16a34a,color:#065f46;
    classDef stop fill:#fee2e2,stroke:#dc2626,color:#7f1d1d;
    classDef infra fill:#ede9fe,stroke:#7c3aed,color:#4c1d95;

    class CodePush,ContentPush,Dispatch trigger;
    class CI,CheckoutCode,CheckoutContent,Sync,Check,BuildCI ci;
    class Deploy,BuildProd,Rsync,Switch deploy;
    class Stop stop;
    class Nginx infra;
