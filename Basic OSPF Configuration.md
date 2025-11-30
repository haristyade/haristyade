# Protocol
Open Short Path First (OSPF) Multi-Area

# Requirement
* Configure hostname.
* Assign IP address on interface routers and loopback.
* Configure OSPF protocol.
* Configure OSPF virtual link.

# Configuration
**| R1 - Internal Backbone Router**
```powershell
Router#enable
Router#configure terminal
Enter configuration commands, one per line.  End with CNTL/Z.

Router(config)#hostname R1

R1(config)#interface fa0/0
R1(config-if)#ip address 172.16.10.1 255.255.255.252
R1(config-if)#no shutdown
R1(config-if)#exit
R1(config)#interface fa0/1
R1(config-if)#ip address 172.16.10.5 255.255.255.252
R1(config-if)#no shutdown
R1(config-if)#exit
R1(config)#interface Loopback0
R1(config-if)#ip address 10.10.1.1 255.255.255.255
R1(config-if)#exit

R1(config)#router ospf 1
R1(config-router)#network 172.16.10.0 0.0.0.3 area 0
R1(config-router)#network 172.16.10.4 0.0.0.3 area 0
```
\
**| R2 - Area Border Router (ABR)**
```powershell
Router#enable
Router#configure terminal
Enter configuration commands, one per line.  End with CNTL/Z.
Router(config)#hostname R2

R2(config)#interface fa0/0
R2(config-if)#ip address 172.16.10.2 255.255.255.252
R2(config-if)#no shutdown
R2(config-if)#exit
R2(config)#interface fa0/1
R2(config-if)#ip address 172.16.10.9 255.255.255.252
R2(config-if)#no shutdown
R2(config-if)#exit
R2(config)#interface fa1/0
R2(config-if)#ip address 172.16.10.13 255.255.255.252
R2(config-if)#no shutdown
R2(config-if)#exit
R2(config)#interface fa2/0
R2(config-if)#ip address 172.16.10.29 255.255.255.252
R2(config-if)#no shutdown
R2(config-if)#exit
R2(config)#interface Loopback0
R2(config-if)#ip address 10.10.2.2 255.255.255.255
R2(config-if)#exit

R2(config)#router ospf 1
R2(config-router)#network 172.16.10.0 0.0.0.3 area 0
R2(config-router)#network 172.16.10.8 0.0.0.3 area 1
R2(config-router)#network 172.16.10.12 0.0.0.3 area 2
R2(config-router)#network 172.16.10.28 0.0.0.3 area 2
R2(config-router)#area 2 virtual-link 10.10.5.5
```
\
**| R3 - Area Border Router (ABR)**
```powershell
Router#enable
Router#configure terminal
Enter configuration commands, one per line.  End with CNTL/Z.
Router(config)#hostname R3

R3(config)#interface fa0/0
R3(config-if)#ip address 172.16.10.6 255.255.255.252
R3(config-if)#no shutdown
R3(config-if)#exit
R3(config)#interface fa0/1
R3(config-if)#ip address 172.16.10.17 255.255.255.252
R3(config-if)#no shutdown
R3(config-if)#exit
R3(config)#interface Loopback0
R3(config-if)#ip address 10.10.3.3 255.255.255.255
R3(config-if)#exit

R3(config)#router ospf 1
R3(config-router)#network 172.16.10.4 0.0.0.3 area 0
R3(config-router)#network 172.16.10.16 0.0.0.3 area 2
R3(config-router)#network 172.16.10.28 0.0.0.3 area 2
```
\
**| R4 - Internal Router**
```powershell
Router#enable
Router#configure terminal
Enter configuration commands, one per line.  End with CNTL/Z.
Router(config)#hostname R4

R4(config)#interface fa0/0
R4(config-if)#ip address 172.16.10.10 255.255.255.252
R4(config-if)#no shutdown
R4(config-if)#exit
R4(config)#interface fa0/1
R4(config-if)#ip address 172.16.10.21 255.255.255.252
R4(config-if)#no shutdown
R4(config-if)#exit
R4(config)#interface Loopback0
R4(config-if)#ip address 10.10.4.4 255.255.255.255
R4(config-if)#exit

R4(config)#router ospf 1
R4(config-router)#network 172.16.10.8 0.0.0.3 area 1
R4(config-router)#network 172.16.10.20 0.0.0.3 area 1
```
\
**| R5 - Area Border Router (ABR)**
```powershell
Router#enable
Router#configure terminal
Enter configuration commands, one per line.  End with CNTL/Z.
Router(config)#hostname R5

R5(config)#interface fa0/0
R5(config-if)#ip address 172.16.10.14 255.255.255.252
R5(config-if)#no shutdown
R5(config-if)#exit
R5(config)#interface fa0/1
R5(config-if)#ip address 172.16.10.18 255.255.255.252
R5(config-if)#no shutdown
R5(config-if)#exit
R5(config)#interface fa1/0
R5(config-if)#ip address 172.16.10.22 255.255.255.252
R5(config-if)#no shutdown
R5(config-if)#exit
R5(config)#interface fa2/0
R5(config-if)#ip address 172.16.10.25 255.255.255.252
R5(config-if)#no shutdown
R5(config-if)#exit
R5(config)#interface Loopback0
R5(config-if)#ip address 10.10.5.5 255.255.255.255
R5(config-if)#exit

R5(config)#router ospf 1
R5(config-router)#network 172.16.10.20 0.0.0.3 area 1
R5(config-router)#network 172.16.10.12 0.0.0.3 area 2
R5(config-router)#network 172.16.10.16 0.0.0.3 area 2
R5(config-router)#network 172.16.10.24 0.0.0.3 area 3
R5(config-router)#area 2 virtual-link 10.10.2.2
```
\
**| R6 - Internal Router**
```powershell
Router#enable
Router#configure terminal
Enter configuration commands, one per line.  End with CNTL/Z.
Router(config)#hostname R6

R6(config)#interface fa0/0
R6(config-if)#ip address 172.16.10.26 255.255.255.252
R6(config-if)#no shutdown
R6(config-if)#exit
R6(config)#interface Loopback0
R6(config-if)#ip address 10.10.6.6 255.255.255.255
R6(config-if)#exit

R6(config)#router ospf 1
R6(config-router)#network 172.16.10.24 0.0.0.3 area 3
```

