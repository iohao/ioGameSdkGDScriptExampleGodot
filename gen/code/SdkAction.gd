# // generateTime 2025-05-02
# // https://github.com/iohao/ioGame

## My SdkAction[br]
## https://github.com/iohao/ioGame
class_name SdkAction
extends RefCounted

const Common = preload("../common.gd")

static var _login_verify_1_0: int = IoGame.CmdKit.mapping_request(65536, "user login")
static var _trigger_broadcast_1_1: int = IoGame.CmdKit.mapping_request(65537, "test broadcast")
static var _int_value_1_2: int = IoGame.CmdKit.mapping_request(65538, "test int")
static var _long_value_1_3: int = IoGame.CmdKit.mapping_request(65539, "test long")
static var _bool_value_1_4: int = IoGame.CmdKit.mapping_request(65540, "test boolean")
static var _string_value_1_5: int = IoGame.CmdKit.mapping_request(65541, "test String")
static var _value_1_6: int = IoGame.CmdKit.mapping_request(65542, "test Object；测试单个对象的接收与响应。")
static var _list_int_1_12: int = IoGame.CmdKit.mapping_request(65548, "test int list")
static var _list_long_1_13: int = IoGame.CmdKit.mapping_request(65549, "test Long list")
static var _list_bool_1_14: int = IoGame.CmdKit.mapping_request(65550, "test Boolean list")
static var _list_string_1_15: int = IoGame.CmdKit.mapping_request(65551, "test String list")
static var _list_value_1_16: int = IoGame.CmdKit.mapping_request(65552, "test Object list")
static var _test_error_1_20: int = IoGame.CmdKit.mapping_request(65556, "test error code")
static var _no_param_1_21: int = IoGame.CmdKit.mapping_request(65557, "noParam method test. 没有参数的方法测试")
static var _no_return_1_22: int = IoGame.CmdKit.mapping_request(65558, "noReturn method test. 没有返回值的方法测试")
static var _bullet_message_1_23: int = IoGame.CmdKit.mapping_request(65559, "")

## user login[br]
##
## [br][b]@param verify_message:[/b] loginVerify
## [br][b]@param callback:[/b] User info (returnType: [code] Common.UserMessage[/code])
## [br][b]@return[/b] [code]IoGame.RequestCommand[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## # loginVerify
## var verify_message: Common.LoginVerifyMessage = ...
##
## SdkAction.of_login_verify(verify_message, func(result: IoGame.ResponseResult):
##     # User info
##     var _value := result.get_value(Common.UserMessage) as Common.UserMessage
## ).on_error(func(result: IoGame.ResponseResult):
##     var error_code := result.get_response_status()
##     print("error_code: ", error_code)
##     print("error_info: ", result.get_error_info())
## )
## [/codeblock]
static func of_login_verify(verify_message: Common.LoginVerifyMessage, callback: Callable) -> IoGame.RequestCommand:
	var _data := verify_message.to_bytes()
	var _request := IoGame.RequestCommand.of(_login_verify_1_0, _data).on_callback(callback)
	_request.data_source = verify_message
	return _request.execute()


## user login[br]
##
## [br][b]@param verify_message:[/b] loginVerify
## [br][b]@return[/b] [code]IoGame.ResponseResult[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## # loginVerify
## var verify_message: Common.LoginVerifyMessage = ...
##
## var result := await SdkAction.of_await_login_verify(verify_message)
##
## if result.success():
##     # User info
##     var _value := result.get_value(Common.UserMessage) as Common.UserMessage
## else:
##     var error_code := result.get_response_status()
##     print("error_code: ", error_code)
##     print("error_info: ", result.get_error_info())
## [/codeblock]
static func of_await_login_verify(verify_message: Common.LoginVerifyMessage) -> IoGame.ResponseResult:
	var _data := verify_message.to_bytes()
	var _request := IoGame.RequestCommand.of(_login_verify_1_0, _data)
	_request.data_source = verify_message
	return await IoGame.RequestCommand.of_await_request_command(_request)


## test broadcast[br]
##
## [br][b]@return[/b] [code]IoGame.RequestCommand void[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## SdkAction.of_trigger_broadcast();
## [/codeblock]
static func of_trigger_broadcast() -> IoGame.RequestCommand:
	return IoGame.RequestCommand.of_empty(_trigger_broadcast_1_1).execute()


