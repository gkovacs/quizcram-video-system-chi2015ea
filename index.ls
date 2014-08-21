root = exports ? this

J = $.jade

{sum} = require \prelude-ls

# Date.now = Date.now || -> +new Date

stringEach = (l) ->
  output = []
  for x in l
    if x.split?
      output.push [$('<span>').text(y).html() for y in x.split("\n")].join('<br>')
    else
      output.push x.toString()
  return output

root.video_info = {
  '1-1-1': {
    filename: '1-1-1.webm'
    title: 'The Four Functions'
    parts: [
      {
        start: '0:00'
        end: '2:40'
      }
      {
        start: '2:40'
        end: '3:53'
      }
      {
        start: '3:53'
        end: '5:22'
      }
      {
        start: '5:22' # noquiz
        end: '6:15'
      }
    ]
  }
  '1-1-2': {
    filename: '1-1-2.webm'
    title: 'Central Anatomy'
    parts: [
      {
        start: '0:00'
        end: '4:54'
      }
      {
        start: '4:54'
        end: '5:48'
      }
      {
        start: '5:48' # noquiz
        end: '6:56'
      }
    ]
  }
  '1-2-1': {
    filename: '1-2-1.webm'
    title: 'Meet the Stars: Neurons'
    parts: [
      {
        start: '0:00'
        end: '2:01'
      }
      {
        start: '2:01' # noquiz
        end: '2:20'
      }
    ]
  }
  '1-2-2': {
    filename: '1-2-2.webm'
    title: 'Parts of the Neuron'
    parts: [
      {
        start: '0:00'
        end: '2:57'
      }
      {
        start: '2:57'
        end: '3:30'
      }
      {
        start: '3:30' # noquiz
        end: '3:58'
      }
    ]
  }
  '1-2-3': {
    filename: '1-2-3.webm'
    title: 'Neuronal Uniqueness: Stars of the Sky'
    parts: [
      {
        start: '0:00'
        end: '8:39'
      }
      {
        start: '8:39' # noquiz
        end: '8:58'
      }
    ]
  }
  '1-2-4': {
    filename: '1-2-4.webm'
    title: 'Meet the Support Staff: Glial Cells'
    parts: [
      {
        start: '0:00'
        end: '3:14'
      }
      {
        start: '3:14' # noquiz
        end: '3:47'
      }
    ]
  }
  '1-2-5': {
    filename: '1-2-5.webm'
    title: 'Myelin'
    parts: [
      {
        start: '0:00'
        end: '2:10'
      }
      {
        start: '2:10'
        end: '5:03'
      }
      {
        start: '5:03' # noquiz
        end: '5:20'
      }
    ]
  }
  '1-2-6': {
    filename: '1-2-6.webm'
    title: 'Demyelinating Diseases'
    parts: [
      {
        start: '0:00'
        end: '2:51'
      }
      {
        start: '2:51' # noquiz
        end: '3:06'
      }
    ]
  }
  '1-3-1': {
    filename: '1-3-1.webm'
    title: 'Meninges'
    parts: [
      {
        start: '0:00'
        end: '1:58'
      }
      {
        start: '1:58'
        end: '4:02'
      }
      {
        start: '4:02' # noquiz
        end: '5:49'
      }
    ]
  }
  '1-3-2': {
    filename: '1-3-2.webm'
    title: 'Peripheral Diseases'
    parts: [
      {
        start: '0:00'
        end: '4:51'
      }
      {
        start: '4:51' # noquiz
        end: '6:09'
      }
    ]
  }
  '1-3-3': {
    filename: '1-3-3.webm'
    title: 'Brain Tumors'
    parts: [
      {
        start: '0:00'
        end: '5:06'
      }
      {
        start: '5:06' # noquiz
        end: '5:46'
      }
    ]
  }
  '1-3-4': {
    filename: '1-3-4.webm'
    title: 'Looking Ahead: Course Preview'
    parts: [
      {
        start: '0:00' # noquiz
        end: '3:41'
      }
    ]
  }
}

root.video_dependencies = {
  '1-1-1': []
  '1-1-2': [ '1-1-1' ]
  '1-2-1': [ '1-1-2' ]
  '1-2-2': [ '1-2-1' ]
  '1-2-3': [ '1-2-2' ]
  '1-2-4': [ '1-2-3' ]
  '1-2-5': [ '1-2-4' ]
  '1-2-6': [ '1-2-5' ]
  '1-3-1': [ '1-2-6' ]
  '1-3-2': [ '1-3-1' ]
  '1-3-3': [ '1-3-2' ]
  '1-3-4': [ '1-3-3' ]
}

getAllDependencies = root.getAllDependencies = (videoname) ->
  if not root.video_dependencies[videoname]?
    return []
  else
    output = root.video_dependencies[videoname]
    for x in root.video_dependencies[videoname]
      output = output ++ getAllDependencies(x)
    return output

