function mfColor(T)  -- 找第一组色<table>T为颜色特征
--                         左上x    左上y        右下x        右下y   颜色    匹配度   水平方向 垂直方向 水平垂直优先级
	return findColor({T[1][1][1],T[1][1][2],T[1][1][3],T[1][1][4]},T[1][2], T[1][3], T[1][4],  T[1][5],   T[1][6])
end
function tap(x, y)   -- 触屏x, y为坐标
	touchDown(1, x,y)
	mSleep(200)
	touchUp(1, x, y)
end
function tapT(T)     -- 触屏table T为当前分辨率下的坐标
	touchDown(1, T[1], T[2])
	mSleep(200)
	touchUp(1, T[1], T[2])
end
function none_tap(TC,TP)  --找不到点击
	while true do
		x, y = mfColor(TC)
		if x > -1 then
			break
		end
		tapT(TP)
		mSleep(500)
	end
end
function found_tap(TC,TP) --找到点击
	while true do
		x, y = mfColor(TC)
		if x == -1 then
			break
		end
		tapT(TP)
		mSleep(500)
	end
end
function swip(p1,p2) --p1滑到p2
	local x1 = p1[1]
	local y1 = p1[2]
	local x2 = p2[1]
	local y2 = p2[2]
	local step, x, y, index = 20, x1 , y1, math.random(1,5)
	touchDown(index, x, y)
	local function move(from, to)
		if from > to then
			do
				return -1 * step
			end
		else
			return step
		end
	end
	while (math.abs(x-x2) >= step) or (math.abs(y-y2) >= step) do
		if math.abs(x-x2) >= step then x = x + move(x1,x2) end
		if math.abs(y-y2) >= step then y = y + move(y1,y2) end
		touchMove(index, x, y)
		mSleep(20)
	end
	touchMove(index, x2, y2)
	mSleep(30)
	touchUp(index, x2, y2)
end
function until_found(delay,T1,T2,T3,T4,T5,T6)  -- 用于识别多种界面返回值为，找到的坐标
	if not delay then
		delay = 500
	end
	if T6 then
		repeat
			mSleep(delay)
			keepScreen(true)
			xf1, yf1 = mfColor(T1)
			xf2, yf2 = mfColor(T2)
			xf3, yf3 = mfColor(T3)
			xf4, yf4 = mfColor(T4)
			xf5, yf5 = mfColor(T5)
			xf6, yf6 = mfColor(T6)
			keepScreen(false)
		until xf1 > -1 or xf2 > -1 or xf3 > -1 or xf4 > -1 or xf5 > -1 or xf6 > -1
		if xf1  > -1 then
			return 0,xf1, yf1
		elseif  xf2 > -1 then
			return 1, xf2, yf2
		elseif xf3 > -1 then
			return 2, xf3, yf3
		elseif xf4 > -1 then
			return 3, xf4, yf4
		elseif xf5 > -1 then
			return 4, xf5, yf5
		elseif xf6 > -1 then
			return 5, xf6, yf6
		end
	elseif T5 then
		repeat
			mSleep(delay)
			keepScreen(true)
			xf1, yf1 = mfColor(T1)
			xf2, yf2 = mfColor(T2)
			xf3, yf3 = mfColor(T3)
			xf4, yf4 = mfColor(T4)
			xf5, yf5 = mfColor(T5)
			keepScreen(false)
		until xf1 > -1 or xf2 > -1 or xf3 > -1 or xf4 > -1 or xf5 > -1
		if xf1  > -1 then
			return 0,xf1, yf1
		elseif  xf2 > -1 then
			return 1, xf2, yf2
		elseif xf3 > -1 then
			return 2, xf3, yf3
		elseif xf4 > -1 then
			return 3, xf4, yf4
		elseif xf5 > -1 then
			return 4, xf5, yf5
		end
	elseif T4 then
		repeat
			mSleep(delay)
			keepScreen(true)
			xf1, yf1 = mfColor(T1)
			xf2, yf2 = mfColor(T2)
			xf3, yf3 = mfColor(T3)
			xf4, yf4 = mfColor(T4)
			keepScreen(false)
		until xf1 > -1 or xf2 > -1 or xf3 > -1 or xf4 > -1
		if xf1  > -1 then
			return 0,xf1, yf1
		elseif  xf2 > -1 then
			return 1, xf2, yf2
		elseif xf3 > -1 then
			return 2, xf3, yf3
		elseif xf4 > -1 then
			return 3, xf4, yf4
		end
	elseif T3 then
		repeat
			mSleep(delay)
			keepScreen(true)
			xf1, yf1 = mfColor(T1)
			xf2, yf2 = mfColor(T2)
			xf3, yf3 = mfColor(T3)
			keepScreen(false)
		until xf1 > -1 or xf2 > -1 or xf3 > -1
		if xf1  > -1 then
			return 0,xf1, yf1
		elseif  xf2 > -1 then
			return 1, xf2, yf2
		elseif xf3 > -1 then
			return 2, xf3, yf3
		end
	elseif T2 then
		repeat
			mSleep(delay)
			keepScreen(true)
			xf1, yf1 = mfColor(T1)
			xf2, yf2 = mfColor(T2)
			keepScreen(false)
		until xf1 > -1 or xf2 > -1
		if xf1  > -1 then
			return 0, xf1, yf1
		elseif  xf2 > -1 then
			return 1, xf2, yf2
		end
	elseif T1 then
		repeat
			mSleep(delay)
			xf1, yf1 = mfColor(T1)
		until xf1 > -1
		return 0, xf1, yf1
	else
		print"until_found():参数错误"
	end
end
