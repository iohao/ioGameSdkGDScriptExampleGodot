# // generateTime 2025-05-02
# // https://github.com/iohao/ioGame

## Broadcast Listener. cn:广播监听[br]
## https://github.com/iohao/ioGame
class_name Listener
extends RefCounted

const Common = preload("../common.gd")

static var _int_value_1_32: int = IoGame.CmdKit.mapping_broadcast(65568, "IntValue method description")
static var _long_value_1_33: int = IoGame.CmdKit.mapping_broadcast(65569, "LongValue")
static var _bool_value_1_34: int = IoGame.CmdKit.mapping_broadcast(65570, "BoolValue")
static var _string_value_1_35: int = IoGame.CmdKit.mapping_broadcast(65571, "StringValue")
static var _user_message_1_36: int = IoGame.CmdKit.mapping_broadcast(65572, "UserMessage")
static var _int_value_list_1_37: int = IoGame.CmdKit.mapping_broadcast(65573, "IntValueList method description")
static var _long_value_list_1_38: int = IoGame.CmdKit.mapping_broadcast(65574, "LongValueList")
static var _bool_value_list_1_39: int = IoGame.CmdKit.mapping_broadcast(65575, "BoolValueList")
static var _string_value_list_1_40: int = IoGame.CmdKit.mapping_broadcast(65576, "StringValueList")
static var _user_message_list_1_41: int = IoGame.CmdKit.mapping_broadcast(65577, "UserMessageList")
static var _bullet_broadcast_1_42: int = IoGame.CmdKit.mapping_broadcast(65578, "trigger bullet broadcast; cn:触发子弹广播")
static var _empty_value_1_43: int = IoGame.CmdKit.mapping_broadcast(65579, "test Empty Value")


## IntValue method description[br]
##
## [br][b]@param callback:[/b] biz data description (returnType:  [code]int[/code])
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## Listener.listen_int_value(func(result: IoGame.ResponseResult):
##     # biz data description
##     var _value := result.get_int()
## )
## [/codeblock]
static func listen_int_value(callback: Callable) -> void:
	# biz data description
	IoGame.ListenCommand.of(_int_value_1_32, callback)


## LongValue[br]
##
## [br][b]@param callback:[/b] LongValue (returnType:  [code]int[/code])
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## Listener.listen_long_value(func(result: IoGame.ResponseResult):
##     # LongValue
##     var _value := result.get_long()
## )
## [/codeblock]
static func listen_long_value(callback: Callable) -> void:
	# LongValue
	IoGame.ListenCommand.of(_long_value_1_33, callback)


## BoolValue[br]
##
## [br][b]@param callback:[/b] BoolValue (returnType:  [code]bool[/code])
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## Listener.listen_bool_value(func(result: IoGame.ResponseResult):
##     # BoolValue
##     var _value := result.get_bool()
## )
## [/codeblock]
static func listen_bool_value(callback: Callable) -> void:
	# BoolValue
	IoGame.ListenCommand.of(_bool_value_1_34, callback)


## StringValue[br]
##
## [br][b]@param callback:[/b] StringValue (returnType:  [code]String[/code])
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## Listener.listen_string_value(func(result: IoGame.ResponseResult):
##     # StringValue
##     var _value := result.get_string()
## )
## [/codeblock]
static func listen_string_value(callback: Callable) -> void:
	# StringValue
	IoGame.ListenCommand.of(_string_value_1_35, callback)


## UserMessage[br]
##
## [br][b]@param callback:[/b] User (returnType:  [code]Common.UserMessage[/code])
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## Listener.listen_user_message(func(result: IoGame.ResponseResult):
##     # User
##     var _value := result.get_value(Common.UserMessage) as Common.UserMessage
## )
## [/codeblock]
static func listen_user_message(callback: Callable) -> void:
	# User
	IoGame.ListenCommand.of(_user_message_1_36, callback)


## IntValueList method description[br]
##
## [br][b]@param callback:[/b] biz id list (returnType: list of [code]int[/code])
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## Listener.listen_int_value_list(func(result: IoGame.ResponseResult):
##     # biz id list
##     var _value := result.list_int()
## )
## [/codeblock]
static func listen_int_value_list(callback: Callable) -> void:
	# biz id list
	IoGame.ListenCommand.of(_int_value_list_1_37, callback)


