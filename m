Return-Path: virtio-comment-return-1084-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 545DB985EF4
	for <virtio-comment@lists.oasis-open.org>; Thu, 20 Feb 2020 09:51:29 +0000 (UTC)
From: Vitaly Mireyno <vmireyno@marvell.com>
Date: Thu, 20 Feb 2020 09:51:17 +0000
Message-ID: <CY4PR1801MB20725E48C52AA4BB57F26B7EC5130@CY4PR1801MB2072.namprd18.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH] virtio-net: Add support for correct
 hdr_len field.
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "jasowang@redhat.com" <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>


>-----Original Message-----
>From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-open=
.org> On Behalf Of
>Michael S. Tsirkin
>Sent: Thursday, 20 February, 2020 10:12
>To: Vitaly Mireyno <vmireyno@marvell.com>
>Cc: virtio-comment@lists.oasis-open.org; jasowang@redhat.com
>Subject: Re: [virtio-comment] [PATCH] virtio-net: Add support for correct =
hdr_len field.
>
>----------------------------------------------------------------------
>On Thu, Oct 24, 2019 at 03:24:43PM +0000, Vitaly Mireyno wrote:
>> Some devices benefit from the knowledge of the exact header length for T=
SO processing.
>> Add a feature bit for a driver that is capable of providing the correct =
header length for TSO packets.
>>
>> Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
>
>So I looked at implementing this and maybe this was not such a good idea a=
fter all.
>
>How would we implement this in Linux?
>Current code just puts skb_headlen there which is # of bytes in the linear=
 buffer.
>Which I guess it often the header, but not at all always.
>
>Should this have been limited to TSO packets?
>
>I also could not figure out how this is useful for the host.
>Could you enlighten me pls?

As see it, header length is essential for TSO, and maybe not so useful for =
non-TSO.
To calculate the header length, I suppose a Linux driver could do something=
 like:
skb_transport_header(skb) + tcp_hdrlen(skb) - skb->data


