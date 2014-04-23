--====================================================================--
-- PROGRAM: [Timer Controller]
--====================================================================--

--[[

 - Version: [1.0]
 - Made by: [Malik Gray]
 - Website: [www.starfantasygames.com]
 - Mail: [mikey@starfantasygames.com]

******************
 - INFORMATION
******************

  - [Timer Controller handles the in game date and time.]

--]]

local timer = {}

timer.dates = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday" }
timer.date = timer.dates[1]
timer.hour = 0
timer.minute = 0
timer.time = timer.hour..":"..timer.minute

function timer:setTime(hours, minutes)
  self.hour = hours
  self.minute = minutes
  self.time = timer.hour..":"..timer.minute
end

function timer:addTime(hours, minutes)
  print("Running addTIme")
  self.showDate()
  local count = self.getDate()
  
  if self.hour == 24 then
    count = count + 1
    self:setDate(count)
    self.hour = 0
    timer:rest(0,0,8,0)
  else
    self.hour = self.hour + hours
    if self.hour == 24 then
      count = count + 1
      self:setDate(count)
      self.hour = 0
      timer:rest(0,0,8,0)
    end
    while self.hour > 24 do
      count = count + 1
      self:setDate(count)
      self.hour = self.hour - 24
      if self.hour == 24 then
        count = count + 1
        self:setDate(count)
        self.hour = 0
        timer:rest(0,0,8,0)
      end
    end
  end
  if self.minute == 60 then
    self.hour = self.hour + 1
    self.minute = 0
    timer:rest(0,0,8,0)
  else
    self.minute = self.minute + minutes
    if self.minute == 60 then
      self.hour = self.hour + 1
      self.minute = 0
      timer:rest(0,0,8,0)
    end
    while self.minute > 60 do
      self.hour = self.hour + 1
      self.minute = self.minute - 60
      if self.minute == 60 then
        self.hour = self.hour + 1
        self.minute = 0
        timer:rest(0,0,8,0)
      end
    end
  end
  print(timer.getTime())
  timer:showDate()
end

function timer.getDate()
  if timer.date == "Monday" then
    return 1
  elseif timer.date == "Tuesday" then  
    return 2
  elseif timer.date == "Wednesday" then  
    return 3
  elseif timer.date == "Thursday" then  
    return 4
  elseif timer.date == "Friday" then  
    return 5
  elseif timer.date == "Saturday" then  
    return 6
  elseif timer.date == "Sunday" then  
    return 7
  end
end

function timer:rest(hours, minutes, resthours, restminutes)
  print("Calling rest function")
  if self.hour == hours and self.minute == minutes then
    timer:addTime(resthours, restminutes)
  end
end

function timer:setDate( number )
  self.date = timer.dates[number]
  print(self.date)
end

function timer.showDate()
  print(timer.date)
  return timer.date
end

function timer.getTime()
  if timer.minute == 0 then
    timer.time = timer.hour..":00"
  else
    timer.time = timer.hour..":"..timer.minute
  end
  return timer.time
end

return timer
