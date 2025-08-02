# PORT	
  0/3/7:25.3 [Frame/Slot/Port:ONU.Gemport]
---------------------------------------------------------------------------
#cek sn ont yang belum di config	
  display ont autofind all
---------------------------------------------------------------------------
#cek interface by sn ont
  display ont info by-sn <SN-ONT>
---------------------------------------------------------------------------
#cek profile name
  display ont-lineprofile gpon all
---------------------------------------------------------------------------
#cek profile name by id
  display ont-lineprofile gpon profile-id 6
---------------------------------------------------------------------------
#cek service profile ont
  display ont-srvprofile gpon all
---------------------------------------------------------------------------
#cek
  display dba-profile all 
---------------------------------------------------------------------------
#cek line profile
  display traffic table ip from-index <index>
---------------------------------------------------------------------------
#cek vlan table
  display vlan all
---------------------------------------------------------------------------
#cek interface vlan
  display vlan <VLAN>
---------------------------------------------------------------------------
#cek mac address yang menggunakan vlan
  display mac-address vlan <VLAN>
---------------------------------------------------------------------------
#cek ont dalam 1 port	interface gpon 0/3
	display ont info 7 all
    (alternative)
  display ont info 0 3 7 all
---------------------------------------------------------------------------
#cek interface by port	interface gpon 0/3
	display ont info 7 25
    (alternative)	
  display ont info 0 3 7 25
---------------------------------------------------------------------------
#cek ip address
  display ont wan-info 0/3 7 25
---------------------------------------------------------------------------
#cek configure service ont
  display current-configuration ont 0/3/7 25
---------------------------------------------------------------------------
#cek service port ont
  display service-port port 0/3/7 ont 25
---------------------------------------------------------------------------
#cek konfigurasi service ont
  display current-configuration service-port 30876
---------------------------------------------------------------------------
#cek mac address yang up
  display mac-address port 0/3/7 ont 25
---------------------------------------------------------------------------
#cek mac address yang up by service port index
  display mac-address service-port 30876
---------------------------------------------------------------------------
#cek mac address device yang terhubung 
  display mac-address ont 0/3/7 25
---------------------------------------------------------------------------
#cek igmp dalam 1 port
  display igmp user port 0/3/7
---------------------------------------------------------------------------
#cek konfigurasi igmp
  display igmp user service-port 30876
---------------------------------------------------------------------------
#cek native vlan di port ethernet ont
  interface gpon 0/3
	  display ont port attribute 7 25 eth
---------------------------------------------------------------------------
#cek port ethernet yang terhubung
  interface gpon 0/3
	  display ont port state 7 25 eth-port all
---------------------------------------------------------------------------
#cek distance dan redaman ont
  display ont info option all 0 3 7 25
---------------------------------------------------------------------------
#cek power dan temperature ont
  interface gpon 0/3
	  display ont optical-info 7 25
---------------------------------------------------------------------------
#cek olt port TX/RX drop packets 
  interface gpon 0/3
  	display statistics port ethernet 7
---------------------------------------------------------------------------
#cek gemport TX/RX drop packets
  interface gpon 0/3
  	display statistics gemport 7 25 gemindex 1
---------------------------------------------------------------------------
#cek ont TX/RX drop packets
  interface gpon 0/3
  	display statistics ont 7 25
---------------------------------------------------------------------------
#cek CRC ethernet ont
  interface gpon 0/3
	  display statistics ont-eth 7 25 ont-port 3
---------------------------------------------------------------------------
#cek voice ethernet ont
  interface gpon 0/3
	  display sippstnuser attribute 7 25
---------------------------------------------------------------------------
#cek ip address sevice internet
  interface gpon 0/3
	  display ont ipconfig 7 25
---------------------------------------------------------------------------
#restart ont
  interface gpon 0/3
	  ont reset 7 25
---------------------------------------------------------------------------
#configure delete ont
  interface gpon 0/3
	  ont delete 7 25
---------------------------------------------------------------------------
#configure register ont
  interface gpon 0/3
	  ont add 7 25 sn-auth "485754432D6EE09F" omci ont-lineprofile-name INDIHOME ont-srvprofile-name HG8245 desc PELANGGAN1
---------------------------------------------------------------------------
#configure delete service	
  undo service-port 30876
---------------------------------------------------------------------------
#configure create service iptv
  service-port vlan 111 gpon 0/3/7 ont 25 gemport 1 multi-service user-vlan 111 tag-transform translate inbound traffic-table index 20 outbound traffic-table index 21
---------------------------------------------------------------------------
#configure create service voice
  service-port vlan 508 gpon 0/3/7 ont 25 gemport 2 multi-service user-vlan 100 tag-transform translate inbound traffic-table index 18 outbound traffic-table index 19
---------------------------------------------------------------------------
#configure create service internet
  service-port vlan 2882 gpon 0/3/7 ont 25 gemport 3 multi-service user-vlan 200 tag-transform translate inbound traffic-table index 14 outbound traffic-table index 17
---------------------------------------------------------------------------
#configure delete igmp
  btv
	  igmp user delete service-port 30876
---------------------------------------------------------------------------
#configure create igmp
  btv
	  igmp user add service-port 30876 no-auth
---------------------------------------------------------------------------
#configure create multicast vlan 110
  multicast-vlan 110
	  igmp multicast-vlan member service-port 30876 
---------------------------------------------------------------------------
#configure tag native vlan ke ethernet ont
  interface gpon 0/3
	  ont port native-vlan 7 25 eth 4 vlan 111
---------------------------------------------------------------------------
#configure line profile via cli
  display traffic table ip from-index 0
	display service-port port 0/3/7 ont 25
	display service-port 30876 
	service-port 30876 inbound traffic-table index 175 outbound traffic-table index 140
#inbound ==> upload
#outbound ==> Download
---------------------------------------------------------------------------
#config create vlan dan tagging vlan ke interface uplink	vlan 110 smart
	vlan name 110 MULTICAST
	vlan desc 110 description MULTICAST_USEETV
	port vlan 110 0/19 0
---------------------------------------------------------------------------













