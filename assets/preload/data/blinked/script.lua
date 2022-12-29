local fx = 0
function onCreatePost()
	local location = 'misc/daiseye/'
    for i=1,3 do
        makeLuaSprite('eye'..i, location..'Eye'..i, 0, 0)
        scaleObject('eye'..i, 1.4, 1.4)
        setObjectCamera('eye'..i, 'hud')
        screenCenter('eye'..i, 'xy')
        addLuaSprite('eye'..i, true)

        makeLuaSprite('Pupil'..i, location..'Pupil', 0, 0)
        scaleObject('Pupil'..i, 1.4, 1.4)
        setObjectCamera('Pupil'..i, 'hud')
        screenCenter('Pupil'..i, 'xy')
        addLuaSprite('Pupil'..i, true)
    end
    
    setProperty('Pupil3.x', 300)
    setProperty('Pupil3.y', -275)

    setProperty('Pupil2.x', 600)
    setProperty('Pupil2.y', -100)
    setProperty('Pupil1.alpha', 0)
    setProperty('Pupil2.alpha', 0)
    setProperty('Pupil3.alpha', 0)
    setProperty('Eye1.alpha', 0)
    setProperty('Eye2.alpha', 0)
    setProperty('Eye3.alpha', 0)
end

function onUpdate(elapsed)
    for i=1,3 do
        fx = fx+0.65;
        setProperty('pupil'..i..'.y',getProperty('pupil'..i..'.y')-math.sin(fx)*3)
        setProperty('pupil'..i..'.x',getProperty('pupil'..i..'.x')-math.sin(fx)*3)
    end
end

function onEvent(name, value1, value2)
    if name == 'Trigger Eyes' then
        if value1 == 'Rando' then
            setProperty('pupil2.x', 600)
            setProperty('pupil2.y', -100)
            setProperty('pupil1.alpha', 0)
            setProperty('pupil2.alpha', 0)
            setProperty('pupil3.alpha', 0)
            setProperty('eye1.alpha', 0)
            setProperty('eye2.alpha', 0)
            setProperty('eye3.alpha', 0)
            local luckyRoll = math.floor(getRandomInt(1,3))
            setProperty('pupil'..luckyRoll..'.alpha', 1)
            setProperty('eye'..luckyRoll..'.alpha', 1)
            doTweenAlpha('eye1', 'eye1', 0, 5, linear);
            doTweenAlpha('eye2', 'eye2', 0, 5, linear);
            doTweenAlpha('eye3', 'eye3', 0, 5, linear);
		  doTweenAlpha('pupil1', 'pupil1', 0, 5, linear);
            doTweenAlpha('pupil2', 'pupil2', 0, 5, linear);
            doTweenAlpha('pupil3', 'pupil3', 0, 5, linear);
        else
            setProperty('pupil'..value1..'.alpha', 1)
            setProperty('eye'..value1..'.alpha', 1)
        end
   end
		
end