# Verification and analysis
Result from table routing R1 show if the router have connected to all router in the network. The router complete to connect to each router, for verification the connection i tried pinging from R1 to each connected router.\
**| Table routing in R1**
```powershell
R1#show ip route | B Gateway
Gateway of last resort is not set
     172.16.0.0/30 is subnetted, 7 subnets
O IA    172.16.10.20 [110/12] via 172.16.10.2, 00:14:28, FastEthernet0/0      >>>>> [route to R5 via R2]
O IA    172.16.10.16 [110/11] via 172.16.10.6, 00:14:28, FastEthernet0/1      >>>>> [route to R5 via R3]
O IA    172.16.10.24 [110/12] via 172.16.10.2, 00:14:28, FastEthernet0/0      >>>>> [route to R6 via Virtual-link R2]
C       172.16.10.4 is directly connected, FastEthernet0/1
C       172.16.10.0 is directly connected, FastEthernet0/0
O IA    172.16.10.12 [110/11] via 172.16.10.2, 00:14:28, FastEthernet0/0      >>>>> [route to R5 via R2]
O IA    172.16.10.8 [110/20] via 172.16.10.2, 00:14:28, FastEthernet0/0       >>>>> [route to R4 via R2]
     10.0.0.0/32 is subnetted, 1 subnets
C       10.10.1.1 is directly connected, Loopback0
```