root.questions = [
  {
    text: 'Which of the following are voluntary movements?'
    title: '1-1-1 Question 1'
    type: 'checkbox'
    options: [
      'Laughing at a joke' #
      'Moving food through the intestinal tract'
      'Crying when you hear bad news' #
      'Breathing' #
      'Pumping blood through the circulatory system'
    ]
    correct: [
      0, 2, 3
    ]
    explanation: 'Voluntary movements are self-generated actions driven by the brain. These can be deliberate movements or emotional reactions.'
    videos: [
      {
        name: '1-1-1'
        degree: 1.0
        part: 0
      }
    ]
  }
  {
    text: 'Which of the following stimuli are sensed but not perceived?'
    title: '1-1-1 Question 2'
    type: 'checkbox'
    options: [
      'Vibration'
      'Skin warming'
      'Skin incision'
      'An increase in blood oxygen concentration' #
      'Lung pressure' #
    ]
    correct: [
      3, 4
    ]
    explanation: 'Our bodies are able to detect things (like carbon dioxide concentration in the blood) that we are not able to perceive. Perceivable stimuli are those we are capable of being aware of.'
    videos: [
      {
        name: '1-1-1'
        degree: 1.0
        part: 1
      }
    ]
  }
  {
    text: 'Which of the following are influenced by homeostatic brain functions?'
    title: '1-1-1 Question 3'
    type: 'checkbox'
    options: [
      'Digestion'
      'Breathing'
      'Sleeping'
      'Eating'
      'Blood pressure'
    ]
    correct: [
      0, 1, 2, 3, 4
      # none checked
    ]
    explanation: 'Homeostasis is the process of maintaining healthy internal conditions, such as body temperature, pH, and blood oxygen levels. All of the functions listed as answer options are influenced by homeostatic brain functions.'
    videos: [
      {
        name: '1-1-1'
        degree: 1.0
        part: 2
      }
    ]
    /*
    text: 'Which of the following are not influenced by homeostatic brain functions?'
    title: '1-1-1 Question 3'
    type: 'checkbox'
    options: [
      'Digestion'
      'Breathing'
      'Sleeping'
      'Eating'
      'Blood pressure'
    ]
    correct: [
      # none checked
    ]
    explanation: 'Homeostasis is the process of maintaining healthy internal conditions, such as body temperature, pH, and blood oxygen levels. All of the functions listed as answer options are influenced by homeostatic brain functions.'
    videos: [
      {
        name: '1-1-1'
        degree: 1.0
        part: 2
      }
    ]
    */
  }
  {
    text: 'Which of the following are true of the brainstem?'
    title: '1-1-2 Question 1'
    type: 'checkbox'
    options: [
      'Contained in the skull' #
      'Is involved in homeostasis' #
      'Contains motoneurons that control voluntary muscles of the arms and legs'
      'Contains two parts: the midbrain and the hindbrain' #
      'Is viewed more completely in a mid-sagittal cut than from the side' #
    ]
    correct: [
      0, 1, 3, 4
    ]
    explanation: '(see correct answers above)'
    videos: [
      {
        name: '1-1-2'
        degree: 1.0
        part: 0
      }
    ]
  }
  {
    text: 'Which of the following are true of the forebrain?'
    title: '1-1-2 Question 2'
    type: 'checkbox'
    options: [
      'Contained in the skull' #
      'Smaller than the brainstem'
      'Contains motoneurons that control voluntary muscles'
      'Location of abstract cognitive functions' #
      'Required for sensory perception' #
    ]
    correct: [
      0, 3, 4
    ]
    explanation: 'The forebrain includes the cerebral cortex and is the "seat of consciousness." All perception and abstract cognitive functions like memory are contained in the forebrain.'
    videos: [
      {
        name: '1-1-2'
        degree: 1.0
        part: 1
      }
    ]
  }
  {
    text: 'Which of the following are true about neurons?'
    title: '1-2-1 Question 1'
    type: 'checkbox'
    options: [
      'There are far more different types of neurons than there are types of bone or pancreatic cells' #
      'Neurons can be longer than any other type of cell in the body' #
      'Neurons are the most important cell type in the nervous system' #
      'There are only about 10 different types of neurons'
    ]
    correct: [
      0, 1, 2
    ]
    explanation: '(see correct answers above)'
    videos: [
      {
        name: '1-2-1'
        degree: 1.0
        part: 0
      }
    ]
  }
  {
    text: 'Which of the following are true about neurons?'
    title: '1-2-2 Question 1'
    type: 'checkbox'
    options: [
      'Dendrites receive information' #
      'The cell body is a cellular part unique to neurons'
      'The synapse is a place of communication between neurons' #
      'Axons carry information from synaptic terminals to the dendrites'
      'There is an empty space between neurons at the synapse' #
    ]
    correct: [
      0, 2, 4
    ]
    explanation: '(see correct answers above)'
    videos: [
      {
        name: '1-2-2'
        degree: 1.0
        part: 0
      }
    ]
  }
  {
    text: 'Which of the following could be on the receiving end of a synapse?'
    title: '1-2-2 Question 2'
    type: 'checkbox'
    options: [
      'Neuronal dendrites' #
      'Skeletal muscle' #
      'Salivary gland' #
      'Smooth muscle in the intestines' #
      'Cardiac muscle of the heart' #
    ]
    correct: [
      0, 1, 2, 3, 4
    ]
    explanation: '(see correct answers above)'
    videos: [
      {
        name: '1-2-2'
        degree: 1.0
        part: 1
      }
    ]
  }
  {
    text: 'Neurons can differ in which of the following features?'
    title: '1-2-3 Question 1'
    type: 'checkbox'
    options: [
      'Connectivity' #
      'Excitability' #
      'Neurotransmitters' #
      'Appearance' #
      'Location' #
    ]
    correct: [
      0, 1, 2, 3, 4
    ]
    explanation: '(see correct answers above)'
    videos: [
      {
        name: '1-2-3'
        degree: 1.0
        part: 0
      }
    ]
  }
  {
    text: 'Which of the following are true of glial cells?'
    title: '1-2-4 Question 1'
    type: 'checkbox'
    options: [
      'There are more types of glial cells than there are types of neurons'
      'Glial cells outnumber neurons' #
      'Astrocytes are the most common type of glial cell' #
      'One type of glial cell makes myelin wherever it is found'
      'Glial cells are critical to brain development' #
    ]
    correct: [
      1, 2, 4
    ]
    explanation: '(see correct answers above)'
    videos: [
      {
        name: '1-2-4'
        degree: 1.0
        part: 0
      }
    ]
  }
  {
    text: 'Which of the following are true of myelin?'
    title: '1-2-5 Question 1'
    type: 'checkbox'
    options: [
      'Myelin reduces the time needed for the brain to send messages.' #
      'Information travels faster on the unmyelinated axons than on the myelinated axons.'
      'Myelin helps humans react more quickly to perceived information.' #
      'About 1/100th of a second is needed for an action potential to travel from the toe to the brain along a myelinated axon.' #
    ]
    correct: [
      0, 2, 3
    ]
    explanation: '(see correct answers above)'
    videos: [
      {
        name: '1-2-5'
        degree: 1.0
        part: 0
      }
    ]
  }
  {
    text: 'Which of the following are true?'
    title: '1-2-5 Question 2'
    type: 'checkbox'
    options: [
      'The neural code consists of a temporal pattern of action potentials.' #
      'Demyelination disrupts the patterning of action potentials.' #
      'Demyelination can result in some action potentials failing to make it to the end of an axon.' #
      'Sometimes demyelination speeds up action potential conduction (another name for travel).'
      'In myelinated axons, spikes jump from one inter-myelin space (called a node) to the next one.' #
    ]
    correct: [
      0, 1, 2, 4
    ]
    explanation: '(see correct answers above)'
    videos: [
      {
        name: '1-2-5'
        degree: 1.0
        part: 1
      }
    ]
  }
  {
    text: 'Which of the following are true?'
    title: '1-2-6 Question 1'
    type: 'checkbox'
    options: [
      'Mutliple sclerosis, a central demyelinating disease, is a disorder of Schwann cells.'
      'Peripheral demyelinating diseases usually impair motor abilities' #
      'Demyelination disrupts the neural code' #
      'The symptoms produced by all central demyelinating diseases are the same'
      'Diseases of different types of glial cells have different effects' #
    ]
    correct: [
      1, 2, 4
    ]
    explanation: '(see correct answers above)'
    videos: [
      {
        name: '1-2-6'
        degree: 1.0
        part: 0
      }
    ]
  }
  {
    text: 'Which of the following are true about the meninges?'
    title: '1-3-1 Question 1'
    type: 'checkbox'
    options: [
      'The outermost meningeal layer, the dura, is the toughest' #
      'The brain is contained within a sack of fluid' #
      'The innermost meningeal layer, the pia, is the most delicate' #
      'There are two meningeal membranes'
      'Low impact blows to the head typically do not produce a concussion' #
    ]
    correct: [
      0, 1, 2, 4
    ]
    explanation: '(see correct answers above)'
    videos: [
      {
        name: '1-3-1'
        degree: 1.0
        part: 0
      }
    ]
  }
  {
    text: 'Which of the following are central neurons?'
    title: '1-3-1 Question 2'
    type: 'checkbox'
    options: [
      'Forebrain neurons' #
      'Motoneurons in the brainstem' #
      'Sensory neurons that respond to injury'
      'Autonomic motor neurons'
    ]
    correct: [
      0, 1
    ]
    explanation: '(see correct answers above)'
    videos: [
      {
        name: '1-3-1'
        degree: 1.0
        part: 1
      }
    ]
  }
  {
    text: 'Which of the following are true of viruses and large molecues such as toxins?'
    title: '1-3-2 Question 1'
    type: 'checkbox'
    options: [
      'They can affect peripheral neurons including sensory neurons' #
      'They can kill affected cells' #
      'They never get through the meninges to reach the central neurons'
      'They can cause changes in the skin innervated by sensory neurons' #
      'All of the above'
    ]
    correct: [
      0, 1, 3
    ]
    explanation: '(see correct answers above)'
    videos: [
      {
        name: '1-3-2'
        degree: 1.0
        part: 0
      }
    ]
  }
  {
    text: 'Which of the following are true of brain tumors?'
    title: '1-3-3 Question 1'
    type: 'checkbox'
    options: [
      'Tumors that start outside the brain can spread to the brain'
      'Intracranial tumors are problematic because they increase pressure within the skull'
      'The most common type of brain tumor is a tumor of immortalized neurons'
      'Glial cells are post-mitotic and therefore do not become cancerous'
    ]
    correct: [
      0, 1
    ]
    explanation: '(see correct answers above)'
    videos: [
      {
        name: '1-3-3'
        degree: 1.0
        part: 0
      }
    ]
  }
]


do ->
  for question,idx in root.questions
    question.idx = idx

#root.questions = root.questions[0 to 3] # TEMPORARY # TODO remove this

/*
root.video_info = {
  '3-3': {
    filename: '3-3.mp4'
    title: ''
  }
  '3-1': {
    filename: '3-1.mp4'
  }
}

root.video_dependencies = {
  '3-3': [
    {
      name: '3-1'
      degree: 1.0
    }
  ]
  '3-1': [
    {
      name: '3-1'
      degree: 1.0
    }
  ]
}

root.questions = [
  {
    text: 'How many distinct strings are in the language of the regular expression: (0+1+ϵ)(0+1+ϵ)(0+1+ϵ)(0+1+ϵ) ?'
    title: 'Question 1'
    type: 'radio'
    options: stringEach [
      81, 12, 31, 32, 16, 64
    ]
    correct: 2
    explanation: 'We have 16 distinct strings of length 4, 8 distinct strings of length 3, 4 distinct strings of length 2, 2 distinct strings of length 1, and one empty string. In total, we have 16+8+4+2+1=31 distinct strings.'
    videos: [
      {
        name: '3-3'
        degree: 1.0
      }
    ]
  }
  {
    text: 'Consider the string abbbaacc. Which of the following lexical specifications produces the tokenization ab/bb/a/acc ?'
    title: 'Question 2'
    type: 'checkboxes'
    options: stringEach [
      'b+\nab*\nac*', 'c*\nb+\nab\nac*', 'ab\nb+\nac*', 'a(b + c*)\nb+'
    ]
    explanation: 'some long explanation'
  }
]
*/

