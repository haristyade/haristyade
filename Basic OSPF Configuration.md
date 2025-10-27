# Protocol
Open Short Path First (OSPF)

# Requirement
* Configure hostname
* Assign IP address on interface routers and loopback.
* Configure OSPF protocol
* Configure OSPF virtual link
* Verification and analysis table route

# Configuration
**| R1**
```
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
**| R2**
```
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
R2(config-router)#network 172.16.10.8 0.0.0.3 area 0
R2(config-router)#network 172.16.10.12 0.0.0.3 area 0
R2(config-router)#area 2 virtual-link 10.10.5.5
```
\
**| R3**
```
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
R3(config-router)#network 172.16.10.16 0.0.0.3 area 0
```
\
**| R4**
```
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
R4(config-router)#network 172.16.10.8 0.0.0.3 area 0
R4(config-router)#network 172.16.10.20 0.0.0.3 area 0
```
\
**| R5**
```
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
R5(config-router)#network 172.16.10.20 0.0.0.3 area 0
R5(config-router)#network 172.16.10.12 0.0.0.3 area 0
R5(config-router)#network 172.16.10.16 0.0.0.3 area 0
R5(config-router)#network 172.16.10.24 0.0.0.3 area 0
R5(config-router)#area 2 virtual-link 10.10.2.2
```
\
**| R6**
```
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
R6(config-router)#network 172.16.10.24 0.0.0.3 area 0
```

# Verification and analysis table route

**Veifikasi pada router R6**
```
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

**Hasil Ping ke setiap Router dari Router Backbone**