## LongValueList[br]
##
## [br][b]@param callback:[/b] LongValueList (returnType: list of [code]int[/code])
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## Listener.listen_long_value_list(func(result: IoGame.ResponseResult):
##     # LongValueList
##     var _value := result.list_long()
## )
## [/codeblock]
static func listen_long_value_list(callback: Callable) -> void:
	# LongValueList
	IoGame.ListenCommand.of(_long_value_list_1_38, callback)


## BoolValueList[br]
##
## [br][b]@param callback:[/b] BoolValueList (returnType: list of [code]bool[/code])
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## Listener.listen_bool_value_list(func(result: IoGame.ResponseResult):
##     # BoolValueList
##     var _value := result.list_bool()
## )
## [/codeblock]
static func listen_bool_value_list(callback: Callable) -> void:
	# BoolValueList
	IoGame.ListenCommand.of(_bool_value_list_1_39, callback)


## StringValueList[br]
##
## [br][b]@param callback:[/b] StringValueList (returnType: list of [code]String[/code])
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## Listener.listen_string_value_list(func(result: IoGame.ResponseResult):
##     # StringValueList
##     var _value := result.list_string()
## )
## [/codeblock]
static func listen_string_value_list(callback: Callable) -> void:
	# StringValueList
	IoGame.ListenCommand.of(_string_value_list_1_40, callback)


## UserMessageList[br]
##
## [br][b]@param callback:[/b] User (returnType: list of [code]Common.UserMessage[/code])
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## Listener.listen_user_message_list(func(result: IoGame.ResponseResult):
##     # User
##     var _value: Array = result.list_value(Common.UserMessage)
## )
## [/codeblock]
static func listen_user_message_list(callback: Callable) -> void:
	# User
	IoGame.ListenCommand.of(_user_message_list_1_41, callback)


## trigger bullet broadcast; cn:触发子弹广播[br]
##
## [br][b]@param callback:[/b] Bullet (returnType:  [code]Common.BulletMessage[/code])
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## Listener.listen_bullet_broadcast(func(result: IoGame.ResponseResult):
##     # Bullet
##     var _value := result.get_value(Common.BulletMessage) as Common.BulletMessage
## )
## [/codeblock]
static func listen_bullet_broadcast(callback: Callable) -> void:
	# Bullet
	IoGame.ListenCommand.of(_bullet_broadcast_1_42, callback)


## test Empty Value[br]
##
## [br][b]@param callback:[/b]  (returnType:  [code][/code])
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## Listener.listen_empty_value(func(result: IoGame.ResponseResult):
##     # broadcast notification
##     
## )
## [/codeblock]
static func listen_empty_value(callback: Callable) -> void:
	# 
	IoGame.ListenCommand.of(_empty_value_1_43, callback)


