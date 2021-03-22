extends "res://Classes/level_class.gd"


func _ready():
	places=[Vector2(0,0),Vector2(20,0),Vector2(40,0)]


remote func sync_level(var id):
	.sync_level(id)
	if get_tree().is_network_server():
		rpc_id(id,'sync_in_progress',$'YSort/Bookshelf'.is_done,$'YSort/Poster'.is_operable,
		$'YSort/MinStatue'.clutching,
		$'YSort/NilStatue'.current_orb,
		$'YSort/MinStatue'.current_orb,
		$'YSort/VimStatue'.current_orb,
		$'YSort/NilStatue'.is_done,
		$'YSort/MinStatue'.is_done,
		$'YSort/VimStatue'.is_done,
		$'YSort/Clock'.is_done,
		$'YSort/Cabinet'.is_done,
		$'YSort/Area2D'.done,
		$'YSort/Door'.is_open,
		$'YSort/Pipes'.is_done)
	
remote func sync_in_progress(var bookshelf_done,
var poster_operable,
var Min_clutch,
var nil_orb, var min_orb, var vim_orb,
var nil_done, var min_done, var vim_done,
var clock_done, var slider_done,
var area_done, var door_open,
var pipes_done):
	$'YSort/Bookshelf'.is_done=bookshelf_done
	if bookshelf_done:
		$'YSort/Bookshelf'.has_moved()
	$'YSort/Poster'.is_operable=poster_operable
	$'YSort/MinStatue'.clutching=Min_clutch
	$'YSort/NilStatue'.current_orb=nil_orb
	$'YSort/MinStatue'.current_orb=min_orb
	$'YSort/VimStatue'.current_orb=vim_orb
	$'YSort/NilStatue'.is_done=nil_done
	$'YSort/MinStatue'.is_done=min_done
	$'YSort/VimStatue'.is_done=vim_done
	$'YSort/Clock'.is_done=clock_done
	$'YSort/Cabinet'.is_done=slider_done
	$'YSort/Area2D'.done=area_done
	$'YSort/Door'.is_open=door_open
	$'YSort/Pipes'.is_done=pipes_done
