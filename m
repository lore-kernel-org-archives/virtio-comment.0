Return-Path: virtio-comment-return-1733-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CBF419864D0
	for <virtio-comment@lists.oasis-open.org>; Thu,  4 Mar 2021 18:36:53 +0000 (UTC)
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Message-ID: <caf0c3e3-5959-10d2-6b87-5128b0e2c30e@opensynergy.com>
Date: Thu, 4 Mar 2021 19:36:48 +0100
MIME-Version: 1.0
Subject: [virtio-comment] virtio-snd: Adding support for audio controls
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: virtio-comment@lists.oasis-open.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, liam.r.girdwood@linux.intel.com, Takashi Iwai <tiwai@suse.de>, broonie@kernel.org, maz@kernel.org, james.morse@arm.com, julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com, cdupontd@redhat.com, jean-philippe@linaro.org
List-ID: <virtio-comment.lists.oasis-open.org>

Hello everyone,

The virtio sound device lacks audio controls, which are a needed
feature. Audio controls can be used to set the volume level, mute/unmute
the audio signal, switch different modes/states of the virtual sound
device, etc. At the same time, it would be desirable also to be able to
para-virtualize ALSA controls on top of the device. As they are feature
rich, flexible and allow many useful scenarios to be implemented in
a Linux-based virtual guests (and potentially in guests without ALSA).

This email contains just a description of possible extension to the spec
and a rough idea of how this could work and have been implemented. Any
comments and suggestions are very welcome!

