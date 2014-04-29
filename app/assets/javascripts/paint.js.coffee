jQuery ($) ->
    screen2client = (e) ->
        [px, py] = if e.type.startsWith('touch') then [e.originalEvent.touches[0].clientX, e.originalEvent.touches[0].clientY] else [e.clientX, e.clientY]
        rect = e.target.getBoundingClientRect()
        {x: px - rect.left, y: py - rect.top}
    drawFlag = false
    oldX = 0
    oldY = 0
    $canvas = $('#paper')
    $canvas.on 'mousedown touchstart', (e) ->
        drawFlag = true
        {x, y} = screen2client(e)
        [oldX, oldY] = [x, y]
    $canvas.on 'mouseup mouseout touchend touchcancel', ->
        drawFlag = false
        data = $canvas[0].toDataURL()
        $($canvas.data('target')).val(data)
    $canvas.on 'mousemove touchmove', (e) ->
        return unless drawFlag
        {x, y} = screen2client(e)
        context = $canvas[0].getContext('2d')
        context.strokeStyle = '#C71C22'
        context.lineWidth = 1
        context.beginPath()
        context.moveTo(oldX, oldY)
        context.lineTo(x, y)
        context.stroke()
        context.closePath()
        oldX = x
        oldY = y
        e.preventDefault()
        return
    $('.clear-canvas').on 'click', ->
        context = $canvas[0].getContext('2d')
        context.clearRect(0, 0, $canvas[0].width, $canvas[0].height)
        $($canvas.data('target')).val(null)
        
    $(document).ready(ready)
    $(document).on('page:load', ready)
