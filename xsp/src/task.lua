function go_home()
	until_found(nil,color.游戏开始)
	found_tap(color.游戏开始,point.跳过点)
	until_found(nil,color.开始界面)
	while true do
		mSleep(800)
		tapT(point.开始游戏)
		mSleep(800)
		x, y = mfColor(color.切换账号)
		x1, y2 = mfColor(color.登录界面)
		if x > -1 then
			none_tap(color.登录界面,point.切换账号)
			break
		elseif x1 > -1 then
			break
		end
	end
	mSleep(800)
	tapT(point.账号输入框)
	mSleep(800)
	inputText("#CLEAR#") --删除输入框中的文字（假设输入框中已存在文字）
	mSleep(500)
	inputText(act[loopc])
	mSleep(800)
	tapT(point.密码输入框)
	mSleep(500)
	inputText("#CLEAR#")
	mSleep(500)
	inputText(pwd[loopc])
	mSleep(800)
	tapT(point.登录)
	none_tap(color.主界面,point.跳过点)
	mSleep(800)
	none_tap(color.主界面,point.跳过点)
end
function tower_support()
	none_tap(color.冒险界面,point.冒险)
	while true do
		x, y = mfColor(color.地下城选图)
		x1, y1 = mfColor(color.地下城在图中)
		if x > -1 then
			break
		elseif x1 > -1 then
			none_tap(color.确认,point.退出地下城)
			none_tap(color.地下城选图,point.确认)
			break
		end
		tapT(point.地下城)
		mSleep(800)
	end
	none_tap(color.确认,point.N塔)
	none_tap(color.地下城在图中,point.确认)
	none_tap(color.挑战,point.第一层)
	none_tap(color.选队,point.地下城挑战)
	none_tap(color.支援界面,point.支援)
	none_tap(color.挑战,point.农场主)
	none_tap(color.确认支援,point.地下城挑战)
	none_tap(color.开始战斗,point.确认支援)
	none_tap(color.撤退确认,point.战斗撤退)
	none_tap(color.地下城在图中,point.撤退确认)
	none_tap(color.确认,point.退出地下城)
	none_tap(color.地下城选图,point.确认)
end
function thumbs_up()
	none_tap(color.行会界面,point.行会)
	if string.find(results.choose_task,"2") then
		donate()
	end
	if string.find(results.choose_task,"1") then
		none_tap(color.点赞界面,point.成员信息)
		found_tap(color.行会界面,point.成员信息)
		found_tap(color.点赞界面,point.点赞b)
		t1,x, y = until_found(nil,color.点赞确认)
		found_tap(color.点赞确认,{x,y})
		until_found(nil,color.点赞界面)
		x, y = mfColor(color.可点赞)
		if x > -1 then --点满了
			thumbs_up_full = true
		end
	end
end
function donate()
	x, y = mfColor(color.黄色下箭头)
	if x > -1 then
		tap(x, y)
	else
		x, y = mfColor(color.蓝色下箭头)
		if x > -1 then
			tap(x, y)
		end
	end
	mSleep(1000)
	x, y = mfColor(color.可捐a)
	if x > -1 then
		tap(x, y)
		until_found(nil,color.捐赠数量界面)
		tapT(point.MAX)
		mSleep(800)
		tapT(point.捐赠确认)
		t1, x, y = until_found(nil,color.捐赠确认)
		tap(x, y)
		until_found(nil,color.行会界面)
	end
	x, y = mfColor(color.可捐a)
	if x > -1 then
		tap(x, y)
		until_found(nil,color.捐赠数量界面)
		tapT(point.MAX)
		mSleep(800)
		tapT(point.捐赠确认)
		t1, x, y = until_found(nil,color.捐赠确认)
		tap(x, y)
		until_found(nil,color.行会界面)
	end
end
function sweep()
	get_task_rewards()
	get_house_rewards()
	get_gift_rewards()
	none_tap(color.冒险界面,point.冒险)
	none_tap(color.主线界面,point.主线)
	if string.find(results.choose_task,"4") then --h图
		none_tap(color.h图,point.h图)
		none_tap(color.一h图,point.向左)
		none_tap(color.扫荡界面,point.h一杠一)
		mSleep(1000)
		touchDown(1, point.加[1],point.加[2])
		mSleep(2000)
		touchUp(1, point.加[1],point.加[2])
		none_tap(color.确认,point.开始扫荡)
		found_tap(color.确认,{x, y})
		sweep_skip_back()
		if string.find(results.choose_task,"3") then
			none_tap(color.n图,point.n图)
		end
	end
	--n
	if string.find(results.choose_task,"3") then
		none_tap(color.一n图,point.向左)
		none_tap(color.扫荡界面,point.n一杠一)
		mSleep(1000)
		touchDown(1, point.加[1],point.加[2])
		while true do
			x, y = mfColor(color.剩余体力)
			if x == -1 then
				break
			end
			mSleep(500)
		end
		touchUp(1, point.加[1],point.加[2])
		none_tap(color.确认,point.开始扫荡)
		found_tap(color.确认,{x, y})
		sweep_skip_back()
	end
