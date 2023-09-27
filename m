Return-Path: <virtio-comment-return-7560-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6409E7F15D
	for <virtio-comment@archiver.kernel.org>; Wed, 27 Sep 2023 03:50:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 176C22AC43
	for <virtio-comment@archiver.kernel.org>; Wed, 27 Sep 2023 03:50:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E77DE9864A1
	for <virtio-comment@archiver.kernel.org>; Wed, 27 Sep 2023 03:50:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C3501986351; Wed, 27 Sep 2023 03:50:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 424C698640A
	for <virtio-comment@lists.oasis-open.org>; Wed, 27 Sep 2023 03:50:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R331e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045192;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0VsylouA_1695786618;
Message-ID: <1695786592.2093081-1-xuanzhuo@linux.alibaba.com>
Date: Wed, 27 Sep 2023 11:49:52 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "jasowang@redhat.com" <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
References: <20230919060710.36535-1-xuanzhuo@linux.alibaba.com>
 <1695779537.5892513-3-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB548180536DB712E4063F00EFDCC2A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB548180536DB712E4063F00EFDCC2A@PH0PR12MB5481.namprd12.prod.outlook.com>
Subject: Re: RE: [virtio-comment] [PATCH v18] virtio-net: support device stats

On Wed, 27 Sep 2023 03:39:24 +0000, Parav Pandit <parav@nvidia.com> wrote:
>
>
> > From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > Sent: Wednesday, September 27, 2023 7:22 AM
> >
> > Any other comments on this?
> >
> I don't have any more comments. Only the last normative fix will be fine.

Yes. That will be fixed in next version.

Thanks.


