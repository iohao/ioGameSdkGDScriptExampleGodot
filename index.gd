extends Node2D

@onready var trigger_broadcast_btn: Button = get_node("OnTriggerBroadcast")
@onready var test_error_btn: Button = get_node("OnTestError")

@onready var int_btn: Button = get_node("Single/OnIntValue")
@onready var long_btn: Button = get_node("Single/OnLongValue")
@onready var bool_btn: Button = get_node("Single/OnBoolValue")
@onready var string_btn: Button = get_node("Single/OnStringValue")
@onready var value_btn: Button = get_node("Single/OnValueObject")

@onready var int_list_btn: Button = get_node("List/OnListInt")
@onready var long_list_btn: Button = get_node("List/OnListLong")
@onready var bool_list_btn: Button = get_node("List/OnListBool")
@onready var string_list_btn: Button = get_node("List/OnListString")
@onready var value_list_btn: Button = get_node("List/OnListValue")

const Common = preload("res://gen/common.gd")
var open_net: bool = true

func _ready() -> void:
	test_error_btn.pressed.connect(test_error_func)
	trigger_broadcast_btn.pressed.connect(trigger_broadcast_func)
	
	int_btn.pressed.connect(int_func)
	long_btn.pressed.connect(long_func)
	bool_btn.pressed.connect(bool_func)
	string_btn.pressed.connect(string_func)
	value_btn.pressed.connect(value_func)
	
	int_list_btn.pressed.connect(int_list_func)
	long_list_btn.pressed.connect(long_list_func)
	bool_list_btn.pressed.connect(bool_list_func)
	string_list_btn.pressed.connect(string_list_func)
	value_list_btn.pressed.connect(value_list_func)
	
	if open_net:
		MyNetConfig.start_net()
		listene()
		start_idle_timer()
	
	pass


func _process(_delta: float) -> void:
	MyNetConfig.poll()


func start_idle_timer() -> void:
	var timer: Timer = Timer.new()
	# seconds
	timer.wait_time = 8.0
	timer.one_shot = false
	timer.timeout.connect(MyNetConfig.send_idle)
	add_child(timer)
	timer.start()


func trigger_broadcast_func():
	print("-------- OnTriggerBroadcast --------")
	SdkAction.of_trigger_broadcast()


var _test_error_value: int = 1

func test_error_func():
	print("-------- OnTestError --------")
	if _test_error_value > 2:
		_test_error_value = 1
	
	_test_error_value += 1
	var value := _test_error_value
	
	# code style: callback.
	SdkAction.of_test_error(value, func(result: IoGame.ResponseResult):
		var _value := result.get_int()
		result.log(_value)
	).on_error(func(result: IoGame.ResponseResult):
		# error
		result.log(result.get_error_info())
	)
	
	# code style: async await.
	var _result := await SdkAction.of_await_test_error(value)
	
	if _result.has_error():
		# error
		_result.log(_result.get_error_info())
	else:
		_result.log(_result.get_int())


func int_func():
	print("-------- OnIntValue --------")
	var value: int = 1
	
	# code style: callback.
	SdkAction.of_int_value(value, func(result: IoGame.ResponseResult):
		result.log(result.get_int())
	).on_error(func(result: IoGame.ResponseResult):
		var error_code := result.get_response_status()
		print("error_code: ", error_code)
		print("error_info: ", result.get_error_info())
	)
	
	# code style: async await.
	var _result := await SdkAction.of_await_int_value(value)
	if _result.success():
		_result.log(_result.get_int())
	else:
		var error_code := _result.get_response_status()
		print("error_code: ", error_code)
		print("error_info: ", _result.get_error_info())
		
 
func int_list_func():
	print("-------- OnListInt --------")
	var value_list: Array[int] = [1, 2]
	
	# code style: callback.
	SdkAction.of_list_int(value_list, func(result: IoGame.ResponseResult):
		result.log(result.list_int())
	)
	
	# code style: async await.
	var _result := await SdkAction.of_await_list_int(value_list)
	_result.log(_result.list_int())
	

func long_func():
	print("-------- OnLongValue --------")
	var value := (1 << 63) - 1
	
	# code style: callback.
	SdkAction.of_long_value(value, func(result: IoGame.ResponseResult):
		result.log(result.get_long())
	)
	
	# code style: async await.
	var _result := await SdkAction.of_await_long_value(value)
	_result.log(_result.get_long())
	

