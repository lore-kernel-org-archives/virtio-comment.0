Return-Path: virtio-comment-return-1825-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 268A598643D
	for <virtio-comment@lists.oasis-open.org>; Tue, 20 Apr 2021 18:32:26 +0000 (UTC)
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Date: Tue, 20 Apr 2021 20:32:03 +0200
Message-ID: <20210420183203.1227004-1-anton.yakovlev@opensynergy.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH] virtio-snd: add support for audio controls
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: liam.r.girdwood@linux.intel.com, tiwai@suse.de, broonie@kernel.org, maz@kernel.org, james.morse@arm.com, julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com, cdupontd@redhat.com, kraxel@redhat.com, jean-philippe@linaro.org, Anton Yakovlev <anton.yakovlev@opensynergy.com>
List-ID: <virtio-comment.lists.oasis-open.org>

This patch extends the virtio sound device specification by adding
support for audio controls. Audio controls can be used to set the volume
level, mute/unmute the audio signal, switch different modes/states of
the virtual sound device, etc.

Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
---
 conformance.tex  |   5 +
 virtio-sound.tex | 374 ++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 378 insertions(+), 1 deletion(-)

diff --git a/conformance.tex b/conformance.tex
index a164cbb..0f97286 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -255,6 +255,8 @@ \section{Conformance Targets}\label{sec:Conformance / C=
onformance Targets}
 \item \ref{drivernormative:Device Types / Sound Device / Device Operation =
/ PCM Stream Parameters}
 \item \ref{drivernormative:Device Types / Sound Device / Device Operation =
/ PCM Output Stream}
 \item \ref{drivernormative:Device Types / Sound Device / Device Operation =
/ PCM Input Stream}
+\item \ref{drivernormative:Device Types / Sound Device / Device Operation =
/ Control Element Value}
+\item \ref{drivernormative:Device Types / Sound Device / Device Operation =
/ Control Element Metadata}
 \end{itemize}
=20
 \conformance{\subsection}{Memory Driver Conformance}\label{sec:Conformance=
 / Driver Conformance / Memory Driver Conformance}
@@ -492,6 +494,9 @@ \section{Conformance Targets}\label{sec:Conformance / C=
onformance Targets}
 \item \ref{devicenormative:Device Types / Sound Device / Device Operation =
/ PCM Output Stream}
 \item \ref{devicenormative:Device Types / Sound Device / Device Operation =
/ PCM Input Stream}
 \item \ref{devicenormative:Device Types / Sound Device / Device Operation =
/ Channel Map Information}
+\item \ref{devicenormative:Device Types / Sound Device / Device Operation =
/ Control Element Information}
+\item \ref{devicenormative:Device Types / Sound Device / Device Operation =
/ Control Element Metadata}
+\item \ref{devicenormative:Device Types / Sound Device / Device Operation =
/ Control Element Notifications}
 \end{itemize}
=20
 \conformance{\subsection}{Memory Device Conformance}\label{sec:Conformance=
 / Device Conformance / Memory Device Conformance}
diff --git a/virtio-sound.tex b/virtio-sound.tex
index 195eadd..54c9c8e 100644
--- a/virtio-sound.tex
+++ b/virtio-sound.tex
@@ -41,7 +41,10 @@ \subsection{Virtqueues}\label{sec:Device Types / Sound D=
evice / Virtqueues}
=20
 \subsection{Feature Bits}\label{sec:Device Types / Sound Device / Feature =
Bits}
=20
-None currently defined.
+\begin{description}
+\item[VIRTIO_SND_F_CTLS (0)]
+Device supports control elements.
+\end{description}
=20
 \subsection{Device Configuration Layout}\label{sec:Device Types / Sound De=
vice / Device Configuration Layout}
=20
@@ -50,6 +53,7 @@ \subsection{Device Configuration Layout}\label{sec:Device=
 Types / Sound Device /
     le32 jacks;
     le32 streams;
     le32 chmaps;
+    le32 controls;
 };
 \end{lstlisting}
