from pydub import AudioSegment
import os
import fire

def concatenate(input_folder):
  print('concatenate files for training')  
  wavs = os.listdir(input_folder)
  wavs.sort()
  #wavs.remove('.DS_Store')
  sound = AudioSegment.silent(duration=1)
  for i in wavs:
    audio = AudioSegment.from_mp3(input_folder+'/'+i)
    #audio_cut = audio[:start_cut]
    sound = sound + audio + AudioSegment.silent(duration=1500)
    if sound.duration_seconds > 330:
        print('file has correct length: ' + str(sound.duration_seconds) + ' seconds')
        sound = sound.set_frame_rate(16000)
        sound.export('assets/wavs/p231/p231_025_cat.wav', format="wav")
        break
        
  sound = sound.set_frame_rate(16000)
  sound.export('assets/wavs/p231/p231_025_cat.wav', format="wav")


if __name__ == '__main__':
    fire.Fire()