static func listener_ioGame() -> void:
	# all listener
	Listener.listen_int_value(func(result: IoGame.ResponseResult):
		var _merge_title := IoGame.CmdKit.to_string_merge(result.get_cmd_merge())
		var _title := IoGame.CmdKit.get_broadcast_title(result.get_cmd_merge())
		var _value := result.get_int()
		var _format := "[%s], [broadcast_title: %s], %s" % [_merge_title, _title, _value]
		IoGame.IoGameSetting.game_console.log(_format)
	)

	Listener.listen_long_value(func(result: IoGame.ResponseResult):
		var _merge_title := IoGame.CmdKit.to_string_merge(result.get_cmd_merge())
		var _title := IoGame.CmdKit.get_broadcast_title(result.get_cmd_merge())
		var _value := result.get_long()
		var _format := "[%s], [broadcast_title: %s], %s" % [_merge_title, _title, _value]
		IoGame.IoGameSetting.game_console.log(_format)
	)

	Listener.listen_bool_value(func(result: IoGame.ResponseResult):
		var _merge_title := IoGame.CmdKit.to_string_merge(result.get_cmd_merge())
		var _title := IoGame.CmdKit.get_broadcast_title(result.get_cmd_merge())
		var _value := result.get_bool()
		var _format := "[%s], [broadcast_title: %s], %s" % [_merge_title, _title, _value]
		IoGame.IoGameSetting.game_console.log(_format)
	)

	Listener.listen_string_value(func(result: IoGame.ResponseResult):
		var _merge_title := IoGame.CmdKit.to_string_merge(result.get_cmd_merge())
		var _title := IoGame.CmdKit.get_broadcast_title(result.get_cmd_merge())
		var _value := result.get_string()
		var _format := "[%s], [broadcast_title: %s], %s" % [_merge_title, _title, _value]
		IoGame.IoGameSetting.game_console.log(_format)
	)

	Listener.listen_user_message(func(result: IoGame.ResponseResult):
		var _merge_title := IoGame.CmdKit.to_string_merge(result.get_cmd_merge())
		var _title := IoGame.CmdKit.get_broadcast_title(result.get_cmd_merge())
		var _value := result.get_value(Common.UserMessage)
		var _format := "[%s], [broadcast_title: %s], %s" % [_merge_title, _title, _value]
		IoGame.IoGameSetting.game_console.log(_format)
	)

	Listener.listen_int_value_list(func(result: IoGame.ResponseResult):
		var _merge_title := IoGame.CmdKit.to_string_merge(result.get_cmd_merge())
		var _title := IoGame.CmdKit.get_broadcast_title(result.get_cmd_merge())
		var _value := result.list_int()
		var _format := "[%s], [broadcast_title: %s], %s" % [_merge_title, _title, _value]
		IoGame.IoGameSetting.game_console.log(_format)
	)

	Listener.listen_long_value_list(func(result: IoGame.ResponseResult):
		var _merge_title := IoGame.CmdKit.to_string_merge(result.get_cmd_merge())
		var _title := IoGame.CmdKit.get_broadcast_title(result.get_cmd_merge())
		var _value := result.list_long()
		var _format := "[%s], [broadcast_title: %s], %s" % [_merge_title, _title, _value]
		IoGame.IoGameSetting.game_console.log(_format)
	)

	Listener.listen_bool_value_list(func(result: IoGame.ResponseResult):
		var _merge_title := IoGame.CmdKit.to_string_merge(result.get_cmd_merge())
		var _title := IoGame.CmdKit.get_broadcast_title(result.get_cmd_merge())
		var _value := result.list_bool()
		var _format := "[%s], [broadcast_title: %s], %s" % [_merge_title, _title, _value]
		IoGame.IoGameSetting.game_console.log(_format)
	)

	Listener.listen_string_value_list(func(result: IoGame.ResponseResult):
		var _merge_title := IoGame.CmdKit.to_string_merge(result.get_cmd_merge())
		var _title := IoGame.CmdKit.get_broadcast_title(result.get_cmd_merge())
		var _value := result.list_string()
		var _format := "[%s], [broadcast_title: %s], %s" % [_merge_title, _title, _value]
		IoGame.IoGameSetting.game_console.log(_format)
	)

	Listener.listen_user_message_list(func(result: IoGame.ResponseResult):
		var _merge_title := IoGame.CmdKit.to_string_merge(result.get_cmd_merge())
		var _title := IoGame.CmdKit.get_broadcast_title(result.get_cmd_merge())
		var _value := result.list_value(Common.UserMessage)
		var _format := "[%s], [broadcast_title: %s], %s" % [_merge_title, _title, _value]
		IoGame.IoGameSetting.game_console.log(_format)
	)

	Listener.listen_bullet_broadcast(func(result: IoGame.ResponseResult):
		var _merge_title := IoGame.CmdKit.to_string_merge(result.get_cmd_merge())
		var _title := IoGame.CmdKit.get_broadcast_title(result.get_cmd_merge())
		var _value := result.get_value(Common.BulletMessage)
		var _format := "[%s], [broadcast_title: %s], %s" % [_merge_title, _title, _value]
		IoGame.IoGameSetting.game_console.log(_format)
	)

	Listener.listen_empty_value(func(result: IoGame.ResponseResult):
		var _merge_title := IoGame.CmdKit.to_string_merge(result.get_cmd_merge())
		var _title := IoGame.CmdKit.get_broadcast_title(result.get_cmd_merge())
		var _format := "[%s], [broadcast_title: %s]" % [_merge_title, _title]
		IoGame.IoGameSetting.game_console.log(_format)
	)

