Return-Path: virtio-comment-return-1005-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4E9A6985A85
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Jan 2020 15:13:16 +0000 (UTC)
From: Vitaly Mireyno <vmireyno@marvell.com>
Date: Mon, 6 Jan 2020 15:13:11 +0000
Message-ID: <BN6PR1801MB206747D106FED185A500424FC53C0@BN6PR1801MB2067.namprd18.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: RE: [virtio-comment] Re: [PATCH] virtio-net: Add an optional device
 control over the receive buffers length
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>


>-----Original Message-----
>From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
>open.org> On Behalf Of Michael S. Tsirkin
>Sent: Sunday, 5 January, 2020 12:35
>To: Vitaly Mireyno <vmireyno@marvell.com>
>Cc: virtio-comment@lists.oasis-open.org; Jason Wang
><jasowang@redhat.com>
>Subject: [EXT] [virtio-comment] Re: [PATCH] virtio-net: Add an optional de=
vice
>control over the receive buffers length
>
>----------------------------------------------------------------------
>On Mon, Dec 30, 2019 at 01:59:17PM +0000, Vitaly Mireyno wrote:
>> This patch gives devices some level of control over the receive buffers
>length.
>> The driver declares the minimum receive buffer length, and the device
>requests max/min buffer length ratio.
>> This is a follow-up to the "[PATCH] virtio-net: Add equal-sized
>> receive buffers feature" discussion:
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.oasis-2Dope
>> n.org_archives_virtio-
>2Dcomment_201912_msg00007.html&d=3DDwIFAg&c=3DnKjWec
>>
>2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&
>m=3DJov-i
>>
>2FywpKbCEQQYzLflL42h0fjcWcoqjQCUhCEVk4&s=3DRw5CPVzuwqvxeHji4PRmR
>mkfarjY4
>> so-C1EBRs8F_yw&e=3D
>>
>>
>> Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
>> ---
>>  content.tex | 41 +++++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 39 insertions(+), 2 deletions(-)
>>
>> diff --git a/content.tex b/content.tex index d68cfaf..0a4cfba 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -2815,6 +2815,13 @@ \subsection{Feature bits}\label{sec:Device
>> Types / Network Device / Feature bits
>\item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through
>control
>>      channel.
>>
>> +\item[VIRTIO_NET_F_RXBUF_LEN_RATIO(57)] Device requests to limit the
>> +    maximum/minimum receive buffers length ratio.
>> +
>
>So VIRTIO_NET_F_RXBUF_LEN_RATIO only makes sense with
>VIRTIO_NET_F_RXBUF_MIN_LEN, right?  I think we can just use a single
>feature bit then, and just set ratio to 0 to mean "infinity".
>

OK. Sounds good.

>> +\item[VIRTIO_NET_F_RXBUF_MIN_LEN(58)] Device requests to know the
>minimum
>> +    receive buffers length. Driver declares the minimum receive buffers
>> +    length.
>> +
>>  \item[VIRTIO_NET_F_GUEST_HDRLEN(59)] Driver can provide the exact
>\field{hdr_len}
>>      value. Device benefits from knowing the exact header length.
>>
>> @@ -2861,8 +2868,8 @@ \subsubsection{Legacy Interface: Feature
>> bits}\label{sec:Device Types / Network  \subsection{Device
>> configuration layout}\label{sec:Device Types / Network Device / Device
>> configuration layout}  \label{sec:Device Types / Block Device /
>> Feature bits / Device configuration layout}
>>
>> -Three driver-read-only configuration fields are currently defined.
>> The \field{mac} address field -always exists (though is only valid if
>> VIRTIO_NET_F_MAC is set), and
>> +The driver-read-only \field{mac} address field always exists (though
>> +is only valid if VIRTIO_NET_F_MAC is set), and
>>  \field{status} only exists if VIRTIO_NET_F_STATUS is set. Two
>> read-only bits (for the driver) are currently defined for the status fie=
ld:
>>  VIRTIO_NET_S_LINK_UP and VIRTIO_NET_S_ANNOUNCE.
>> @@ -2882,12 +2889,22 @@ \subsection{Device configuration
>> layout}\label{sec:Device Types / Network Device  VIRTIO_NET_F_MTU is
>> set. This field specifies the maximum MTU for the driver to  use.
>>
>> +The device-read-only field \field{min_rx_buf_len} only exists if
>> +VIRTIO_NET_F_RXBUF_MIN_LEN is set. This field specifies the minimum
>> +receive buffers length.
>> +
>> +The driver-read-only field \field{rx_buf_len_ratio} only exists if
>> +VIRTIO_NET_F_RXBUF_LEN_RATIO is set. This field specifies the
>> +maximum/minimum receive buffers length ratio.
>
>Actually shouldn't all of these always exist and only be valid if a flag i=
s set? I
>think existing text should be fixed too.
>

This makes sense, but wouldn't it break compatibility with the existing dev=
ices/drivers?

>> +
>>  \begin{lstlisting}
>>  struct virtio_net_config {
>>          u8 mac[6];
>>          le16 status;
>>          le16 max_virtqueue_pairs;
>>          le16 mtu;
>> +        le32 min_rx_buf_len;
>> +        le16 rx_buf_len_ratio;
>>  };
>>  \end{lstlisting}
>>
>> @@ -2916,6 +2933,15 @@ \subsection{Device configuration
>> layout}\label{sec:Device Types / Network Device  If the driver
>> negotiates the VIRTIO_NET_F_STANDBY feature, the device MAY act  as a
>standby device for a primary device with the same MAC address.
>>
>> +A driver SHOULD accept the VIRTIO_NET_F_RXBUF_MIN_LEN feature if
>offered.
>> +
>> +If VIRTIO_NET_F_RXBUF_MIN_LEN feature has been negotiated, the
>driver
>> +MUST set \field{min_rx_buf_len}.
>> +
>> +A driver MUST NOT modify \field{min_rx_buf_len} once it has been set.
>> +
>> +A driver SHOULD accept the VIRTIO_NET_F_RXBUF_LEN_RATIO feature if
>offered.
>> +
>>  \drivernormative{\subsubsection}{Device configuration layout}{Device
>> Types / Network Device / Device configuration layout}
>>
>>  A driver SHOULD negotiate VIRTIO_NET_F_MAC if the device offers it.
>> @@ -3281,6 +3307,17 @@ \subsubsection{Setting Up Receive
>> Buffers}\label{sec:Device Types / Network Devi  If VIRTIO_NET_F_MQ is
>> negotiated, each of receiveq1\ldots receiveqN  that will be used SHOULD =
be
>populated with receive buffers.
>>
>> +If VIRTIO_NET_F_RXBUF_MIN_LEN feature has been negotiated, the
>driver
>> +MUST initialize all receive virtqueue descriptors \field{len} field
>> +with the value greater than or equal to the value configured in the
>> +\field{min_rx_buf_len} device configuration field, and allocate
>> +receive buffers accordingly.
>
>I think above should talk about buffer length, discussion about descriptor=
s
>doesn't belong in devices, it's a way to describe buffers.
>
>If we want to limit descriptors per rx buffer, I think it's a separate fea=
ture
>similar to max_sg for blk/scsi.
>

The intention is to control the Rx buffer "Element Length" (using the term =
from "2.7 Packed Virtqueues"), i.e. the 'len' field of the Packed Virtqueue=
 Descriptor. The driver is free to allocate rx buffers at its own discretio=
n, as long as the element length, presented to the device, is under control=
.

The number of descriptors per rx packet is indeed out of scope.

>
>> +If VIRTIO_NET_F_RXBUF_LEN_RATIO feature has been negotiated, the
>> +driver MUST initialize all receive virtqueue descriptors \field{len}
>> +field with the value less than or equal to (\field{min_rx_buf_len} *
>> +\field{rx_buf_len_ratio}), and allocate receive buffers accordingly.
>> +
>>  \devicenormative{\paragraph}{Setting Up Receive Buffers}{Device Types
>> / Network Device / Device Operation / Setting Up Receive Buffers}
>>
>>  The device MUST set \field{num_buffers} to the number of descriptors
>> used to
>> --
>
>
>This publicly archived list offers a means to provide input to the OASIS V=
irtual
>I/O Device (VIRTIO) TC.
>
>In order to verify user consent to the Feedback License terms and to minim=
ize
>spam in the list archive, subscription is required before posting.
>
>Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>List help: virtio-comment-help@lists.oasis-open.org
>List archive: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
>3A__lists.oasis-2Dopen.org_archives_virtio-
>2Dcomment_&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lq
>qsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DJov-
>i2FywpKbCEQQYzLflL42h0fjcWcoqjQCUhCEVk4&s=3D1t3qS1jhifMlcEXNjidDMXM
>5pZGEO4uRXxbwi4dLXIc&e=3D
>Feedback License: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
>3A__www.oasis-2Dopen.org_who_ipr_feedback-
>5Flicense.pdf&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lqq
>sArgFRdcevq01tbLQAw4A_NO7xgI&m=3DJov-
>i2FywpKbCEQQYzLflL42h0fjcWcoqjQCUhCEVk4&s=3Ddc91VihQWL6FndSEJEeRzW
>LJ8ToA0pHarPntCDaMJOg&e=3D
>List Guidelines: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
>3A__www.oasis-2Dopen.org_policies-2Dguidelines_mailing-
>2Dlists&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lqqsArgFR
>dcevq01tbLQAw4A_NO7xgI&m=3DJov-
>i2FywpKbCEQQYzLflL42h0fjcWcoqjQCUhCEVk4&s=3Dee48tu7ghdvrA9ftBtshmHj
>vpyLgwSQ9UrPD42_8IXs&e=3D
>Committee: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
>3A__www.oasis-
>2Dopen.org_committees_virtio_&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&
>r=3DlDHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DJov-
>i2FywpKbCEQQYzLflL42h0fjcWcoqjQCUhCEVk4&s=3D48YkEnHP1JQiZb__G5x7U3
>ks3nOfA5LwglrVmVCCu3k&e=3D
>Join OASIS: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
>3A__www.oasis-
>2Dopen.org_join_&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52o
>J3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DJov-
>i2FywpKbCEQQYzLflL42h0fjcWcoqjQCUhCEVk4&s=3DYjUdXcenDv9leny8SoZI93W
>WFx1idUUJuw1X5bfuBh4&e=3D


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