root.username = 'defaultuser'

randomFromList = (list) ->
  return list[Math.floor(Math.random() * list.length)]

randomString = (length) ->
  alphabet = [\a to \z] ++ [\A to \Z] ++ [\0 to \9]
  return [randomFromList(alphabet) for x in [0 til length]].join('')

do ->
  if $.cookie('username')?
    root.username = $.cookie('username')
  else
    root.username = randomString(14)
    $.cookie('username', root.username)

getlog = root.getlog = (callback) ->
  $.getJSON '/viewlog?' + $.param({username: root.username}), (logs) ->
    for line in logs
      console.log JSON.stringify(line)
    callback logs

postJSON = root.postJSON = (url, jsondata, callback) ->
  $.ajax {
    type: 'POST'
    url: url
    data: JSON.stringify(jsondata)
    success: (data) ->
      if callback?
        callback data
      else
        console.log data
    contentType: 'application/json'
    #dataType: 'json'
  }

clearlog = root.clearlog = ->
  postJSON '/clearlog', {
    username: root.username
  }

root.logged-data = []
root.logging-disabled = false

ensureLoggedToServer = (list, name) ->
  if not name?
    name = randomString(14)
  if not root.server-received-logidx?
    root.server-received-logidx = {}
  if root.server-received-logidx[name]?
    console.log 'already ensuring logged to server: ' + name
    return
  root.server-received-logidx[name] = -1
  setInterval ->
    nextidx = root.server-received-logidx[name] + 1
    if nextidx < list.length
      # have new data to send
      console.log 'sending item ' + nextidx
      postJSON '/addlog', list[nextidx], (updated-idx) ->
        console.log 'updated-idx: ' + updated-idx
        updated-idx = parseInt(updated-idx)
        if isFinite(updated-idx)
          root.server-received-logidx[name] = updated-idx
  , 350

addlogReal = root.addlogReal = (data) ->
  if not data.logidx?
    data.logidx = root.logged-data.length
  root.logged-data.push data
  #postJSON '/addlog', data

addlog = root.addlog = (logdata) ->
  if root.logging-disabled
    return
  data = $.extend {}, logdata
  if not data.username?
    data.username = root.username
  if not data.time?
    data.time = Date.now()
  if not data.timeloc?
    data.timeloc = new Date().toString()
  if not data.automatic? and root.automatic-trigger
    data.automatic = true
    root.automatic-trigger = false
  addlogReal data

root.counter_values = {}

counterNext = root.counterNext = (name) ->
  if not root.counter_values[name]?
    root.counter_values[name] = 0
  else
    root.counter_values[name] += 1
  return root.counter_values[name]

counterSet = root.counterSet = (name, val) ->
  root.counter_values[name] = val

counterCurrent = root.counterCurrent = (name) ->
  if not root.counter_values[name]
    return 0
  return root.counter_values[name]

toPercent = (num) ->
  #return (num * 100).toFixed(2)
  return (num * 100).toFixed(0)

toSeconds = (time) ->
  if not time?
    return null
  if typeof time == 'number'
    return time
  if typeof time == 'string'
    timeParts = [parseInt(x) for x in time.split(':')]
    if timeParts.length == 0
      return null
    if timeParts.length == 1
      return timeParts[0]
    if timeParts.length == 2
      return timeParts[0]*60 + timeParts[1]
    if timeParts.length == 3
      return timeParts[0]*3600 + timeParts[1]*60 + timeParts[2]
  return null

getVideoEnd = (vidinfo) ->
  return toSeconds(vidinfo.parts[*-1].end)

getVideoStartEnd = (vidname, vidpart) ->
  vidinfo = root.video_info[vidname]
  if vidpart?
    {start,end} = vidinfo.parts[vidpart]
    return [toSeconds(start), toSeconds(end)]
  else
    start = 0
    end = getVideoEnd vidinfo
    return [toSeconds(start), toSeconds(end)]

root.video-parts-seen = []
console.log 'vidinfo!!!---------------------==================='
do ->
  for vidname,vidinfo of root.video_info
    seen = [0] * (Math.round(getVideoEnd(vidinfo)) + 1)
    root.video-parts-seen[vidname] = seen

getVideoProgress = root.getVideoProgress = (vidname, vidpart) ->
  [start,end] = getVideoStartEnd vidname, vidpart
  viewing-history = root.video-parts-seen[vidname]
  relevant-section = viewing-history[Math.round(start) to Math.round(end)]
  return sum(relevant-section) / relevant-section.length

markVideoSecondWatched = root.markVideoSecondWatched = (vidname, vidpart, second) ->
  [start,end] = getVideoStartEnd vidname, vidpart
  viewing-history = root.video-parts-seen[vidname]
  viewing-history[Math.round(second + start)] = 1

setWatchButtonProgress = root.setWatchButtonProgress = (vidname, vidpart, percent-viewed) ->
  $('.watch_' + toVidnamePart(vidname, vidpart)).data('progress', percent-viewed).text('watch video (' + toPercent(percent-viewed) + '% seen)')
  $('.review_' + toVidnamePart(vidname, vidpart)).data('progress', percent-viewed).text('review video before answering again (' + toPercent(percent-viewed) + '% seen)')

updateWatchButtonProgress = root.updateWatchButtonProgress = (vidname, vidpart) ->
  console.log "setWatchButtonProgress(#vidname, #vidpart)"
  percent-viewed = getVideoProgress vidname, vidpart
  console.log 'percent-viewed: ' + percent-viewed
  setWatchButtonProgress vidname, vidpart, percent-viewed

timeUpdatedReal = (qnum) ->
  video = $("\#video_#qnum")
  #body = getBody qnum
  vidname = getVidname qnum
  vidpart = getVidpart qnum
  /*
  if not video.data('duration')?
    video.data 'duration', video[0].duration
  if not video.data('viewed')?
    video.data('viewed', [0]*(Math.round(video.data 'duration')+1))
  viewed = video.data('viewed')
  if video.length > 0
    curtime = video[0].currentTime
    viewed[Math.round(curtime)] = 1
  percent-viewed = sum(viewed) / viewed.length
  */
  if video.length > 0
    curtime = video[0].currentTime
    markVideoSecondWatched vidname, vidpart, curtime
  percent-viewed = getVideoProgress vidname, vidpart
  $('#progress_' + qnum).text(toPercent(percent-viewed) + '% seen')
  setWatchButtonProgress vidname, vidpart, percent-viewed

timeUpdated = root.timeUpdated = _.throttle timeUpdatedReal, 1000

setStartTime = root.setStartTime = (time, qnum) ->
  video = $("\#video_#qnum")
  video[0].currentTime = time

insertAfter = (qnum, contents) ->
  console.log "insertAfter #qnum #contents"
  contents.insertAfter $("\#body_#qnum")

isVideoFocused = root.isVideoFocused = ->
  video = $(\.activevideo)
  if not video? or not video.length? or video.length < 1
    return false
  return video.data('focused')

timeSinceVideoFocus = root.timeSinceVideoFocus = ->
  video = $(\.activevideo)
  if not video? or not video.length? or video.length < 1
    return 0
  if not video.data('focused')
    return 0
  if not video.data('timeVideoFocused')
    return 0
  return (Date.now() - video.data('timeVideoFocused')) / 1000

setVideoFocused = root.setVideoFocused = (isFocused) ->
  video = $(\.activevideo)
  if not video? or not video.length? or video.length < 1
    return false
  if isFocused
    video.data('timeVideoFocused', Date.now())
    video-top = video.offset().top
    $(window).scrollTop(video-top)
  else
    pauseVideo()
  video.data('focused', isFocused)

removeAllVideos = root.removeAllVideos = ->
  $('.videopanel').remove()

