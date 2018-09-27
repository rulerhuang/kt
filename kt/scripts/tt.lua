-- Find records whose key matches a pattern.
function findpattern(key, value)
  local res = ""
  function proc(tkey, tvalue)
    if string.match(tkey, key) then
      res = res .. tkey .. "\t" .. tvalue .. "\n"
    end
    return true
  end
  _foreach(proc)
  return res
end


-- Find records whose key is within a certain edit distance.
function finddist(key, value)
  value = tonumber(value)
  if not value then
    value = 0
  end
  local res = ""
  function proc(tkey, tvalue)
    if _dist(tkey, key) <= value then
      res = res .. tkey .. "\t" .. tvalue .. "\n"
    end
    return true
  end
  _foreach(proc)
  return res
end


-- Lock a key.
function lock(key, value)
  if _lock(key) then return "" end
end

-- Unlock a key.
function unlock(key, value)
  if _unlock(key) then return "" end
end

-- Seize/pop implementation.
function seize(key, value)
  local res = _get(key)
  if res ~= nil then
    _out(key)
    return res
  end
end


-- Split a string.
function split(key, value)
  if #value < 1 then
    value = nil
  end
  local elems = _split(key, value)
  local res = ""
  for i = 1, #elems do
    res = res .. elems[i] .. "\n"
  end
  return res
end


-- e.g. hash('md5', 'foo bar'), hash('crc32', 'checksum me')
function hash(key, value)
  return _hash(key, value)
end


function time(key, value)
  return string.format("%.6f", _time())
end


function glob(key, value)
  local paths = _glob(key)
  local res = ""
  for i = 1, #paths do
    res = res .. paths[i] .. "\n"
  end
  return res
end
