Config = {}

Config.AntiWallhack = {
    enabled = true,
    debug = false, -- registers the antiesp_check command on the client
    maxDistance = 500.0,
    closeDistance = 0.0,
    discoveryMs = 250,
    tickMs = 20,
    checkMs = 100,
    farCheckMs = 250,
    hideDelayMs = 350,
    rayTimeoutMs = 200,
    rayFailureGraceMs = 1000,
    synchronousFallback = true,
    fallbackAfterFailures = 2,
    fallbackIntervalMs = 100,
    maxRayStartsPerTick = 8,
    maxPendingRays = 64,
    reportMs = 1000,
    leaseMs = 3500,
    maxReportsPerSecond = 4,
    maxTargets = 1024,
    positionRequestMs = 250,
    positionTimeoutMs = 1500,
    maxPositionRequestsPerSecond = 8,
    reciprocalVisibility = false,
    traceFlags = 19,
    traceOptions = 7,
    revealInteriors = false,
    revealVehicles = false,
    revealDeadPlayers = false,
    revealWhileSpectating = false,
}

-- Startup validation: invalid values fall back to safe defaults instead of breaking the scheduler.
do
    local cfg = Config.AntiWallhack
    local numeric = {
        -- key = { minimum, default }
        maxDistance = { 1.0, 500.0 },
        closeDistance = { 0.0, 0.0 },
        discoveryMs = { 50, 250 },
        tickMs = { 1, 20 },
        checkMs = { 10, 100 },
        farCheckMs = { 10, 250 },
        hideDelayMs = { 0, 350 },
        rayTimeoutMs = { 20, 200 },
        rayFailureGraceMs = { 0, 1000 },
        fallbackAfterFailures = { 1, 2 },
        fallbackIntervalMs = { 0, 100 },
        maxRayStartsPerTick = { 1, 8 },
        maxPendingRays = { 1, 64 },
        reportMs = { 100, 1000 },
        leaseMs = { 500, 3500 },
        maxReportsPerSecond = { 1, 4 },
        maxTargets = { 1, 1024 },
        positionRequestMs = { 50, 250 },
        positionTimeoutMs = { 100, 1500 },
        maxPositionRequestsPerSecond = { 1, 8 },
        traceFlags = { 0, 19 },
        traceOptions = { 0, 7 },
    }

    for key, rule in pairs(numeric) do
        local value = cfg[key]

        if type(value) ~= 'number' or value ~= value or value == math.huge or value < rule[1] then
            print(('[antiwallhack] invalid config value for "%s", using default %s'):format(key, tostring(rule[2])))
            cfg[key] = rule[2]
        end
    end

    for _, key in ipairs({
        'enabled', 'debug', 'synchronousFallback', 'reciprocalVisibility', 'revealInteriors',
        'revealVehicles', 'revealDeadPlayers', 'revealWhileSpectating',
    }) do
        cfg[key] = cfg[key] == true
    end
end