**| Ping result to each connected router**
```powershell
R1#ping 172.16.10.2                  >>>>> [ping to interface fa0/0 router R2]
Type escape sequence to abort.
Sending 5, 100-byte ICMP Echos to 172.16.10.2, timeout is 2 seconds:
!!!!!
Success rate is 100 percent (5/5), round-trip min/avg/max = 8/12/20 ms

R1#ping 172.16.10.6                  >>>>> [ping to interface fa0/0 router R3]
Type escape sequence to abort.
Sending 5, 100-byte ICMP Echos to 172.16.10.6, timeout is 2 seconds:
!!!!!
Success rate is 100 percent (5/5), round-trip min/avg/max = 8/15/32 ms

R1#ping 172.16.10.10                  >>>>> [ping to interface fa0/0 router R4]
Type escape sequence to abort.
Sending 5, 100-byte ICMP Echos to 172.16.10.10, timeout is 2 seconds:
!!!!! 
Success rate is 100 percent (5/5), round-trip min/avg/max = 52/60/72 ms

R1#ping 172.16.10.18                  >>>>> [ping to interface fa0/1 router R5]
Type escape sequence to abort.
Sending 5, 100-byte ICMP Echos to 172.16.10.18, timeout is 2 seconds:
!!!!!
Success rate is 100 percent (5/5), round-trip min/avg/max = 52/60/72 ms

R1#ping 172.16.10.22                  >>>>> [ping to interface fa1/0 router R5]
Type escape sequence to abort.
Sending 5, 100-byte ICMP Echos to 172.16.10.22, timeout is 2 seconds:
!!!!!
Success rate is 100 percent (5/5), round-trip min/avg/max = 56/71/84 ms

R1#ping 172.16.10.26                  >>>> [ping to interface fa0/0 router R6]
Type escape sequence to abort.
Sending 5, 100-byte ICMP Echos to 172.16.10.26, timeout is 2 seconds:
!!!!!
Success rate is 100 percent (5/5), round-trip min/avg/max = 72/80/92 ms
```
Traceroute to R6 for checking route use Virtual-link. The result show route active via virtual-link in R2 to R5 area 2.
```
R1#traceroute 172.16.10.26                  >>>>> [traceroute to router R6]
Type escape sequence to abort.
Tracing the route to 172.16.10.26
  1 172.16.10.2 8 msec 12 msec 12 msec
  2 172.16.10.14 20 msec 20 msec 20 msec
  3 172.16.10.26 36 msec 44 msec 40 msec
```

**| Veification virtual-link interface at R2 and R5**
```powershell
R2#show ip ospf virtual-links
Virtual Link OSPF_VL0 to router 10.10.5.5 is up                   >>>>>[virtual link connect to router R5 use Router-ID]
  Run as demand circuit
  DoNotAge LSA allowed.
  Transit area 2, via interface FastEthernet1/0, Cost of using 1
  Transmit Delay is 1 sec, State POINT_TO_POINT,
  Timer intervals configured, Hello 10, Dead 40, Wait 40, Retransmit 5
    Hello due in 00:00:00
    Adjacency State FULL (Hello suppressed)
    Index 2/2, retransmission queue length 0, number of retransmission 0
    First 0x0(0)/0x0(0) Next 0x0(0)/0x0(0)
    Last retransmission scan length is 0, maximum is 0
    Last retransmission scan time is 0 msec, maximum is 0 msec
```
```powershell
R5#show ip ospf virtual-links
Virtual Link OSPF_VL0 to router 10.10.2.2 is up                  >>>>>[virtual link connect to router R2 use Router-ID]
  Run as demand circuit
  DoNotAge LSA allowed.
  Transit area 2, via interface FastEthernet0/0, Cost of using 10
  Transmit Delay is 1 sec, State POINT_TO_POINT,
  Timer intervals configured, Hello 10, Dead 40, Wait 40, Retransmit 5
    Hello due in 00:00:03
    Adjacency State FULL (Hello suppressed)
    Index 1/5, retransmission queue length 0, number of retransmission 0
    First 0x0(0)/0x0(0) Next 0x0(0)/0x0(0)
    Last retransmission scan length is 0, maximum is 0
    Last retransmission scan time is 0 msec, maximum is 0 msec
```

