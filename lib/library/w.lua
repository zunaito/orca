W = function(self, x, y, frame, grid)
  self.name = 'W'
  self.x = x
  self.y = y
  if self:active() then
    self:move(-1,0)
  elseif self.banged(x,y) then
    self:move(-1,0)
  end
end

return W