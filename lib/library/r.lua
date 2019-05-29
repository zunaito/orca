local R = function (self, x, y, glyph)

  self.y = y
  self.x = x
  
  self.glyph = glyph
  self.passive = glyph == string.lower(glyph) and true 
  self.name = 'random'
  self.info = 'Outputs a random value.'

  self.ports = {
    {-1, 0, 'in-a', 'haste'}, 
    { 1, 0, 'in-b', 'input'}, 
    {0, 1, 'r-output', 'output'}
  }
  
    local a = self:listen(self.x - 1, self.y) or 0
    local b = self:listen(self.x + 1, self.y) or 35
    local l = self.data.cell[self.y][self.x + 1] ~= '.' and self.data.cell[self.y][self.x + 1]
    local cap = l == self.up(l) and true
    if b < a then a,b = b,a end
    local val = self.chars[math.random(a, b)]
    local value = cap and self.up(val) or val

  if not self.passive then
    self:spawn(self.ports)
    self.data.cell[self.y + 1][self.x] = value
  else
    if self:banged() then
      self.data.cell[self.y + 1][self.x] = value
    end
  end
  
end

return R