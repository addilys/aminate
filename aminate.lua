
-- whatre we aminatin
--- thanks

amin = {}
amin.__index = amin
amin.s = {}
amin.is = {}

-- img, frame width, frame height, x gap, y gap, startframe, length, repeat, x start, y start
function amin.image(directory, fw, fh, xg, yg)
	amin.is[#amin.is + 1] = {love.graphics.newImage(directory), fw, fh, xg, yg}
	return amin.is[#amin.is]
end
function amin.load(image, xsf, ysf, xbl, xbr, ybb, l, spd, rpt)
	local t = {image[1], false, spd, l, 0, 1, rpt}
	local x = xsf
	local y = ysf
	local d = false
	while(d == false) do
		t[#t+1] = love.graphics.newQuad((x-1)*(image[2]+image[4]),(y-1)*(image[3]+image[5]), image[2], image[3], image[1])
		x = x + 1
		if x > xbr then 
			x = xbl
			y = y + 1
			if y > ybb then d = true end
		end 
		if #t - 7 == l then d = true end
	end
	amin.s[#amin.s+1] = setmetatable(t,amin)
	return amin.s[#amin.s]
end
function amin.update(dt)
	for n = 1, #amin.s, 1 do
		if amin.s[n][2] == true then amin.s[n]:tick(dt) end
	end
end
function amin:tick(dt)
	self[5] = self[5] + dt
	if self[5] > self[3] then 
		self[5] = self[5] - self[3]
		self[6] = self[6] + 1
		if self[6] > self[4] then 
			if self[7] == true then 
				self[6] = 1
			else
				self[2] = false
				self[5] = 0
				self[6] = 1
			end
		end
	end
end
function amin:start()
	self[2] = true
end
function amin:stop()
	self[2] = false
	self[5] = 0
	self[6] = 1
end
function amin:draw(x, y)
	love.graphics.draw(self[1], self[7+self[6]], x, y)
end