>
>> ---
>>  content.tex | 49 +++++++++++++++++++++++++++++++++++++++----------
>>  1 file changed, 39 insertions(+), 10 deletions(-)
>>
>> diff --git a/content.tex b/content.tex index 679391e..dac6921 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -2811,6 +2811,9 @@ \subsection{Feature bits}\label{sec:Device Types
>> / Network Device / Feature bits  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] S=
et MAC address
>through control
>>      channel.
>>
>> +\item[VIRTIO_NET_F_GUEST_HDRLEN(59)] Driver can provide the exact \fiel=
d{hdr_len}
>> +    value.
>> +
>>  \item[VIRTIO_NET_F_RSC_EXT(61)] Device can process duplicated ACKs
>>      and report number of coalesced segments and duplicated ACKs
>>
>> @@ -2840,6 +2843,7 @@ \subsubsection{Feature bit
>> requirements}\label{sec:Device Types / Network Device  \item[VIRTIO_NET_=
F_MQ] Requires
>VIRTIO_NET_F_CTRL_VQ.
>>  \item[VIRTIO_NET_F_CTRL_MAC_ADDR] Requires VIRTIO_NET_F_CTRL_VQ.
>>  \item[VIRTIO_NET_F_RSC_EXT] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_N=
ET_F_HOST_TSO6.
>> +\item[VIRTIO_NET_F_GUEST_HDRLEN] Requires VIRTIO_NET_F_HOST_TSO4 or
>VIRTIO_NET_F_HOST_TSO6 or VIRTIO_NET_F_HOST_UFO.
>>  \end{description}
>>
>>  \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types
>> / Network Device / Feature bits / Legacy Interface: Feature bits} @@ -30=
95,12 +3099,21 @@
>\subsubsection{Packet Transmission}\label{sec:Device Types / Network Devic=
e / De
>>    into smaller packets. The other gso fields are set:
>>
>>    \begin{itemize}
>> -  \item \field{hdr_len} is a hint to the device as to how much of the
>> header
>> +  \item If the VIRTIO_NET_F_GUEST_HDRLEN feature has been negotiated,
>> +    \field{hdr_len} indicates the header length that needs to be replic=
ated
>> +    for each packet. It's a number of bytes from beginning of the packe=
t
>> +    to beginning of the transport payload.
>> +    Otherwise, if the VIRTIO_NET_F_GUEST_HDRLEN feature has not been ne=
gotiated,
>> +    \field{hdr_len} is a hint to the device as to how much of the
>> + header
>>      needs to be kept to copy into each packet, usually set to the
>>      length of the headers, including the transport
>> header\footnote{Due to various bugs in implementations, this field is no=
t useful  as a guarantee of
>the transport header size.
>>  }.
>>
>> +  \begin{note}
>> +  Some devices benefit from the knowledge of the exact header length, f=
or TSO processing.
>> +  \end{note}
>> +
>>    \item \field{gso_size} is the maximum size of each packet beyond that
>>      header (ie. MSS).
>>
>> @@ -3173,9 +3186,17 @@ \subsubsection{Packet
>> Transmission}\label{sec:Device Types / Network Device / De  desired MSS.
>>
>>  If one of the VIRTIO_NET_F_HOST_TSO4, TSO6 or UFO options have -been
>> negotiated, the driver SHOULD set \field{hdr_len} to a value -not less
>> than the length of the headers, including the transport -header.
>> +been negotiated:
>> +\begin{itemize}
>> +\item If the VIRTIO_NET_F_GUEST_HDRLEN feature has been negotiated,
>> +=09the driver MUST set \field{hdr_len} to a value equal to the length
>> +=09of the headers, including the transport header.
>> +
>> +\item If the VIRTIO_NET_F_GUEST_HDRLEN feature has not been negotiated,
>> +=09the driver SHOULD set \field{hdr_len} to a value
>> +=09not less than the length of the headers, including the transport
>> +=09header.
>> +\end{itemize}
>>
>>  The driver MUST NOT set the VIRTIO_NET_HDR_F_DATA_VALID and
>> VIRTIO_NET_HDR_F_RSC_INFO bits in \field{flags}.
>> @@ -3187,12 +3208,20 @@ \subsubsection{Packet
>> Transmission}\label{sec:Device Types / Network Device / De  device MUST =
NOT use the
>\field{csum_start} and \field{csum_offset}.
>>
>>  If one of the VIRTIO_NET_F_HOST_TSO4, TSO6 or UFO options have -been
>> negotiated, the device MAY use \field{hdr_len} only as a hint about
>> the -transport header size.
>> -The device MUST NOT rely on \field{hdr_len} to be correct.
>> -\begin{note}
>> -This is due to various bugs in implementations.
>> -\end{note}
>> +been negotiated:
>> +\begin{itemize}
>> +\item If the VIRTIO_NET_F_GUEST_HDRLEN feature has been negotiated,
>> +=09the device MAY use \field{hdr_len} as the transport header size.
>> +
>> +\item If the VIRTIO_NET_F_GUEST_HDRLEN feature has not been negotiated,
>> +=09the device MAY use \field{hdr_len} only as a hint about the
>> +=09transport header size.
>> +=09The device MUST NOT rely on \field{hdr_len} to be correct.
>> +
>> +=09\begin{note}
>> +=09This is due to various bugs in implementations.
>> +=09\end{note}
>> +\end{itemize}
>>
>>  If VIRTIO_NET_HDR_F_NEEDS_CSUM is not set, the device MUST NOT  rely
>> on the packet checksum being correct.
>> --
>>
>>
>> This publicly archived list offers a means to provide input to the
>> OASIS Virtual I/O Device (VIRTIO) TC.
>>
>> In order to verify user consent to the Feedback License terms and to
>> minimize spam in the list archive, subscription is required before
>> posting.
>>
>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>> List help: virtio-comment-help@lists.oasis-open.org
>> List archive:
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.oasis-2Dope
>> n.org_archives_virtio-2Dcomment_&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=
=3Dl
>> DHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DBJCwxFbolHCRz9kLfj915Enu-
>> mREeI_KYFcLA9Idzwo&s=3Dnlr22vvxamnoP6GTBunPiIQXatfR1jEpMVWo3QWjgkU&e=3D
>> Feedback License:
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-2Dopen.
>> org_who_ipr_feedback-5Flicense.pdf&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ=
&r
>> =3DlDHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DBJCwxFbolHCRz9kLfj915=
En
>> u-mREeI_KYFcLA9Idzwo&s=3DfLR52kyo8ob2sRKD-YqfBkcFpc4N8CjVyoGB8l9jiDY&e=
=3D
>> List Guidelines:
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-2Dopen.
>> org_policies-2Dguidelines_mailing-2Dlists&d=3DDwIFAg&c=3DnKjWec2b6R0mOyP=
az
>> 7xtfQ&r=3DlDHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DBJCwxFbolHCRz9=
kL
>> fj915Enu-mREeI_KYFcLA9Idzwo&s=3DT4qEUr9UYy6-wRGkVEQCwR6bmlDDnJHJMSR3cDx2
>> jow&e=3D
>> Committee:
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-2Dopen.
>> org_committees_virtio_&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW=
52oJ
>> 3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DBJCwxFbolHCRz9kLfj915Enu-mREeI_KYFc
>> LA9Idzwo&s=3DFvN-HcjlfOBLxKBa3aCs7Q8oLFjlwi9b0VEfabOQ-yc&e=3D
>> Join OASIS:
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-2Dopen.
>> org_join_&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lqqsArgF=
Rdce
>> vq01tbLQAw4A_NO7xgI&m=3DBJCwxFbolHCRz9kLfj915Enu-mREeI_KYFcLA9Idzwo&s=3D=
x-
>> xmnzrTYOlr2UQIHWAbcuM9xWt0IXCPnEFjNNdC2sA&e=3D
>
>
>This publicly archived list offers a means to provide input to the OASIS V=
irtual I/O Device (VIRTIO) TC.
>
>In order to verify user consent to the Feedback License terms and to minim=
ize spam in the list archive,
>subscription is required before posting.
>
>Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>List help: virtio-comment-help@lists.oasis-open.org
>List archive: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists=
.oasis-
>2Dopen.org_archives_virtio-
>2Dcomment_&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lqqsArgFR=
dcevq01tbLQAw4
>A_NO7xgI&m=3DBJCwxFbolHCRz9kLfj915Enu-
>mREeI_KYFcLA9Idzwo&s=3Dnlr22vvxamnoP6GTBunPiIQXatfR1jEpMVWo3QWjgkU&e=3D
>Feedback License: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__w=
ww.oasis-
>2Dopen.org_who_ipr_feedback-
>5Flicense.pdf&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lqqsAr=
gFRdcevq01tbLQAw4
>A_NO7xgI&m=3DBJCwxFbolHCRz9kLfj915Enu-mREeI_KYFcLA9Idzwo&s=3DfLR52kyo8ob2s=
RKD-
>YqfBkcFpc4N8CjVyoGB8l9jiDY&e=3D
>List Guidelines: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__ww=
w.oasis-
>2Dopen.org_policies-2Dguidelines_mailing-
>2Dlists&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lqqsArgFRdce=
vq01tbLQAw4A_NO7
>xgI&m=3DBJCwxFbolHCRz9kLfj915Enu-mREeI_KYFcLA9Idzwo&s=3DT4qEUr9UYy6-
>wRGkVEQCwR6bmlDDnJHJMSR3cDx2jow&e=3D
>Committee: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasi=
s-
>2Dopen.org_committees_virtio_&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlD=
HJ2FW52oJ3lqqsArgF
>Rdcevq01tbLQAw4A_NO7xgI&m=3DBJCwxFbolHCRz9kLfj915Enu-mREeI_KYFcLA9Idzwo&s=
=3DFvN-
>HcjlfOBLxKBa3aCs7Q8oLFjlwi9b0VEfabOQ-yc&e=3D
>Join OASIS: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oas=
is-
>2Dopen.org_join_&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lqq=
sArgFRdcevq01tbLQ
>Aw4A_NO7xgI&m=3DBJCwxFbolHCRz9kLfj915Enu-mREeI_KYFcLA9Idzwo&s=3Dx-
>xmnzrTYOlr2UQIHWAbcuM9xWt0IXCPnEFjNNdC2sA&e=3D


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