insertVideo = (vidname, vidpart, reasonForInsertion) ->
  [start,end] = getVideoStartEnd vidname, vidpart
  qnum = counterNext 'qnum'
  vidnamepart = toVidnamePart(vidname, vidpart)
  body = J('.panel-body').attr('id', "body_#qnum").data(\qnum, qnum).addClass(\videopanel).addClass("video_#vidnamepart").data(\type, \video).data(\vidname, vidname).data(\vidpart, vidpart)
  console.log vidname
  basefilename = root.video_info[vidname].filename
  fileurl = '/segmentvideo?video=' + basefilename + '&' + $.param {start: start, end: end}
  title = root.video_info[vidname].title
  # {filename, title} = root.video_info[vidinfo.name]
  fulltitle = title
  if vidpart?
    fulltitle = fulltitle + ' part ' + (vidpart+1)
  $('.activevideo').removeClass 'activevideo'
  videodiv = J(\div)
    .css \position, \relative
    .css \width, \100%
  video = J('video')
    .attr('id', "video_#qnum")
    .attr('controls', 'controls')
    .attr('ontimeupdate', 'timeUpdated(' + qnum + ')')
    .css('width', '100%')
    .addClass('activevideo')
    #.data('focused', true)
    .click (evt) ->
      console.log 'mousedown video ' + qnum
      gotoNum qnum
      if not isVideoPlaying()
        playVideo()
        evt.preventDefault()
        return false
      /*
      if not $(this).hasClass \activevideo
        console.log 'mousedown video not active ' + qnum
        $(\.activevideo).removeClass \activevideo
        $(this).addClass \activevideo
      setVideoFocused(true)
      */
    .append J('source')
      .attr('src', fileurl)
  #setInterval ->
  #  console.log $("\#video_#qnum")[0].currentTime
  #, 1000
  console.log video
  video-header = J(\div)
    .css \width, \100%
    .css \background-color, 'rgba(0, 0, 0, 0.7)'
    #.css \height, \100px
    .css \position, \absolute
    .css \top, \0px
  video-header.append J('h3').css(\color, \white).css(\float, \left).css(\margin-left, \10px).css(\margin-top, \10px).text fulltitle
  video-header.append J('h3#progress_' + qnum).css(\color, \white).css(\float, \left).css(\margin-left, \10px).css(\margin-top, \10px).css(\display, \none).text 'foobar'
  if reasonForInsertion?
    video-header.append $(reasonForInsertion).addClass('insertionreason').css(\color, \white).css(\float, \left).css(\margin-left, \10px).css(\margin-top, \10px)
  videodiv.append video
  videodiv.append video-header
  body.append videodiv
  body.append J 'br'
  if (vidpart? and vidpart > 0) or (root.video_dependencies[vidname]? and root.video_dependencies[vidname].length > 0)
    #body.append J('button.btn.btn-primary.btn-lg').text("show related videos from earlier").click (evt) ->
    video-header.append J(\h3.linklike).css(\float, \left).css(\margin-left, \10px).css(\margin-top, \10px).text('view previous clip').click (evt) ->
      console.log 'do not understand video'
      console.log vidname
      viewPreviousClip vidname, vidpart
      #showChildVideo qnum
      #dependencies = []
      #for prevpart in [0 til partnum]
      #  dependencies.push [vidname, prevpart]
      #dependencies = dependencies ++ [[x,null] for x in root.video_dependencies[vidname]]
      /*
      dependencies = getVideoDependencies vidname, partnum
      for [dependency,vidnum] in dependencies
        console.log dependency
        console.log root.video_info[dependency]
        insertAfter qnum, (insertVideo dependency, vidnum, "<h3>(to help you understand <span class='linklike' onclick='gotoNum(#qnum)'>#title</span>)</h3>")
        addVideoDependsOnQuestion qnum, counterCurrent(\qnum)
        gotoNum counterCurrent(\qnum)
        break
      */
  return body

root.question-to-video-dependencies = {}

addVideoDependsOnQuestion = root.addVideoDependsOnQuestion = (qnum-question, qnum-video) ->
  if not root.question-to-video-dependencies[qnum-question]?
    root.question-to-video-dependencies[qnum-question] = []
  root.question-to-video-dependencies[qnum-question].push qnum-video

getVideosDependingOnQuestion = root.getVideosDependingOnQuestion = (qnum-question) ->
  return question-to-video-dependencies[qnum-question]

/*
insertReview = (question) ->
  console.log 'reviewing!'
  numvideos = 0
  numvideos = question.videos.length if question.videos?
  qnum-question = counterCurrent(\qnum) + numvideos + 1
  console.log 'qnum-question ' + qnum-question
  #$('#quizstream').append J('h3').text('We suggest you review the following videos:')
  if question.videos?
    for vidinfo in question.videos
      $('#quizstream').append insertVideo vidinfo.name, vidinfo.part, "<h3>(to help you understand <a href='\#body_#{qnum-question}' onclick='setVideoFocused(false)'>#{question.title}</a>)</h3>"
      addVideoDependsOnQuestion qnum-question, counterCurrent(\qnum)
  #$('#quizstream').append J('.panel.panel-default').append body
  insertQuestion question, {skip-video: true}
  console.log 'qnum-question and actual: ' + qnum-question + ' vs ' + counterCurrent(\qnum)
*/

getType = (qnum) ->
  return $("\#body_#qnum").data \type

bodyExists = (qnum) ->
  return $("\#body_#qnum").length > 0

getBody = root.getBody = (qnum) ->
  return $("\#body_#qnum")

getQidx = (qnum) ->
  return $("\#body_#qnum").data \qidx

getVidnameForQuestion = (question) ->
  vidinfo = question.videos[0]
  vidname = vidinfo.name
  return vidname

getVidpartForQuestion = (question) ->
  vidinfo = question.videos[0]
  vidpart = vidinfo.part
  return vidpart

getVidnamePartForQuestion = (question) ->
  vidinfo = question.videos[0]
  vidname = vidinfo.name
  vidpart = vidinfo.part
  if vidpart?
    return vidname + '_' + vidpart
  else
    return vidname

toVidnamePart = (vidname, vidpart) ->
  if vidpart?
    return vidname + '_' + vidpart
  else
    return vidname

getVidnamePart = (qnum) ->
  body = $("\#body_#qnum")
  vidname = body.data \vidname
  vidpart = body.data \vidpart
  if vidpart?
    return vidname + '_' + vidpart
  else
    return vidname

getVidname = (qnum) ->
  return $("\#body_#qnum").data \vidname

getVidpart = (qnum) ->
  return $("\#body_#qnum").data \vidpart

insertBefore = (qnum, content) ->
  content.insertBefore $("\#body_#qnum")

insertReviewForQuestion = (qnum) ->
  body = getBody qnum
  qidx = getQidx qnum
  console.log 'qidx is: ' + qidx
  question = root.questions[qidx]
  if question.videos?
    for vidinfo in question.videos
      #$('#quizstream').append insertVideo vidinfo.name, vidinfo.part, "<h3>(to help you understand <a href='\#body_#{qnum}' onclick='setVideoFocused(false)'>#{question.title}</a>)</h3>"
      insertBefore qnum, (insertVideo vidinfo.name, vidinfo.part, "<h3>(to help you understand <span class='linklike' onclick='gotoNum(#qnum)'>#{question.title}</span>)</h3>")
      addVideoDependsOnQuestion qnum, counterCurrent(\qnum)
      body.data \video, counterCurrent(\qnum)

childVideoAlreadyInserted = (qnum) ->
  body = $("\#body_#qnum")
  if not body? or body.length < 1
    return false
  video-qnum = body.data(\video)
  if video-qnum? and $('#body_' + video-qnum).length > 0
    return true
  return false

getChildVideoQnum = (qnum) ->
  return $("\#body_#qnum").data \video

gotoQuestionNum = (qnum) ->
  pauseVideo()
  $(\.activevideo).removeClass \activevideo
  body = getBody qnum
  $(window).scrollTop body.offset().top
  #throw 'gotoQuestionNum unimplemented'

gotoVideoNum = (qnum) ->
  body = $("\#body_#qnum")
  video = body.find \video
  if not video.hasClass \activevideo
    pauseVideo()
    $(\.activevideo).removeClass \activevideo
    video.addClass \activevideo
  setVideoFocused(true)

gotoNum = root.gotoNum = (qnum) ->
  body = $("\#body_#qnum")
  switch body.data(\type)
  | \video => gotoVideoNum qnum
  | \question => gotoQuestionNum qnum
  | _ => throw 'unexpected body type: ' + body.data(\type)

disableAnswerOptions = (qnum) ->
  $("input[type=radio][name=radiogroup_#qnum]").attr('disabled', true)
  $("input[type=checkbox][name=checkboxgroup_#qnum]").attr('disabled', true)

enableAnswerOptions = (qnum) ->
  $("input[type=radio][name=radiogroup_#qnum]").attr('disabled', false)
  $("input[type=checkbox][name=checkboxgroup_#qnum]").attr('disabled', false)