## test int[br]
##
## [br][b]@param value:[/b] value
## [br][b]@param callback:[/b] int value (returnType: [code] int[/code])
## [br][b]@return[/b] [code]IoGame.RequestCommand[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## # value
## var value: int = ...
##
## SdkAction.of_int_value(value, func(result: IoGame.ResponseResult):
##     # int value
##     var _value := result.get_int()
## ).on_error(func(result: IoGame.ResponseResult):
##     var error_code := result.get_response_status()
##     print("error_code: ", error_code)
##     print("error_info: ", result.get_error_info())
## )
## [/codeblock]
static func of_int_value(value: int, callback: Callable) -> IoGame.RequestCommand:
	return IoGame.RequestCommand.of_int(_int_value_1_2, value).on_callback(callback).execute()


## test int[br]
##
## [br][b]@param value:[/b] value
## [br][b]@return[/b] [code]IoGame.ResponseResult[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## # value
## var value: int = ...
##
## var result := await SdkAction.of_await_int_value(value)
##
## if result.success():
##     # int value
##     var _value := result.get_int()
## else:
##     var error_code := result.get_response_status()
##     print("error_code: ", error_code)
##     print("error_info: ", result.get_error_info())
## [/codeblock]
static func of_await_int_value(value: int) -> IoGame.ResponseResult:
	return await IoGame.RequestCommand.of_await_int(_int_value_1_2, value)


## test long[br]
##
## [br][b]@param value:[/b] value
## [br][b]@param callback:[/b] long value (returnType: [code] int[/code])
## [br][b]@return[/b] [code]IoGame.RequestCommand[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## # value
## var value: int = ...
##
## SdkAction.of_long_value(value, func(result: IoGame.ResponseResult):
##     # long value
##     var _value := result.get_long()
## ).on_error(func(result: IoGame.ResponseResult):
##     var error_code := result.get_response_status()
##     print("error_code: ", error_code)
##     print("error_info: ", result.get_error_info())
## )
## [/codeblock]
static func of_long_value(value: int, callback: Callable) -> IoGame.RequestCommand:
	return IoGame.RequestCommand.of_long(_long_value_1_3, value).on_callback(callback).execute()


## test long[br]
##
## [br][b]@param value:[/b] value
## [br][b]@return[/b] [code]IoGame.ResponseResult[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## # value
## var value: int = ...
##
## var result := await SdkAction.of_await_long_value(value)
##
## if result.success():
##     # long value
##     var _value := result.get_long()
## else:
##     var error_code := result.get_response_status()
##     print("error_code: ", error_code)
##     print("error_info: ", result.get_error_info())
## [/codeblock]
static func of_await_long_value(value: int) -> IoGame.ResponseResult:
	return await IoGame.RequestCommand.of_await_long(_long_value_1_3, value)


## test boolean[br]
##
## [br][b]@param value:[/b] value
## [br][b]@param callback:[/b] boolean value (returnType: [code] bool[/code])
## [br][b]@return[/b] [code]IoGame.RequestCommand[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## # value
## var value: bool = ...
##
## SdkAction.of_bool_value(value, func(result: IoGame.ResponseResult):
##     # boolean value
##     var _value := result.get_bool()
## ).on_error(func(result: IoGame.ResponseResult):
##     var error_code := result.get_response_status()
##     print("error_code: ", error_code)
##     print("error_info: ", result.get_error_info())
## )
## [/codeblock]
static func of_bool_value(value: bool, callback: Callable) -> IoGame.RequestCommand:
	return IoGame.RequestCommand.of_bool(_bool_value_1_4, value).on_callback(callback).execute()


## test boolean[br]
##
## [br][b]@param value:[/b] value
## [br][b]@return[/b] [code]IoGame.ResponseResult[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## # value
## var value: bool = ...
##
## var result := await SdkAction.of_await_bool_value(value)
##
## if result.success():
##     # boolean value
##     var _value := result.get_bool()
## else:
##     var error_code := result.get_response_status()
##     print("error_code: ", error_code)
##     print("error_info: ", result.get_error_info())
## [/codeblock]
static func of_await_bool_value(value: bool) -> IoGame.ResponseResult:
	return await IoGame.RequestCommand.of_await_bool(_bool_value_1_4, value)


