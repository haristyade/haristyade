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
R5(config-if)#ip address 172.16.10.22 255.255.255.252
R5(config-if)#no shutdown
R5(config-if)#exit
R5(config)#interface fa0/1
R5(config-if)#ip address 172.16.10.14 255.255.255.252
R5(config-if)#no shutdown
R5(config-if)#exit
R5(config)#interface fa1/0
R5(config-if)#ip address 172.16.10.18 255.255.255.252
R5(config-if)#no shutdown
R5(config-if)#exit
R5(config)#interface fa1/1
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
**Ping result to each Router**
Result from table routing R1 show if the router have connected to all router in the network. The router complete to connect to each router, for verification the connection i tried pinging from R1 to each connected router.\
\
**| R1 is Internal Backbone Router**
```powershell
R1#show ip route | B Gateway
Gateway of last resort is not set

      10.0.0.0/32 is subnetted, 1 subnets
C        10.10.1.1 is directly connected, Loopback0
      172.16.0.0/16 is variably subnetted, 9 subnets, 2 masks
C        172.16.10.0/30 is directly connected, FastEthernet0/0
L        172.16.10.1/32 is directly connected, FastEthernet0/0
C        172.16.10.4/30 is directly connected, FastEthernet0/1
L        172.16.10.5/32 is directly connected, FastEthernet0/1
O IA     172.16.10.8/30 [110/2] via 172.16.10.2, 01:15:17, FastEthernet0/0      >>>>> [route to R4 via R2]
O IA     172.16.10.12/30 [110/2] via 172.16.10.2, 01:15:17, FastEthernet0/0     >>>>> [route to R5 via R2]
O IA     172.16.10.16/30 [110/2] via 172.16.10.6, 01:15:22, FastEthernet0/1     >>>>> [route to R5 via R3]
O IA     172.16.10.20/30 [110/3] via 172.16.10.2, 01:15:02, FastEthernet0/0     >>>>> [route to R5 via R2]
O IA     172.16.10.24/30 [110/3] via 172.16.10.2, 01:15:02, FastEthernet0/0     >>>>> [route to R6 via R2]
O IA     172.16.10.28/30 [110/2] via 172.16.10.6, 00:35:06, FastEthernet0/1     >>>>> [route to R6 via R3]
                         [110/2] via 172.16.10.2, 00:06:57, FastEthernet0/0     >>>>> [route to R6 via R2]
```

```powershell
>>>>> [traceroute to router R6]
R1#traceroute 172.16.10.26
Type escape sequence to abort.
Tracing the route to 172.16.10.26
VRF info: (vrf in name/id, vrf out name/id)
  1 172.16.10.2 44 msec 32 msec 24 msec
  2 172.16.10.14 64 msec 56 msec 56 msec
  3 172.16.10.26 120 msec 60 msec 104 msec

>>>>> [ping to interface fa0/0 router R4]
R1#ping 172.16.10.10
Type escape sequence to abort.
Sending 5, 100-byte ICMP Echos to 172.16.10.10, timeout is 2 seconds:
!!!!! 
Success rate is 100 percent (5/5), round-trip min/avg/max = 52/60/72 ms

>>>>> [ping to interface fa1/1 router R5]
R1#ping 172.16.10.18
Type escape sequence to abort.
Sending 5, 100-byte ICMP Echos to 172.16.10.18, timeout is 2 seconds:
!!!!!
Success rate is 100 percent (5/5), round-trip min/avg/max = 52/60/72 ms

>>>>> [ping to interface fa0/0 router R5]
R1#ping 172.16.10.22
Type escape sequence to abort.
Sending 5, 100-byte ICMP Echos to 172.16.10.22, timeout is 2 seconds:
!!!!!
Success rate is 100 percent (5/5), round-trip min/avg/max = 56/71/84 ms

>>>> [ping to interface fa0/0 router R6]
R1#ping 172.16.10.26
Type escape sequence to abort.
Sending 5, 100-byte ICMP Echos to 172.16.10.26, timeout is 2 seconds:
!!!!!
Success rate is 100 percent (5/5), round-trip min/avg/max = 72/80/92 ms
```

