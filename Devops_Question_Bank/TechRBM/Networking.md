# Networking / CIDR – TechRBM Interview Questions

## Q1. If you need 1000 IPs, which CIDR will you pick?
### Answer
Use /22 which provides 1024 IP addresses — that satisfies the requirement of 1000 IPs.
### Follow-Up Points
- Pick next power-of-two block that covers required hosts.  
- Account for reserved addresses (Azure reserves some addresses per subnet).
### Example
CIDR: 10.0.0.0/22 → 1024 addresses.

---

## Q2. CIDR calculation formula?
### Answer
Number of IPs = 2^(32 - prefix_length). For usable hosts subtract reserved addresses (platform-specific; e.g., Azure reserves 5 addresses in each subnet).
### Follow-Up Points
- /24 → 256 IPs, /22 → 1024 IPs.  
- Convert prefix to available addresses with 2^(32 - prefix).
### Example
prefix=22 → 2^(32-22)=2^10=1024 IPs.

---

## Q3. If one subnet has 16 IPs, how many are available?
### Answer
A /28 subnet has 16 total IPs. In Azure, 5 are reserved by the platform, so usable = 11. In general networking, usable hosts may be total-2 (network and broadcast) → 14 usable; cloud providers often reserve different counts.
### Follow-Up Points
- Clarify whether question expects raw CIDR math or cloud provider reservations.  
- Always consider platform-specific reserved addresses.
### Example
/28 = 16 addresses; Azure usable = 11.