The same ALSA control design can be used as a basis. It allow us to
implement the necessary logic for volume control, muting, etc for both
Linux-based systems and systems where there is no ALSA (for example,
Windows). For this reason, all structure declarations are derived from
ALSA structures, and most constants are just ALSA constants (if
everything goes well, we'll just rename everything and assign numbers).

It's necessary to add a new feature bit, and extend the device
configuration space with a field containing the number of provided
controls:

struct virtio_snd_config {
     ...
     /* # of available audio controls */
     le32 controls;
};

After that, the driver will be able to send a request to obtain
information about each of the available controls:

struct virtio_snd_ctl_info {
     struct virtio_snd_info hdr;
     le32 iface;         /* interface (SNDRV_CTL_ELEM_IFACE_XXX) */
     le32 type;          /* value type (SNDRV_CTL_ELEM_TYPE_XXX) */
     le32 access;    /* access rights (1 << SNDRV_CTL_ELEM_ACCESS_XXX) */
     le32 count;         /* count of same elements */
     le32 subdevice;     /* subdevice (substream) number */
     le32 index;         /* index of element */
     u8 name[44];        /* ASCII name of element (0-terminated) */
     union {
         struct {
             le32 min;   /* minimum value */
             le32 max;   /* maximum value */
             le32 step;  /* step (0 variable) */
         } integer;
         struct {
             le64 min;   /* minimum value */
             le64 max;   /* maximum value */
             le64 step;  /* step (0 variable) */
         } integer64;
         struct {
             le32 items; /* number of items */
         } enumerated;
     } value;
};

ALSA control is assigned to a specific interface (kind of a "scope"),
and the `iface` field contains the interface identifier for this
specific control. Of all the existing interface types, the virtual sound
device can support the following:

SNDRV_CTL_ELEM_IFACE_CARD
   Global controls that are not logically part of the mixer.
SNDRV_CTL_ELEM_IFACE_MIXER
   Virtual mixer controls. Most of the controls (volume controls, mute
   switches, etc.) belong to this interface.
SNDRV_CTL_ELEM_IFACE_PCM
   Controls that are bound to a specific PCM devices.

The `type` field contains the value type for this specific control.
Controls can have the following value types:

SNDRV_CTL_ELEM_TYPE_BOOLEAN
   This is a special case of the INTEGER type, which can take only two
   values: off (0) and on (1). Basically, it is the value type for the
   switch control.
SNDRV_CTL_ELEM_TYPE_INTEGER
   32-bit integer values.
SNDRV_CTL_ELEM_TYPE_INTEGER64
   64-bit integer values.
SNDRV_CTL_ELEM_TYPE_ENUMERATED
   The values are represented by an array of ASCII strings.
SNDRV_CTL_ELEM_TYPE_BYTES
   The value of the control is an array of (up to 512) bytes.
SNDRV_CTL_ELEM_TYPE_IEC958
   This control is connected to the digital audio interface. The value is
   in the form of:

     struct snd_aes_iec958 {
         u8 status[24];      /* AES/IEC958 channel status bits */
         u8 subcode[147];    /* AES/IEC958 subcode bits */
         u8 pad;             /* nothing */
         u8 dig_subframe[4]; /* AES/IEC958 subframe bits */
     };

The `access` field contains a bit mask describing access rights to the
control:

SNDRV_CTL_ELEM_ACCESS_READ
   The driver can read the value of the control.
SNDRV_CTL_ELEM_ACCESS_WRITE
   The driver can write (change) the value of the control.
SNDRV_CTL_ELEM_ACCESS_VOLATILE
   Control value may be changed without a notification. (Applications
   should poll such a control constantly.)
SNDRV_CTL_ELEM_ACCESS_INACTIVE
   Control does actually nothing, but may be updated. (For example, the
   control can be used for some specific auxiliary functions.)

If the control supports metadata (more on this below), then the
following access rights may also be present:

SNDRV_CTL_ELEM_ACCESS_TLV_READ
   The driver can read metadata in TLV format.
SNDRV_CTL_ELEM_ACCESS_TLV_WRITE
   The driver can write (change) metadata in TLV format.
SNDRV_CTL_ELEM_ACCESS_TLV_COMMAND
   The driver can execute a command for metadata expressed in TLV format.

The `count` field contains amount of the same elements (up to 64 for
INTEGER64, and up to 128 for BOOLEAN, INTEGER and ENUMERATED types).
That is, if this value is >1, then the control has a kind of
"subcontrols". For example, for volume control this value may be equal
to the number of channels supported. And this allows to change the
volume of each channel separately.

If the control is bound to the PCM device (iface=PCM), then it also
can be bound to a particular PCM substream (if this PCM device has more
than one substream). In this case, the `subdevice` field contains
the ID of the virtio PCM stream. Also, in this case it is necessary to
know the ID of the PCM device itself. This information can be derived
from the ID of the function group to which the control belongs. If for
a given control iface=PCM, but it is not bound to a specific substream,
we can put -1 here.

The `name` field contains the name identifier string (up to 44 bytes
including the terminating 0). ALSA classifies the role of a control by
its name. This can be problematic for systems without ALSA. On the other
hand, such systems usually require only standard volume controls, mute
switches, and the like. So as a possible solution to the problem, we
could explicitly write in the specification that for these purposes the
driver should look for controls with the following fields:

Playback volume control (search in the specified order):
iface=MIXER,name="Master Playback Volume"|"Playback Volume"

Playback mute switch (search in the specified order):
iface=MIXER,name="Master Playback Switch"|"Playback Switch"

Capture volume control (search in the specified order):
iface=MIXER,name="Master Capture Volume"|"Capture Volume"

Capture mute switch (search in the specified order):
iface=MIXER,name="Master Capture Switch"|"Capture Switch"

Mic boost
iface=MIXER,name="Mic Boost Volume"|"Mic Boost"

(Maybe some some other typical roles...)

...and just ignore all other controls. It also gives instructions to the
device which names to choose for controls for a given role. And of
course, it is always possible for the driver to parse the names of
controls on its own in accordance with the ALSA rules (if really
necessary).

Since control's role is classified from its name, the name must be
unique for that particular sound device. If it's really required to
provide several controls with the same name, then they can be
distinguished by the `index` field value.

And finally the `values` field contains additional information about the
value for certain types of controls:

type=INTEGER -> value.integer:
type=INTEGER64 -> value.integer64:
     `min`
         Contains minimum control value.
     `max`
         Contains maximum control value.
     `step`
         Contains a fixed step size for changing the control value between
         minimum and maximum values. The special value 0 means that the
         step has variable size.

type=ENUMERATED -> value.enumerated:
     `items`
         Contains the number of items from which the control value can be
         selected (more on this below).

Everything described above relates to the initialization of controls in
the driver. To manipulate controls, we need to define a control request
header, additional control request and event types.

enum {
     ...
     VIRTIO_SND_R_CTL_INFO,
     VIRTIO_SND_R_CTL_ENUM_VALUES,
     VIRTIO_SND_R_CTL_READ,
     VIRTIO_SND_R_CTL_WRITE,
     VIRTIO_SND_R_CTL_TLV_READ,
     VIRTIO_SND_R_CTL_TLV_WRITE,
     VIRTIO_SND_R_CTL_TLV_COMMAND,
     ...
     VIRTIO_SND_EVT_CTL_NOTIFY
};

struct virtio_snd_ctl_hdr {
     /* VIRTIO_SND_R_CTL_XXX */
     struct virtio_snd_hdr hdr;
     /* 0 ... virtio_snd_config::controls - 1 */
     le16 control_id;
     /* 0 ... virtio_snd_ctl_info::count - 1 */
     le16 subcontrol_id;
};

VIRTIO_SND_R_CTL_INFO
     Get virtio_snd_ctl_info for the control with the specified ID.

VIRTIO_SND_R_CTL_ENUM_VALUES
     Controls with enumeration type are intended for user-friendly
     configuration of some device feature. The values themselves are
     ASCII strings, each up to 64 bytes (including the terminating 0).

     Example:
       name="Auto-Mute Mode"
       type=ENUMERATED
       items=[ "Disabled", "Enabled" ]

     Since the array with the enumeration values has a variable length,
     we cannot add it to the control information structure. But since we
     know the number of values, each of which has a fixed maximum size,
     we can get them in one go.

     A request part of message consists of virtio_snd_ctl_hdr, and
     a response part consists of virtio_snd_hdr followed by
     virtio_snd_ctl_info::value.items of the following structures:

     struct virtio_snd_ctl_enum_value {
         u8 name[64];
     };

VIRTIO_SND_R_CTL_READ
VIRTIO_SND_R_CTL_WRITE
     The following structure is used to represent the value of the control
     for read and write operations:

     struct virtio_snd_ctl_value {
         union {
             le32 integer[128];              /* type=BOOLEAN|INTEGER */
             le64 integer64[64];             /* type=INTEGER64 */
             le32 enumerated[128];           /* type=ENUMERATED */
             u8 bytes[512];                  /* type=BYTES */
             struct snd_aes_iec958 iec958;   /* type=IEC958 */
         } value;
     };

     Since the control has the `count` field, the value of which can be >1,
     the arrays for the BOOLEAN, INTEGER[64] and ENUMERATED types contain
     `count` values (one for each "subcontrol"). For ENUMERATED type,
     this value is the index of the selected item.

     A request part of the READ message consists of virtio_snd_ctl_hdr,
     and a response part consists of virtio_snd_hdr followed by
     virtio_snd_ctl_value.

     A request part of the WRITE message consists of virtio_snd_ctl_hdr
     followed by virtio_snd_ctl_value, and a response part consists of
     virtio_snd_hdr.

     It remains an open question whether to use the le{32,64} types and
     do endianess conversions, or just use the u{32,64} types.

VIRTIO_SND_R_CTL_TLV_READ
VIRTIO_SND_R_CTL_TLV_WRITE
VIRTIO_SND_R_CTL_TLV_COMMAND
     If the control supports metadata, the driver can use these requests
     for metadata. Metadata can be used to provide additional (arbitrary)
     information about the control, presented in the form of TLV.

     For example, for volume or mic boost controls, ALSA can also provide
     information about the dB values. This information can be obtained
     and used also in systems without ALSA.

     Data are presented in TLV (Type-Length-Value) format:

         struct virtio_snd_ctl_tlv {
             le32 type;      /* SNDRV_CTL_TLVT_XXX */
             le32 length;    /* value length in bytes aligned to 4 */
             le32 value[];
         };

     The `type` field contains value type. ALSA defines several standard
     types:

         SNDRV_CTL_TLVT_CONTAINER (0)
             A container that contains a set of nested virtio_snd_ctl_tlv
             structures in the `value` field.
         SNDRV_CTL_TLVT_DB_SCALE (1)
             The `value` field contains information about a mixer control
             where each step in the control's value changes the dB value
             by a constant dB amount.
         SNDRV_CTL_TLVT_DB_LINEAR (2)
             The `value` field contains information about a mixer control
             where the control's value affects the output linearly.
         SNDRV_CTL_TLVT_DB_RANGE (3)
             A container that contains a set of nested dB ranges in the
             `value` field.
         SNDRV_CTL_TLVT_DB_MINMAX (4)
             The `value` field contains information about a mixer control
             where dB scale specified with min/max values instead of
             step.
         SNDRV_CTL_TLVT_DB_MINMAX_MUTE (5)
             The `value` field contains information about a mixer control
             where dB scale specified with min/max values with mute
             instead of step.

     Since this information is useful, we can add descriptions of the
     `value` field layout for each of these types to support non-ALSA
     systems. ALSA also defines several more types. But since they are
     not suitable for the case of para-virtualization, we do not
     mention them here.

     Also, the device implementation can define its own custom value
     types that can be retrieved and parsed by the application on the
     guest side. I think we need to define some kind of base ID for such
     types so as not to clash with ALSA (especially since the type has a
     32-bit value, there should be enough space).

     In general, the data size can be arbitrary, but ALSA limits it to
     65536 bytes, so we apply the same limit to virtio_snd_ctl_tlv.

     A request part of the TLV_READ message consists of
     virtio_snd_ctl_hdr, and a response part consists of virtio_snd_hdr
     followed by virtio_snd_ctl_tlv.

     A request part of the TLV_WRITE and TLV_COMMAND messages consists of
     virtio_snd_ctl_hdr followed by virtio_snd_ctl_tlv, and a response
     part consists of virtio_snd_hdr.

     It remains an open question whether to use the le32 type and do
     endianess conversions, or just use the u32 type.

The only thing left to describe is the events for control. The event is
represented by the following structure:

     struct virtio_snd_ctl_event {
         /* VIRTIO_SND_EVT_CTL_NOTIFY */
         struct virtio_snd_hdr hdr;
         /* 0 ... virtio_snd_config::controls - 1 */
         le16 control_id;
         /* event mask (1 << SNDRV_CTL_EVENT_MASK_XXX) */
         le16 mask;
     };

ALSA defines a bit mask describing the reason for sending an event. We 
are interested in the following three bit values:

     SNDRV_CTL_EVENT_MASK_VALUE
         Element value was changed.
     SNDRV_CTL_EVENT_MASK_INFO
         Element info was changed.
     SNDRV_CTL_EVENT_MASK_TLV
         Element TLV tree was changed.



That's it. Any comments and suggestions are very welcome. Thanks!


-- 
Anton Yakovlev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