## test String[br]
##
## [br][b]@param value:[/b] value
## [br][b]@param callback:[/b] String value (returnType: [code] String[/code])
## [br][b]@return[/b] [code]IoGame.RequestCommand[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## # value
## var value: String = ...
##
## SdkAction.of_string_value(value, func(result: IoGame.ResponseResult):
##     # String value
##     var _value := result.get_string()
## ).on_error(func(result: IoGame.ResponseResult):
##     var error_code := result.get_response_status()
##     print("error_code: ", error_code)
##     print("error_info: ", result.get_error_info())
## )
## [/codeblock]
static func of_string_value(value: String, callback: Callable) -> IoGame.RequestCommand:
	return IoGame.RequestCommand.of_string(_string_value_1_5, value).on_callback(callback).execute()


## test String[br]
##
## [br][b]@param value:[/b] value
## [br][b]@return[/b] [code]IoGame.ResponseResult[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## # value
## var value: String = ...
##
## var result := await SdkAction.of_await_string_value(value)
##
## if result.success():
##     # String value
##     var _value := result.get_string()
## else:
##     var error_code := result.get_response_status()
##     print("error_code: ", error_code)
##     print("error_info: ", result.get_error_info())
## [/codeblock]
static func of_await_string_value(value: String) -> IoGame.ResponseResult:
	return await IoGame.RequestCommand.of_await_string(_string_value_1_5, value)


## test Object；测试单个对象的接收与响应。[br]
##
## [br][b]@param login_verify_message:[/b] loginVerify；登录对象。
## [br][b]@param callback:[/b] UserMessage；用户数据。 (returnType: [code] Common.UserMessage[/code])
## [br][b]@return[/b] [code]IoGame.RequestCommand[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## # loginVerify；登录对象。
## var login_verify_message: Common.LoginVerifyMessage = ...
##
## SdkAction.of_value(login_verify_message, func(result: IoGame.ResponseResult):
##     # UserMessage；用户数据。
##     var _value := result.get_value(Common.UserMessage) as Common.UserMessage
## ).on_error(func(result: IoGame.ResponseResult):
##     var error_code := result.get_response_status()
##     print("error_code: ", error_code)
##     print("error_info: ", result.get_error_info())
## )
## [/codeblock]
static func of_value(login_verify_message: Common.LoginVerifyMessage, callback: Callable) -> IoGame.RequestCommand:
	var _data := login_verify_message.to_bytes()
	var _request := IoGame.RequestCommand.of(_value_1_6, _data).on_callback(callback)
	_request.data_source = login_verify_message
	return _request.execute()


## test Object；测试单个对象的接收与响应。[br]
##
## [br][b]@param login_verify_message:[/b] loginVerify；登录对象。
## [br][b]@return[/b] [code]IoGame.ResponseResult[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## # loginVerify；登录对象。
## var login_verify_message: Common.LoginVerifyMessage = ...
##
## var result := await SdkAction.of_await_value(login_verify_message)
##
## if result.success():
##     # UserMessage；用户数据。
##     var _value := result.get_value(Common.UserMessage) as Common.UserMessage
## else:
##     var error_code := result.get_response_status()
##     print("error_code: ", error_code)
##     print("error_info: ", result.get_error_info())
## [/codeblock]
static func of_await_value(login_verify_message: Common.LoginVerifyMessage) -> IoGame.ResponseResult:
	var _data := login_verify_message.to_bytes()
	var _request := IoGame.RequestCommand.of(_value_1_6, _data)
	_request.data_source = login_verify_message
	return await IoGame.RequestCommand.of_await_request_command(_request)


