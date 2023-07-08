local M = {}

path = "/home/justed/projects/freshauto/crm/spec"
command = "rg shared_examples_for --no-filename --no-line-number " .. path

local handle = io.popen(command)
local result = handle:read("*a")
handle:close()

function dump(o)
   if type(o) == 'table' then
      local s = '{\r\n'
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '  ['..k..'] = ' .. dump(v) .. '\r\n'
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

local all_shared_examples_definitions = {}
for line in result:gmatch("[^\r\n]+") do
  line = string.match(line, [['([^']+)']])
  --print(line)
  table.insert(all_shared_examples_definitions, line)
end

local hash = {}
local unique_shared_examples_definitions = {}

for _, value in ipairs(all_shared_examples_definitions) do
  if (not hash[value]) and value then
    unique_shared_examples_definitions[#unique_shared_examples_definitions + 1] = value
    hash[value] = true
  end
end

print(dump(unique_shared_examples_definitions))
