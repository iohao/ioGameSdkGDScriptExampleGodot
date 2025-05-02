class_name MyNetConfig
extends RefCounted

static var _socket: MyNetChannel = MyNetChannel.new()
static var current_time_millis: int = 0

static func start_net():
	# biz code init
	GameCode.init()
	Listener.listener_ioGame()
	
	# --------- IoGameSetting ---------
	var setting := IoGame.IoGameSetting
	setting.enable_dev_mode = true
	setting.set_language(IoGame.IoGameLanguage.Us)
	# message callback. cn: 回调监听
	setting.listen_message_callback = MyListenMessageCallback.new()
	# set socket. cn: 设置网络连接
	setting.net_channel = _socket
	
	socket_init()
	setting.start_net()


static func poll():
	_socket.poll()

const Common = preload("res://gen/common.gd")

static func socket_init():
	_socket.on_open = func():
		var verify_message := Common.LoginVerifyMessage.new()
		verify_message.set_jwt("1")
		
		SdkAction.of_login_verify(verify_message, func(result: IoGame.ResponseResult):
				var value := result.get_value(Common.UserMessage) as Common.UserMessage
				print("user: ", value)
		)


static var _heartbeat_message_bytes := IoGame.Proto.ExternalMessage.new().to_bytes()
static var _heartbeat_counter: int = 1

static func send_idle() -> void:
	_heartbeat_counter += 1
	#print("-------- ..HeartbeatMessage {%s}" % [_heartbeat_counter])
	IoGame.IoGameSetting.net_channel.write_and_flush_byte(_heartbeat_message_bytes)


class MyListenMessageCallback extends IoGame.ListenMessageCallback:
	func on_idle_callback(message: Proto.ExternalMessage):
		var data_bytes := message.get_data()
		var long_value := IoGame.Proto.LongValue.new()
		long_value.from_bytes(data_bytes)
		# Synchronize the time of each heartbeat with that of the server.
		# cn: 每次心跳与服务器的时间同步
		MyNetConfig.current_time_millis = long_value.get_value()


class MyNetChannel extends IoGame.SimpleNetChannel:
	var _last_state: WebSocketPeer.State = WebSocketPeer.State.STATE_CLOSED
	var _socket: WebSocketPeer = WebSocketPeer.new()
	var _url: String = "ws://127.0.0.1:10100/websocket"

	var on_open: Callable = func():
		print("on_open")
	
	var on_connecting: Callable = func():
		print("on_connecting")

	var on_connect_error: Callable = func(error: int):
		print("on_connect_error:", error)

	var on_closing: Callable = func():
		print("on_closing")

	var on_closed: Callable = func():
		print("on_closed")

	func prepare() -> void:
		if _url == null or _url.is_empty():
			_url = IoGame.IoGameSetting.url

		var error: int = _socket.connect_to_url(_url)

		if error != 0:
			on_connect_error.call(error)
			return
		
		_last_state = _socket.get_ready_state()


	func write_and_flush_byte(bytes: PackedByteArray) -> void:
		_socket.send(bytes)


	func poll() -> void:
		if _socket.get_ready_state() != WebSocketPeer.State.STATE_CLOSED:
			_socket.poll()
		
		while _socket.get_available_packet_count() > 0:
			var packet := _socket.get_packet()
			var message := IoGame.Proto.ExternalMessage.new()
			message.from_bytes(packet)
			self.accept_message(message)
		
		var state: WebSocketPeer.State = _socket.get_ready_state()
		if _last_state == state:
			return
		
		_last_state = state

		match state:
			WebSocketPeer.State.STATE_OPEN:
				on_open.call()
			WebSocketPeer.State.STATE_CONNECTING:
				on_connecting.call()
			WebSocketPeer.State.STATE_CLOSING:
				on_closing.call()
			WebSocketPeer.State.STATE_CLOSED:
				on_closed.call()
			_:
				printerr("Socket Unknown Status.")