disableQuestion = root.disableQuestion = (qnum) ->
  type = getType qnum
  body = getBody qnum
  switch type
  | \video =>
    body.remove()
  | \question =>
    disableAnswerOptions qnum
    /*
    $('#check_' + qnum).attr('disabled', true)
    $('#watch_' + qnum).attr('disabled', true)
    #$('#skip_' + qnum).attr('disabled', true)
    $('#show_' + qnum).attr('disabled', true)
    $('#next_' + qnum).attr('disabled', true)
    */
    hideButton qnum, \check
    hideButton qnum, \watch
    hideButton qnum, \show
    hideButton qnum, \next
  | _ => throw 'unknown body type ' + type
  body.css 'background-color' 'rgb(232,232,232)'
  if getVideosDependingOnQuestion(qnum)?
    for qnum-video in getVideosDependingOnQuestion(qnum)
      disableQuestion qnum-video

hideQuestion = (qnum) ->
  $("\#body_#qnum").hide()

initializeQuestion = ->
  return {
    correct: []
    incorrect: []
    skip: []
  }

root.question_progress = [initializeQuestion() for x in root.questions]

havePassedQuestion = (question) ->
  return question.correct.length > 0 or question.skip.length > 0

mostRecentCorrect = (question) ->
  if question.correct.length > 0
    return question.correct[*-1]
  return 0

mostRecentSkip = (question) ->
  if question.skip.length > 0
    return question.skip[*-1]
  return 0

mostRecentCorrectOrSkip = (question) ->
  return Math.max(mostRecentCorrect(question), mostRecentSkip(question))

scoreQuestion = (now, question) ->
  # higher score = more need to review
  return now - mostRecentCorrectOrSkip(question)

maxidx = (list) ->
  maxidx = 0
  maxval = Number.MIN_VALUE
  for item,idx in list
    if item > maxval
      maxval = item
      maxidx = idx
  return maxidx

getNextQuestion = ->
  now = Date.now()
  scores = [scoreQuestion(now, question) for question,idx in root.question_progress]
  qidx = maxidx scores
  #qidx = Math.random() * root.questions.length |> Math.floor
  return root.questions[qidx]

interleavedConcat = (list1, list2) ->
  output = []
  l1 = 0
  l2 = 0
  while l1 < list1.length or l2 < list2.length
    if l1 == list1.length and l2 == list2.length
      break
    else if l1 == list1.length
      output.push list2[l2++]
    else if l2 == list2.length
      output.push list1[l1++]
    else if (l1 + l2) % 0 == 0
      output.push list1[l1++]
    else
      output.push list2[l2++]
  return output

toBrainData = (list, outval) ->
  return {input: list, output: [outval]}

getInitialTrainData = ->
  # features:
  # % of immediate dependent video watched
  # has been correctly answered previously [1 or 0]
  # ratio of correct vs incorrect responses 
  positive-instances-raw = [
    [1.0, 0.0, 0.0]
    [1.0, 1.0, 0.5]

  ]
  positive-instances = [toBrainData(x, 1.0) for x in positive-instances-raw]
  negative-instances-raw = [
    [0.0, 0.0, 0.0]
  ]
  negative-instances = [toBrainData(x, 0.0) for x in negative-instances-raw]
  return interleavedConcat positive-instances, negative-instances

getClassifier = root.getClassifier = ->
  net = new brain.NeuralNetwork()
  net.train getInitialTrainData()
  return net

/*
tovol = root.tovol = (l) -> return new convnetjs.Vol(l)

getInitialTrainData = ->
  # features: % of immediate dependent video watched, has been correctly answered previously, was answered correctly last time, % correctly answered thus far, 
  answered_correctly_data = [tovol([1.0])]
  answered_incorrectly_data = [tovol([0.0])]
  return [interleavedConcat(answered_correctly_data, answered_incorrectly_data), interleavedConcat([1]*answered_correctly_data.length, [0]*answered_incorrectly_data.length)] # data, labels

getMagicNet = root.getMagicNet = ->
  [train_data,train_labels] = getInitialTrainData()
  magic-net = new convnetjs.MagicNet(train_data, train_labels)
  console.log train_data
  console.log train_labels
  magic-net.onFinishBatch ->
    console.log 'batch finished!'
    testData = tovol([1.0])
    results = magic-net.predict_soft(testData)
    #console.log results.w[0]
    console.log results
  setInterval ->
    #console.log 'magic-net step!'
    magic-net.step()
  , 0
*/

createRadio = (qnum, idx, option, body) ->
  inputbox = J("input.radiogroup_#{qnum}(type='radio' style='vertical-align: top; display: inline-block; margin-right: 5px')").attr('name', "radiogroup_#{qnum}").attr('id', "radio_#{qnum}_#{idx}").attr('value', idx).change (evt) ->
    addlog {
      event: \radiobox
      type: \selection
      qnum: qnum
      optionidx: idx
    }
    #setDefaultButton qnum, \check
    /*
    question = root.questions[getQidx(qnum)]
    answers = getAnswerValue \radio, qnum
    if isAnswerCorrect question, answers
      #showAnswer qnum, true
      (getButton qnum, \check).click()
    */
    #$('#check_' + qnum).attr('disabled', false)
  body.append J('.radio').append J('label').append(inputbox).append(option)
  #body.append inputbox
  #body.append J("label(style='display: inline-block; font-weight: normal' for='radio_#{qnum}_#{idx}')").html option
  #body.append J('br')

shouldBeChecked = (qnum, idx) ->
  question = root.questions[getQidx(qnum)]
  if question.correct.indexOf(idx) != -1
    return true
  return false

createCheckbox = (qnum, idx, option, body) ->
  #console.log option
  inputbox = J("input.checkboxgroup_#{qnum}(type='checkbox' style='vertical-align: top; display: inline-block; margin-right: 5px')").attr('name', "checkboxgroup_#{qnum}").attr('id', "checkbox_#{qnum}_#{idx}").attr('value', idx).change (evt) ->
    value = $('#checkbox_' + qnum + '_' + idx).is(':checked')
    console.log 'value:' + value
    shouldbechecked = shouldBeChecked(qnum, idx)
    addlog {
      event: \checkbox
      type: \selection
      value
      shouldbechecked
      qnum
      optionidx: idx
    }
    #setDefaultButton qnum, \check
    /*
    question = root.questions[getQidx(qnum)]
    answers = getAnswerValue \checkbox, qnum
    if isAnswerCorrect question, answers
      #showAnswer qnum, true
      (getButton qnum, \check).click()
    */
    #$('#check_' + qnum).attr('disabled', false)
  body.append J('.checkbox').append J('label').append(inputbox).append(option)
  #body.append inputbox
  #body.append J("label(style='display: inline-block; font-weight: normal' for='checkbox_#{qnum}_#{idx}')").html option
  #body.append J('br')

setCheckboxOption = root.setCheckboxOption = (qnum, idx, value) ->
  $('#checkbox_' + qnum + '_' + idx).prop('checked', value)
  #$('#checkbox_' + qnum + '_' + idx).change()

setOption = (type, qnum, idx, value) ->
  switch type
  | \radio => throw 'selectOption not implemented for radio'
  | \checkbox => setCheckboxOption(qnum, idx, value)
  | _ => 'selectOption not implemented for ' + type

createWidget = (type, qnum, idx, option, body) ->
  switch type
  | \radio => createRadio(qnum, idx, option, body)
  | \checkbox => createCheckbox(qnum, idx, option, body)
  | _ => throw 'nonexistant question type ' + type

getRadioValue = root.getRadioValue = (radioname) ->
  throw 'getRadioValue not implemented'
  #return parseInt $("input[type=radio][name=#radioname]:checked").val()

getCheckboxes = root.getCheckboxes = (qnum) ->
  numoptions = $('.checkboxgroup_' + qnum).length
  return [$('#checkbox_' + qnum + '_' + i)[0] for i in [0 til numoptions]]

getCheckboxValue = root.getCheckboxValue = (qnum) ->
  output = []
  for checkbox,i in getCheckboxes(qnum)
    if checkbox.checked
      output.push i
  return output
  #return [parseInt(x) for x in $("input[type=checkbox][name=#checkboxname]:checked").map(-> $(this).val()).get()]

arraysEqualUnsorted = root.arraysEqualUnsorted = (a,b) ->
  a = a[to]
  a.sort()
  b = b[to]
  b.sort()
  return arraysEqual a, b

arraysEqual = root.arraysEqual = (a,b) ->
  return a === b
  #if a.length != b.length
  #  return false
  #for i in [0 til a.length]
  #  if a[i] != b[i]
  #    return false
  #return true

getAnswerValue = (type, qnum) ->
  switch type
  | \radio => getRadioValue qnum # "radiogroup_#qnum"
  | \checkbox => getCheckboxValue qnum # "checkboxgroup_#qnum"
  | _ => throw 'nonexistant question type ' + type 

