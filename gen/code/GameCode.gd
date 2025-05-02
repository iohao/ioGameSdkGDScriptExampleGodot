# // generateTime 2025-05-02
# // https://github.com/iohao/ioGame

## GameCode、ErrorCode. cn:游戏错误码[br]
## https://github.com/iohao/ioGame
class_name GameCode
extends RefCounted

## 绑定的游戏逻辑服不存在
static var FindBindingLogicServerNotExist: int = IoGame.CmdKit.mapping_error_code(-1008, "绑定的游戏逻辑服不存在")
## 强制玩家下线
static var ForcedOffline: int = IoGame.CmdKit.mapping_error_code(-1007, "强制玩家下线")
## 数据不存在
static var DataNotExist: int = IoGame.CmdKit.mapping_error_code(-1006, "数据不存在")
## class 不存在
static var ClassNotExist: int = IoGame.CmdKit.mapping_error_code(-1005, "class 不存在")
## 请先登录
static var VerifyIdentity: int = IoGame.CmdKit.mapping_error_code(-1004, "请先登录")
## 心跳超时相关
static var IdleErrorCode: int = IoGame.CmdKit.mapping_error_code(-1003, "心跳超时相关")
## 路由错误
static var CmdInfoErrorCode: int = IoGame.CmdKit.mapping_error_code(-1002, "路由错误")
## 参数验错误
static var ValidateErrCode: int = IoGame.CmdKit.mapping_error_code(-1001, "参数验错误")
## 系统其它错误
static var SystemOtherErrCode: int = IoGame.CmdKit.mapping_error_code(-1000, "系统其它错误")
## login error
static var LoginError: int = IoGame.CmdKit.mapping_error_code(1, "login error")
## test error
static var TestError: int = IoGame.CmdKit.mapping_error_code(2, "test error")

static func init() -> void:
	# trigger errorCodeMapping init. cn:调用一次方法，触发错误码的初始化操作。
	pass
