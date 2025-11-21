# Networking / CIDR — Unknown / Mixed-Source Questions (Questions + Answers)

Q1. If you need 1000 IPs, which CIDR will you select?
A1. Use a /22 network (2^(32-22) = 1024 addresses), which meets 1000 IP requirement.

Q2. IP availability if subnet has 16 IPs?
A2. A /28 has 16 total addresses. In generic networking 14 are usable (network + broadcast reserved); in Azure the platform reserves 5 addresses, so usable = 11.

Q3. CIDR calculation formula?
A3. Number of IPs = 2^(32 - prefix_length). Usable hosts = total minus reserved addresses (network/broadcast or cloud provider reserves).