**Veification virtual-link to R6**\
**| R2**
```powershell
R2#show ip ospf virtual-links
Virtual Link OSPF_VL0 to router 10.10.5.5 is up >>>>>[virtual link connect to router R5] 
  Run as demand circuit
  DoNotAge LSA allowed.
  Transit area 2, via interface FastEthernet1/0
 Topology-MTID    Cost    Disabled     Shutdown      Topology Name
        0           1         no          no            Base
  Transmit Delay is 1 sec, State POINT_TO_POINT,
  Timer intervals configured, Hello 10, Dead 40, Wait 40, Retransmit 5
    Hello due in 00:00:09
    Adjacency State FULL (Hello suppressed)
    Index 2/4, retransmission queue length 0, number of retransmission 0
    First 0x0(0)/0x0(0) Next 0x0(0)/0x0(0)
    Last retransmission scan length is 0, maximum is 0
    Last retransmission scan time is 0 msec, maximum is 0 msec
```
\
**| R2**
```powershell
R2#show ip ospf virtual-links
Virtual Link OSPF_VL0 to router 10.10.5.5 is up                             >>>>>[virtual link connect to router R5]
  Run as demand circuit
  DoNotAge LSA allowed.
  Transit area 2, via interface FastEthernet1/0
 Topology-MTID    Cost    Disabled     Shutdown      Topology Name
        0           1         no          no            Base
  Transmit Delay is 1 sec, State POINT_TO_POINT,
  Timer intervals configured, Hello 10, Dead 40, Wait 40, Retransmit 5
    Hello due in 00:00:00
    Adjacency State FULL (Hello suppressed)
    Index 2/5, retransmission queue length 0, number of retransmission 0
    First 0x0(0)/0x0(0) Next 0x0(0)/0x0(0)
    Last retransmission scan length is 0, maximum is 0
    Last retransmission scan time is 0 msec, maximum is 0 msec
```
\
**| R5**
```powershell
R5#show ip ospf virtual-links
Virtual Link OSPF_VL0 to router 10.10.2.2 is up                             >>>>>[virtual link connect to router R2]
  Run as demand circuit
  DoNotAge LSA allowed.
  Transit area 2, via interface FastEthernet0/1
 Topology-MTID    Cost    Disabled     Shutdown      Topology Name
        0           1         no          no            Base
  Transmit Delay is 1 sec, State POINT_TO_POINT,
  Timer intervals configured, Hello 10, Dead 40, Wait 40, Retransmit 5
    Hello due in 00:00:02
    Adjacency State FULL (Hello suppressed)
    Index 1/5, retransmission queue length 0, number of retransmission 0
    First 0x0(0)/0x0(0) Next 0x0(0)/0x0(0)
    Last retransmission scan length is 0, maximum is 0
    Last retransmission scan time is 0 msec, maximum is 0 msec
```
\
**| R6**
```powershell
R6#show ip ospf neighbor

Neighbor ID     Pri   State           Dead Time   Address         Interface
10.10.5.5         1   FULL/BDR        00:00:31    172.16.10.25    FastEthernet0/0
R6#show ip route | B Gateway
Gateway of last resort is not set

      10.0.0.0/32 is subnetted, 1 subnets
C        10.10.6.6 is directly connected, Loopback0
      172.16.0.0/16 is variably subnetted, 8 subnets, 2 masks
O IA     172.16.10.0/30 [110/3] via 172.16.10.25, 08:28:42, FastEthernet0/0 
O IA     172.16.10.4/30 [110/3] via 172.16.10.25, 08:28:37, FastEthernet0/0
O IA     172.16.10.8/30 [110/3] via 172.16.10.25, 08:28:43, FastEthernet0/0
O IA     172.16.10.12/30 [110/2] via 172.16.10.25, 08:28:43, FastEthernet0/0
O IA     172.16.10.16/30 [110/2] via 172.16.10.25, 08:28:43, FastEthernet0/0
O IA     172.16.10.20/30 [110/2] via 172.16.10.25, 08:28:43, FastEthernet0/0
C        172.16.10.24/30 is directly connected, FastEthernet0/0
L        172.16.10.26/32 is directly connected, FastEthernet0/0
R6#show ip protocol
*** IP Routing is NSF aware ***

Routing Protocol is "application"
  Sending updates every 0 seconds
  Invalid after 0 seconds, hold down 0, flushed after 0
  Outgoing update filter list for all interfaces is not set
  Incoming update filter list for all interfaces is not set
  Maximum path: 32
  Routing for Networks:
  Routing Information Sources:
    Gateway         Distance      Last Update
  Distance: (default is 4)

Routing Protocol is "ospf 1"
  Outgoing update filter list for all interfaces is not set
  Incoming update filter list for all interfaces is not set
  Router ID 10.10.6.6
  Number of areas in this router is 1. 1 normal 0 stub 0 nssa
  Maximum path: 4
  Routing for Networks:
    172.16.10.24 0.0.0.3 area 3
  Routing Information Sources:
    Gateway         Distance      Last Update
    10.10.5.5            110      08:28:54
  Distance: (default is 110)
```

# Troubleshoot
menentukan rute alternative jika link R2 > R5 down.
Virtual-link akan membuat "tunnel" antar ABR untuk menghubungkan non-backbone area ke backbone area melalui transit route pada ABR yang terhubung dengan backbone (area 0). Dalam kasus ini virtual-link R2-R5 down, maka R6 akan terisolasi ke area backbone. Agar R6 tetap dapat terhubung tanpa backup virtual-link,  jika R2 tersedia terhubung dengan router lain dalam area yang sama maka rute dapat dialihkan langsung. sehingga route akan melalui R2 > R3 > R5 karena R3 dapat meruskan paket dari R2 ke R5 dan ketiga router tersebut terhubung dalam area 2.

