function init_fun()--初始化
	init("0", 1) --以当前应用 Home 键在右边初始化
	width,height = getScreenSize()
	if width ~= 540 and height ~= 960 then--分辨率适配
		dialogRet(width.."*"..height.."分辨率不支持,请使用模拟器的手机模式540*960", "晓得啦", "", "", 0)
		lua_exit()
	end
	usersfile = io.open("[public]用户信息.conf", "r")--/data/data/com.xxscript.idehelper/tengine/public用户配置文件
	if not usersfile then
		dialogRet("没有找到账号信息，请先将\"用户信息.conf\"放入\"/data/data/com.xxscript.idehelper/tengine/public\"再运行脚本", "晓得啦", "", "", 0)
		lua_exit()
	end
	ret,results = showUI("ui.json")--UI初始化
	if ret == 0 then--UI初始化失败
		lua_exit()
	end
	hud1 = createHUD()--创建HUD
	loopc = tonumber(results.Edit1) - 1--从UI读取开始任务的账号
	users = usersfile:read("*a")
	usersfile:close()
	loadusers = loadstring(users)
	loadusers()--加载外部用户信息
	count = table.getn(act)--获取用户数量
	if loopc + 1 > count then
		dialogRet("开始的账号好像比账号总数还大哦，好好检查一下吧", "确定", "", "", 0)
		lua_exit()
	end
	runApp("com.bilibili.priconne")--启动pcr
	thumbs_up_full = false
end