## test int list[br]
##
## [br][b]@param value:[/b] value
## [br][b]@param callback:[/b] int list (returnType: [code]list of int[/code])
## [br][b]@return[/b] [code]IoGame.RequestCommand[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## # value
## var value: Array[int] = ...
##
## SdkAction.of_list_int(value, func(result: IoGame.ResponseResult):
##     # int list
##     var _value := result.list_int()
## ).on_error(func(result: IoGame.ResponseResult):
##     var error_code := result.get_response_status()
##     print("error_code: ", error_code)
##     print("error_info: ", result.get_error_info())
## )
## [/codeblock]
static func of_list_int(value: Array[int], callback: Callable) -> IoGame.RequestCommand:
	return IoGame.RequestCommand.of_int_list(_list_int_1_12, value).on_callback(callback).execute()


## test int list[br]
##
## [br][b]@param value:[/b] value
## [br][b]@return[/b] [code]IoGame.ResponseResult[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## # value
## var value: Array[int] = ...
##
## var result := await SdkAction.of_await_list_int(value)
##
## if result.success():
##     # int list
##     var _value := result.list_int()
## else:
##     var error_code := result.get_response_status()
##     print("error_code: ", error_code)
##     print("error_info: ", result.get_error_info())
## [/codeblock]
static func of_await_list_int(value: Array[int]) -> IoGame.ResponseResult:
	return await IoGame.RequestCommand.of_await_int_list(_list_int_1_12, value)


## test Long list[br]
##
## [br][b]@param value:[/b] value
## [br][b]@param callback:[/b] Long list (returnType: [code]list of int[/code])
## [br][b]@return[/b] [code]IoGame.RequestCommand[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## # value
## var value: Array[int] = ...
##
## SdkAction.of_list_long(value, func(result: IoGame.ResponseResult):
##     # Long list
##     var _value := result.list_long()
## ).on_error(func(result: IoGame.ResponseResult):
##     var error_code := result.get_response_status()
##     print("error_code: ", error_code)
##     print("error_info: ", result.get_error_info())
## )
## [/codeblock]
static func of_list_long(value: Array[int], callback: Callable) -> IoGame.RequestCommand:
	return IoGame.RequestCommand.of_long_list(_list_long_1_13, value).on_callback(callback).execute()


## test Long list[br]
##
## [br][b]@param value:[/b] value
## [br][b]@return[/b] [code]IoGame.ResponseResult[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## # value
## var value: Array[int] = ...
##
## var result := await SdkAction.of_await_list_long(value)
##
## if result.success():
##     # Long list
##     var _value := result.list_long()
## else:
##     var error_code := result.get_response_status()
##     print("error_code: ", error_code)
##     print("error_info: ", result.get_error_info())
## [/codeblock]
static func of_await_list_long(value: Array[int]) -> IoGame.ResponseResult:
	return await IoGame.RequestCommand.of_await_long_list(_list_long_1_13, value)


## test Boolean list[br]
##
## [br][b]@param value:[/b] value
## [br][b]@param callback:[/b] Boolean list (returnType: [code]list of bool[/code])
## [br][b]@return[/b] [code]IoGame.RequestCommand[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## # value
## var value: Array[bool] = ...
##
## SdkAction.of_list_bool(value, func(result: IoGame.ResponseResult):
##     # Boolean list
##     var _value := result.list_bool()
## ).on_error(func(result: IoGame.ResponseResult):
##     var error_code := result.get_response_status()
##     print("error_code: ", error_code)
##     print("error_info: ", result.get_error_info())
## )
## [/codeblock]
static func of_list_bool(value: Array[bool], callback: Callable) -> IoGame.RequestCommand:
	return IoGame.RequestCommand.of_bool_list(_list_bool_1_14, value).on_callback(callback).execute()


## test Boolean list[br]
##
## [br][b]@param value:[/b] value
## [br][b]@return[/b] [code]IoGame.ResponseResult[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## # value
## var value: Array[bool] = ...
##
## var result := await SdkAction.of_await_list_bool(value)
##
## if result.success():
##     # Boolean list
##     var _value := result.list_bool()
## else:
##     var error_code := result.get_response_status()
##     print("error_code: ", error_code)
##     print("error_info: ", result.get_error_info())
## [/codeblock]
static func of_await_list_bool(value: Array[bool]) -> IoGame.ResponseResult:
	return await IoGame.RequestCommand.of_await_bool_list(_list_bool_1_14, value)


