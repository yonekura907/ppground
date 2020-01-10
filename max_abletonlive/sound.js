let maxApi = require('max-api');

// const soundData = ['se1', 'se2', 'se3', 'theo.wav', 'voice.wav'];


maxApi.addHandler('setFiles', (num) => {
  let bufferName = 'se' + num;
  // setFiles[0] = soundData[ar0];
  // setFiles[1] = soundData[ar1];
  // setFiles[2] = soundData[ar2];

  maxApi.outlet(bufferName);
});
