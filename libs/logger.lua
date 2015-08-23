require "defines"

local _M = {}
local Logger = {prefix='ammo-box'}
Logger.__index = Logger

function Logger:log(str)
    local run_time_s = math.floor(game.tick/60)
    local run_time_minutes = math.floor(run_time_s/60)
    local run_time_hours = math.floor(run_time_minutes/60)
    self.log_buffer[#self.log_buffer + 1] = string.format("%02d:%02d:%02d: %s\r\n", run_time_hours, run_time_minutes % 60, run_time_s % 60, str)
    self.checkOutput(self)
end

function Logger:checkOutput()
    if self.last_write_size ~= #self.log_buffer and (game.tick - self.last_write_tick) > 36 then
        self.last_write_tick = game.tick
        self.last_write_size = #self.log_buffer
        local file_name = "logs/"..self.prefix.."/"..self.name..".log"
        game.makefile(file_name, table.concat(self.log_buffer))
    end
end

function Logger:dump(file_name)
  self.checkOutput(self)
  return true
end

function Logger:toString(table)
    if table == nil then
        return "nil"
    end
    local str = ""
	for i,d in pairs(table) do
		local t = type(d)
		if t == "table" then
			str = str .. "\n\t" .. i .. " : " .. self.toString(self, d)
		else
			str = str .. "\n\t" .. i .." : "..tostring(d)
		end
	end
    return str
end


function _M.new_logger(name)
    local temp = {name = name, log_buffer = {}, last_write_tick = game.tick, last_write_size = 0}
    local logger = setmetatable(temp, Logger)
    return logger
end
return _M
