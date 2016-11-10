-- @author Peter J. Kranz (Absurd-Mind, peter@myref.net)
-- Any questions, criticism or praise just drop me an email

local awful = require("awful")

local M = {}

-- get the current Pid of awesome
local function getCurrentPid()
    -- get awesome pid from /proc
    local fpid = assert(io.open("/proc/self/stat", "r"))
    local t = fpid:read("*all")
    fpid:close()
    pid = string.match(t, "%S+")

    -- sanity check
    if pid == nil then
        return -1
    end

    return pid
end

local function getOldPid(filename)
    -- open file
    local pidFile = io.open(filename)
    if pidFile == nil then
        return -1
    end

    -- read number
    local pid = pidFile:read("*n")
    pidFile:close()

    -- sanity check
    if pid <= 0 then
        return -1
    end

    return pid;
end

local function writePid(filename, pid)
    local pidFile = io.open(filename, "w+")
    pidFile:write(pid)
    pidFile:close()
end

local function shallExecute(oldPid, newPid)
    -- simple check if equivalent
    return not string.find(oldPid,"^" .. newPid .. "$")

end

local function getPidFile()
    local host = io.lines("/proc/sys/kernel/hostname")()
    awful.util.mkdir(awful.util.getdir("cache") .. "/awesome")
    return awful.util.getdir("cache") .. "/awesome." .. host .. ".pid"
end

-- run Once per real awesome start (config reload works)
-- does not cover "pkill awesome && awesome"
function M.run(shellCommand)
    -- check and Execute
    if shallExecute(M.oldPid, M.currentPid) then
        awful.util.spawn_with_shell(shellCommand)
    end
end

M.pidFile = getPidFile()
M.oldPid = getOldPid(M.pidFile)
M.currentPid = getCurrentPid()
writePid(M.pidFile, M.currentPid)

return M