**| when virtual-link status up R2 > R5**
```powershell
R6#ping 172.16.10.1
Type escape sequence to abort.
Sending 5, 100-byte ICMP Echos to 172.16.10.1, timeout is 2 seconds:
!!!!!
Success rate is 100 percent (5/5), round-trip min/avg/max = 92/116/140 ms

R6#trace 172.16.10.1
Type escape sequence to abort.
Tracing the route to 172.16.10.1
VRF info: (vrf in name/id, vrf out name/id)
  1 172.16.10.25 36 msec 72 msec 32 msec      >>>>> Interface R5
  2 172.16.10.13 64 msec 56 msec 80 msec      >>>>> Interface R2
  3 172.16.10.1 100 msec 96 msec 96 msec      >>>>> IP destination R1

R6#sho ip route | B Gateway
Gateway of last resort is not set
      10.0.0.0/32 is subnetted, 2 subnets
O IA     10.10.1.1 [110/4] via 172.16.10.25, 00:02:21, FastEthernet0/0
C        10.10.6.6 is directly connected, Loopback0
      172.16.0.0/16 is variably subnetted, 9 subnets, 2 masks
O IA     172.16.10.0/30 [110/3] via 172.16.10.25, 00:02:21, FastEthernet0/0
O IA     172.16.10.4/30 [110/3] via 172.16.10.25, 00:02:21, FastEthernet0/0
O IA     172.16.10.8/30 [110/3] via 172.16.10.25, 00:31:02, FastEthernet0/0
O IA     172.16.10.12/30 [110/2] via 172.16.10.25, 00:02:26, FastEthernet0/0      >>>>> IP Route for virtual-link
O IA     172.16.10.16/30 [110/2] via 172.16.10.25, 00:31:02, FastEthernet0/0
O IA     172.16.10.20/30 [110/2] via 172.16.10.25, 00:31:02, FastEthernet0/0
C        172.16.10.24/30 is directly connected, FastEthernet0/0
L        172.16.10.26/32 is directly connected, FastEthernet0/0
O IA     172.16.10.28/30 [110/3] via 172.16.10.25, 00:31:02, FastEthernet0/0

```
\
**| after virtual-link down between R2 > R5**
```powershell
R2#show ip interface brief
Interface                  IP-Address      OK? Method Status                Protocol
FastEthernet0/0            172.16.10.2     YES NVRAM  up                    up
FastEthernet0/1            172.16.10.9     YES NVRAM  up                    up
FastEthernet1/0            172.16.10.13    YES NVRAM  administratively down down            >>>>> Link to R5 in this interface down
FastEthernet1/1            unassigned      YES NVRAM  administratively down down
FastEthernet2/0            unassigned      YES NVRAM  administratively down down
FastEthernet2/1            172.16.10.29    YES NVRAM  up                    up
Loopback0                  10.10.2.2       YES NVRAM  up                    up
```

```powershell
R6#sho ip route | B Gateway
Gateway of last resort is not set

      10.0.0.0/32 is subnetted, 2 subnets
O IA     10.10.1.1 [110/4] via 172.16.10.25, 00:22:46, FastEthernet0/0
C        10.10.6.6 is directly connected, Loopback0
      172.16.0.0/16 is variably subnetted, 9 subnets, 2 masks
O IA     172.16.10.0/30 [110/4] via 172.16.10.25, 00:22:50, FastEthernet0/0
O IA     172.16.10.4/30 [110/3] via 172.16.10.25, 00:22:45, FastEthernet0/0
O IA     172.16.10.8/30 [110/3] via 172.16.10.25, 00:22:55, FastEthernet0/0
O IA     172.16.10.12/30 [110/2] via 172.16.10.25, 00:22:55, FastEthernet0/0
O IA     172.16.10.16/30 [110/2] via 172.16.10.25, 00:22:55, FastEthernet0/0
O IA     172.16.10.20/30 [110/2] via 172.16.10.25, 00:22:55, FastEthernet0/0
C        172.16.10.24/30 is directly connected, FastEthernet0/0
L        172.16.10.26/32 is directly connected, FastEthernet0/0
O IA     172.16.10.28/30 [110/3] via 172.16.10.25, 00:22:55, FastEthernet0/0

>>>>> Ping to R1, result complete
R6#ping 172.16.10.1
Type escape sequence to abort.
Sending 5, 100-byte ICMP Echos to 172.16.10.1, timeout is 2 seconds:
!!!!!
Success rate is 100 percent (5/5), round-trip min/avg/max = 116/138/192 ms

>>>>> in traceroute to R1, route berubah melalui route R5 > R3 > R2
R6#trace 172.16.10.1
Type escape sequence to abort.
Tracing the route to 172.16.10.1
VRF info: (vrf in name/id, vrf out name/id)
  1 172.16.10.25 16 msec 32 msec 28 msec      >>>>> Interface R5
  2 172.16.10.17 92 msec 56 msec 60 msec      >>>>> Interface R3
  3 172.16.10.29 108 msec 84 msec 88 msec     >>>>> Interface R2
  4 172.16.10.1 120 msec 124 msec 120 msec    >>>>> IP destination R1
```






