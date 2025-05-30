# Purpose of DHCP
Dynamic Host Configuration Protocols (DHCP), digunakan untuk mengizinkan host mempelajari network configuration secara otomatis. aspek network configuration mencakup konfigurasi IP address, subnet mask, default gateway, DNS server. DHCP umumnya diterapkan pada perangkat client seperti laptop, smartphone, game console, dll. DHCP sangat diperlukan pada jaringan besar dan biasanya menggunakan server windows/linux untuk mendistribusikannya. Pada jaringan yang kecil bisa menggunakan router sebagai DHCP server untuk host di LAN.  
DHCP menggunakan protocol UDP untuk meneruskan paket karena ketika client mengirim paket masih belum memiliki IP address dan paket dikirimkan secara broadcast, protocol UDP juga lebih ringan dan cepat karena tidak memerlukan 3-way handshake, error checking dan tidak perlu membuat koneksi terlebih dahulu. Dalam DHCP menggunakan port 67 dan port 68 untuk mengtransmisikan paket DHCP. Port 67 digunakan untuk DHCP client seperti message Discover dan Request, sedangkan port 68 untuk DHCP server seperti message Offer dan Ack.

# DHCP Message and Procces

| DHCP Message | Direction       | Transmission Method     |
|--------------|-----------------|-------------------------|
| Discover     | Client → Server | Broadcast               |
| Offer        | Server → Client | Broadcast or Unicast    |
| Request      | Client → Server | Broadcast               |
| ACK          | Server → Client | Broadcast or Unicast    |
| Release      | Client → Server | Unicast                 |

- **DHCP discover** > merupakan pesan broadcast yang dikirim oleh client untuk mencari DHCP server untuk mendapatkan IP address.
  ```bash
  Frame 29: 406 bytes on wire (3248 bits), 406 bytes captured (3248 bits) on interface -, id 0
  Ethernet II, Src: Private_66:68:02 (00:50:79:66:68:02), Dst: Broadcast (ff:ff:ff:ff:ff:ff)
  Internet Protocol Version 4, Src: 0.0.0.0, Dst: 255.255.255.255
  User Datagram Protocol, Src Port: 68, Dst Port: 67
  Dynamic Host Configuration Protocol (Discover)
    Message type: Boot Request (1)
    Hardware type: Ethernet (0x01)
    Hardware address length: 6
    Hops: 0
    Transaction ID: 0x80cc0245
    Seconds elapsed: 0
    Bootp flags: 0x0000 (Unicast)
    Client IP address: 0.0.0.0
    Your (client) IP address: 0.0.0.0
    Next server IP address: 0.0.0.0
    Relay agent IP address: 0.0.0.0
    Client MAC address: Private_66:68:02 (00:50:79:66:68:02)
    Client hardware address padding: 00000000000000000000
    Server host name not given
    Boot file name not given
    Magic cookie: DHCP
    Option: (53) DHCP Message Type (Discover)
    Option: (12) Host Name
    Option: (61) Client identifier
    Option: (255) End
    Padding: 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
  ```

- **DHCP offer** > pesan balasan dari server ke client untuk menawarkan IP address yang tersedia di server, mencakup IP address, subnet mask, IP gateway, DNS.
  ```bash
  Frame 31: 347 bytes on wire (2776 bits), 347 bytes captured (2776 bits) on interface -, id 0
  Ethernet II, Src: ca:01:50:d8:00:08 (ca:01:50:d8:00:08), Dst: Private_66:68:02 (00:50:79:66:68:02)
  Internet Protocol Version 4, Src: 10.10.1.1, Dst: 10.10.1.11
  User Datagram Protocol, Src Port: 67, Dst Port: 68
  Dynamic Host Configuration Protocol (Offer)
    Message type: Boot Reply (2)
    Hardware type: Ethernet (0x01)
    Hardware address length: 6
    Hops: 0
    Transaction ID: 0x80cc0245
    Seconds elapsed: 0
    Bootp flags: 0x0000 (Unicast)
    Client IP address: 0.0.0.0
    Your (client) IP address: 10.10.1.11
    Next server IP address: 10.10.1.1
    Relay agent IP address: 0.0.0.0
    Client MAC address: Private_66:68:02 (00:50:79:66:68:02)
    Client hardware address padding: 00000000000000000000
    Server host name not given
    Boot file name not given
    Magic cookie: DHCP
    Option: (53) DHCP Message Type (Offer)
    Option: (54) DHCP Server Identifier (10.10.1.1)
    Option: (51) IP Address Lease Time
    Option: (58) Renewal Time Value
    Option: (59) Rebinding Time Value
    Option: (1) Subnet Mask (255.255.255.0)
        Length: 4
        Subnet Mask: 255.255.255.0
    Option: (6) Domain Name Server
        Length: 4
        Domain Name Server: 8.8.8.8
    Option: (15) Domain Name
    Option: (3) Router
    Option: (255) End
  ```