isAnswerCorrect = (question, answers) ->
  switch question.type
  | \radio => answers == question.correct
  | \checkbox => arraysEqualUnsorted answers, question.correct
  | _ => throw 'nonexistant question type ' + type

markQuestion = (question_idx, mark) ->
  if question_idx.idx?
    return markQuestion question_idx.idx, mark
  question_progress = root.question_progress[question_idx]
  console.log question_progress
  question_progress[mark].push Date.now()

questionSkip = (question) -> markQuestion question, 'skip'

questionCorrect = (question) -> markQuestion question, 'correct'

questionIncorrect = (question) -> markQuestion question, 'incorrect'

root.overlap-button = null
root.automatic-trigger = false

resetButtonFill = ->
  if root.overlap-button?
    root.overlap-button.hide()
  autotrigger = $('.autotrigger')
  if not autotrigger? or not autotrigger.length? or autotrigger.length == 0
    return
  button-fill = 0
  autotrigger.data('button-fill', button-fill)
  #partialFillButton button-fill

increaseButtonFill = ->
  autotrigger = $('.autotrigger')
  if not autotrigger? or not autotrigger.length? or autotrigger.length == 0
    return
  button-fill = 0
  if autotrigger.data('button-fill')?
    button-fill = autotrigger.data('button-fill')
  button-fill += 0.1
  if button-fill >= 1.0
    resetButtonFill()
    #disableButtonAutotrigger()
    root.automatic-trigger = true
    autotrigger.click()
    root.automatic-trigger = false
    return
  console.log 'increaseButtionFill ' + button-fill
  console.log 'autotrigger offset: ' + autotrigger.offset().top
  autotrigger.data('button-fill', button-fill)
  partialFillButton button-fill

partialFillButton = root.partialFillButton = (fraction) ->
  autotrigger = $('.autotrigger')
  if not autotrigger? or not autotrigger.length? or autotrigger.length == 0
    return
  if not root.overlap-button?
    root.overlap-button = J('button.btn.btn-success.btn-lg').css('position', 'absolute').css('pointer-events', 'none')
    $('#quizstream').append /*J('#overlapButtonContainer').append*/ root.overlap-button
  root.overlap-button.text autotrigger.text()
  root.overlap-button.width autotrigger.width()
  root.overlap-button.height autotrigger.height()
  {top, left} = autotrigger.offset()
  console.log 'top is: ' + top
  root.overlap-button.css \top, top
  root.overlap-button.css \left, left
  root.overlap-button.css 'clip', 'rect(0px ' + (autotrigger.outerWidth() * fraction) + 'px auto 0px)' # top right bottom left
  root.overlap-button.show()

root.inserted-reviews = {}

haveInsertedReview = (qnum) ->
  if root.inserted-reviews[qnum]?
    return true
  return false

reviewInserted = (qnum) ->
  root.inserted-reviews[qnum] = true

showIsCorrect = (qnum, isCorrect) ->
  qidx = getQidx qnum
  question = root.questions[qidx]
  console.log 'showIsCorrect!'
  feedback = J('span')
  if isCorrect
    feedback.append J('b').css('color', 'green').text 'Correct'
    if not question.explanation? or question.explanation == '(see correct answers above)'
      $("\#explanation_#qnum").text 'Move on to the next question!'
    else
      $("\#explanation_#qnum").text question.explanation
  else
    feedback.append J('b').css('color', 'red').text 'Incorrect'
    $("\#explanation_#qnum").text 'We suggest you watch the video and try answering again, or see solution'
  #feedback.append question.explanation
  feedback-display = $("\#iscorrect_#qnum")
  feedback-display.html ''
  feedback-display.append feedback

scrambleAnswerOptionsCheckbox = (qnum) ->
  #options = $(".checkboxgroup_#{qnum}")
  optionsdiv = $("\#options_#{qnum}")
  options = optionsdiv.find('.checkbox')
  for i in [0 til options.length]
    randidx = Math.floor(Math.random() * options.length)
    curopt = $(options[randidx]).detach()
    optionsdiv.append curopt

scrambleAnswerOptions = root.scrambleAnswerOptions = (qnum) ->
  scrambleAnswerOptionsCheckbox(qnum)

hideAnswer = root.hideAnswer = (qnum) ->
  qidx = getQidx qnum
  question = root.questions[qidx]
  body = getBody qnum
  if question.type == \checkbox
    $(".checkboxgroup_#{qnum}").prop \checked, false
  else if question.type == \radio
    throw 'radio show answer not yet implemented'
  feedback-display = $("\#iscorrect_#qnum")
  feedback-display.html ''
  explanation-display = $("\#explanation_#qnum")
  explanation-display.text ''
  hideButton qnum, \show
  hideButton qnum, \next
  showButton qnum, \check
  showButton qnum, \watch
  hideButton qnum, \review
  enableAnswerOptions qnum
  scrambleAnswerOptions qnum

showAnswer = root.showAnswer = (qnum) ->
  qidx = getQidx qnum
  question = root.questions[qidx]
  body = getBody qnum
  if question.type == \checkbox
    $(".checkboxgroup_#{qnum}").prop \checked, false
    for answeridx in question.correct
      $("\#checkbox_#{qnum}_#{answeridx}").prop \checked, true
  else if question.type == \radio
    throw 'radio show answer not yet implemented'
  feedback-display = $("\#iscorrect_#qnum")
  feedback-display.html '<b style="color: red">Incorrect - see correct answer above</b>'
  explanation-display = $("\#explanation_#qnum")
  explanation-display.text question.explanation
  hideButton qnum, \show
  hideButton qnum, \check
  vidname = question.videos[0].name
  vidpart = question.videos[0].part
  showButton qnum, \review
  hideButton qnum, \watch
  updateWatchButtonProgress(vidname, vidpart)
  disableAnswerOptions qnum

videoAtFront = ->
  video = $('.activevideo')
  if video[0].currentTime < 1.0
    return true
  return false

videoAtEnd = ->
  video = $('.activevideo')
  if Math.abs(video[0].currentTime - video[0].duration) < 1.0
    return true
  return false

scrollVideoForward = ->
  video = $('.activevideo')
  video[0].currentTime += 5.0

scrollVideoBackward = ->
  video = $('.activevideo')
  video[0].currentTime -= 5.0

isVideoPlaying = root.isVideoPlaying = ->
  video = $('.activevideo')
  if video.length == 0
    return false
  return not video[0].paused

playVideoFromStart = ->
  video = $('.activevideo')
  if video.length < 1
    return
  video[0].currentTime = 0
  if video[0].paused
    video[0].play()

root.currentQuestionQnum = 0

getCurrentQuestionQnum = root.getCurrentQuestionQnum = ->
  root.currentQuestionQnum

playVideo = ->
  resetIfNeeded getCurrentQuestionQnum()
  video = $('.activevideo')
  if video.length > 0
    if video[0].paused
      video[0].play()

pauseVideo = ->
  video = $('.activevideo')
  for vid in video
    if not vid.paused
      vid.pause()
  #if not video[0].paused
  #  video[0].pause()

disableButtonAutotrigger = ->
  console.log 'disableButtonAutotrigger'
  resetButtonFill()
  button = $(\.autotrigger)
  button.removeClass \autotrigger
  if button.hasClass \btn-primary
    button.removeClass \btn-primary
    button.addClass \btn-default

getButton = (qnum, buttontype) ->
  switch buttontype
  | \show => $("\#show_#qnum")
  | \check => $("\#check_#qnum")
  | \watch => $("\#watch_#qnum")
  | \next => $("\#next_#qnum")
  | \review => $("\#review_#qnum")
  | _ => throw 'unknown button type ' + buttontype

showButton = (qnum, buttontype) ->
  (getButton qnum, buttontype).show()

hideButton = (qnum, buttontype) ->
  (getButton qnum, buttontype).hide()

turnOffAllDefaultbuttons = ->
  buttons = $(\.btn-primary)
  buttons.removeClass \btn-primary
  buttons.addClass \btn-default

turnOffDefaultButton = (button, buttontype) ->
  if typeof button == typeof 0 # first argument is actually qnum
    button = getButton button, buttontype
  if button.hasClass \btn-primary
    button.removeClass \btn-primary
    button.addClass \btn-default