## test String list[br]
##
## [br][b]@param value:[/b] value
## [br][b]@param callback:[/b] String list (returnType: [code]list of String[/code])
## [br][b]@return[/b] [code]IoGame.RequestCommand[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## # value
## var value: Array[String] = ...
##
## SdkAction.of_list_string(value, func(result: IoGame.ResponseResult):
##     # String list
##     var _value := result.list_string()
## ).on_error(func(result: IoGame.ResponseResult):
##     var error_code := result.get_response_status()
##     print("error_code: ", error_code)
##     print("error_info: ", result.get_error_info())
## )
## [/codeblock]
static func of_list_string(value: Array[String], callback: Callable) -> IoGame.RequestCommand:
	return IoGame.RequestCommand.of_string_list(_list_string_1_15, value).on_callback(callback).execute()


## test String list[br]
##
## [br][b]@param value:[/b] value
## [br][b]@return[/b] [code]IoGame.ResponseResult[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## # value
## var value: Array[String] = ...
##
## var result := await SdkAction.of_await_list_string(value)
##
## if result.success():
##     # String list
##     var _value := result.list_string()
## else:
##     var error_code := result.get_response_status()
##     print("error_code: ", error_code)
##     print("error_info: ", result.get_error_info())
## [/codeblock]
static func of_await_list_string(value: Array[String]) -> IoGame.ResponseResult:
	return await IoGame.RequestCommand.of_await_string_list(_list_string_1_15, value)


## test Object list[br]
##
## [br][b]@param value:[/b] LoginVerifyMessage list
## [br][b]@param callback:[/b] UserMessage list (returnType: [code]list of Common.UserMessage[/code])
## [br][b]@return[/b] [code]IoGame.RequestCommand[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## # LoginVerifyMessage list
## var value: Array[Common.LoginVerifyMessage] = ...
##
## SdkAction.of_list_value(value, func(result: IoGame.ResponseResult):
##     # UserMessage list
##     var _value: Array = result.list_value(Common.UserMessage)
## ).on_error(func(result: IoGame.ResponseResult):
##     var error_code := result.get_response_status()
##     print("error_code: ", error_code)
##     print("error_info: ", result.get_error_info())
## )
## [/codeblock]
static func of_list_value(value: Array[Common.LoginVerifyMessage], callback: Callable) -> IoGame.RequestCommand:
	var _message := IoGame.Proto.ByteValueList.new()
	for _value in value:
		_message.add_values(_value.to_bytes())
	var _request := IoGame.RequestCommand.of(_list_value_1_16, _message.to_bytes()).on_callback(callback)
	_request.data_source = value
	return _request.execute()


## test Object list[br]
##
## [br][b]@param value:[/b] LoginVerifyMessage list
## [br][b]@return[/b] [code]IoGame.ResponseResult[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## # LoginVerifyMessage list
## var value: Array[Common.LoginVerifyMessage] = ...
##
## var result := await SdkAction.of_await_list_value(value)
##
## if result.success():
##     # UserMessage list
##     var _value: Array = result.list_value(Common.UserMessage)
## else:
##     var error_code := result.get_response_status()
##     print("error_code: ", error_code)
##     print("error_info: ", result.get_error_info())
## [/codeblock]
static func of_await_list_value(value: Array[Common.LoginVerifyMessage]) -> IoGame.ResponseResult:
	var _message := IoGame.Proto.ByteValueList.new()
	for _value in value:
		_message.add_values(_value.to_bytes())
	var _request := IoGame.RequestCommand.of(_list_value_1_16, _message.to_bytes())
	_request.data_source = value
	return await IoGame.RequestCommand.of_await_request_command(_request)


## test error code[br]
##
## [br][b]@param value:[/b] If the value is equal to 2, an error will be thrown
## [br][b]@param callback:[/b] int (returnType: [code] int[/code])
## [br][b]@return[/b] [code]IoGame.RequestCommand[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## # If the value is equal to 2, an error will be thrown
## var value: int = ...
##
## SdkAction.of_test_error(value, func(result: IoGame.ResponseResult):
##     # int
##     var _value := result.get_int()
## ).on_error(func(result: IoGame.ResponseResult):
##     var error_code := result.get_response_status()
##     print("error_code: ", error_code)
##     print("error_info: ", result.get_error_info())
## )
## [/codeblock]
static func of_test_error(value: int, callback: Callable) -> IoGame.RequestCommand:
	return IoGame.RequestCommand.of_int(_test_error_1_20, value).on_callback(callback).execute()


