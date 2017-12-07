Dell XPS 13 96360 - Realtek ALC-256

### Codec

    Codec: Realtek ALC3246
    Address: 0
    AFG Function Id: 0x1 (unsol 1)
    Vendor Id: 0x10ec0256
    Subsystem Id: 0x1028082a
    Revision Id: 0x100002

 * Codec: `Realtek ALC3246`
 * Address: `0`
 * Vendor Id: `0x10ec0256` (`283902550`)

### Pin Complex

##### Internal Mic Boost Volume

    Node 0x12 [Pin Complex] wcaps 0x40040b: Stereo Amp-In
      Control: name="Internal Mic Boost Volume", index=0, device=0
        ControlAmp: chs=3, dir=In, idx=0, ofs=0
      Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
      Amp-In vals:  [0x00 0x00]
      Pincap 0x00000020: IN
      Pin Default 0x90a60160: [Fixed] Mic at Int N/A
        Conn = Digital, Color = Unknown
        DefAssociation = 0x6, Sequence = 0x0
        Misc = NO_PRESENCE
      Pin-ctls: 0x20: IN
      Power states:  D0 D1 D2 D3 EPSS
      Power: setting=D0, actual=D0

    Node 0x13 [Pin Complex] wcaps 0x40040b: Stereo Amp-In
      Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
      Amp-In vals:  [0x00 0x00]
      Pincap 0x00000020: IN
      Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
        Conn = 1/8, Color = Black
        DefAssociation = 0xf, Sequence = 0x0
        Misc = NO_PRESENCE
      Pin-ctls: 0x00:
      Power states:  D0 D1 D2 D3 EPSS
      Power: setting=D3, actual=D3

##### Speaker Playback Switch

    Node 0x14 [Pin Complex] wcaps 0x40058d: Stereo Amp-Out
      Control: name="Speaker Playback Switch", index=0, device=0
        ControlAmp: chs=3, dir=Out, idx=0, ofs=0
      Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
      Amp-Out vals:  [0x80 0x80]
      Pincap 0x00010014: OUT EAPD Detect
      EAPD 0x2: EAPD
      Pin Default 0x90170120: [Fixed] Speaker at Int N/A
        Conn = Analog, Color = Unknown
        DefAssociation = 0x2, Sequence = 0x0
        Misc = NO_PRESENCE
      Pin-ctls: 0x40: OUT
      Unsolicited: tag=00, enabled=0
      Power states:  D0 D1 D2 D3 EPSS
      Power: setting=D0, actual=D0
      Connection: 1
         0x02

    Node 0x18 [Pin Complex] wcaps 0x40048b: Stereo Amp-In
      Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
      Amp-In vals:  [0x00 0x00]
      Pincap 0x00003724: IN Detect
        Vref caps: HIZ 50 GRD 80 100
      Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
        Conn = 1/8, Color = Black
        DefAssociation = 0xf, Sequence = 0x0
        Misc = NO_PRESENCE
      Pin-ctls: 0x20: IN VREF_HIZ
      Unsolicited: tag=00, enabled=0
      Power states:  D0 D1 D2 D3 EPSS
      Power: setting=D3, actual=D3

##### Headset Mic Boost Volume

    Node 0x19 [Pin Complex] wcaps 0x40048b: Stereo Amp-In
      Control: name="Headset Mic Boost Volume", index=0, device=0
        ControlAmp: chs=3, dir=In, idx=0, ofs=0
      Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
      Amp-In vals:  [0x00 0x00]
      Pincap 0x00003724: IN Detect
        Vref caps: HIZ 50 GRD 80 100
      Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
        Conn = 1/8, Color = Black
        DefAssociation = 0xf, Sequence = 0x0
        Misc = NO_PRESENCE
      Pin-ctls: 0x24: IN VREF_80
      Unsolicited: tag=00, enabled=0
      Power states:  D0 D1 D2 D3 EPSS
      Power: setting=D3, actual=D3

