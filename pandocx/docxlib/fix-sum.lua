-- fix-sum.lua
-- 只改写“只有下限”的 \sum，变为 \underset{...}{\sum}
-- 支持 \sum_{k} 和 \sum_k 两种写法；\limits 可有可无

local function next_nonspace(s, j)
  while j <= #s do
    local ch = s:sub(j, j)
    if not ch:match("%s") then return j, ch end
    j = j + 1
  end
  return nil, nil
end

local function replace_only_lower(tex)
  local i = 1
  local out = ""
  while true do
    -- 先匹配带花括号的写法：\sum [\limits] _{...}
    local s, e, lower = tex:find("\\sum%s*(\\limits%s*)?_%s*{([^}]+)}", i)
    local form = "braced"
    if not s then
      -- 再匹配不带花括号的：\sum [\limits] _k
      s, e, lower = tex:find("\\sum%s*(\\limits%s*)?_%s*([%a%d]+)", i)
      form = "bare"
    end
    if not s then
      out = out .. tex:sub(i)
      break
    end

    -- 复制匹配前的部分
    out = out .. tex:sub(i, s - 1)

    -- 检查后面是否紧跟上限 ^
    local j, ch = next_nonspace(tex, e + 1)
    local has_upper = (ch == "^")

    if has_upper then
      -- 有上限的情况不改写，原样输出匹配段
      out = out .. tex:sub(s, e)
      i = e + 1
    else
      -- 只有下限：改写成 \underset{lower}{\sum}
      out = out .. "\\underset{" .. lower .. "}{\\sum}"
      i = e + 1
    end
  end
  return out
end

function Math(m)
  if m.mathtype == "InlineMath" or m.mathtype == "DisplayMath" then
    local before = m.text
    local after = replace_only_lower(before)
    if after ~= before then
      m.text = after
    end
    return m
  end
end