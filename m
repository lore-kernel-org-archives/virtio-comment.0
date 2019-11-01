Return-Path: virtio-comment-return-898-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6ABAC986110
	for <virtio-comment@lists.oasis-open.org>; Fri,  1 Nov 2019 07:22:37 +0000 (UTC)
References: <BN6PR1801MB2067FA1E7C89A81371DC0DB9C5630@BN6PR1801MB2067.namprd18.prod.outlook.com>
 <20191031235120-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <2b9fe971-7d9d-245c-bc74-81c1336cbb9d@redhat.com>
Date: Fri, 1 Nov 2019 15:22:26 +0800
MIME-Version: 1.0
In-Reply-To: <20191031235120-mutt-send-email-mst@kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH] virtio-net: Add equal-sized receive
 buffers feature
To: "Michael S. Tsirkin" <mst@redhat.com>, Vitaly Mireyno <vmireyno@marvell.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>


On 2019/11/1 =E4=B8=8B=E5=8D=8812:09, Michael S. Tsirkin wrote:
> On Thu, Oct 31, 2019 at 10:46:55AM +0000, Vitaly Mireyno wrote:
>> The feature is limited to receive buffers only.
>> A driver decides on receive buffer length. The only limitation is that t=
his length has to be the same for all receive virtqueue buffers.
>> The driver configures receive buffer length to the device during device =
initialization, and the device reads it and may use it for optimal operatio=
n.
>> No changes for transmit buffers.
>>
>> -----Original Message-----
>> From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-op=
en.org> On Behalf Of Jason Wang
>> Sent: Thursday, 31 October, 2019 12:15
>> To: Vitaly Mireyno <vmireyno@marvell.com>; virtio-comment@lists.oasis-op=
en.org
>> Cc: Michael S. Tsirkin <mst@redhat.com>
>> Subject: [virtio-comment] Re: [PATCH] virtio-net: Add equal-sized receiv=
e buffers feature
>>
>>
>> On 2019/10/31 =E4=B8=8B=E5=8D=885:23, Vitaly Mireyno wrote:
>>> Some devices benefit from working with receive buffers of a predefined =
constant length.
>>> Add a feature for drivers that allocate equal-sized receive buffers, an=
d devices that benefit from predefined receive buffers length.
>>>
>>> Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
>>> ---
>>>    content.tex | 29 +++++++++++++++++++++++++++--
>>>    1 file changed, 27 insertions(+), 2 deletions(-)
>>
>> Is there any other networking device that has this feature?
>>
>>
>>> diff --git a/content.tex b/content.tex index b1ea9b9..c9e67c8 100644
>>> --- a/content.tex
>>> +++ b/content.tex
>>> @@ -2811,6 +2811,10 @@ \subsection{Feature bits}\label{sec:Device Types=
 / Network Device / Feature bits
>>>    \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through contro=
l
>>>        channel.
>>>   =20
>>> +\item[VIRTIO_NET_F_CONST_RXBUF_LEN(58)] Driver allocates all receive b=
uffers
>>> +    of the same constant length. Device benefits from working with
>>> +    receive buffers of equal length.
>>> +
> Problem is, I don't think linux will use this for skbs since it breaks
> buffer accounting. This is because it is important to make skbs
> as small as you can. So even if you see "device would benefit"
> there is no way to balance this with the benefit to linux.
> How do you know which benefit is bigger?


I guess the idea is e.g for Linux driver, it can refuse this feature.


>
> You also never explained how does device benefit. My guess is this
> allows device to calculate the # of descriptors to fetch
> that are needed for a packet. Right?
> Assuming this, I think a rough estimate should be enough.
> If device fetches too much it can discard extra, if it does not
> fetch enough it can fetch extra.
>
> Let us not forget that express packets are 256 bytes so
> up to 16 descriptors fit in a packet, there is no
> benefit most of the time in knowing whether e.g. 1 or 2
> descriptors are needed.
>
>
> Let us not forget these are buffers, not descriptors.


I guess maybe the initial motivation is constant descriptor length.


>
> So device does not really know the exact # of descriptors:
> current drivers do 1 descriptor per buffer but nothing
> prevents more.
>
>
> Thoughts?
>
>
>>>    \item[VIRTIO_NET_F_RSC_EXT(61)] Device can process duplicated ACKs
>>>        and report number of coalesced segments and duplicated ACKs
>>>   =20
>>> @@ -2854,8 +2858,8 @@ \subsubsection{Legacy Interface: Feature bits}\la=
bel{sec:Device Types / Network
>>>    \subsection{Device configuration layout}\label{sec:Device Types / Ne=
twork Device / Device configuration layout}
>>>    \label{sec:Device Types / Block Device / Feature bits / Device
>>> configuration layout}
>>>   =20
>>> -Three driver-read-only configuration fields are currently defined.
>>> The \field{mac} address field -always exists (though is only valid if
>>> VIRTIO_NET_F_MAC is set), and
>>> +The driver-read-only \field{mac} address field always exists (though
>>> +is only valid if VIRTIO_NET_F_MAC is set), and
>>>    \field{status} only exists if VIRTIO_NET_F_STATUS is set. Two
>>>    read-only bits (for the driver) are currently defined for the status=
 field:
>>>    VIRTIO_NET_S_LINK_UP and VIRTIO_NET_S_ANNOUNCE.
>>> @@ -2875,12 +2879,17 @@ \subsection{Device configuration layout}\label{=
sec:Device Types / Network Device
>>>    VIRTIO_NET_F_MTU is set. This field specifies the maximum MTU for th=
e driver to
>>>    use.
>>>   =20
>>> +The device-read-only field \field{rx_buf_len} only exists if
>>
>> Should be driver-read-only.
>>
>>
>>> +VIRTIO_NET_F_CONST_RXBUF_LEN is negotiated. This field specifies the
>>> +receive buffers length.
>>> +
>>>    \begin{lstlisting}
>>>    struct virtio_net_config {
>>>            u8 mac[6];
>>>            le16 status;
>>>            le16 max_virtqueue_pairs;
>>>            le16 mtu;
>>> +        le32 rx_buf_len;
>>>    };
>>>    \end{lstlisting}
>>>   =20
>>> @@ -2933,6 +2942,13 @@ \subsection{Device configuration
>>> layout}\label{sec:Device Types / Network Device
>>>   =20
>>>    A driver SHOULD negotiate the VIRTIO_NET_F_STANDBY feature if the de=
vice offers it.
>>>   =20
>>> +A driver SHOULD accept the VIRTIO_NET_F_CONST_RXBUF_LEN feature if off=
ered.
>>> +
>>> +If VIRTIO_NET_F_CONST_RXBUF_LEN feature has been negotiated, the
>>> +driver MUST set \field{rx_buf_len}.
>>
>> I think it's device that set the field?
> Makes more sense for the driver, but if you want this set
> e.g. before buffers are added, you must say so.
>
>>> +
>>> +A driver MUST NOT modify \field{rx_buf_len} once it has been set.
>>> +
>
> This seems very unflexible. I can see how e.g. XDP would benefit from
> big buffers while skbs benefit from small buffers.
>
> This calls for ability to change this.


Yes, but it requires non trivial cleanups for the old length and place=20
them with new ones.

Thanks


>
>>>    \subsubsection{Legacy Interface: Device configuration layout}\label{=
sec:Device Types / Network Device / Device configuration layout / Legacy In=
terface: Device configuration layout}
>>>    \label{sec:Device Types / Block Device / Feature bits / Device confi=
guration layout / Legacy Interface: Device configuration layout}
>>>    When using the legacy interface, transitional devices and drivers @@
>>> -3241,6 +3257,11 @@ \subsubsection{Setting Up Receive Buffers}\label{se=
c:Device Types / Network Devi
>>>    If VIRTIO_NET_F_MQ is negotiated, each of receiveq1\ldots receiveqN
>>>    that will be used SHOULD be populated with receive buffers.
>>>   =20
>>> +If VIRTIO_NET_F_CONST_RXBUF_LEN feature has been negotiated, the
>>> +driver MUST initialize all receive virtqueue descriptors \field{len}
>>> +field with the value configured in \field{rx_buf_len} device
>>> +configuration field, and allocate receive buffers accordingly.
>>> +
>>>    \devicenormative{\paragraph}{Setting Up Receive Buffers}{Device
>>> Types / Network Device / Device Operation / Setting Up Receive
>>> Buffers}
>>>   =20
>>>    The device MUST set \field{num_buffers} to the number of descriptors
>>> used to @@ -3396,6 +3417,10 @@ \subsubsection{Processing of Incoming Pa=
ckets}\label{sec:Device Types / Network
>>>    checksum (in case of multiple encapsulated protocols, one level
>>>    of checksums is validated).
>>>   =20
>>> +If VIRTIO_NET_F_CONST_RXBUF_LEN has been negotiated, the device MAY
>>> +use \field{rx_buf_len} as a buffer length (instead of reading it from
>>> +virtqueue descriptor \field{len} field).
>>
>> Is this safe? What if driver submit a small buffer, then device can read=
 more than what is allowed?
>>
>> Thanks
>>
>>
>>> +
>>>    \drivernormative{\paragraph}{Processing of Incoming
>>>    Packets}{Device Types / Network Device / Device Operation /
>>>    Processing of Incoming Packets}
>>> --
>>
>> This publicly archived list offers a means to provide input to theOASIS =
Virtual I/O Device (VIRTIO) TC.In order to verify user consent to the Feedb=
ack License terms andto minimize spam in the list archive, subscription is =
requiredbefore posting.Subscribe: virtio-comment-subscribe@lists.oasis-open=
.orgUnsubscribe: virtio-comment-unsubscribe@lists.oasis-open.orgList help: =
virtio-comment-help@lists.oasis-open.orgList archive: https://urldefense.pr=
oofpoint.com/v2/url?u=3Dhttps-3A__lists.oasis-2Dopen.org_archives_virtio-2D=
comment_&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lqqsArgFRdce=
vq01tbLQAw4A_NO7xgI&m=3DKkXMgr3LRg5F7_7jB6uHCHA2n_Tn6303zez2N4VkSfU&s=3DZvY=
uXs3LuhkeJxW_zoADv1L4RisDyGH_vp7scO91w9s&e=3D Feedback License: https://url=
defense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-2Dopen.org_who_ipr_fe=
edback-5Flicense.pdf&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3=
lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DKkXMgr3LRg5F7_7jB6uHCHA2n_Tn6303zez2N4V=
kSfU&s=3D7Hf-O4ss-rLdNJsAbIOg5ruheBcfAYFdXWuks_HJfFQ&e=3D List Guidelines: =
https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-2Dopen.org=
_policies-2Dguidelines_mailing-2Dlists&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtf=
Q&r=3DlDHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DKkXMgr3LRg5F7_7jB6uHC=
HA2n_Tn6303zez2N4VkSfU&s=3D7oMwlBy4fdYwjT2_f9BTwHRm2GFtIYL-x8e4C0jlrpM&e=3D=
 Committee: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasi=
s-2Dopen.org_committees_virtio_&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3Dl=
DHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DKkXMgr3LRg5F7_7jB6uHCHA2n_Tn=
6303zez2N4VkSfU&s=3D-K2akZ06PY7r4TquQY4T4UWdZ6JyAsBDFZIEZFNsWHk&e=3D Join O=
ASIS: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-2Dop=
en.org_join_&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lqqsArgF=
Rdcevq01tbLQAw4A_NO7xgI&m=3DKkXMgr3LRg5F7_7jB6uHCHA2n_Tn6303zez2N4VkSfU&s=
=3DlR1SlzXT71tjw7DDuD6XaHefJQSTBCAvRcdp45ureB8&e=3D
>>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>


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
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