##### Headphone Mic Boost Volume

    Node 0x1a [Pin Complex] wcaps 0x40048b: Stereo Amp-In
      Control: name="Headphone Mic Boost Volume", index=0, device=0
        ControlAmp: chs=3, dir=In, idx=0, ofs=0
      Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
      Amp-In vals:  [0x00 0x00]
      Pincap 0x00003724: IN Detect
        Vref caps: HIZ 50 GRD 80 100
      Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
        Conn = 1/8, Color = Black
        DefAssociation = 0xf, Sequence = 0x0
        Misc = NO_PRESENCE
      Pin-ctls: 0x20: IN VREF_HIZ
      Unsolicited: tag=00, enabled=0
      Power states:  D0 D1 D2 D3 EPSS
      Power: setting=D3, actual=D3

    Node 0x1b [Pin Complex] wcaps 0x40058f: Stereo Amp-In Amp-Out
          Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
          Amp-In vals:  [0x00 0x00]
          Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
          Amp-Out vals:  [0x80 0x80]
          Pincap 0x00013734: IN OUT EAPD Detect
            Vref caps: HIZ 50 GRD 80 100
          EAPD 0x2: EAPD
          Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
            Conn = 1/8, Color = Black
            DefAssociation = 0xf, Sequence = 0x0
            Misc = NO_PRESENCE
          Pin-ctls: 0x20: IN VREF_HIZ
          Unsolicited: tag=00, enabled=0
          Power states:  D0 D1 D2 D3 EPSS
          Power: setting=D3, actual=D3
          Connection: 2
             0x02* 0x03

    Node 0x1d [Pin Complex] wcaps 0x400400: Mono
      Pincap 0x00000020: IN
      Pin Default 0x40700001: [N/A] Modem Hand at Ext N/A
        Conn = Unknown, Color = Unknown
        DefAssociation = 0x0, Sequence = 0x1
      Pin-ctls: 0x20: IN
      Power states:  D0 D1 D2 D3 EPSS
      Power: setting=D3, actual=D3

    Node 0x1e [Pin Complex] wcaps 0x400781: Stereo Digital
      Pincap 0x00000014: OUT Detect
      Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
        Conn = 1/8, Color = Black
        DefAssociation = 0xf, Sequence = 0x0
        Misc = NO_PRESENCE
      Pin-ctls: 0x40: OUT
      Unsolicited: tag=00, enabled=0
      Power states:  D0 D1 D2 D3 EPSS
      Power: setting=D3, actual=D3
      Connection: 1
         0x06

##### Headphone Playback Switch

    Node 0x21 [Pin Complex] wcaps 0x40058d: Stereo Amp-Out
      Control: name="Headphone Playback Switch", index=0, device=0
        ControlAmp: chs=3, dir=Out, idx=0, ofs=0
      Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
      Amp-Out vals:  [0x80 0x80]
      Pincap 0x0001001c: OUT HP EAPD Detect
      EAPD 0x2: EAPD
      Pin Default 0x02211030: [Jack] HP Out at Ext Front
        Conn = 1/8, Color = Black
        DefAssociation = 0x3, Sequence = 0x0
      Pin-ctls: 0xc0: OUT HP
      Unsolicited: tag=01, enabled=1
      Power states:  D0 D1 D2 D3 EPSS
      Power: setting=D3, actual=D3
      Connection: 2
         0x02 0x03*

#### Pin Complex extract

* Internal Mic Boost Volume  
  Node: `0x12`  
  Pin Default: `0x90a60160`  
  Verb: `60 01 a6 90`  
  [Fixed] Mic at Int N/A, Conn = Digital, Color = Unknown, DefAssociation = 0x6, Sequence = 0x0, Misc = NO_PRESENCE