>
> > Next week we have the Chinese National Day holiday.
> > So, if there are no new comments, I'll push it to the next stage in 10.9
> >
> > Thanks.
> >
> > On Tue, 19 Sep 2023 14:07:10 +0800, Xuan Zhuo
> > <xuanzhuo@linux.alibaba.com> wrote:
> > > This patch allows the driver to obtain some statistics from the device.
> > >
> > > In the device implementation, we can count a lot of such information,
> > > which can be used for debugging and judging the running status of the
> > > device. We hope to directly display it to the user through ethtool.
> > >
> > > To get stats atomically, try to get stats for all/multiple queue pairs
> > > in one command.
> > >
> > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> > > ---
> > >
> > > v18:
> > >    * fix some issues @Parav
> > >
> > http://lore.kernel.org/all/PH0PR12MB5481C32DA10A84488E421328DCF0A@PH
> > 0P
> > > R12MB5481.namprd12.prod.outlook.com
> > >
> > > v17:
> > >    * fix some issues @Parav
> > >
> > http://lore.kernel.org/all/PH0PR12MB54819EB466305284A8C9F649DCE4A@PH
> > 0P
> > > R12MB5481.namprd12.prod.outlook.com
> > >
> > > v16:
> > >    * fix some issues @Parav
> > https://lore.kernel.org/all/PH0PR12MB54814174FC713CF5640B7B10DC1DA@P
> > H0PR12MB5481.namprd12.prod.outlook.com/
> > >    * introduce *_{packets,bytes}_allowance_exceeded
> > >
> > > v15:
> > >    * query supported types via cvq @Parav
> > >    * fix some problem @David
> > >
> > > v14:
> > >    * introduce supported_stats to config space
> > >    * add header(vq_index, size, type) to each reply stats
> > >    * add ref to the tx GSO
> > >
> > >
> > >
> > >  device-types/net/description.tex        | 511 +++++++++++++++++++++++-
> > >  device-types/net/device-conformance.tex |   1 +
> > >  device-types/net/driver-conformance.tex |   1 +
> > >  3 files changed, 510 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/device-types/net/description.tex
> > > b/device-types/net/description.tex
> > > index 76585b0..514554c 100644
> > > --- a/device-types/net/description.tex
> > > +++ b/device-types/net/description.tex
> > > @@ -88,6 +88,9 @@ \subsection{Feature bits}\label{sec:Device Types /
> > > Network Device / Feature bits  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)]
> > Set MAC address through control
> > >      channel.
> > >
> > > +\item[VIRTIO_NET_F_DEVICE_STATS(50)] Device can provide device-level
> > statistics
> > > +    to the driver through the control virtqueue.
> > > +
> > >  \item[VIRTIO_NET_F_HASH_TUNNEL(51)] Device supports inner header hash
> > for encapsulated packets.
> > >
> > >  \item[VIRTIO_NET_F_VQ_NOTF_COAL(52)] Device supports virtqueue
> > notification coalescing.
> > > @@ -1156,6 +1159,7 @@ \subsubsection{Control
> > Virtqueue}\label{sec:Device Types / Network Device / Devi
> > >          u8 command;
> > >          u8 command-specific-data[];
> > >          u8 ack;
> > > +        u8 command-specific-result[];
> > >  };
> > >
> > >  /* ack values */
> > > @@ -1164,9 +1168,12 @@ \subsubsection{Control
> > > Virtqueue}\label{sec:Device Types / Network Device / Devi
> > > \end{lstlisting}
> > >
> > >  The \field{class}, \field{command} and command-specific-data are set
> > > by the -driver, and the device sets the \field{ack} byte. There is
> > > little it can -do except issue a diagnostic if \field{ack} is not
> > > -VIRTIO_NET_OK.
> > > +driver, and the device sets the \field{ack} byte and optionally
> > > +\field{command-specific-result}. There is little the driver can do
> > > +except issue a diagnostic if \field{ack} is not VIRTIO_NET_OK.
> > > +
> > > +The command VIRTIO_NET_CTRL_STATS_QUERY and
> > VIRTIO_NET_CTRL_STATS_GET
> > > +contain \field{command-specific-result}.
> > >
> > >  \paragraph{Packet Receive Filtering}\label{sec:Device Types / Network
> > > Device / Device Operation / Control Virtqueue / Packet Receive
> > > Filtering}  \label{sec:Device Types / Network Device / Device
> > > Operation / Control Virtqueue / Setting Promiscuous Mode}%old label
> > > for latexdiff @@ -1805,6 +1812,504 @@ \subsubsection{Control
> > > Virtqueue}\label{sec:Device Types / Network Device / Devi
> > >
> > >  Upon reset, a device MUST initialize all coalescing parameters to 0.
> > >
> > > +\paragraph{Device Statistics}\label{sec:Device Types / Network Device
> > > +/ Device Operation / Control Virtqueue / Device Statistics}
> > > +
> > > +If the VIRTIO_NET_F_DEVICE_STATS feature is negotiated, the driver
> > > +can obtain device statistics from the device by using the following command.
> > > +
> > > +Different types of virtqueues have different statistics. The
> > > +statistics of the receiveq are different from those of the transmitq.
> > > +
> > > +The statistics of a certain type of virtqueue are also divided into
> > > +multiple types because different types require different features.
> > > +This enables the expansion of new statistics.
> > > +
> > > +In one command, the driver can obtain the statistics of one or multiple
> > virtqueues.
> > > +Additionally, the driver can obtain multiple type statistics of each virtqueue.
> > > +
> > > +\subparagraph{Query Statistic Capabilities}\label{sec:Device Types /
> > > +Network Device / Device Operation / Control Virtqueue / Device
> > > +Statistics / Query Statistic Capabilities}
> > > +
> > > +\begin{lstlisting}
> > > +#define VIRTIO_NET_CTRL_STATS         8
> > > +#define VIRTIO_NET_CTRL_STATS_QUERY   0
> > > +#define VIRTIO_NET_CTRL_STATS_GET     1
> > > +
> > > +struct virtio_net_stats_capabilities {
> > > +
> > > +#define VIRTIO_NET_STATS_TYPE_CVQ       (1 << 32)
> > > +
> > > +#define VIRTIO_NET_STATS_TYPE_RX_BASIC  (1 << 0)
> > > +#define VIRTIO_NET_STATS_TYPE_RX_CSUM   (1 << 1)
> > > +#define VIRTIO_NET_STATS_TYPE_RX_GSO    (1 << 2)
> > > +#define VIRTIO_NET_STATS_TYPE_RX_SPEED  (1 << 3)
> > > +
> > > +#define VIRTIO_NET_STATS_TYPE_TX_BASIC  (1 << 16)
> > > +#define VIRTIO_NET_STATS_TYPE_TX_CSUM   (1 << 17)
> > > +#define VIRTIO_NET_STATS_TYPE_TX_GSO    (1 << 18)
> > > +#define VIRTIO_NET_STATS_TYPE_TX_SPEED  (1 << 19)
> > > +
> > > +    le64 supported_stats_types[1];
> > > +}
> > > +\end{lstlisting}
> > > +
> > > +To obtain device statistic capability, use the
> > > +VIRTIO_NET_CTRL_STATS_QUERY command. When the command completes
> > > +successfully, \field{command-specific-result} is in the format of \field{struct
> > virtio_net_stats_capabilities}.
> > > +
> > > +\subparagraph{Get Statistics}\label{sec:Device Types / Network Device
> > > +/ Device Operation / Control Virtqueue / Device Statistics / Get
> > > +Statistics}
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_net_ctrl_queue_stats {
> > > +       struct {
> > > +           le16 vq_index;
> > > +           le16 reserved[3];
> > > +           le64 types_bitmap[1];
> > > +       } stats[];
> > > +};
> > > +
> > > +struct virtio_net_stats_reply_hdr {
> > > +#define VIRTIO_NET_STATS_TYPE_REPLY_CVQ       32
> > > +
> > > +#define VIRTIO_NET_STATS_TYPE_REPLY_RX_BASIC  0
> > > +#define VIRTIO_NET_STATS_TYPE_REPLY_RX_CSUM   1
> > > +#define VIRTIO_NET_STATS_TYPE_REPLY_RX_GSO    2
> > > +#define VIRTIO_NET_STATS_TYPE_REPLY_RX_SPEED  3
> > > +
> > > +#define VIRTIO_NET_STATS_TYPE_REPLY_TX_BASIC  16
> > > +#define VIRTIO_NET_STATS_TYPE_REPLY_TX_CSUM   17
> > > +#define VIRTIO_NET_STATS_TYPE_REPLY_TX_GSO    18
> > > +#define VIRTIO_NET_STATS_TYPE_REPLY_TX_SPEED  19
> > > +    u8 type;
> > > +    u8 reserved;
> > > +    le16 vq_index;
> > > +    le16 reserved1;
> > > +    le16 size;
> > > +}
> > > +\end{lstlisting}
> > > +
> > > +To obtain device statistics, use the VIRTIO_NET_CTRL_STATS_GET
> > > +command with the \field{command-specific-data} which is in the format
> > > +of \field{struct virtio_net_ctrl_queue_stats}. When the command
> > > +completes successfully, \field{command-specific-result} contains
> > > +multiple statistic results, each statistic result has the
> > > +\field{struct virtio_net_stats_reply_hdr} as the header.
> > > +
> > > +The fields of the \field{struct virtio_net_ctrl_queue_stats}:
> > > +\begin{description}
> > > +    \item [vq_index]
> > > +        The index of the virtqueue to obtain the statistics.
> > > +
> > > +    \item [types_bitmap]
> > > +        This is a bitmask of the types of statistics to be obtained. Therefore, a
> > > +        \field{stats} inside \field{struct virtio_net_ctrl_queue_stats} may
> > > +        indicate multiple statistic replies for the virtqueue.
> > > +\end{description}
> > > +
> > > +The fields of the \field{struct virtio_net_stats_reply_hdr}:
> > > +\begin{description}
> > > +    \item [type]
> > > +        The type of the reply statistic.
> > > +
> > > +    \item [vq_index]
> > > +        The virtqueue index of the reply statistic.
> > > +
> > > +    \item [size]
> > > +        The number of bytes for the statistics entry including size of \field{struct
> > virtio_net_stats_reply_hdr}.
> > > +
> > > +\end{description}
> > > +
> > > +\subparagraph{Controlq Statistics}\label{sec:Device Types / Network
> > > +Device / Device Operation / Control Virtqueue / Device Statistics /
> > > +Controlq Statistics}
> > > +
> > > +The structure corresponding to the controlq statistics is
> > > +\field{struct virtio_net_stats_cvq}. The corresponding type is
> > > +VIRTIO_NET_STATS_TYPE_CVQ. This is for the controlq.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_net_stats_cvq {
> > > +    struct virtio_net_stats_reply_hdr hdr;
> > > +
> > > +    le64 command_num;
> > > +    le64 ok_num;
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +\begin{description}
> > > +    \item [command_num]
> > > +        The number of commands received by the device including the current
> > command.
> > > +
> > > +    \item [ok_num]
> > > +        The number of commands completed successfully by the device
> > including the current command.
> > > +\end{description}
> > > +
> > > +
> > > +\subparagraph{Receiveq Basic Statistics}\label{sec:Device Types /
> > > +Network Device / Device Operation / Control Virtqueue / Device
> > > +Statistics / Receiveq Basic Statistics}
> > > +
> > > +The structure corresponding to the receiveq basic statistics is
> > > +\field{struct virtio_net_stats_rx_basic}. The corresponding type is
> > > +VIRTIO_NET_STATS_TYPE_RX_BASIC. This is for the receiveq.
> > > +
> > > +Receiveq basic statistics do not require any feature. As long as the
> > > +device supports VIRTIO_NET_F_DEVICE_STATS, the following are the
> > receiveq basic statistics.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_net_stats_rx_basic {
> > > +    struct virtio_net_stats_reply_hdr hdr;
> > > +
> > > +    le64 rx_notifications;
> > > +
> > > +    le64 rx_packets;
> > > +    le64 rx_bytes;
> > > +
> > > +    le64 rx_interrupts;
> > > +
> > > +    le64 rx_drops;
> > > +    le64 rx_drop_overruns;
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +The packets described below were all presented on the specified virtqueue.
> > > +\begin{description}
> > > +    \item [rx_notifications]
> > > +        The number of driver notifications received by the device for this
> > > +        receiveq.
> > > +
> > > +    \item [rx_packets]
> > > +        This is the number of packets passed to the driver by the device.
> > > +
> > > +    \item [rx_bytes]
> > > +        This is the bytes of packets passed to the driver by the device.
> > > +
> > > +    \item [rx_interrupts]
> > > +        The number of interrupts generated by the device for this receiveq.
> > > +
> > > +    \item [rx_drops]
> > > +        This is the number of packets dropped by the device. The count includes
> > > +        all types of packets dropped by the device.
> > > +
> > > +    \item [rx_drop_overruns]
> > > +        This is the number of packets dropped by the device when no more
> > > +        descriptors were available.
> > > +
> > > +\end{description}
> > > +
> > > +\subparagraph{Transmitq Basic Statistics}\label{sec:Device Types /
> > > +Network Device / Device Operation / Control Virtqueue / Device
> > > +Statistics / Transmitq Basic Statistics}
> > > +
> > > +The structure corresponding to the transmitq basic statistics is
> > > +\field{struct virtio_net_stats_tx_basic}. The corresponding type is
> > > +VIRTIO_NET_STATS_TYPE_TX_BASIC. This is for the transmitq.
> > > +
> > > +Transmitq basic statistics do not require any feature. As long as the
> > > +device supports VIRTIO_NET_F_DEVICE_STATS, the following are the
> > transmitq basic statistics.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_net_stats_tx_basic {
> > > +    struct virtio_net_stats_reply_hdr hdr;
> > > +
> > > +    le64 tx_notifications;
> > > +
> > > +    le64 tx_packets;
> > > +    le64 tx_bytes;
> > > +
> > > +    le64 tx_interrupts;
> > > +
> > > +    le64 tx_drops;
> > > +    le64 tx_drop_malformed;
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +The packets described below are all for a specific virtqueue.
> > > +\begin{description}
> > > +    \item [tx_notifications]
> > > +        The number of driver notifications received by the device for this
> > > +        transmitq.
> > > +
> > > +    \item [tx_packets]
> > > +        This is the number of packets sent by the device (not the packets
> > > +        got from the driver).
> > > +
> > > +    \item [tx_bytes]
> > > +        This is the number of bytes sent by the device for all the sent packets
> > > +        (not the bytes sent got from the driver).
> > > +
> > > +    \item [tx_interrupts]
> > > +        The number of interrupts generated by the device for this transmitq.
> > > +
> > > +    \item [tx_drops]
> > > +        The number of packets dropped by the device. The count includes all
> > > +        types of packets dropped by the device.
> > > +
> > > +    \item [tx_drop_malformed]
> > > +        The number of packets dropped by the device, when the descriptors are
> > > +        malformed. For example, the buffer is too short.
> > > +\end{description}
> > > +
> > > +\subparagraph{Receiveq CSUM Statistics}\label{sec:Device Types /
> > > +Network Device / Device Operation / Control Virtqueue / Device
> > > +Statistics / Receiveq CSUM Statistics}
> > > +
> > > +The structure corresponding to the receiveq checksum statistics is
> > > +\field{struct virtio_net_stats_rx_csum}. The corresponding type is
> > > +VIRTIO_NET_STATS_TYPE_RX_CSUM. This is for the receiveq.
> > > +
> > > +Only after the VIRTIO_NET_F_GUEST_CSUM is negotiated, the receiveq
> > > +checksum statistics can be obtained.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_net_stats_rx_csum {
> > > +    struct virtio_net_stats_reply_hdr hdr;
> > > +
> > > +    le64 rx_csum_valid;
> > > +    le64 rx_needs_csum;
> > > +    le64 rx_csum_none;
> > > +    le64 rx_csum_bad;
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +The packets described below were all presented on the specified virtqueue.
> > > +\begin{description}
> > > +    \item [rx_csum_valid]
> > > +        The number of packets with VIRTIO_NET_HDR_F_DATA_VALID.
> > > +
> > > +    \item [rx_needs_csum]
> > > +        The number of packets with VIRTIO_NET_HDR_F_NEEDS_CSUM.
> > > +
> > > +    \item [rx_csum_none]
> > > +        The number of packets without hardware checksum. The packet here
> > refers
> > > +        to the non-TCP/UDP packet that the device cannot recognize.
> > > +
> > > +    \item [rx_csum_bad]
> > > +        The number of packets with checksum mismatch.
> > > +
> > > +\end{description}
> > > +
> > > +\subparagraph{Transmitq CSUM Statistics}\label{sec:Device Types /
> > > +Network Device / Device Operation / Control Virtqueue / Device
> > > +Statistics / Transmitq CSUM Statistics}
> > > +
> > > +The structure corresponding to the transmitq checksum statistics is
> > > +\field{struct virtio_net_stats_tx_csum}. The corresponding type is
> > > +VIRTIO_NET_STATS_TYPE_TX_CSUM. This is for the transmitq.
> > > +
> > > +Only after the VIRTIO_NET_F_CSUM is negotiated, the transmitq
> > > +checksum statistics can be obtained.
> > > +
> > > +The following are the transmitq checksum statistics:
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_net_stats_tx_csum {
> > > +    struct virtio_net_stats_reply_hdr hdr;
> > > +
> > > +    le64 tx_csum_none;
> > > +    le64 tx_needs_csum;
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +The packets described below are all for a specific virtqueue.
> > > +\begin{description}
> > > +    \item [tx_csum_none]
> > > +        The number of packets which do not require hardware checksum.
> > > +
> > > +    \item [tx_needs_csum]
> > > +        The number of packets which require checksum calculation by the
> > device.
> > > +
> > > +\end{description}
> > > +
> > > +\subparagraph{Receiveq GSO Statistics}\label{sec:Device Types /
> > > +Network Device / Device Operation / Control Virtqueue / Device
> > > +Statistics / Receiveq GSO Statistics}
> > > +
> > > +The structure corresponding to the receivq GSO statistics is
> > > +\field{struct virtio_net_stats_rx_gso}. The corresponding type is
> > > +VIRTIO_NET_STATS_TYPE_RX_GSO. This is for the receiveq.
> > > +
> > > +If one or more of the VIRTIO_NET_F_GUEST_TSO4,
> > > +VIRTIO_NET_F_GUEST_TSO6 have been negotiated, the receiveq GSO
> > statistics can be obtained.
> > > +
> > > +GSO packets refer to packets passed by the device to the driver where
> > > +\field{gso_type} is not VIRTIO_NET_HDR_GSO_NONE.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_net_stats_rx_gso {
> > > +    struct virtio_net_stats_reply_hdr hdr;
> > > +
> > > +    le64 rx_gso_packets;
> > > +    le64 rx_gso_bytes;
> > > +    le64 rx_gso_packets_coalesced;
> > > +    le64 rx_gso_bytes_coalesced;
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +The packets described below were all presented on the specified virtqueue.
> > > +\begin{description}
> > > +    \item [rx_gso_packets]
> > > +        The number of the GSO packets received by the device.
> > > +
> > > +    \item [rx_gso_bytes]
> > > +        The bytes of the GSO packets received by the device.
> > > +        This includes the header size of the GSO packet.
> > > +
> > > +    \item [rx_gso_packets_coalesced]
> > > +        The number of the GSO packets coalesced by the device.
> > > +
> > > +    \item [rx_gso_bytes_coalesced]
> > > +        The bytes of the GSO packets coalesced by the device.
> > > +        This includes the header size of the GSO packet.
> > > +\end{description}
> > > +
> > > +\subparagraph{Transmitq GSO Statistics}\label{sec:Device Types /
> > > +Network Device / Device Operation / Control Virtqueue / Device
> > > +Statistics / Transmitq GSO Statistics}
> > > +
> > > +The structure corresponding to the transmitq GSO statistics is
> > > +\field{struct virtio_net_stats_tx_gso}. The corresponding type is
> > > +VIRTIO_NET_STATS_TYPE_TX_GSO. This is for the transmitq.
> > > +
> > > +If one or more of the VIRTIO_NET_F_HOST_TSO4,
> > VIRTIO_NET_F_HOST_TSO6,
> > > +VIRTIO_NET_F_HOST_USO options have been negotiated, the transmitq
> > GSO
> > > +statistics can be obtained.
> > > +
> > > +GSO packets refer to packets passed by the driver to the device where
> > > +\field{gso_type} is not VIRTIO_NET_HDR_GSO_NONE.
> > > +See more \ref{sec:Device Types / Network Device / Device Operation /
> > > +Packet Transmission}.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_net_stats_tx_gso {
> > > +    struct virtio_net_stats_reply_hdr hdr;
> > > +
> > > +    le64 tx_gso_packets;
> > > +    le64 tx_gso_bytes;
> > > +    le64 tx_gso_segments;
> > > +    le64 tx_gso_segments_bytes;
> > > +    le64 tx_gso_packets_noseg;
> > > +    le64 tx_gso_bytes_noseg;
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +The packets described below are all for a specific virtqueue.
> > > +\begin{description}
> > > +    \item [tx_gso_packets]
> > > +        The number of the GSO packets sent by the device.
> > > +
> > > +    \item [tx_gso_bytes]
> > > +        The bytes of the GSO packets sent by the device.
> > > +
> > > +    \item [tx_gso_segments]
> > > +        The number of segments prepared from GSO packets.
> > > +
> > > +    \item [tx_gso_segments_bytes]
> > > +        The bytes of segments prepared from GSO packets.
> > > +
> > > +    \item [tx_gso_packets_noseg]
> > > +        The number of the GSO packets without segmentation.
> > > +
> > > +    \item [tx_gso_bytes_noseg]
> > > +        The bytes of the GSO packets without segmentation.
> > > +
> > > +\end{description}
> > > +
> > > +\subparagraph{Receiveq Speed Statistics}\label{sec:Device Types /
> > > +Network Device / Device Operation / Control Virtqueue / Device
> > > +Statistics / Receiveq Speed Statistics}
> > > +
> > > +The structure corresponding to the receiveq speed statistics is
> > > +\field{struct virtio_net_stats_rx_speed}. The corresponding type is
> > > +VIRTIO_NET_STATS_TYPE_RX_SPEED. This is for the receiveq.
> > > +
> > > +The device has the allowance for the speed. If
> > > +VIRTIO_NET_F_SPEED_DUPLEX has been negotiated, the driver can get
> > > +this by \field{speed}. When the received packets bitrate exceeds the
> > > +\field{speed}, some packets may be dropped by the device.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_net_stats_rx_speed {
> > > +    struct virtio_net_stats_reply_hdr hdr;
> > > +
> > > +    le64 rx_packets_allowance_exceeded;
> > > +    le64 rx_bytes_allowance_exceeded; }; \end{lstlisting}
> > > +
> > > +The packets described below were all presented on the specified virtqueue.
> > > +\begin{description}
> > > +    \item [rx_packets_allowance_exceeded]
> > > +        The number of the packets dropped by the device due to the received
> > > +        packets bitrate exceeding the \field{speed}.
> > > +
> > > +    \item [rx_bytes_allowance_exceeded]
> > > +        The bytes of the packets dropped by the device due to the received
> > > +        packets bitrate exceeding the \field{speed}.
> > > +
> > > +\end{description}
> > > +
> > > +\subparagraph{Transmitq Speed Statistics}\label{sec:Device Types /
> > > +Network Device / Device Operation / Control Virtqueue / Device
> > > +Statistics / Transmitq Speed Statistics}
> > > +
> > > +The structure corresponding to the transmitq speed statistics is
> > > +\field{struct virtio_net_stats_tx_speed}. The corresponding type is
> > > +VIRTIO_NET_STATS_TYPE_TX_SPEED. This is for the transmitq.
> > > +
> > > +The device has the allowance for the speed. If
> > > +VIRTIO_NET_F_SPEED_DUPLEX has been negotiated, the driver can get
> > > +this by \field{speed}. When the transmit packets bitrate exceeds the
> > > +\field{speed}, some packets may be dropped by the device.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_net_stats_tx_speed {
> > > +    struct virtio_net_stats_reply_hdr hdr;
> > > +
> > > +    le64 tx_packets_allowance_exceeded;
> > > +    le64 tx_bytes_allowance_exceeded; }; \end{lstlisting}
> > > +
> > > +The packets described below were all presented on the specified virtqueue.
> > > +\begin{description}
> > > +    \item [tx_packets_allowance_exceeded]
> > > +        The number of the packets dropped by the device due to the transmit
> > packets
> > > +        bitrate exceeding the \field{speed}.
> > > +
> > > +    \item [tx_bytes_allowance_exceeded]
> > > +        The bytes of the packets dropped by the device due to the transmit
> > packets
> > > +        bitrate exceeding the \field{speed}.
> > > +
> > > +\end{description}
> > > +
> > > +\devicenormative{\subparagraph}{Device Statistics}{Device Types /
> > > +Network Device / Device Operation / Control Virtqueue / Device
> > > +Statistics}
> > > +
> > > +When the VIRTIO_NET_F_DEVICE_STATS feature is negotiated, the device
> > > +MUST reply to the command VIRTIO_NET_CTRL_STATS_QUERY with the
> > > +\field{struct virtio_net_stats_capabilities}.
> > > +\field{supported_stats_types} includes all the statistic types supported by
> > the device.
> > > +
> > > +If \field{struct virtio_net_ctrl_queue_stats} is incorrect (such as
> > > +the following), the device MUST set \field{ack} to VIRTIO_NET_ERR.
> > > +Even if there is only one error, the device MUST fail the entire command.
> > > +\begin{itemize}
> > > +    \item \field{vq_index} exceeds the queue range.
> > > +    \item \field{types_bitmap} contains unknown types.
> > > +    \item One or more of the bits present in \field{types_bitmap} is not valid
> > > +        for the specified virtqueue.
> > > +    \item The feature corresponding to the specified \field{types_bitmap} was
> > > +        not negotiated.
> > > +\end{itemize}
> > > +
> > > +The device MUST set the actual size of the bytes occupied by the
> > > +reply to the \field{size} of the \field{hdr}. And the device MUST set
> > > +the \field{type} and the \field{vq_index} of the statistic header.
> > > +
> > > +The \field{command-specific-result} buffer allocated by the driver
> > > +may be smaller or bigger than all the statistics specified by
> > > +\field{struct virtio_net_ctrl_queue_stats}. The device MUST fill up
> > > +only upto the valid bytes.
> > > +
> > > +The statistics counters wrap around to zero on overflow.
> > > +
> > > +\drivernormative{\subparagraph}{Device Statistics}{Device Types /
> > > +Network Device / Device Operation / Control Virtqueue / Device
> > > +Statistics}
> > > +
> > > +The types contained in the \field{types_bitmap} MUST be queried from
> > > +the device via command VIRTIO_NET_CTRL_STATS_QUERY.
> > > +
> > > +\field{types_bitmap} in \field{struct virtio_net_ctrl_queue_stats}
> > > +MUST be valid to the vq specified by \field{vq_index}.
> > > +
> > > +The \field{command-specific-result} buffer allocated by the driver
> > > +MUST have enough capacity to store all the statistics reply headers
> > > +defined in \field{struct virtio_net_ctrl_queue_stats}. If the
> > > +\field{command-specific-result} buffer is fully utilized by the
> > > +device but some replies are missed, it is possible that some
> > > +statistics may exceed the capacity of the driver's records. In such
> > > +cases, the driver should allocate additional space for the \field{command-
> > specific-result} buffer.
> > > +
> > >  \subsubsection{Legacy Interface: Framing
> > > Requirements}\label{sec:Device  Types / Network Device / Legacy
> > > Interface: Framing Requirements}
> > >
> > > diff --git a/device-types/net/device-conformance.tex
> > > b/device-types/net/device-conformance.tex
> > > index f88f48b..52526e4 100644
> > > --- a/device-types/net/device-conformance.tex
> > > +++ b/device-types/net/device-conformance.tex
> > > @@ -15,4 +15,5 @@
> > >  \item \ref{devicenormative:Device Types / Network Device / Device
> > > Operation / Control Virtqueue / Receive-side scaling (RSS) / RSS
> > > processing}  \item \ref{devicenormative:Device Types / Network Device
> > > / Device Operation / Control Virtqueue / Notifications Coalescing}
> > > \item \ref{devicenormative:Device Types / Network Device / Device
> > > Operation / Control Virtqueue / Inner Header Hash}
> > > +\item \ref{devicenormative:Device Types / Network Device / Device
> > > +Operation / Control Virtqueue / Device Statistics}
> > >  \end{itemize}
> > > diff --git a/device-types/net/driver-conformance.tex
> > > b/device-types/net/driver-conformance.tex
> > > index 9d853d9..c693c4f 100644
> > > --- a/device-types/net/driver-conformance.tex
> > > +++ b/device-types/net/driver-conformance.tex
> > > @@ -15,4 +15,5 @@
> > >  \item \ref{drivernormative:Device Types / Network Device / Device
> > > Operation / Control Virtqueue / Receive-side scaling (RSS) }  \item
> > > \ref{drivernormative:Device Types / Network Device / Device Operation
> > > / Control Virtqueue / Notifications Coalescing}  \item
> > > \ref{drivernormative:Device Types / Network Device / Device Operation
> > > / Control Virtqueue / Inner Header Hash}
> > > +\item \ref{drivernormative:Device Types / Network Device / Device
> > > +Operation / Control Virtqueue / Device Statistics}
> > >  \end{itemize}
> > > --
> > > 2.32.0.3.g01195cf9f
> > >
> > >
> > > This publicly archived list offers a means to provide input to the
> > > OASIS Virtual I/O Device (VIRTIO) TC.
> > >
> > > In order to verify user consent to the Feedback License terms and to
> > > minimize spam in the list archive, subscription is required before
> > > posting.
> > >
> > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > List help: virtio-comment-help@lists.oasis-open.org
> > > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > > Feedback License:
> > > https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > > List Guidelines:
> > > https://www.oasis-open.org/policies-guidelines/mailing-lists
> > > Committee: https://www.oasis-open.org/committees/virtio/
> > > Join OASIS: https://www.oasis-open.org/join/
> > >

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