=20
@@ -62,6 +66,9 @@ \subsection{Device Configuration Layout}\label{sec:Device=
 Types / Sound Device /
 PCM streams.
 \item[\field{chmaps}] (driver-read-only) indicates a total number of all a=
vailable
 channel maps.
+\item[\field{controls}] (driver-read-only) indicates a total number of all=
 available
+control elements if VIRTIO_SND_F_CTLS has been negotiated.
+
 \end{description}
=20
 \subsection{Device Initialization}
@@ -74,12 +81,16 @@ \subsection{Device Initialization}
 about the available PCM streams.
 \item Read the \field{chmaps} field and send a control request to query in=
formation
 about the available channel maps.
+\item If VIRTIO_SND_F_CTLS has been negotiated, read the \field{controls} =
field
+and send a control request to query information about the available contro=
l elements.
 \item Populate the event queue with empty buffers.
 \end{enumerate}
=20
 \drivernormative{\subsubsection}{Device Initialization}{Device Types / Sou=
nd Device / Device Initialization}
=20
 \begin{itemize}
+\item The driver MUST NOT read the \field{controls} field
+if VIRTIO_SND_F_CTLS has not been negotiated.
 \item The driver MUST populate the event queue with empty buffers of at le=
ast
 the struct virtio_snd_event size.
 \item The driver MUST NOT put a device-readable buffers in the event queue=
.
@@ -108,6 +119,15 @@ \subsection{Device Operation}\label{sec:Device Types /=
 Sound Device / Device Ope
     /* channel map control request types */
     VIRTIO_SND_R_CHMAP_INFO =3D 0x0200,
=20
+    /* control element request types */
+    VIRTIO_SND_R_CTL_INFO =3D 0x0300,
+    VIRTIO_SND_R_CTL_ENUM_ITEMS,
+    VIRTIO_SND_R_CTL_READ,
+    VIRTIO_SND_R_CTL_WRITE,
+    VIRTIO_SND_R_CTL_TLV_READ,
+    VIRTIO_SND_R_CTL_TLV_WRITE,
+    VIRTIO_SND_R_CTL_TLV_COMMAND,
+
     /* jack event types */
     VIRTIO_SND_EVT_JACK_CONNECTED =3D 0x1000,
     VIRTIO_SND_EVT_JACK_DISCONNECTED,
@@ -116,6 +136,9 @@ \subsection{Device Operation}\label{sec:Device Types / =
Sound Device / Device Ope
     VIRTIO_SND_EVT_PCM_PERIOD_ELAPSED =3D 0x1100,
     VIRTIO_SND_EVT_PCM_XRUN,
=20
+    /* control element event types */
+    VIRTIO_SND_EVT_CTL_NOTIFY =3D 0x1200,
+
     /* common status codes */
     VIRTIO_SND_S_OK =3D 0x8000,
     VIRTIO_SND_S_BAD_MSG,
@@ -805,3 +828,352 @@ \subsubsection{Channel Map Control Messages}\label{se=
c:Device Types / Sound Devi
 \item The device MUST NOT set undefined direction values.
 \item The device MUST NOT set the channels value to more than VIRTIO_SND_C=
HMAP_MAX_SIZE.
 \end{itemize}
+
+\subsubsection{Control Elements}\label{sec:Device Types / Sound Device / D=
evice Operation / Control Elements}
+
+Control elements can be used to set the volume level, mute/unmute the audi=
o
+signal, switch different modes/states of the virtual sound device, etc. De=
sign
+of virtual audio controls is based on and derived from ALSA audio controls=
.
+
+The device informs about the support of audio controls by setting the
+VIRTIO_SND_F_CTLS feature bit. If VIRTIO_SND_F_CTLS has been negotiated, t=
he
+following messages are available for manipulation of control elements.
+
+A control request has, or consists of, a common header with the following
+layout structure:
+
+\begin{lstlisting}
+struct virtio_snd_ctl_hdr {
+    struct virtio_snd_hdr hdr;
+    le32 control_id;
+};
+\end{lstlisting}
+
+The header consists of the following device-readable fields:
+
+\begin{description}
+\item[\field{hdr}] specifies request type (VIRTIO_SND_R_CTL_*).
+\item[\field{control_id}] specifies a control element identifier from 0 to
+\field{virtio_snd_config::controls} - 1.
+\end{description}
+
+\paragraph{Query information}
+
+The VIRTIO_SND_R_CTL_INFO control message is used to query basic informati=
on
+about the available control elements.
+
+The request consists of the virtio_snd_query_info structure
+(see \nameref{sec:Device Types / Sound Device / Device Operation / Item In=
formation Request}).
+The response consists of the virtio_snd_hdr structure, followed by the fol=
lowing
+control element information structures:
+
+\begin{lstlisting}
+enum {
+    VIRTIO_SND_CTL_ROLE_UNDEFINED =3D 0,
+    VIRTIO_SND_CTL_ROLE_VOLUME,
+    VIRTIO_SND_CTL_ROLE_MUTE,
+    VIRTIO_SND_CTL_ROLE_GAIN
+};
+
+enum {
+    VIRTIO_SND_CTL_TYPE_BOOLEAN =3D 0,
+    VIRTIO_SND_CTL_TYPE_INTEGER,
+    VIRTIO_SND_CTL_TYPE_INTEGER64,
+    VIRTIO_SND_CTL_TYPE_ENUMERATED,
+    VIRTIO_SND_CTL_TYPE_BYTES,
+    VIRTIO_SND_CTL_TYPE_IEC958
+};
+
+enum {
+    VIRTIO_SND_CTL_ACCESS_READ =3D 0,
+    VIRTIO_SND_CTL_ACCESS_WRITE,
+    VIRTIO_SND_CTL_ACCESS_VOLATILE,
+    VIRTIO_SND_CTL_ACCESS_INACTIVE,
+    VIRTIO_SND_CTL_ACCESS_TLV_READ,
+    VIRTIO_SND_CTL_ACCESS_TLV_WRITE,
+    VIRTIO_SND_CTL_ACCESS_TLV_COMMAND
+};
+
+struct virtio_snd_ctl_info {
+    struct virtio_snd_info hdr;
+    le32 role;
+    le32 type;
+    le32 access; /* 1 << VIRTIO_SND_CTL_ACCESS_XXX */
+    le32 count;
+    le32 index;
+    u8 name[44];
+    union {
+        struct {
+            le32 min;
+            le32 max;
+            le32 step;
+        } integer;
+        struct {
+            le64 min;
+            le64 max;
+            le64 step;
+        } integer64;
+        struct {
+            le32 items;
+        } enumerated;
+    } value;
+};
+\end{lstlisting}
+
+The structure contains the following device-writable fields:
+
+\begin{description}
+\item[\field{role}] indicates a role for the element. If the field value
+is not equal to UNDEFINED, then the least significant bit indicates the di=
rection
+of data flow (VIRTIO_SND_D_*), and (\field{role} \& 0xfffffffe) >> 1 is eq=
ual to
+one of the following values (VIRTIO_SND_CTL_ROLE_*):
+\begin{description}
+\item[VOLUME] is for a volume control.
+\item[MUTE] is for a mute switch.
+\item[GAIN] is for a gain control.
+\end{description}
+\item[\field{type}] indicates the element value type (VIRTIO_SND_CTL_TYPE_=
*):
+\begin{description}
+\item[BOOLEAN] This is a special case of the INTEGER type, which can take =
only
+two values: 0 (off) and 1 (on).
+\item[INTEGER] 32-bit integer values.
+\item[INTEGER64] 64-bit integer values.
+\item[ENUMERATED] The value is represented by an array of ASCII strings.
+\item[BYTES] 8-bit integer values.
+\item[IEC958] This element is connected to the digital audio interface.
+The value is in the form of the virtio_snd_ctl_iec958 structure.
+\end{description}
+\item[\field{access}] indicates a bit mask describing access rights to the
+element (VIRTIO_SND_CTL_ACCESS_*):
+\begin{description}
+\item[READ] It is possible to read the value.
+\item[WRITE] It is possible to write (change) the value.
+\item[VOLATILE] The value may be changed without a notification.
+\item[INACTIVE] The element does actually nothing, but may be updated.
+\item[TLV_READ] It is possible to read metadata.
+\item[TLV_WRITE] It is possible to write (change) metadata.
+\item[TLV_COMMAND] It is possible to execute a command for metadata.
+\end{description}
+\item[\field{count}] indicates the number of \field{type} members that rep=
resent
+the value of the element.
+\item[\field{index}] indicates the index for an element with a non-unique =
\field{name}.
+\item[\field{name}] indicates the name identifier string for the element.
+\item[\field{value}] indicates some additional information about the value=
 for
+certain types of elements:
+\begin{description}
+\item[\field{integer}]
+\item[\field{integer64}] \field{min} and \field{max} indicate minimum and =
maximum
+element values. \field{step} indicates a fixed step size for changing the =
element
+value between minimum and maximum values. The special value 0 means that t=
he step
+has variable size.
+\item[\field{enumerated}] \field{items} indicates the number of items from=
 which
+the element value can be selected.
+\end{description}
+\end{description}
+
+To query an array of items for elements with the ENUMERATED type, an addit=
ional
+VIRTIO_SND_R_CTL_ENUM_ITEMS control message is used. The request consists =
of the
+virtio_snd_ctl_hdr structure. The response consists of the virtio_snd_hdr =
structure,
+followed by an array of size \field{value.enumerated.items}, consisting of=
 the following
+structures:
+
+\begin{lstlisting}
+struct virtio_snd_ctl_enum_item {
+    u8 item[64];
+};
+\end{lstlisting}
+
+The structure contains the only device-writable field:
+
+\begin{description}
+\item[\field{item}] indicates the name of an available element option.
+\end{description}
+
+\devicenormative{\subparagraph}{Control Element Information}{Device Types =
/ Sound Device / Device Operation / Control Element Information}
+
+\begin{itemize}
+\item The device MUST NOT set undefined \field{role}, \field{type} and
+\field{access} values.
+\item The device MUST set the \field{count} to a value other than zero. Th=
e maximum
+allowed value depends on the element type:
+\begin{description}
+\item[BOOLEAN] 128
+\item[INTEGER] 128
+\item[INTEGER64] 64
+\item[ENUMERATED] 128
+\item[BYTES] 512
+\item[IEC958] 1
+\end{description}
+\item The device MUST set \field{name} and \field{item} fields to a non-em=
pty
+0-terminated ASCII strings.
+\item The device MUST ensure that the combination (\field{name}, \field{in=
dex})
+is unique for each available element.
+\end{itemize}
+
+\paragraph{Value}
+
+If the element has VIRTIO_SND_CTL_ACCESS_READ access right, then the drive=
r
+can issue VIRTIO_SND_R_CTL_READ request to the device to read the element'=
s
+value.
+
+If the element has VIRTIO_SND_CTL_ACCESS_WRITE access right, then the driv=
er
+can issue VIRTIO_SND_R_CTL_WRITE request to the device to write the elemen=
t's
+value.
+
+The following structure and layout definitions are used in read and write =
requests:
+
+\begin{lstlisting}
+struct virtio_snd_ctl_iec958 {
+    u8 status[24];      /* AES/IEC958 channel status bits */
+    u8 subcode[147];    /* AES/IEC958 subcode bits */
+    u8 pad;             /* nothing */
+    u8 dig_subframe[4]; /* AES/IEC958 subframe bits */
+};
+
+struct virtio_snd_ctl_value {
+    union {
+        le32 integer[128];
+        le64 integer64[64];
+        le32 enumerated[128];
+        u8 bytes[512];
+        struct virtio_snd_ctl_iec958 iec958;
+    } value;
+};
+\end{lstlisting}
+
+The element value structure consists of a single \field{value} union, whic=
h
+contains the following fields:
+
+\begin{description}
+\item[\field{integer}] specifies values for an element of type BOOLEAN or
+INTEGER.
+\item[\field{integer64}] specifies values for an element of type INTEGER64=
.
+\item[\field{enumerated}] specifies indexes of items for an element of typ=
e
+ENUMERATED.
+\item[\field{bytes}] specifies values for an element of type BYTES.
+\item[\field{iec958}] specifies a value for an element of type IEC958.
+\end{description}
+
+For all types, except for IEC958, the array contains \field{count} values
+(the \field{count} is reported in the element information structure).
+
+A read request consists of a (device-readable) virtio_snd_ctl_hdr structur=
e
+containing request, followed by (device-writable) virtio_snd_hdr and
+virtio_snd_ctl_value structures, into which the status of the request and
+the current value of the element will be written.
+
+A write request consists of (device-readable) virtio_snd_ctl_hdr and
+virtio_snd_ctl_value structures containing request and the new element val=
ue,
+followed by (device-writable) virtio_snd_hdr structure, into which the sta=
tus
+of the request will be written.
+
+\drivernormative{\subparagraph}{Control Element Value}{Device Types / Soun=
d Device / Device Operation / Control Element Value}
+
+\begin{itemize}
+\item The driver MUST NOT send READ request if the element does not have A=
CCESS_READ access right.
+\item The driver MUST NOT send WRITE request if the element does not have =
ACCESS_WRITE access right.
+\end{itemize}
+
+\paragraph{Metadata}
+
+Metadata can be used to provide additional (arbitrary) information about t=
he
+element (e.g. dB range).
+
+If the element has VIRTIO_SND_CTL_ACCESS_TLV_READ access right, then the d=
river
+can issue VIRTIO_SND_R_CTL_TLV_READ request to the device to read the elem=
ent's
+metadata.
+
+If the element has VIRTIO_SND_CTL_ACCESS_TLV_WRITE access right, then the =
driver
+can issue VIRTIO_SND_R_CTL_TLV_WRITE request to the device to write the el=
ement's
+metadata.
+
+If the element has VIRTIO_SND_CTL_ACCESS_TLV_COMMAND access right, then th=
e driver
+can issue VIRTIO_SND_R_CTL_TLV_COMMAND request to the device to execute a =
command
+for element's metadata.
+
+All information related to metadata is presented in the form of TLV (Type-=
Length-Value):
+
+\begin{lstlisting}
+struct virtio_snd_ctl_tlv {
+    le32 type;
+    le32 length;
+    le32 value[];
+};
+\end{lstlisting}
+
+The structure contains the following fields:
+
+\begin{description}
+\item[\field{type}] specifies metadata type. ALSA defines several standard=
 metadata
+types for control elements, details of which can be found in various ALSA =
documentation.
+Device implementers can also define their own types and formats.
+\item[\field{length}] specifies the \field{value} length in bytes aligned =
to 4.
+\item[\field{value}] contains metadata in form of an array of 4-byte integ=
ers.
+\end{description}
+
+A read request consists of a (device-readable) virtio_snd_ctl_hdr structur=
e
+containing request, followed by (device-writable) virtio_snd_hdr and
+virtio_snd_ctl_tlv structures, into which the status of the request and
+element's metadata will be written.
+
+A write and command requests consist of (device-readable) virtio_snd_ctl_h=
dr and
+virtio_snd_ctl_tlv structures containing request and element's metadata/co=
mmand
+content, followed by (device-writable) virtio_snd_hdr structure, into whic=
h the
+status of the request will be written.
+
+\devicenormative{\subparagraph}{Control Element Metadata}{Device Types / S=
ound Device / Device Operation / Control Element Metadata}
+
+\begin{itemize}
+\item For a read request, if there is not enough space in the \field{value=
} field,
+the device SHOULD write as much as it can and successfully complete the re=
quest.
+\end{itemize}
+
+\drivernormative{\subparagraph}{Control Element Metadata}{Device Types / S=
ound Device / Device Operation / Control Element Metadata}
+
+\begin{itemize}
+\item The driver MUST NOT send TLV_READ request if the element does not ha=
ve
+ACCESS_TLV_READ access right.
+\item The driver MUST NOT send TLV_WRITE request if the element does not h=
ave
+ACCESS_TLV_WRITE access right.
+\item The driver MUST NOT send TLV_COMMAND request if the element does not=
 have
+ACCESS_TLV_COMMAND access right.
+\item The driver MUST NOT submit the \field{value} field larger than 65536=
 bytes.=20
+\end{itemize}
+
+\paragraph{Notifications}
+
+The notification uses the following structure and layout definitions:
+
+\begin{lstlisting}
+enum {
+    VIRTIO_SND_CTL_EVT_MASK_VALUE =3D 0,
+    VIRTIO_SND_CTL_EVT_MASK_INFO,
+    VIRTIO_SND_CTL_EVT_MASK_TLV
+};
+
+struct virtio_snd_ctl_event {
+    struct virtio_snd_hdr hdr; /* .code =3D VIRTIO_SND_EVT_CTL_NOTIFY */
+    le16 control_id;
+    le16 mask; /* 1 << VIRTIO_SND_CTL_EVT_MASK_XXX */
+};
+\end{lstlisting}
+
+The structure contains the following device-writable fields:
+
+\begin{description}
+\item[\field{control_id}] indicates a control element identifier from 0 to
+\field{virtio_snd_config::controls} - 1.
+\item[\field{mask}] indicates a bit mask describing the reason(s) for send=
ing
+the notification (VIRTIO_SND_CTL_EVT_MASK_*):
+\begin{description}
+\item[VALUE] means the element's value has changed.
+\item[INFO] means the element's information has changed.
+\item[TLV] means the element's metadata has changed.
+\end{description}
+\end{description}
+
+\devicenormative{\subparagraph}{Control Element Notifications}{Device Type=
s / Sound Device / Device Operation / Control Element Notifications}
+
+\begin{itemize}
+\item The device MUST NOT set undefined \field{mask} values.
+\end{itemize}
--=20
2.31.1



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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