- **DHCP request** > setelah mendapatkan offer message, client akan memberi respon kepada DHCP server untuk memberi tahu bahwa client ingin menggunakan alamat IP yang telah ditawarkan. namun karena mungkin akan ada beberapa DHCP server yang mengirimkan DHCP offer ke client, jadi client harus memberitahu server mana yang menerima offer nya, biasanya offer yang pertama yang akan diterima client.
  ```bash
  Frame 33: 406 bytes on wire (3248 bits), 406 bytes captured (3248 bits) on interface -, id 0
  Ethernet II, Src: Private_66:68:02 (00:50:79:66:68:02), Dst: ca:01:50:d8:00:08 (ca:01:50:d8:00:08)
  Internet Protocol Version 4, Src: 0.0.0.0, Dst: 255.255.255.255
  User Datagram Protocol, Src Port: 68, Dst Port: 67
  Dynamic Host Configuration Protocol (Request)
    Message type: Boot Request (1)
    Hardware type: Ethernet (0x01)
    Hardware address length: 6
    Hops: 0
    Transaction ID: 0x80cc0245
    Seconds elapsed: 0
    Bootp flags: 0x0000 (Unicast)
    Client IP address: 10.10.1.11
    Your (client) IP address: 0.0.0.0
    Next server IP address: 0.0.0.0
    Relay agent IP address: 0.0.0.0
    Client MAC address: Private_66:68:02 (00:50:79:66:68:02)
    Client hardware address padding: 00000000000000000000
    Server host name not given
    Boot file name not given
    Magic cookie: DHCP
    Option: (53) DHCP Message Type (Request)
    Option: (54) DHCP Server Identifier (10.10.1.1)
        Length: 4
        DHCP Server Identifier: 10.10.1.1
    Option: (50) Requested IP Address (10.10.1.11)
        Length: 4
        Requested IP Address: 10.10.1.11
    Option: (61) Client identifier
    Option: (12) Host Name
    Option: (55) Parameter Request List
    Option: (255) End
    Padding: 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
	```

- **DHCP ack** > pesan dikirim oleh DHCP server untuk memberikan informasi bahwa IP address yang di request oleh client bisa digunakan, setelah client menerima pesan tersebut, network configuration seperti IP address dll akan dikonfigurasi secara otomatis pada network interface.
  ```bash
  Frame 34: 347 bytes on wire (2776 bits), 347 bytes captured (2776 bits) on interface -, id 0
  Ethernet II, Src: ca:01:50:d8:00:08 (ca:01:50:d8:00:08), Dst: Private_66:68:02 (00:50:79:66:68:02)
  Internet Protocol Version 4, Src: 10.10.1.1, Dst: 10.10.1.11
  User Datagram Protocol, Src Port: 67, Dst Port: 68
  Dynamic Host Configuration Protocol (ACK)
    Message type: Boot Reply (2)
    Hardware type: Ethernet (0x01)
    Hardware address length: 6
    Hops: 0
    Transaction ID: 0x80cc0245
    Seconds elapsed: 0
    Bootp flags: 0x0000 (Unicast)
    Client IP address: 10.10.1.11
    Your (client) IP address: 10.10.1.11
    Next server IP address: 10.10.1.1
    Relay agent IP address: 0.0.0.0
    Client MAC address: Private_66:68:02 (00:50:79:66:68:02)
    Client hardware address padding: 00000000000000000000
    Server host name not given
    Boot file name not given
    Magic cookie: DHCP
    Option: (53) DHCP Message Type (ACK)
    Option: (54) DHCP Server Identifier (10.10.1.1)
        Length: 4
        DHCP Server Identifier: 10.10.1.1
    Option: (51) IP Address Lease Time
    Option: (58) Renewal Time Value
    Option: (59) Rebinding Time Value
    Option: (1) Subnet Mask (255.255.255.0)
        Length: 4
        Subnet Mask: 255.255.255.0
    Option: (6) Domain Name Server
        Length: 4
        Domain Name Server: 8.8.8.8
    Option: (15) Domain Name
    Option: (3) Router
    Option: (255) End
  ```
  
