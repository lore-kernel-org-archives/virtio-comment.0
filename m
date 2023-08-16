Return-Path: <virtio-comment-return-7175-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD852C001DF
	for <virtio-comment@archiver.kernel.org>; Wed, 16 Aug 2023 08:54:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1C6222AC4B
	for <virtio-comment@archiver.kernel.org>; Wed, 16 Aug 2023 08:54:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 09CE99863D7
	for <virtio-comment@archiver.kernel.org>; Wed, 16 Aug 2023 08:54:54 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EBAC7983EB2; Wed, 16 Aug 2023 08:54:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DA9FA9863D1
	for <virtio-comment@lists.oasis-open.org>; Wed, 16 Aug 2023 08:54:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045170;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0VpvHMJ._1692176087;
Message-ID: <f6cdc677-f4e4-477b-b706-a9e7f64437a7@linux.alibaba.com>
Date: Wed, 16 Aug 2023 16:54:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Cc: virtio-comment@lists.oasis-open.org, Parav Pandit <parav@nvidia.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 xuanzhuo@linux.alibaba.com
References: <20230815123650.38822-1-hengqi@linux.alibaba.com>
 <CAOEp5OfUDq-6i7i4Ccr3P8=Fi308aUx7zPw9KSKesVnmEWsZwQ@mail.gmail.com>
From: Heng Qi <hengqi@linux.alibaba.com>
In-Reply-To: <CAOEp5OfUDq-6i7i4Ccr3P8=Fi308aUx7zPw9KSKesVnmEWsZwQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [PATCH] virtio-net: support the RSS context



在 2023/8/16 上午2:03, Yuri Benditovich 写道:
> Probably worth to clarify: what is the expected persistency of the RSS 
> context:

Ok.

> is it expected to survive device reset?

No, after device reset, rss contexts are cleared.

> powerdown cycle?

Do you mean the host?

If yes, there is no rss context anymore because the host ram is reset.
If no, I think this is the same as the device reset.

Thanks.

