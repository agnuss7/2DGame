extends "res://Classes/door_class.gd"

remote var statues_orbs=[]
var correct_orbs=[3,1,2]



func make_orbs():
	statues_orbs.clear()
	statues_orbs.append($'/root/Node2D/YSort/NilStatue'.current_orb)
	statues_orbs.append($'/root/Node2D/YSort/MinStatue'.current_orb)
	statues_orbs.append($'/root/Node2D/YSort/VimStatue'.current_orb)
	
func check_for_success():
	if(correct_orbs==statues_orbs):
		statues_orbs.clear()
		unlock()
		$'/root/Node2D/YSort/NilStatue'.set_done()
		$'/root/Node2D/YSort/MinStatue'.set_done()
		$'/root/Node2D/YSort/VimStatue'.set_done()

func _process(delta):
	check_for_success()
