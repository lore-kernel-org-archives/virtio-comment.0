Return-Path: virtio-comment-return-1056-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 083AF9847E3
	for <virtio-comment@lists.oasis-open.org>; Mon, 10 Feb 2020 11:47:48 +0000 (UTC)
From: Vitaly Mireyno <vmireyno@marvell.com>
Date: Mon, 10 Feb 2020 11:47:42 +0000
Message-ID: <BN6PR1801MB20674C4E3C7FF0C591335B85C5190@BN6PR1801MB2067.namprd18.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH v2] virtio-net: Add an optional device control over the
 receive buffers length
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Jason Wang <jasowang@redhat.com>, Ariel Elior <aelior@marvell.com>
List-ID: <virtio-comment.lists.oasis-open.org>


>-----Original Message-----
>From: Michael S. Tsirkin <mst@redhat.com>
>Sent: Tuesday, 4 February, 2020 18:42
>To: Vitaly Mireyno <vmireyno@marvell.com>
>Cc: virtio-comment@lists.oasis-open.org; Jason Wang
><jasowang@redhat.com>; Ariel Elior <aelior@marvell.com>
>Subject: [EXT] Re: [PATCH v2] virtio-net: Add an optional device control o=
ver
>the receive buffers length
>
>----------------------------------------------------------------------
>On Tue, Feb 04, 2020 at 04:13:36PM +0000, Vitaly Mireyno wrote:
>> This patch gives devices some level of control over the receive buffers
>length.
>> The driver declares the minimum receive buffer length, and the device
>requests max/min buffer length ratio.
>>
>> v2 incorporates v1 comments.
>>
>> Changes from v1:
>>  * min_rx_buf_len must be set before FEATURES_OK
>>  * Use a single feature bit VIRTIO_NET_F_RXBUF_LEN_CTRL for both, the
>> min size and the ratio
>>  * min_rx_buf_len is defined as write-only for driver
>>
>>
>> Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
>> ---
>>  content.tex | 32 ++++++++++++++++++++++++++++++--
>>  1 file changed, 30 insertions(+), 2 deletions(-)
>>
>> diff --git a/content.tex b/content.tex index d68cfaf..ab0d193 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -2815,6 +2815,10 @@ \subsection{Feature bits}\label{sec:Device
>> Types / Network Device / Feature bits
>\item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through
>control
>>      channel.
>>
>> +\item[VIRTIO_NET_F_RXBUF_LEN_CTRL(58)] Device requests to know the
>minimum
>> +    receive buffers length, and requests to limit the maximum/minimum
>receive
>> +    buffers length ratio. Driver declares the minimum receive buffers l=
ength.
>> +
>>  \item[VIRTIO_NET_F_GUEST_HDRLEN(59)] Driver can provide the exact
>\field{hdr_len}
>>      value. Device benefits from knowing the exact header length.
>>
>> @@ -2861,8 +2865,8 @@ \subsubsection{Legacy Interface: Feature
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
>> @@ -2882,12 +2886,22 @@ \subsection{Device configuration
>> layout}\label{sec:Device Types / Network Device  VIRTIO_NET_F_MTU is
>> set. This field specifies the maximum MTU for the driver to  use.
>>
>> +The write-only for driver field \field{min_rx_buf_len} only exists if
>> +VIRTIO_NET_F_RXBUF_LEN_CTRL is set. This field specifies the minimum
>> +receive buffers length.
>> +
>> +The driver-read-only field \field{rx_buf_len_ratio} only exists if
>> +VIRTIO_NET_F_RXBUF_LEN_CTRL is set. This field specifies the
>> +maximum/minimum receive buffers length ratio. The value '0' indicates
>unrestricted ratio.
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
>> @@ -2916,6 +2930,13 @@ \subsection{Device configuration
>> layout}\label{sec:Device Types / Network Device  If the driver
>> negotiates the VIRTIO_NET_F_STANDBY feature, the device MAY act  as a
>standby device for a primary device with the same MAC address.
>>
>> +A driver SHOULD accept the VIRTIO_NET_F_RXBUF_LEN_CTRL feature if
>offered.
>> +
>> +If VIRTIO_NET_F_RXBUF_LEN_CTRL feature has been negotiated, the
>> +driver MUST set \field{min_rx_buf_len} before setting the FEATURES_OK
>status bit.
>> +
>> +A driver MUST NOT modify \field{min_rx_buf_len} once it has been set.
>> +
>>  \drivernormative{\subsubsection}{Device configuration layout}{Device
>> Types / Network Device / Device configuration layout}
>>
>>  A driver SHOULD negotiate VIRTIO_NET_F_MAC if the device offers it.
>
>I still think this is too restrictive. Switching between e.g.
>XDP/non-XDP workloads demands ability to change this without device reset.
>I am thinking about sending the avail index to device with a command to
>change the size, this way device can figure out where are the old and wher=
e
>are the new buffers.
>Doesn't look too hard on the hardware, does it?
>

Changing descriptors size once in a while sounds reasonable and possible.
I see a problem though with this specific method - updating the rx descript=
ors size is an asynchronous slow-path operation (in vDPA it would go throug=
h a SW emulation). So there is no guarantee that the ring index, the driver=
 requests, will be delivered on time to the device.
I can suggest another method, where the driver requests to change a descrip=
tor size through a slow-path, but fast-path synchronization will come from =
the device - it will set a dedicated flag in the first used rx descriptor w=
ith the new size (from the device perspective).

So the flow of changing the descriptor size could be as follows:

For enlarging descriptors size:
 1. Driver enlarges descriptors size. All new descriptors are made availabl=
e with the new size. Obviously, the buffers behind the descriptors must be =
enlarged as well.
 2. Driver requests the device to change descriptors size (by writing to th=
e device configuration space). At this stage the device still thinks that a=
ll descriptors are of an old (smaller) size. Although new descriptors are o=
f a new size, the driver must treat them as if they were of an old size (i.=
e. the device would not fill the whole descriptor).
 3. At some point, the device receives the driver's request, and it changes=
 internally the rx descriptors size. The device sets a new_size flag in the=
 next descriptor used.
 4. When the driver receives a used descriptor with a new_size flag set, fr=
om that point on it can treat all descriptors as being of a new size.

For reducing descriptors size:
 1. Driver requests the device to change descriptors size.
 2. At some point, the device receives the driver's request, and it changes=
 internally the rx descriptors size. the device sets a new_size flag in the=
 next descriptor used.
 3. When the driver receives a used descriptor with a new_size flag set, fr=
om that point on it must treat all the descriptors as being of the new size=
.
 4. Now the driver can actually reduce descriptors size. All new descriptor=
s will be made available with a new size.


>> @@ -3281,6 +3302,13 @@ \subsubsection{Setting Up Receive
>> Buffers}\label{sec:Device Types / Network Devi  If VIRTIO_NET_F_MQ is
>> negotiated, each of receiveq1\ldots receiveqN  that will be used SHOULD =
be
>populated with receive buffers.
>>
>> +If VIRTIO_NET_F_RXBUF_LEN_CTRL feature has been negotiated, the
>> +driver MUST initialize all receive virtqueue descriptors \field{len}
>> +field with the value greater than or equal to the value configured in
>> +the \field{min_rx_buf_len} device configuration field, and allocate
>> +receive buffers accordingly. If \field{rx_buf_len_ratio} > 0, then
>> +the \field{len} value must also be less than or equal to
>(\field{min_rx_buf_len} * \field{rx_buf_len_ratio}).
>> +
>>  \devicenormative{\paragraph}{Setting Up Receive Buffers}{Device Types
>> / Network Device / Device Operation / Setting Up Receive Buffers}
>>
>>  The device MUST set \field{num_buffers} to the number of descriptors
>> used to
>> --


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