end
function sweep_skip_back()
	t1, x, y = until_found(nil,color.跳过, color.扫荡完成)
	if t1 == 0 then
		found_tap(color.跳过,{x, y})
		t1, x, y = until_found(nil,color.扫荡完成)
	end
	found_tap(color.扫荡完成,{x, y})
	t1, x, y = until_found(nil,color.升级,color.扫荡界面,color.弹出限时,color.团队战)
	if t1 == 0 then
		found_tap(color.升级,{x, y})
		until_found(nil,color.扫荡界面)
		mSleep(1000)
		none_tap(color.确认,point.开始扫荡)
		mSleep(800)
		found_tap(color.确认,{x, y})
		t1, x, y = until_found(nil,color.跳过, color.扫荡完成)
		if t1 == 0 then
			found_tap(color.跳过,{x, y})
			t1, x, y = until_found(nil,color.扫荡完成)
		end
		found_tap(color.扫荡完成,{x, y})
		until_found(nil,color.扫荡界面)
	end
	none_tap(color.主线界面,point.取消)
end
function daily_task()
	explore()
	gacha()
	get_task_rewards()
	none_tap(color.主界面,point.主界面)
	x, y = mfColor(color.体力没了)
	if x == 1 and string.find(results.choose_task,"3") then
		sweep()
	end
end
function explore()
	if string.find(results.choose_task,"6") then --探索
		none_tap(color.冒险界面,point.冒险)
		none_tap(color.探索界面,point.探索)
		none_tap(color.探索里页,point.经验探索)
		none_tap(color.扫荡界面,point.中间探索)
		mSleep(800)
		tapT(point.加)
		mSleep(800)
		tapT(point.加)
		mSleep(800)
		none_tap(color.确认,point.开始扫荡)
		none_tap(color.跳过,point.确认)
		none_tap(color.探索界面,point.探索扫荡完成)
		none_tap(color.探索里页,point.玛娜探索)
		none_tap(color.扫荡界面,point.中间探索)
		mSleep(800)
		tapT(point.加)
		mSleep(800)
		tapT(point.加)
		mSleep(800)
		none_tap(color.确认,point.开始扫荡)
		none_tap(color.跳过,point.确认)
		none_tap(color.探索界面,point.探索扫荡完成)
	end
end
function gacha()
	while true do
		x, y = mfColor(color.扭蛋界面)
		x1, y1 = mfColor(color.十连设置)
		if x > -1 then
			break
		elseif x1 > -1 then
			none_tap(color.扭蛋界面,point.扭蛋设定)
			break
		end
		tapT(point.扭蛋)
		mSleep(500)
	end
	none_tap(color.扭蛋界面,point.扭蛋设定)
	none_tap(color.普通十连,point.普通)
	none_tap(color.十连确认,point.免费十连)
	found_tap(color.十连确认,{x, y})
	until_found(nil,color.普通十连)
	none_tap(color.主界面,point.主界面)
	none_tap(color.买玛娜界面,point.购买玛娜)
	none_tap(color.确认,point.购买)
	found_tap(color.确认,{x, y})
	t1, x, y = until_found(nil,color.关闭玛娜界面)
	found_tap(color.关闭玛娜界面,{x, y})
end
function get_gift_rewards()
	none_tap(color.主界面,point.主界面)
	x, y = mfColor(color.有邮件)
	if x > -1 then
		none_tap(color.邮件全部领取,point.邮件)
		found_tap(color.邮件全部领取,{x, y})
		t1, x, y = until_found(nil,color.邮件确认)
		found_tap(color.邮件确认,{x, y})
		t1, x, y = until_found(nil,color.扫荡完成)
		found_tap(color.扫荡完成,{x, y})
		t1, x, y = until_found(nil,color.关闭邮箱)
		found_tap(color.关闭邮箱,{x, y})
	end
end
function get_task_rewards()
	none_tap(color.主界面,point.主界面)
	x, y = mfColor(color.任务需要领)
	if x > -1 then
	--[[
		none_tap(color.任务界面,point.任务)
		none_tap(color.任务确认,point.任务全部领取)
		found_tap(color.任务确认,{x, y})
		none_tap(color.主界面,point.主界面)
	--]]
		none_tap(color.任务界面,point.任务)
		none_tap(color.任务不能领,point.任务全部领取)
	end
end
function get_house_rewards()
--[[
	none_tap(color.小屋,point.小屋)
	none_tap(color.任务确认,point.小屋全部领取)
	found_tap(color.任务确认,{x, y})
	none_tap(color.主界面,point.主界面)
--]]
	none_tap(color.小屋,point.小屋)
	none_tap(color.小屋不能领,point.小屋全部领取)
end
function sign_out()
	none_tap(color.菜单,point.菜单)
	none_tap(color.确认,point.注销)
	found_tap(color.确认,{x, y})
end