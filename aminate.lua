
-- whatre we aminatin
--- thanks

local amin = {}
amin.__index = amin
amin.s = {}
amin.imgd = {}

-- img, frame width, frame height, x gap, y gap, startframe, length, repeat, x start, y start
function amin.image(directory, fw, fh, xg, yg)
	amin.imgd[#amin.imgd + 1] = {love.graphics.newImage(directory), fw, fh, xg, yg}
	return amin.imgd[#amin.imgd]
end
function amin.load(image, xsf, ysf, xbl, xbr, ybb, l, spd, rpt)
	local sw = image[1]:getWidth()
	local sh = image[1]:getHeight()
	local t = {false, spd, l, 0, 1, rpt}
	local x = xsf
	local y = ysf
	while d = false do
		t[#t+1] = love.graphics.newQuad(x*(image[2]+image[4]),y*(image[3]+image[5]), image[2], image[3], sw, sh)
		x = x + 1
		if x > xbr then 
			x = xbl
			y = y + 1
			if y > ybb then d = true end
		end 
		if #t - 5 == l then d = true end
	end
	amin.s[#amin.s+1] = setmetatable(t,amin)
	return amin.s[#amin.s]
end
function amin.update(dt)
	for n = 1, #amin.s, 1 do
		if amin.s[n][1] == true then amin.s[n]:update(dt) end
	end
end
function amin:update(dt)
	self[4] = self[4] + dt
	if self[4] > self[2] then 
		self[4] = self[4] - self[2]
		self[5] = self[5] + 1
		if self[5] > self[3] then 
			if self[6] == true then self[5] = 1 end
		else
			self[1] = false
			self[4] = 0
			self[5] = 1
		end
	end
end
function amin:draw(x, y)
	
end