setDefaultButton = (button, buttontype) -> # or alternativey: button
  return # should no longer do anything
  if typeof button == typeof 0 # first argument is actually qnum
    button = getButton button, buttontype
  if not button.hasClass \autotrigger
    #$(\.autotrigger).removeClass \autotrigger
    disableButtonAutotrigger()
    button.addClass \autotrigger
  if not button.hasClass \btn-primary
    button.removeClass \btn-default
    button.addClass \btn-primary

showChildVideoForQuestion = (qnum) ->
  if childVideoAlreadyInserted qnum
    gotoNum getChildVideoQnum(qnum)
  else
    insertReviewForQuestion qnum
    gotoNum getChildVideoQnum(qnum)
  setVideoFocused(true)

getVideoDependencies = (vidname, vidpart) ->
  dependencies = []
  if vidpart?
    for prevpart in [0 til vidpart]
      dependencies.push [vidname, prevpart]
  dependencies = dependencies ++ [[x,null] for x in root.video_dependencies[vidname]]
  return dependencies

showChildVideoForVideo = (qnum) ->
  setVideoFocused(false)
  vidname = getVidname qnum
  vidpart = getVidpart qnum
  prebody-qnum = getVideo(vidname, vidpart).data(\prebody)
  if childVideoAlreadyInserted qnum
    gotoNum getChildVideoQnum(qnum)
  else
    dependency = getVideoDependencies(vidname, vidpart)[*-1]
    [dvidname,dvidpart] = dependency
    /*
    if vidpart?
      insertBefore qnum, (insertVideo dvidname, dvidpart, "<h3>(to help you understand <span class='linklike' onclick='gotoNum(#qnum)'>#{vidname} part #{vidpart+1}</span>)</h3>")
    else
      insertBefore qnum, (insertVideo dvidname, dvidpart, "<h3>(to help you understand <span class='linklike' onclick='gotoNum(#qnum)'>#{vidname}</span>)</h3>")
    */
    placeVideoBefore dvidname, dvidpart, prebody-qnum
    setInsertionReasonAsVideo dvidname, dvidpart, vidname, vidpart
    addVideoDependsOnQuestion qnum, counterCurrent(\qnum)
    body = getBody qnum
    body.data \video, counterCurrent(\qnum)
    gotoNum getChildVideoQnum(qnum)
  setVideoFocused(true)
  playVideo()

showChildVideo = root.showChildVideo = (qnum) ->
  type = getType qnum
  switch type
  | \question => showChildVideoForQuestion(qnum)
  | \video => showChildVideoForVideo(qnum)
  | _ => throw 'unknown item type ' + type

resetIfNeeded = root.resetIfNeeded = (qnum) ->
  if (getBody qnum).data(\answered)
    if not (getBody qnum).data(\correct)
      # hide answer and require user to try again
      (getBody qnum).data(\answered, false)
      (getBody qnum).data(\correct, false)
      hideAnswer qnum

getVideo = (vidname, vidpart) ->
  vidnamepart = toVidnamePart vidname, vidpart
  return $('.video_' + vidnamepart)

setInsertionReasonAs = (vidname, vidpart, reason) ->
  curvid = getVideo(vidname, vidpart)
  curvid.find('.insertionreason').html(reason)

setInsertionReasonAsQuestion = (vidname, vidpart, qnum) ->
  qidx = getQidx qnum
  question = root.questions[qidx]
  setInsertionReasonAs vidname, vidpart, "(to help you understand <span class='linklike' onclick='gotoNum(#qnum)'>#{question.title}</span>)"

setInsertionReasonAsVideo = (vidname, vidpart, pvidname, pvidpart) ->
  pqnum = getVideo(pvidname, pvidpart).data(\qnum)
  if pvidpart?
    setInsertionReasonAs vidname, vidpart, "(to help you understand <span class='linklike' onclick='gotoNum(#pqnum)'>#{pvidname} part #{pvidpart + 1}</span>)"
  else
    setInsertionReasonAs vidname, vidpart, "(to help you understand <span class='linklike' onclick='gotoNum(#pqnum)'>#{pvidname}</span>)"

showVideo = (vidname, vidpart) ->
  curvid = getVideo(vidname, vidpart)
  gotoNum curvid.data(\qnum)

viewPreviousClip = (vidname, vidpart) ->
  pauseVideo()
  curvid = getVideo(vidname, vidpart)
  qnum = curvid.data(\qnum)
  prebody-qnum = curvid.data(\prebody)
  dependency = getVideoDependencies(vidname, vidpart)[*-1]
  [dvidname,dvidpart] = dependency
  placeVideoBefore dvidname, dvidpart, prebody-qnum
  setInsertionReasonAsVideo dvidname, dvidpart, vidname, vidpart
  showVideo dvidname, dvidpart
  playVideo()

placeVideoBefore = root.placeVideoBefore = (vidname, vidpart, qnum) ->
  vidnamepart = toVidnamePart vidname, vidpart
  curvid = getVideo(vidname, vidpart)
  if curvid.length > 0
    if curvid.data(\prebody) == qnum
      return # already inserted in the correct location
    else
      target-body = $('#prebody_' + qnum)
      curvid.detach()
      target-body.prepend curvid
      curvid.data(\prebody, qnum)
  else
    $('#prebody_' + qnum).prepend (insertVideo vidname, vidpart, "<h3>(to help you understand <span class='linklike' onclick='gotoNum(#qnum)'>Question Title</span>)</h3>")
    getVideo(vidname, vidpart).data(\prebody, qnum)

insertQuestion = root.insertQuestion = (question, options) ->
  options = {} if not options?
  if options.qnum?
    qnum = options.qnum
    counterSet 'qnum', qnum
  else
    qnum = counterNext 'qnum'
  root.currentQuestionQnum = qnum
  turnOffAllDefaultbuttons()
  removeAllVideos()
  body = J('.panel-body').attr('id', "body_#qnum").data('qidx', question.idx).data(\type, \question)
  body.append J('h3').text question.title
  body.append J('span').text question.text
  body.append J('br')
  vidname = getVidnameForQuestion(question)
  vidpart = getVidpartForQuestion(question)
  vidnamepart = getVidnamePartForQuestion(question)
  optionsdiv = J("\#options_#qnum")
  for option,idx in question.options
    createWidget(question.type, qnum, idx, option, optionsdiv)
  body.append optionsdiv
  addlog {
    event: 'insertquestion'
    type: 'question'
    qidx: question.idx
    qnum: qnum
  }
  insertShowAnswerButton = ->
    body.append J('button.btn.btn-default.btn-lg#show_' + qnum).css(\display, \none).css('margin-right', '15px')/*.attr('disabled', true)*/.text('see solution').click (evt) ->
      questionSkip question
      showAnswer qnum
      showButton qnum, \next
      setDefaultButton qnum, \next
      addlog {
        event: 'show'
        type: 'button'
        qidx: question.idx
        qnum: qnum
      }
  insertCheckAnswerButton = ->
    body.append J('button.btn.btn-primary.btn-lg#check_' + qnum).css('margin-right', '15px')/*.attr('disabled', true)*/.text('check answer').click (evt) ->
      answers = getAnswerValue question.type, qnum
      console.log answers
      if isAnswerCorrect question, answers
        addlog {
          event: 'check'
          type: 'button'
          correct: true
          qidx: question.idx
          answers: answers
          qnum: qnum
        }
        showIsCorrect qnum, true
        questionCorrect question
        #insertQuestion getNextQuestion()
        #disableQuestion qnum
        showButton qnum, \watch
        hideButton qnum, \review
        hideButton qnum, \check
        hideButton qnum, \show
        showButton qnum, \next
        setDefaultButton qnum, \next
        disableAnswerOptions qnum
        insertQuestion getNextQuestion()
        (getButton qnum, \next).hide()
        (getBody qnum).data(\answered, true)
        (getBody qnum).data(\correct, true)
      else
        addlog {
          event: 'check'
          type: 'button'
          correct: false
          qidx: question.idx
          answers: answers
          qnum: qnum
        }
        showIsCorrect qnum, false
        questionIncorrect question
        setDefaultButton qnum, \watch
        showAnswer qnum
        (getBody qnum).data(\answered, true)
        (getBody qnum).data(\correct, false)
        #if (getButton qnum, \watch).data('progress') > 0.1
        #  showButton qnum, \next
        
        #showButton qnum, \show
        #(getButton qnum, \show).click()
        #insertQuestion getNextQuestion()
        #(getButton qnum, \next).hide()
        
        #if not haveInsertedReview qnum
        #  disableQuestion qnum
        #  insertReview question
        #  reviewInserted (counterCurrent \qnum)
  insertWatchVideoButton = (autotrigger) ->
    watch-video-button = J('button.btn.btn-primary.btn-lg#watch_' + qnum).data('vidname', vidname).data('vidpart', vidpart).addClass('watch_' + vidnamepart).css('margin-right', '15px')/*.text("watch video (0% seen)")*/.click (evt) ->
      addlog {
        event: 'watch'
        type: 'button'
        qidx: question.idx
        qnum: qnum
      }
      resetIfNeeded getCurrentQuestionQnum()
      if not root.mock-insert-video
        placeVideoBefore(vidname, vidpart, qnum)
        setInsertionReasonAsQuestion(vidname, vidpart, qnum)
        showVideo(vidname, vidpart)
        #showChildVideo qnum
        playVideo()
      #playVideoFromStart()
    if autotrigger
      setDefaultButton watch-video-button
    body.append watch-video-button
  insertReviewVideoButton = ->
    review-video-button = J('button.btn.btn-primary.btn-lg#review_' + qnum).addClass('review_' + vidnamepart).css(\display, \none).css('margin-right', '15px').text('review video before answering again (0% seen)').click (evt) ->
      (getButton qnum, \watch).click()
    body.append review-video-button
  insertNextQuestionButton = ->
    body.append J('button.btn.btn-default.btn-lg#next_' + qnum).css(\display, \none).css('margin-right', '15px')/*.attr('disabled', true)*/.text('next question').click (evt) ->
      addlog {
        event: 'next'
        type: 'button'
        qidx: question.idx
        qnum: qnum
      }
      #disableQuestion qnum
      insertQuestion getNextQuestion()
  /*
  insertSkipButton = ->
    body.append J('button.btn.btn-default.btn-lg#skip_' + qnum).css('margin-right', '15px').text('already know answer').click (evt) ->
      console.log 'skipping question'
      disableQuestion qnum
      questionSkip question
      insertQuestion getNextQuestion()
  */
  body.append J(\hr.vspace).css(\height, \3px)
  body.append J("span\#iscorrect_#qnum").html('')
  body.append J("span\#explanation_#qnum").css(\margin-left, \5px).html('')
  body.append J(\br)
  insertWatchVideoButton(true)
  insertCheckAnswerButton()
  insertReviewVideoButton()
  /*
  if root.question_progress[question.idx].correct.length > 0
    insertCheckAnswerButton()
    if not options.skip-video?
      insertWatchVideoButton()
  else
    if not options.skip-video?
      insertWatchVideoButton(true)
    insertCheckAnswerButton()
  */
  #if root.question_progress[question.idx].correct.length > 0
  #  insertSkipButton()
  insertShowAnswerButton()
  insertNextQuestionButton()
  $('#quizstream').append J('#prebody_' + qnum)
  $('#quizstream').append /*J('.panel.panel-default')*/ /*J('div').attr('id', "panel_#qnum").append*/ body
  scrambleAnswerOptions qnum
  updateWatchButtonProgress(vidname, vidpart)
  if root.question_progress[question.idx].correct.length > 0
    showButton qnum, \show
    setDefaultButton qnum, \show