* Speaker Playback Switch  
  Node: `0x14`  
  Pin Default: `0x90170120`  
  Verb: `20 01 17 90`  
  EAPD: `0x02`  
  [Fixed] Speaker at Int N/A, Conn = Analog, Color = Unknown, DefAssociation = 0x2, Sequence = 0x0, Misc = NO_PRESENCE

* Headset Mic Boost Volume  
  Node: `0x19`
  Pin Default: `0x411111f0`  
  Verb: `f0 11 11 41`  
  [N/A] Speaker at Ext Rear, Conn = 1/8, Color = Black, DefAssociation = 0xf, Sequence = 0x0, Misc = NO_PRESENCE

* Headphone Mic Boost Volume  
  Node: `0x1a`  
  Pin Default: `0x411111f0`  
  Verb: `f0 11 11 41`  
  [N/A] Speaker at Ext Rear, Conn = 1/8, Color = Black, DefAssociation = 0xf, Sequence = 0x0, Misc = NO_PRESENCE

* Headphone Playback Switch  
  Node: `0x21`  
  Pin Default: `0x02211030`  
  Verb: `30 10 21 02`  
  EAPD: `0x02`  
  [Jack] HP Out at Ext Front, Conn = 1/8, Color = Black, DefAssociation = 0x3, Sequence = 0x0

#### Pin Config Data

    01271c00 01271d00 01271ea6 01271f90 
    01371cf0 01371d00 01371e00 01371f40
    01471c10 01471d00 01471e17 01471f90 01470c02
    01871cf0 01871d00 01871e00 01871f40
    01971c20 01971d11 01971e11 01971f41 
    01a71c30 01a71d11 01a71e11 01a71f41
    01b71cf0 01b71d00 01b71e00 01b71f40 
    01d71cf0 01d71d00 01d71e00 01d71f40 
    01e71cf0 01e71d00 01e71e00 01e71f40 
    02171c40 02171d11 02171e21 02171f02 02170c02

### Audio Mixers / Audio Selectors

    Node 0x22 [Audio Mixer] wcaps 0x20010b: Stereo Amp-In
      Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
      Amp-In vals:  [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80]
      Connection: 5
         0x18 0x19 0x1a 0x1b 0x1d

    Node 0x23 [Audio Mixer] wcaps 0x20010b: Stereo Amp-In
      Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
      Amp-In vals:  [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x00 0x00]
      Connection: 6
         0x18 0x19 0x1a 0x1b 0x1d 0x12

    Node 0x24 [Audio Selector] wcaps 0x300101: Stereo
      Connection: 2
         0x12* 0x13

### Audio Outputs

    Node 0x02 [Audio Output] wcaps 0x41d: Stereo Amp-Out
      Control: name="Speaker Playback Volume", index=0, device=0
        ControlAmp: chs=3, dir=Out, idx=0, ofs=0
      Amp-Out caps: ofs=0x57, nsteps=0x57, stepsize=0x02, mute=0
      Amp-Out vals:  [0x3d 0x3d]
      Converter: stream=1, channel=0
      PCM:
        rates [0x60]: 44100 48000
        bits [0xe]: 16 20 24
        formats [0x1]: PCM
      Power states:  D0 D1 D2 D3 EPSS
      Power: setting=D0, actual=D0

    Node 0x03 [Audio Output] wcaps 0x41d: Stereo Amp-Out
      Control: name="Headphone Playback Volume", index=0, device=0
        ControlAmp: chs=3, dir=Out, idx=0, ofs=0
      Device: name="ALC3246 Analog", type="Audio", device=0
      Amp-Out caps: ofs=0x57, nsteps=0x57, stepsize=0x02, mute=0
      Amp-Out vals:  [0x00 0x00]
      Converter: stream=1, channel=0
      PCM:
        rates [0x60]: 44100 48000
        bits [0xe]: 16 20 24
        formats [0x1]: PCM
      Power states:  D0 D1 D2 D3 EPSS
      Power: setting=D0, actual=D0

    Node 0x06 [Audio Output] wcaps 0x611: Stereo Digital
      Converter: stream=0, channel=0
      Digital:
      Digital category: 0x0
      IEC Coding Type: 0x0
      PCM:
        rates [0x5e0]: 44100 48000 88200 96000 192000
        bits [0xe]: 16 20 24
        formats [0x1]: PCM
      Power states:  D0 D1 D2 D3 EPSS
      Power: setting=D3, actual=D3

