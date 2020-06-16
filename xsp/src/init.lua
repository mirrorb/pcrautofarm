function init_fun()--初始化
	init("0", 1) --以当前应用 Home 键在右边初始化
	width,height = getScreenSize()
	if width ~= 540 and height ~= 960 then--分辨率适配
		dialog(width.."*"..height.."分辨率不支持,请使用模拟器的手机模式540*960", 5)
		lua_exit()
	end
	runApp("com.bilibili.priconne")--启动pcr
	first = 1 --第一次执行任务
	ret,results = showUI("ui.json")--UI初始化
	if ret == 0 then--UI初始化失败
		lua_exit()
	end
	hud1 = createHUD()--创建HUD
	loopc = tonumber(results.Edit1) - 1--从UI读取开始任务的账号
	usersfile = io.open("[public]用户信息.conf", "r")--/data/data/com.xxscript.idehelper/tengine/public用户配置文件
	users = usersfile:read("*a")
	usersfile:close()
	loadusers = loadstring(users)
	loadusers()--加载外部用户信息
	count = table.getn(act)--获取用户数量
end
