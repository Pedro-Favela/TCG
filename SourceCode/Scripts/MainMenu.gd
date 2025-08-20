extends Control


func _ready():
	$HTTPRequest.request_completed.connect(_on_request_completed)
	$HTTPRequest.request("http://worldtimeapi.org/api/timezone/America/Sao_Paulo")

func _on_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	#print(json["datetime"])
