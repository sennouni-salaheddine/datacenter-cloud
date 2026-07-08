# VMware ESXi — Virtualisatie & Active Directory

> **Schoolproject** — Odisee Campus Brussel · Toegepaste Informatica · Cybersecurity & Network Specialist · 2024–2025

Opzetten van een gevirtualiseerde serveromgeving met VMware ESXi, Windows Server 2022 en Active Directory domeinbeheer.

---

## Technologieën

| Domein | Technologie |
|--------|-------------|
| Hypervisor | VMware ESXi |
| OS | Windows Server 2022 |
| Directoryservice | Active Directory Domain Services (AD DS) |
| DNS & DHCP | Windows DNS Server, Windows DHCP Server |
| Groepsbeleid | Group Policy Objects (GPO) |
| Scripting | PowerShell |

---

## Inhoud van deze repo

```
scripts/
├── New-ADUsers.ps1        # Bulk gebruikers aanmaken via CSV
└── New-OUStructure.ps1    # OU-structuur aanmaken in AD

docs/
├── VM-configuratie.md     # ESXi host + VM specs en netwerkinstellingen
└── GPO-overzicht.md       # Overzicht van toegepaste groepsbeleidsregels
```

---

## Scripts

### `New-ADUsers.ps1`
Leest een CSV-bestand in en maakt automatisch AD-gebruikersaccounts aan in de juiste OU. Configureert UPN, wachtwoord en verplichte wachtwoordwijziging bij eerste login.

### `New-OUStructure.ps1`
Maakt de basisstructuur van Organisatie-eenheden (OUs) aan voor een schooldomein: Gebruikers, Leerlingen, Personeel, Computers, Groepen, Servers.

---

## Documentatie

- **[VM-configuratie.md](docs/VM-configuratie.md)** — ESXi host specs, VM overzicht, netwerkconfiguratie en stappen voor domeinopzet
- **[GPO-overzicht.md](docs/GPO-overzicht.md)** — Toegepaste groepsbeleidsregels met wachtwoord- en vergrendelingsbeleid

---

## Badges

![VMware](https://img.shields.io/badge/Hypervisor-VMware%20ESXi-607078?logo=vmware&logoColor=white)
![Windows Server](https://img.shields.io/badge/OS-Windows%20Server%202022-0078D4?logo=windows&logoColor=white)
![Active Directory](https://img.shields.io/badge/Directory-Active%20Directory-blue)
![PowerShell](https://img.shields.io/badge/Scripting-PowerShell-5391FE?logo=powershell&logoColor=white)