isMouseInVideo = (evt) ->
  video = $ \.activevideo
  if video.length < 1
    return false
  if timeSinceVideoFocus() < 1.0
    return true
  video-top = video.offset().top
  video-bottom = video-top + video.height()
  return video-top <= parseFloat(evt.pageY) <= video-bottom

isScrollAtBottom = ->
  return $(window).scrollTop() + $(window).height() == $(document).height()

root.mock-insert-video = false

replayLogs = (logs) ->
  for log in logs
    console.log 'replaying: ' + JSON.stringify(log)
    switch log.event
    | \insertquestion =>
      if log.qnum != 0 #if bodyExists(log.qnum)
        continue
      insertQuestion root.questions[log.qidx], {qnum: log.qnum}
    | \watch => root.mock-insert-video = true; (getButton log.qnum, \watch).click(); root.mock-insert-video = false
    | \check => (getButton log.qnum, \check).click()
    | \show => (getButton log.qnum, \show).click()
    | \next => (getButton log.qnum, \next).click()
    | \checkbox => setOption \checkbox, log.qnum, log.optionidx, log.value
    | \radio => setOption \radio, log.qnum, log.optionidx, log.value
    | _ => console.log(log)

videoHeightFractionVisible = ->
  video = $('.activevideo')
  if video.length == 0
    return 0
  video-height = video.height()
  if video-height <= 0 or not isFinite video-height
    return 0
  window-height = $(window).height()
  window-top = $(window).scrollTop()
  console.log 'window-top:' + window-top
  window-bottom = window-top + window-height
  video-top = video.offset().top
  video-bottom = video-top + video-height
  video-hidden-top = Math.max(0, window-top - video-top)
  console.log 'video-hidden-top:' + video-hidden-top
  video-hidden-bottom = Math.max(0, video-bottom - window-bottom)
  console.log 'video-hidden-bottom:' + video-hidden-bottom
  video-hidden = video-hidden-top + video-hidden-bottom
  video-shown = video-height - video-hidden
  #fraction-hidden = video-hidden / Math.min(window-height, video-height)
  #console.log 'video-hidden:' + video-hidden
  #console.log 'fraction hiddden:' +  (1 - fraction-hidden)
  #return 1 - fraction-hidden
  fraction-shown = video-shown / Math.min(window-height, video-height)
  return fraction-shown


$(document).ready ->
  console.log 'ready'
  $(document).mousedown (evt) ->
    console.log 'document mousedown'
    resetButtonFill()
    if isVideoFocused()
      if not isMouseInVideo(evt)
        console.log 'document mousedown setvideofocused false'
        setVideoFocused(false)
  $(document).keydown (evt) ->
    key = evt.keyCode
    if $('.activevideo').length > 0 # in video
      if key == 27 # esc
        setVideoFocused(false)
  $(document).mousewheel (evt) ->
    try
      #console.log evt
      if isVideoPlaying() and videoHeightFractionVisible() < 0.85
        pauseVideo()
      else if not isVideoPlaying() and videoHeightFractionVisible() > 0.85
        playVideo()
      if $('.activevideo').length > 0 and false #and isVideoPlaying()
        window-top = $(window).scrollTop()
        video-top = $('.activevideo').offset().top
        window-bottom = window-top + $(window).height()
        video-bottom = video-top + $('.activevideo').height()
        #if Math.abs(window-bottom - video-bottom) < 50
        invideo = false
        if isVideoFocused()
          if evt.deltaY < 0 and videoAtEnd()
            setVideoFocused false
          else if evt.deltaY > 0 and videoAtFront()
            setVideoFocused false
          else
            invideo = true
        if timeSinceVideoFocus() > 1.0 and not (video-top <= parseFloat(evt.pageY) <= video-bottom)
          invideo = false
          console.log 'evt.pageY is:' + parseFloat(evt.pageY)
          console.log 'video-bottom is:' + video-bottom
          console.log 'video-top is:' + video-top
          setVideoFocused(false)
        /*
        if evt.deltaY < 0 and (Math.abs(window-top - video-top) <= 20) and not videoAtEnd() # scrolling downwards
          invideo = true
        if evt.deltaY > 0 and (Math.abs(window-top - video-top) <= 20) and not videoAtFront()
          invideo = true
        */
        if invideo
          $(window).scrollTop(video-top)
          if not isVideoPlaying() and not videoAtEnd()
            playVideo()
          else
            if evt.deltaY < 0
              #if videoAtEnd()
              #  return
              scrollVideoForward()
            else
              #if videoAtFront()
              #  return
              scrollVideoBackward()
          evt.preventDefault()
          return false
        else
          pauseVideo()
        return
      /*
      if evt.deltaY < 0 and isScrollAtBottom()
        increaseButtonFill()
        return
      else
        resetButtonFill()
      */
      if evt.deltaY < 0
        $(window).scrollTop $(window).scrollTop() + 30
      else if evt.deltaY > 0
        $(window).scrollTop $(window).scrollTop() - 30
    catch e
      console.log e
    finally
      evt.preventDefault()
      return false
  getlog (logs) ->
    if logs.length > 0
      root.logging-disabled = true
      console.log 'replaying logs!'
      root.logged-data = logs
      replayLogs(logs)
      root.logging-disabled = false
    else
      insertQuestion getNextQuestion()
    ensureLoggedToServer(root.logged-data, 'logged-data')
  #insertQuestion questions[0]
  #for question in root.questions.slice 0,1
  #  insertQuestion question
    
  #$('#quizstream').append J('.panel.panel-default').append J('.panel-body').text('some text')
  #$('#quizstream').append J('.panel.panel-default').append J('.panel-body').text('some more text')