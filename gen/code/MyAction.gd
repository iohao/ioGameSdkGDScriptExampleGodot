# // generateTime 2025-05-02
# // https://github.com/iohao/ioGame

## My Action; 我的 Action[br]
## https://github.com/iohao/ioGame
class_name MyAction
extends RefCounted

const Common = preload("../common.gd")

static var _hello_2_1: int = IoGame.CmdKit.mapping_request(131073, "this is hello action. 这是我提供的 hello action。")
static var _login_verify_2_2: int = IoGame.CmdKit.mapping_request(131074, "我的登录验证 action。My loginVerify action")

## this is hello action. 这是我提供的 hello action。[br]
##
## [br][b]@param name:[/b] your name; 你的名字
## [br][b]@param callback:[/b] 我的响应内容; My Response (returnType: [code] String[/code])
## [br][b]@return[/b] [code]IoGame.RequestCommand[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## # your name; 你的名字
## var name: String = ...
##
## MyAction.of_hello(name, func(result: IoGame.ResponseResult):
##     # 我的响应内容; My Response
##     var _value := result.get_string()
## ).on_error(func(result: IoGame.ResponseResult):
##     var error_code := result.get_response_status()
##     print("error_code: ", error_code)
##     print("error_info: ", result.get_error_info())
## )
## [/codeblock]
static func of_hello(name: String, callback: Callable) -> IoGame.RequestCommand:
	return IoGame.RequestCommand.of_string(_hello_2_1, name).on_callback(callback).execute()


## this is hello action. 这是我提供的 hello action。[br]
##
## [br][b]@param name:[/b] your name; 你的名字
## [br][b]@return[/b] [code]IoGame.ResponseResult[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## # your name; 你的名字
## var name: String = ...
##
## var result := await MyAction.of_await_hello(name)
##
## if result.success():
##     # 我的响应内容; My Response
##     var _value := result.get_string()
## else:
##     var error_code := result.get_response_status()
##     print("error_code: ", error_code)
##     print("error_info: ", result.get_error_info())
## [/codeblock]
static func of_await_hello(name: String) -> IoGame.ResponseResult:
	return await IoGame.RequestCommand.of_await_string(_hello_2_1, name)


## 我的登录验证 action。My loginVerify action[br]
##
## [br][b]@param verify_message:[/b] 我的验证信息。verifyMessage
## [br][b]@param callback:[/b] 我的用户信息。My UserMessage (returnType: [code] Common.UserMessage[/code])
## [br][b]@return[/b] [code]IoGame.RequestCommand[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## # 我的验证信息。verifyMessage
## var verify_message: Common.LoginVerifyMessage = ...
##
## MyAction.of_login_verify(verify_message, func(result: IoGame.ResponseResult):
##     # 我的用户信息。My UserMessage
##     var _value := result.get_value(Common.UserMessage) as Common.UserMessage
## ).on_error(func(result: IoGame.ResponseResult):
##     var error_code := result.get_response_status()
##     print("error_code: ", error_code)
##     print("error_info: ", result.get_error_info())
## )
## [/codeblock]
static func of_login_verify(verify_message: Common.LoginVerifyMessage, callback: Callable) -> IoGame.RequestCommand:
	var _data := verify_message.to_bytes()
	var _request := IoGame.RequestCommand.of(_login_verify_2_2, _data).on_callback(callback)
	_request.data_source = verify_message
	return _request.execute()


## 我的登录验证 action。My loginVerify action[br]
##
## [br][b]@param verify_message:[/b] 我的验证信息。verifyMessage
## [br][b]@return[/b] [code]IoGame.ResponseResult[/code]
## [br]
## [br][b]Example Code[/b]
## [codeblock]
## # 我的验证信息。verifyMessage
## var verify_message: Common.LoginVerifyMessage = ...
##
## var result := await MyAction.of_await_login_verify(verify_message)
##
## if result.success():
##     # 我的用户信息。My UserMessage
##     var _value := result.get_value(Common.UserMessage) as Common.UserMessage
## else:
##     var error_code := result.get_response_status()
##     print("error_code: ", error_code)
##     print("error_info: ", result.get_error_info())
## [/codeblock]
static func of_await_login_verify(verify_message: Common.LoginVerifyMessage) -> IoGame.ResponseResult:
	var _data := verify_message.to_bytes()
	var _request := IoGame.RequestCommand.of(_login_verify_2_2, _data)
	_request.data_source = verify_message
	return await IoGame.RequestCommand.of_await_request_command(_request)


