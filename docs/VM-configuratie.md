# VM Configuratie — VMware ESXi Omgeving

## ESXi Host

| Parameter | Waarde |
|-----------|--------|
| Hypervisor | VMware ESXi |
| Geheugen | 16 GB RAM |
| Opslag | Lokale datastore |
| Netwerk | 1 vSwitch, 1 VM Network portgroup |

## Virtuele Machines

### DC01 — Domeincontroller

| Parameter | Waarde |
|-----------|--------|
| OS | Windows Server 2022 (Desktop Experience) |
| vCPUs | 2 |
| RAM | 4 GB |
| Schijf | 60 GB |
| IP | Statisch (domeincontroller) |
| Rollen | AD DS, DNS Server, DHCP Server |

### WS01 — Werkstation (domeinclient)

| Parameter | Waarde |
|-----------|--------|
| OS | Windows 10/11 |
| vCPUs | 2 |
| RAM | 2 GB |
| Schijf | 40 GB |
| Domein | school.local |

## Netwerkconfiguratie

- Intern VMware netwerk (geen externe verbinding vereist)
- Domeincontroller fungeert als DNS voor alle VM-clients
- DHCP-scope uitgedeeld door DC01

## Stappen domein opzetten

1. ESXi installeren op bare-metal host
2. VM aanmaken voor DC01, Windows Server 2022 installeren
3. Statisch IP instellen op DC01
4. Rol AD DS toevoegen via Server Manager
5. Domeincontroller promoveren (`school.local`)
6. DNS automatisch geconfigureerd door AD DS installatie
7. DHCP-rol toevoegen, scope aanmaken
8. Werkstation-VM joinen aan domein
9. OU-structuur en GPOs aanmaken