### Audio Inputs

    Node 0x07 [Audio Input] wcaps 0x10051b: Stereo Amp-In
      Amp-In caps: ofs=0x17, nsteps=0x3f, stepsize=0x02, mute=1
      Amp-In vals:  [0x97 0x97]
      Converter: stream=0, channel=0
      SDI-Select: 0
      PCM:
        rates [0x560]: 44100 48000 96000 192000
        bits [0xe]: 16 20 24
        formats [0x1]: PCM
      Power states:  D0 D1 D2 D3 EPSS
      Power: setting=D3, actual=D3
      Connection: 1
         0x24

    Node 0x08 [Audio Input] wcaps 0x10051b: Stereo Amp-In
      Control: name="Capture Volume", index=0, device=0
        ControlAmp: chs=3, dir=In, idx=0, ofs=0
      Control: name="Capture Switch", index=0, device=0
        ControlAmp: chs=3, dir=In, idx=0, ofs=0
      Device: name="ALC3246 Analog", type="Audio", device=0
      Amp-In caps: ofs=0x17, nsteps=0x3f, stepsize=0x02, mute=1
      Amp-In vals:  [0x27 0x27]
      Converter: stream=1, channel=0
      SDI-Select: 0
      PCM:
        rates [0x560]: 44100 48000 96000 192000
        bits [0xe]: 16 20 24
        formats [0x1]: PCM
      Power states:  D0 D1 D2 D3 EPSS
      Power: setting=D0, actual=D0
      Connection: 1
         0x23

    Node 0x09 [Audio Input] wcaps 0x10051b: Stereo Amp-In
      Amp-In caps: ofs=0x17, nsteps=0x3f, stepsize=0x02, mute=1
      Amp-In vals:  [0x97 0x97]
      Converter: stream=0, channel=0
      SDI-Select: 0
      PCM:
        rates [0x560]: 44100 48000 96000 192000
        bits [0xe]: 16 20 24
        formats [0x1]: PCM
      Power states:  D0 D1 D2 D3 EPSS
      Power: setting=D3, actual=D3
      Connection: 1
         0x22

## Pathmaps

### Output

* Speaker  

      0x14 (20) --> 0x02 (2)

* Headphone  

      0x21 (33) --> 0x03 (3)

### Input

    0x07 (7) --> 0x24 (36) --> 0x12 (18) (Internal Mic boost volume)
                               0x13 (19) (N/A)

    0x08 (8) --> 0x23 (35) --> 0x12 (18) (Internal Mic Boost Volume)
                               0x18 (24) (N/A)
                               0x19 (25) (Headset Mic Boost Volume)
                               0x1a (26) (Headphone Mic Boost Volume)
                               0x1b (27) (N/A)
                               0x1d (29) (N/A)

    0x09 (9) --> 0x22 (34) --> 0x18 (24) (N/A)
                               0x19 (25) (Headset Mic Boost Volume)
                               0x1a (26) (Headphone Mic Boost Volume)
                               0x1b (27) (N/A)
                               0x1d (29) (N/A)

* Internal Mic boost volume  

      0x12 (18) --> 0x24 (36) --> 0x07 (7)

* Headset Mic Boost Volume

      0x19 (25) --> 0x23 (35) --> 0x08 (8)
      0x19 (25) --> 0x22 (34) --> 0x09 (9)

* Headphone Mic Boost Volume

      0x1a (26) --> 0x22 (34) --> 0x09 (9)
      0x1a (26) --> 0x23 (35) --> 0x08 (8)