- **DHCP release** > melepaskan konfigurasi IP address yang sebelumnya diberikan oleh DHCP server.
  ```bash
  Frame 13: 406 bytes on wire (3248 bits), 406 bytes captured (3248 bits) on interface -, id 0
  Ethernet II, Src: Private_66:68:02 (00:50:79:66:68:02), Dst: ca:01:50:d8:00:08 (ca:01:50:d8:00:08)
  Internet Protocol Version 4, Src: 10.10.1.11, Dst: 10.10.1.1
  User Datagram Protocol, Src Port: 68, Dst Port: 67
  Dynamic Host Configuration Protocol (Release)
    Message type: Boot Request (1)
    Hardware type: Ethernet (0x01)
    Hardware address length: 6
    Hops: 0
    Transaction ID: 0x00000000
    Seconds elapsed: 32849
    Bootp flags: 0x0000 (Unicast)
    Client IP address: 10.10.1.11
    Your (client) IP address: 0.0.0.0
    Next server IP address: 0.0.0.0
    Relay agent IP address: 0.0.0.0
    Client MAC address: Private_66:68:02 (00:50:79:66:68:02)
    Client hardware address padding: 00000000000000000000
    Server host name not given
    Boot file name not given
    Magic cookie: DHCP
    Option: (53) DHCP Message Type (Release)
    Option: (55) Parameter Request List
    Option: (54) DHCP Server Identifier (10.10.1.1)
    Option: (50) Requested IP Address (10.10.1.11)
    Option: (12) Host Name
    Option: (61) Client identifier
    Option: (255) End
    Padding: 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
  ```

# DHCP Server Configuration
Berikut ini basic configuration DHCP server pada router cisco, 
```bash
Router# ip dhcp excluded-address (low address) (high address)  
Router# ip dhcp pool (pool name)
Router# network (ip address) {/prefix-length | subnet-mask}
Router# dns-server (dns server)
Router# domain-name (domain-name)
Router# default-router (ip address)
Router# lease {days hours minutes | infinite}  

> validate
Router> show ip dhcp binding
Router> show ip dhcp pool
```

# DHCP Relay 
fitur yang dapat meneruskan paket DHCP discover dari client ke DHCP server. situasi ini biasanya diterapkan pada jaringan berskala besar dengan menempatkan DHCP server secara terpusat, agar pendistribusian IP address dapat mencakup banyak subnet hanya dengan 1 server. cara kerja DHCP relay yaitu sebagai berikut:  
- sebuah client mengirim paket DHCP discover menggunakan metode transmisi broadcast untuk menemukan DHCP server.
- paket broadcast yang diterima oleh router yang memiliki fitur DHCP relay akan meneruskan paket tersebut ke DHCP server dengan metode transmisi unicast.
- setelah paket DHCP dicover diterima oleh DHCP server maka server akan mengirim pesan DHCP Offer kepada client.
- maka terbentuk proses DHCP hingga client menerima network configuration yang dibutuhkan.

## DHCP relay configuration
configure pada interface router yang mengarah ke client
```bash
Router# interface g0/0
Router# ip helper-address (ip address)

> validate
Router> show ip interface g0/0
```

# DHCP Snooping
keamanan layer 2 pada switch cisco untuk mencegah serangan DHCP snooping dan rogue DHCP server, fitur ini berjalan dengan cara memfilter DHCP message yang masuk dan hanya mengizinkan DHCP server terpercaya saja yang dapat merespon client. 



# DHCP Client Configuration
configure router sebagai DHCP client jarang terjadi karena perangkat jaringan di konfigurasi secara static, khusus perangkat seperti router dan server biasanya di konfigurasi secara manual. Namun tetap perlu diketahui  
interface g0/0
ip address dhcp

validate
show ip interface g0/0

# InterVLAN DHCP
metode untuk mengalokasikan IP address dari DHCP server ke client dengan VLAN tertentu, DHCP server dapat melayani banyak VLAN, sehingga client bisa mendapatkan IP address sesuai dengan VLAN yang digunakan. hal ini juga memungkinkan client dengan VLAN yang berbeda dapat berkomunikasi satu sama lain. 