> If there is some level of persistency, how can external software know 
> what contexts that the device contains?
> Should the sub-command be defined to apply one of saved contexts?
>
> Thanks,
> Yuri
>
>
> On Tue, Aug 15, 2023 at 3:36 PM Heng Qi <hengqi@linux.alibaba.com> wrote:
>
>     Commit 84a1d9c48200 ("net: ethtool: extend RXNFC API to support
>     RSS spreading of
>     filter matches") adds support for RSS context as a destination for
>     receive flow filters
>     (pls see https://lists.oasis-open.
>     org/archives/virtio-comment/202308/msg00194.html).
>
>     An RSS context consists of configurable parameters specified by
>     receive-side scaling.
>
>     Usecase:
>     When users want some data flows to be steered to specific multiple
>     rxqs, they can set
>     receive flow filter rules for these data flows to an RSS context
>     with desired rxqs.
>
>     How to set/configure an RSS context:
>     Assuming no RSS context has been created before.
>     1. ethtool -X eth0 context new start 5 equal 8
>
>     This command creates an RSS context with an id=1 for eth0, and
>     fills in the indirection
>     table with rxq indexes 5-8 circularly. The hash key and hash types
>     reuse the default
>     RSS configuration.
>
>     Then, we can use 'ethtool -x eth0 context 1' to query the above
>     configuration.
>
>     2. ethtool -X eth0 context new start 6 equal 7 \
>        hkey 8f:bf:dd:11:23:58:d2:8a:00:31:d0:32:a3:b5:1f:\
>      1f:e4:d1:fe:47:7f:64:42:fd:d0:61:16:b8:b0:f9:71:e8:2d:36:7f:18:dd:4d:c8:f3
>
>     This command creates an RSS context with an id=2 for eth0, and
>     fills in the indirection
>     table with rxq indexes 6-7 circularly. The hash key is
>     8f:bf:dd:11:23:58:d2:8a:00:31:d0\
>     :32:a3:b5:1f:1f:e4:d1:fe:47:7f:64:42:fd:d0:61:16:b8:b0:f9:71:e8:2d:36:7f:18:dd:4d:c8:f3.
>     Hash types reuse the default RSS configuration.
>
>     3. ethtool -N eth0 rx-flow-hash tcp4 sdfn context 1
>
>     This command specifies the hash types for the RSS context whose
>     id=1 on eth0.
>     Now this RSS context only has the hash key to reuse the default
>     RSS configuration.
>
>     4. ethtool -N eth0 flow-type udp4 src-ip 1.1.1.1 context 1
>
>     This command configures a receive flow filter rule for eth0, and
>     the data flow matching
>     this rule will continue to select the final rxq according to the
>     RSS context configuration
>     with id=1.
>
>     Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
>     ---
>      device-types/net/description.tex        | 70
>     +++++++++++++++++++++++++
>      device-types/net/driver-conformance.tex |  1 +
>      2 files changed, 71 insertions(+)
>
>     diff --git a/device-types/net/description.tex
>     b/device-types/net/description.tex
>     index 76585b0..2deb060 100644
>     --- a/device-types/net/description.tex
>     +++ b/device-types/net/description.tex
>     @@ -88,6 +88,8 @@ \subsection{Feature bits}\label{sec:Device Types
>     / Network Device / Feature bits
>      \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
>          channel.
>
>     +\item[VIRTIO_NET_F_RSS_CONTEXT(50)] Device supports multiple RSS
>     contexts.
>     +
>      \item[VIRTIO_NET_F_HASH_TUNNEL(51)] Device supports inner header
>     hash for encapsulated packets.
>
>      \item[VIRTIO_NET_F_VQ_NOTF_COAL(52)] Device supports virtqueue
>     notification coalescing.
>     @@ -150,6 +152,7 @@ \subsubsection{Feature bit
>     requirements}\label{sec:Device Types / Network Device
>      \item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_CTRL_VQ.
>      \item[VIRTIO_NET_F_VQ_NOTF_COAL] Requires VIRTIO_NET_F_CTRL_VQ.
>      \item[VIRTIO_NET_F_HASH_TUNNEL] Requires VIRTIO_NET_F_CTRL_VQ
>     along with VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT.
>     +\item[VIRTIO_NET_F_RSS_CONTEXT] Requires VIRTIO_NET_F_CTRL_VQ and
>     VIRTIO_NET_F_RSS.
>      \end{description}
>
>      \subsubsection{Legacy Interface: Feature bits}\label{sec:Device
>     Types / Network Device / Feature bits / Legacy Interface: Feature
>     bits}
>     @@ -179,6 +182,8 @@ \subsection{Device configuration
>     layout}\label{sec:Device Types / Network Device
>              le16 rss_max_indirection_table_length;
>              le32 supported_hash_types;
>              le32 supported_tunnel_types;
>     +        le16 max_rss_contexts;
>     +        le16 reserved;
>      };
>      \end{lstlisting}
>
>     @@ -235,6 +240,12 @@ \subsection{Device configuration
>     layout}\label{sec:Device Types / Network Device
>      Encapsulation types are defined in \ref{sec:Device Types /
>     Network Device / Device Operation / Processing of Incoming Packets /
>      Hash calculation for incoming packets / Encapsulation types
>     supported/enabled for inner header hash}.
>
>     +Field \field{max_rss_contexts} only exists if
>     VIRTIO_NET_F_RSS_CONTEXT is set.
>     +This field specifies the maximum number of RSS contexts
>     \ref{sec:Device Types / Network Device /
>     +Device Operation / Control Virtqueue / RSS Context} supported by
>     the device.
>     +
>     +Field \field{reserved} contains zeroes and is reserved.
>     +
>      \devicenormative{\subsubsection}{Device configuration
>     layout}{Device Types / Network Device / Device configuration layout}
>
>      The device MUST set \field{max_virtqueue_pairs} to between 1 and
>     0x8000 inclusive,
>     @@ -285,6 +296,8 @@ \subsection{Device configuration
>     layout}\label{sec:Device Types / Network Device
>      The device SHOULD NOT offer VIRTIO_NET_F_CTRL_RX_EXTRA if it
>      does not offer VIRTIO_NET_F_CTRL_VQ.
>
>     +The device MUST set \field{max_rss_contexts} to at least 1 if it
>     offers VIRTIO_NET_F_RSS_CONTEXT.
>     +
>      \drivernormative{\subsubsection}{Device configuration
>     layout}{Device Types / Network Device / Device configuration layout}
>
>      The driver MUST NOT write to any of the device configuration fields.
>     @@ -1606,6 +1619,63 @@ \subsubsection{Control
>     Virtqueue}\label{sec:Device Types / Network Device / Devi
>      \item If the destination receive queue is being reset (See
>     \ref{sec:Basic Facilities of a Virtio Device / Virtqueues /
>     Virtqueue Reset}), the device MUST drop the packet.
>      \end{itemize}
>
>     +\paragraph{RSS Context}\label{sec:Device Types / Network Device /
>     Device Operation / Control Virtqueue / RSS Context}
>     +
>     +An RSS context consists of configurable parameters specified by
>     \ref{sec:Device Types / Network Device
>     +/ Device Operation / Control Virtqueue / Receive-side scaling (RSS)}.
>     +
>     +The RSS configuration supported by the VIRTIO_NET_F_RSS feature
>     is implicitly considered the default RSS context.
>     +
>     +The device offers the feature VIRTIO_NET_F_RSS_CONTEXT if it
>     supports one or more RSS contexts (excluding the default RSS context
>     +supported by VIRTIO_NET_F_RSS) and configurable parameters.
>     +
>     +\begin{lstlisting}
>     +struct virtnet_rss_ctx_add_modify {
>     +    u8 rss_ctx_id;
>     +    u8 padding[3];
>     +    struct virtio_net_rss_config rss;
>     +};
>     +
>     +struct virtnet_rss_ctx_del {
>     +    u8 rss_ctx_id;
>     +};
>     +
>     +#define VIRTNET_RSS_CTX_CTRL 8
>     + #define VIRTNET_RSS_CTX_CTRL_ADD  0
>     + #define VIRTNET_RSS_CTX_CTRL_MOD  1
>     + #define VIRTNET_RSS_CTX_CTRL_DEL  2
>     +\end{lstlisting}
>     +
>     +RSS context parameters:
>     +\begin{itemize}
>     +\item  \field{rss_ctx_id}: ID of the specific RSS context.
>     +\item  \field{rss}: Configure the specific RSS context whose id
>     is \field{rss_ctx_id}.
>     +\end{itemize}
>     +
>     +\field{padding} is reserved and it is ignored by the device.
>     +
>     +If the feature VIRTIO_NET_F_RSS_CONTEXT has been negotiated, the
>     driver can send the following
>     +VIRTNET_RSS_CTX_CTRL class commands to configure a specific RSS
>     context:
>     +\begin{enumerate}
>     +\item VIRTNET_RSS_CTX_CTRL_ADD: use the structure
>     virtnet_rss_ctx_add_modify to
>     +       add an RSS context configured as \field{rss} and id as
>     \field{rss_ctx_id} for the device.
>     +\item VIRTNET_RSS_CTX_CTRL_MOD: use the structure
>     virtnet_rss_ctx_add_modify to
>     +       configure parameters of the RSS context whose id is
>     \field{rss_ctx_id} as \field{rss} for the device.
>     +\item VIRTNET_RSS_CTX_CTRL_DEL: use the structure
>     virtnet_rss_ctx_del to delete
>     +       the RSS context whose id is \field{rss_ctx_id} for the device.
>     +\end{enumerate}
>     +
>     +For VIRTNET_RSS_CTX_CTRL_ADD and VIRTNET_RSS_CTX_CTRL_MOD
>     commands, the structure virtnet_rss_ctx_add_modify is read-only
>     for the device.
>     +For the VIRTNET_RSS_CTX_CTRL_DEL command, the structure
>     virtnet_rss_ctx_del is read-only for the device.
>     +
>     +\drivernormative{\subparagraph}{RSS Context}{Device Types /
>     Network Device / Device Operation / Control Virtqueue / RSS Context}
>     +
>     +The driver MUST have negotiated the VIRTIO_NET_F_RSS_CONTEXT
>     feature when issuing the VIRTNET_RSS_CTX_CTRL class commands.
>     +
>     +The driver MUST set \field{rss_ctx_id} to between 1 and
>     \field{max_rss_contexts} inclusive.
>     +
>     +The driver MUST NOT send the VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET
>     command when the device has responded to the
>     VIRTNET_RSS_CTX_CTRL_ADD command with VIRTIO_NET_OK.
>     +
>      \paragraph{Offloads State Configuration}\label{sec:Device Types /
>     Network Device / Device Operation / Control Virtqueue / Offloads
>     State Configuration}
>
>      If the VIRTIO_NET_F_CTRL_GUEST_OFFLOADS feature is negotiated,
>     the driver can
>     diff --git a/device-types/net/driver-conformance.tex
>     b/device-types/net/driver-conformance.tex
>     index 9d853d9..22ff5c3 100644
>     --- a/device-types/net/driver-conformance.tex
>     +++ b/device-types/net/driver-conformance.tex
>     @@ -15,4 +15,5 @@
>      \item \ref{drivernormative:Device Types / Network Device / Device
>     Operation / Control Virtqueue / Receive-side scaling (RSS) }
>      \item \ref{drivernormative:Device Types / Network Device / Device
>     Operation / Control Virtqueue / Notifications Coalescing}
>      \item \ref{drivernormative:Device Types / Network Device / Device
>     Operation / Control Virtqueue / Inner Header Hash}
>     +\item \ref{drivernormative:Device Types / Network Device / Device
>     Operation / Control Virtqueue / RSS Context}
>      \end{itemize}
>     -- 
>     2.19.1.6.gb485710b
>
>
>     This publicly archived list offers a means to provide input to the
>     OASIS Virtual I/O Device (VIRTIO) TC.
>
>     In order to verify user consent to the Feedback License terms and
>     to minimize spam in the list archive, subscription is required
>     before posting.
>
>     Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>     Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>     List help: virtio-comment-help@lists.oasis-open.org
>     List archive: https://lists.oasis-open.org/archives/virtio-comment/
>     Feedback License:
>     https://www.oasis-open.org/who/ipr/feedback_license.pdf
>     List Guidelines:
>     https://www.oasis-open.org/policies-guidelines/mailing-lists
>     Committee: https://www.oasis-open.org/committees/virtio/
>     Join OASIS: https://www.oasis-open.org/join/
>


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