**| Verification and analysis table route at R6**\
R6 has been configured OSPF protocol, as shown in the table routing displaying route information to connected routers. 
```powershell
R6#show ip ospf
 Routing Process "ospf 1" with ID 10.10.6.6
 Start time: 00:00:18.864, Time elapsed: 00:07:38.080
 Supports only single TOS(TOS0) routes
 Supports opaque LSA
 Supports Link-local Signaling (LLS)
 Supports area transit capability
 Router is not originating router-LSAs with maximum metric
 Initial SPF schedule delay 5000 msecs
 Minimum hold time between two consecutive SPFs 10000 msecs
 Maximum wait time between two consecutive SPFs 10000 msecs
 Incremental-SPF disabled
 Minimum LSA interval 5 secs
 Minimum LSA arrival 1000 msecs
 LSA group pacing timer 240 secs
 Interface flood pacing timer 33 msecs
 Retransmission pacing timer 66 msecs
 Number of external LSA 0. Checksum Sum 0x000000
 Number of opaque AS LSA 0. Checksum Sum 0x000000
 Number of DCbitless external and opaque AS LSA 0
 Number of DoNotAge external and opaque AS LSA 0
 Number of areas in this router is 1. 1 normal 0 stub 0 nssa
 Number of areas transit capable is 0
 External flood list length 0
    Area 3
        Number of interfaces in this area is 1
        Area has no authentication
        SPF algorithm last executed 00:06:47.932 ago
        SPF algorithm executed 2 times
        Area ranges are
        Number of LSA 9. Checksum Sum 0x042AC9
        Number of opaque link LSA 0. Checksum Sum 0x000000
        Number of DCbitless LSA 0
        Number of indication LSA 0
        Number of DoNotAge LSA 0
        Flood list length 0

R6#show ip ospf neighbor
Neighbor ID     Pri   State           Dead Time   Address         Interface
10.10.5.5         1   FULL/DR         00:00:38    172.16.10.25    FastEthernet0/0

R6#show ip route | B Gateway
Gateway of last resort is not set
     172.16.0.0/30 is subnetted, 7 subnets
O IA    172.16.10.20 [110/11] via 172.16.10.25, 01:03:41, FastEthernet0/0      >>>>> [route to R4]
O IA    172.16.10.16 [110/20] via 172.16.10.25, 01:03:41, FastEthernet0/0      >>>>> [route to R3]
C       172.16.10.24 is directly connected, FastEthernet0/0
O IA    172.16.10.4 [110/30] via 172.16.10.25, 01:03:27, FastEthernet0/0       >>>>> [route to R1]
O IA    172.16.10.0 [110/30] via 172.16.10.25, 01:03:31, FastEthernet0/0       >>>>> [route to R1]
O IA    172.16.10.12 [110/20] via 172.16.10.25, 01:03:41, FastEthernet0/0      >>>>> [route to R2]
O IA    172.16.10.8 [110/21] via 172.16.10.25, 01:03:41, FastEthernet0/0       >>>>> [route to R2]
     10.0.0.0/32 is subnetted, 1 subnets
C       10.10.6.6 is directly connected, Loopback0
```

# Troubleshoot
***1 Menentukan rute alternative jika link R2 > R5 down.***\
A Virtual-link creates a "tunnel" between ABR (Area Border Router)  to connect a non-backbone area to backbone area (area 0) through a transit area on the ABR that is connected to the backbone area (area 0). In this case, if the virtual-link between R2 and R5 goes down, then R6 will be isolated from the backbone area. To ensure that R6 can still connect to the backbone area without creating a new Virtual-Link, provided that R2 is connected to another router in the same area, the route can be directly diverted to the connected route even without the Virtual-Link. In this topology, the route will go through R2 > R3 > R5. R3 can forward packets from R2 to R5 because these routers are connected within the same Area 2.

