Karakteristik jaringan yang baik adalah yang dapat pulih dengan cepat setelah mengalami kendala (resiliency). Spanning Tree Protocol adalah protocol yang digunakan pada layer 2 untuk mencegah terjadinya looping pada jaringan switching. jika jaringan terjadi looping maka akan menyebabkan broadcast storm, duplikasi frame, dan jaringan menjadi tidak stabil.

### Spanning Tree Operation
- Menentukan root bridge.
- Menghitung jarak terpendek menujuk ke root bridge untuk menentukan root port.
- Memilih designated port di setiap segment.
- Block port yang bukan root port dan designated port.

### Type Spanning-Tree Protocol
| *Protocol*  | *standart*    | *Resource Need* | *Convergence* | *Tree Calculation* | *Trunking*   |
| ----------- | ------------- | --------------- | ------------- | ------------------ | ------------ |
| Legacy STP  | 802.1D        | Low             | Slow          | All VLANs          |  N/A         |
| PSVT+       | Cisco         | High            | Slow          | Per VLANs          |  802.1Q, ISL |
| RSTP        | 802.1W        | Medium          | Fast          | All VLANs          |  N/A         |
| Rapid PVST+ | Cisco         | Very High       | Fast          | Per VLANs          |  802.1Q, ISL |
| MSTP        | 802.1S, Cisco | Medium or High  | Fast          | Per Instance       |  802.1Q, ISL |

### Role Switch
| *Role Switch*   | *Fungtion*                                                                                |  
| --------------- | ----------------------------------------------------------------------------------------- |
| Root Bridge     | switch pusat dari jaringan, ditentukan dengan Bridge-ID terkecil, default Bridge-ID 32768 |
| Non-Root Bridge | switch selain root bridge                                                                 |

### Role Port
|*Protocol*        | *Role Port*      | *Fungtion*                                                                                                             |
|----------------- | ---------------- | ---------------------------------------------------------------------------------------------------------------------- |
| Legacy STP       | Root Port        | port yang mengarah ke root bridge berdasarkan cost terkecil, status port green                                         |
| Legacy/Rapid STP | Designated Port  | port yang menjauhi root bridge karena cost lebih besar, status port green                                              |
| Rapid STP        | Alternate Port   | port yang menjadi jalur aternatif menuju root bridge, tapi port di blocking untuk mencegah looping, status port orange |
| Legacy/Rapid STP | Blocking Port    |                                                                                                                        |
| Rapid STP        | Backup           |                                                                                                                        |


### Port State
|*Protocol*        | *State*     | *Fungtion*                                                         |
|----------------- | -------     | ------------------------------------------------------------------ |
| Legacy STP       | Disable     | port administratively down                                         |
| Legacy STP       | Listening   | menunggu dan mengirimkan BPDU                                      |
| Legacy STP       | Learning    | menunggu update BPDU lainnya dan melakukan perbandingan Bridge-ID  |
| Legacy STP       | Forwarding  | port sudah dapat digunakan untuk forward traffic                   |
| Legacy STP       | Blocking    | port di blok untuk mencegah looping                                |
| Legacy/Rapid STP | Learning    | menunggu update BPDU lainnya dan melakukan perbandingan Bridge-ID  |
| Legacy/Rapid STP | Forwarding  | port sudah dapat digunakan untuk forward traffic                   |
| Legacy/Rapid STP | Blocking    | port di blok untuk mencegah looping                                |


## Link Cost
menentukan link cost
|Link	     | Cost (802.1D) | Cost (802.1t) |
|--------- | ------------- | ------------- |
|10 Gbps	 | 2             |2000           |
|2 Gbps    | 3             |10000          |
|1 Gbps	   | 4             |20000          |
|100 Mbps	 | 19	           |200000         |
|16 Mbps	 | 62            |1250000        |
|10 Mbps	 | 100	         |2000000        |
|4 Mbps    |	250	         |5000000        |