## test error code[br]
##
## [br][b]@param value:[/b] If the value is equal to 2, an error will be thrown
## [br][b]@return[/b] [code]IoGame.ResponseResult[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## # If the value is equal to 2, an error will be thrown
## var value: int = ...
##
## var result := await SdkAction.of_await_test_error(value)
##
## if result.success():
##     # int
##     var _value := result.get_int()
## else:
##     var error_code := result.get_response_status()
##     print("error_code: ", error_code)
##     print("error_info: ", result.get_error_info())
## [/codeblock]
static func of_await_test_error(value: int) -> IoGame.ResponseResult:
	return await IoGame.RequestCommand.of_await_int(_test_error_1_20, value)


## noParam method test. 没有参数的方法测试[br]
##
## [br][b]@param callback:[/b] counter (returnType: [code] int[/code])
## [br][b]@return[/b] [code]IoGame.RequestCommand[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## SdkAction.of_no_param(func(result: IoGame.ResponseResult):
##     # counter
##     var _value := result.get_int()
## })
## [/codeblock]
static func of_no_param(callback: Callable) -> IoGame.RequestCommand:
	return IoGame.RequestCommand.of_empty(_no_param_1_21).on_callback(callback).execute()


## noParam method test. 没有参数的方法测试[br]
##
## [br][b]@return[/b] [code]IoGame.ResponseResult[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## var result := await SdkAction.of_await_no_param()
##
## if result.success():
##     # counter
##     var _value := result.get_int()
## else:
##     var error_code := result.get_response_status()
##     print("error_code: ", error_code)
##     print("error_info: ", result.get_error_info())
static func of_await_no_param() -> IoGame.ResponseResult:
	return await IoGame.RequestCommand.of_await_empty(_no_param_1_21)


## noReturn method test. 没有返回值的方法测试[br]
##
## [br][b]@param name:[/b] name
## [br][b]@return[/b] [code]IoGame.RequestCommand[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## # name
## var name: String = ...
## SdkAction.ofno_return_method(name);
## [/codeblock]
static func of_no_return_method(name: String) -> IoGame.RequestCommand:
	return IoGame.RequestCommand.of_string(_no_return_1_22, name).execute()


## [br]
##
## [br][b]@param message:[/b] 
## [br][b]@param callback:[/b]  (returnType: [code] Common.BulletMessage[/code])
## [br][b]@return[/b] [code]IoGame.RequestCommand[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## # 
## var message: Common.BulletMessage = ...
##
## SdkAction.of_bullet_message(message, func(result: IoGame.ResponseResult):
##     # 
##     var _value := result.get_value(Common.BulletMessage) as Common.BulletMessage
## ).on_error(func(result: IoGame.ResponseResult):
##     var error_code := result.get_response_status()
##     print("error_code: ", error_code)
##     print("error_info: ", result.get_error_info())
## )
## [/codeblock]
static func of_bullet_message(message: Common.BulletMessage, callback: Callable) -> IoGame.RequestCommand:
	var _data := message.to_bytes()
	var _request := IoGame.RequestCommand.of(_bullet_message_1_23, _data).on_callback(callback)
	_request.data_source = message
	return _request.execute()


## [br]
##
## [br][b]@param message:[/b] 
## [br][b]@return[/b] [code]IoGame.ResponseResult[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## # 
## var message: Common.BulletMessage = ...
##
## var result := await SdkAction.of_await_bullet_message(message)
##
## if result.success():
##     # 
##     var _value := result.get_value(Common.BulletMessage) as Common.BulletMessage
## else:
##     var error_code := result.get_response_status()
##     print("error_code: ", error_code)
##     print("error_info: ", result.get_error_info())
## [/codeblock]
static func of_await_bullet_message(message: Common.BulletMessage) -> IoGame.ResponseResult:
	var _data := message.to_bytes()
	var _request := IoGame.RequestCommand.of(_bullet_message_1_23, _data)
	_request.data_source = message
	return await IoGame.RequestCommand.of_await_request_command(_request)