**| Ping and traceroute to R6 if virtual-link status up**
```powershell
R1#ping 172.16.10.26
Type escape sequence to abort.
Sending 5, 100-byte ICMP Echos to 172.16.10.26, timeout is 2 seconds:
!!!!!
Success rate is 100 percent (5/5), round-trip min/avg/max = 44/56/64 ms

R1#traceroute 172.16.10.26
Type escape sequence to abort.
Tracing the route to 172.16.10.26
  1 172.16.10.2 16 msec 24 msec 24 msec                  >>>>> route still goes through R2 and R5
  2 172.16.10.14 24 msec 32 msec 28 msec
  3 172.16.10.26 36 msec 40 msec 40 msec
```
**| Table routing at R6**
R6 keep get information route and network 172.16.10.12 /30 keep active
```powershell
R6#show ip route | B Gateway
Gateway of last resort is not set

     172.16.0.0/30 is subnetted, 7 subnets
O IA    172.16.10.20 [110/11] via 172.16.10.25, 00:51:04, FastEthernet0/0
O IA    172.16.10.16 [110/20] via 172.16.10.25, 00:51:04, FastEthernet0/0
C       172.16.10.24 is directly connected, FastEthernet0/0
O IA    172.16.10.4 [110/30] via 172.16.10.25, 00:50:49, FastEthernet0/0
O IA    172.16.10.0 [110/30] via 172.16.10.25, 00:50:54, FastEthernet0/0
O IA    172.16.10.12 [110/20] via 172.16.10.25, 00:51:04, FastEthernet0/0
O IA    172.16.10.8 [110/21] via 172.16.10.25, 00:51:04, FastEthernet0/0
     10.0.0.0/32 is subnetted, 1 subnets
C       10.10.6.6 is directly connected, Loopback0
```
**| Virtual-link down at interface F0/1 R2**
```powershell
R2#show ip interface brief
Interface                  IP-Address      OK? Method Status                Protocol
FastEthernet0/0            172.16.10.2     YES NVRAM  up                    up
FastEthernet0/1            172.16.10.9     YES NVRAM  up                    up
FastEthernet1/0            172.16.10.13    YES NVRAM  administratively down down                  >>>>> interface detected down
FastEthernet2/0            172.16.10.29    YES NVRAM  administratively down down                  >>>>> as a backup interface to R3 from R2 not active
Loopback0                  10.10.2.2       YES NVRAM  up                    up
```
**| Ping and traceroute to R6 failed**
```powershell
R1#ping 172.16.10.26                        >>>>> ping from R1 to R6 failed
Type escape sequence to abort.
Sending 5, 100-byte ICMP Echos to 172.16.10.26, timeout is 2 seconds:
.....
Success rate is 0 percent (0/5)

R1#traceroute 172.16.10.26                  >>>>> traceroute detect if route down in neighbor router
Type escape sequence to abort.
Tracing the route to 172.16.10.26
  1  *  *  *
  2  *  *  *
  3  *  *  *
  4  *  *  *
  5  *  *  *
  6  *  *  *
  7  *  *  *
  8  *  *  *
  9  *  *  *
 10  *  *  *
 11  *  *  *
 12  *  *  *
 13  *  *  *
 14  *  *  *
 15  *  *  *
 16  *  *  *
 17  *  *  *
 18  *  *  *
 19  *  *  *
 20  *  *  *
 21  *  *  *
 22  *  *  *
 23  *  *  *
 24  *  *  *
 25  *  *  *
 26  *  *  *
 27  *  *  *
 28  *  *  *
 29  *  *  *
 30  *  *  *
```
**| After backup route from R2 to R3 active, R6 have connect to each router and get LSA update after 30 second**
```powershell
R6#show ip route | B Gateway
Gateway of last resort is not set

     172.16.0.0/30 is subnetted, 8 subnets
O IA    172.16.10.20 [110/11] via 172.16.10.25, 00:00:55, FastEthernet0/0
O IA    172.16.10.16 [110/20] via 172.16.10.25, 00:00:55, FastEthernet0/0
O IA    172.16.10.28 [110/30] via 172.16.10.25, 00:00:55, FastEthernet0/0
C       172.16.10.24 is directly connected, FastEthernet0/0
O IA    172.16.10.4 [110/30] via 172.16.10.25, 00:00:40, FastEthernet0/0
O IA    172.16.10.0 [110/40] via 172.16.10.25, 00:00:45, FastEthernet0/0
O IA    172.16.10.12 [110/20] via 172.16.10.25, 00:00:55, FastEthernet0/0
O IA    172.16.10.8 [110/21] via 172.16.10.25, 00:00:55, FastEthernet0/0
     10.0.0.0/32 is subnetted, 1 subnets
C       10.10.6.6 is directly connected, Loopback0

R6#ping 172.16.10.1                  >>>>> ping from R6 to R1 has successfull
Type escape sequence to abort.
Sending 5, 100-byte ICMP Echos to 172.16.10.1, timeout is 2 seconds:
!!!!!
Success rate is 100 percent (5/5), round-trip min/avg/max = 16/41/60 ms
```

**| Test ping from R1 to R6**
```powershell
R1#ping 172.16.10.26                  >>>>> Ping to R6 has success to
Type escape sequence to abort.
Sending 5, 100-byte ICMP Echos to 172.16.10.26, timeout is 2 seconds:
!!!!!
Success rate is 100 percent (5/5), round-trip min/avg/max = 36/52/80 ms

R1#traceroute 172.16.10.26            >>>>> in traceroute to R6, route change through R2 > R3 > R5
Type escape sequence to abort.
Tracing the route to 172.16.10.26
  1 172.16.10.2 16 msec 24 msec 16 msec            >>>>> Interface R2
  2 172.16.10.30 36 msec 20 msec 8 msec            >>>>> Interface R3
  3 172.16.10.18 16 msec 28 msec 28 msec           >>>>> Interface R5
  4 172.16.10.26 48 msec 36 msec 28 msec           >>>>> IP destination R6
```






