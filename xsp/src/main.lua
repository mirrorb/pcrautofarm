require('globle')
require('task')
require('data')
require('init')
init_fun()--初始化
while true do--每个账号
	loopc = loopc + 1--当前账号
	showHUD(hud1,loopc,tsize,fcolor,bgcolor,1,posx,posy,hudw,hudh)      --显示当前账号
	go_home()--返回主界面
	need_donate = false
	if string.find(results.choose_task,"0") then
		tower_support()--地下城支援
	end
	if string.find(results.choose_task,"2") then
		need_donate = true--捐赠装备
	end
	if string.find(results.choose_task,"1") then
		thumbs_up()--成员点赞
	end
	if string.find(results.choose_task,"3") then
		get_gift_rewards()
		sweep()--1-1刷图
	end
	if string.find(results.choose_task,"5") then
		daily_task()--简单日常任务
	end
	sign_out()
	if loopc == count then
		closeApp("com.bilibili.priconne")--任务完成退出游戏
		lua_exit()
	end
end--每个账号