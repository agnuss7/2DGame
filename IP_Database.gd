extends Node

var lan_ip
var broadcast_port=6868
var broadcast_network
var broadcast_timer=0

var listen_timer=0

var is_hosting=false
var is_joined=false
var is_joining=false

var host_nick_name

func _ready():
	broadcast_network=PacketPeerUDP.new()
	
func start_broadcast():
	broadcast_network.set_broadcast_enabled(true)
	broadcast_network.set_dest_address("255.255.255.255",broadcast_port)

func end_broadcast():
	var pac=("_end_of_broadcast_").to_ascii()
	broadcast_network.put_packet(pac)
	broadcast_network.set_broadcast_enabled(false)

func broadcast_ip():
	if broadcast_timer<=0:
		broadcast_timer=2
		var pac=(NeetWork.player_info.nick_name).to_ascii()
		broadcast_network.put_packet(pac)
	

func start_listen():
	broadcast_network.listen(broadcast_port)

func end_listen():
	broadcast_network.close()

func listening():
	if broadcast_network.get_available_packet_count()>0:
		var bytes=broadcast_network.get_packet()
		host_nick_name=bytes.get_string_from_ascii()
		lan_ip=broadcast_network.get_packet_ip()
	else:
		host_nick_name="_end_of_broadcast_"
	print (host_nick_name)


func _process(delta):
	if is_hosting:
		broadcast_timer-=delta
		broadcast_ip()
	if is_joining:
		listen_timer+=delta
		if listen_timer>=2:
			listen_timer=0
			listening()