func long_list_func():
	print("-------- OnListLong --------")
	var value_max := (1 << 63) - 1
	var value_list: Array[int] = [value_max, value_max - 1]
	
	# code style: callback.
	SdkAction.of_list_long(value_list, func(result: IoGame.ResponseResult):
		result.log(result.list_long())
	)
	
	# code style: async await.
	var _result := await SdkAction.of_await_list_long(value_list)
	_result.log(_result.list_long())


func bool_func():
	print("-------- OnBoolValue --------")
	var value := true
	
	# code style: callback.
	SdkAction.of_bool_value(value, func(result: IoGame.ResponseResult):
		result.log(result.get_bool())
	)
	
	# code style: async await.
	var _result := await SdkAction.of_await_bool_value(value)
	_result.log(_result.get_bool())


func bool_list_func():
	print("-------- OnListBool --------")
	var value_list: Array[bool] = [true, false]
	
	# code style: callback.
	SdkAction.of_list_bool(value_list, func(result: IoGame.ResponseResult):
		result.log(result.list_bool())
	)
	
	# code style: async await.
	var _result := await SdkAction.of_await_list_bool(value_list)
	_result.log(_result.list_bool())


func string_func():
	print("-------- OnStringValue --------")
	var value := "ioGame "
	
	# code style: callback.
	SdkAction.of_string_value(value, func(result: IoGame.ResponseResult):
		result.log(result.get_string())
	)
	
	# code style: async await.
	var _result := await SdkAction.of_await_string_value(value)
	_result.log(_result.get_string())


func string_list_func():
	print("-------- OnListString --------")
	var value_list: Array[String] = ["ioGame-1-", "ioGame-2-"]
	
	# code style: callback.
	SdkAction.of_list_string(value_list, func(result: IoGame.ResponseResult):
		result.log(result.list_string())
	)
	
	# code style: async await.
	var _result := await SdkAction.of_await_list_string(value_list)
	_result.log(_result.list_string())


func listene():
	Listener.listen_int_value(func(result: IoGame.ResponseResult):
		result.log(result.get_int())
	)


func value_func():
	print("-------- OnValueObject --------")
	var verify_message := Common.LoginVerifyMessage.new()
	verify_message.set_jwt("1")
	
	# code style: callback.
	SdkAction.of_value(verify_message, func(result: IoGame.ResponseResult):
		var _value := result.get_value(Common.UserMessage) as Common.UserMessage
		result.log(_value)
	)
	
	# code style: async await.
	var _result := await SdkAction.of_await_value(verify_message)
	var value := _result.get_value(Common.UserMessage) as Common.UserMessage
	_result.log(value)


func value_list_func():
	print("-------- OnListValue --------")
	var verify_message := Common.LoginVerifyMessage.new()
	verify_message.set_jwt("1")
	
	var verify_message2 := Common.LoginVerifyMessage.new()
	verify_message2.set_jwt("2")
	
	# code style: callback.
	SdkAction.of_list_value([verify_message, verify_message2], func(result: IoGame.ResponseResult):
		var _value_list: Array = result.list_value(Common.UserMessage)
		result.log(_value_list)
	)
	
	# code style: async await.
	var _result := await SdkAction.of_await_list_value([verify_message, verify_message2])
	var value_list: Array = _result.list_value(Common.UserMessage)
	_result.log(value_list)


func hello_callback():
	var _name := "Michael Jackson"
	# code style: callback. cn: 编码风格，回调
	MyAction.of_hello(_name, func(result: IoGame.ResponseResult):
		result.log(result.get_string())
	)


func hello_await():
	var _name := "Michael Jackson"
	# code style: async await. cn: 编码风格，await
	var result := await MyAction.of_await_hello(_name)
	result.log(result.get_string())


func login_verify_await():
	var login_verify := Common.LoginVerifyMessage.new()
	login_verify.set_jwt("10")
	
	var result := await MyAction.of_await_login_verify(login_verify)
	# code style: async await. cn: 编码风格：async await 风格
	if result.success():
		var _value := result.get_value(Common.UserMessage) as Common.UserMessage
		result.log(_value)


func login_verify_callback():
	var login_verify := Common.LoginVerifyMessage.new()
	login_verify.set_jwt("10")

	# code style: callback. cn: 编码风格：回调风格
	MyAction.of_login_verify(login_verify, func(result: IoGame.ResponseResult):
		# 我的用户信息。My UserMessage
		var _value := result.get_value(Common.UserMessage) as Common.UserMessage
		result.log(_value)
	)
