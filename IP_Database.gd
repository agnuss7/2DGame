extends Node

var lan_ip
var broadcast_port=6868
var broadcast_network
var broadcast_timer=0

var is_hosting=false
var is_joined=false


func _ready():
	broadcast_network=PacketPeerUDP.new()
	

func start_broadcast():
	broadcast_network.set_broadcast_enabled(true)
	broadcast_network.set_dest_address("255.255.255.255",broadcast_port)

func end_broadcast():
	broadcast_network.set_broadcast_enabled(false)

func broadcast_ip():
	if broadcast_timer<=0:
		broadcast_timer=3
		var pac=(IP.get_local_addresses()[0]).to_ascii()
		broadcast_network.put_packet(pac)
	

func start_listen():
	broadcast_network.listen(broadcast_port)

func end_listen():
	broadcast_network.close()

func listening():
	if broadcast_network.get_available_packet_count()>0:
		var bytes=broadcast_network.get_packet()
		lan_ip=bytes.get_string_from_ascii()
		print(lan_ip)



func _process(delta):
	if is_hosting:
		broadcast_timer-=delta
		broadcast_ip()
	if is_joined:
		listening()
