Return-Path: <virtio-comment-return-8557-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7709C61D9B
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 13:52:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1DDC033580
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 13:52:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E0AE3986899
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 13:52:51 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C6EC5986896; Wed, 22 Nov 2023 13:52:51 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B82F9986898
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 13:52:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: iirNXItiMiedGeVdJVXGqw-1
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, virtio-comment@lists.oasis-open.org,
 mst@redhat.com
Cc: sburla@marvell.com, shahafs@nvidia.com, si-wei.liu@oracle.com,
 xuanzhuo@linux.alibaba.com, Parav Pandit <parav@nvidia.com>, Heng Qi
 <hengqi@linux.alibaba.com>
In-Reply-To: <20231110123853.2093309-5-parav@nvidia.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20231110123853.2093309-1-parav@nvidia.com>
 <20231110123853.2093309-5-parav@nvidia.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 22 Nov 2023 14:52:47 +0100
Message-ID: <871qchlwsw.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: [virtio-comment] Re: [PATCH v6 4/5] virtio-net: Add flow filter match entry, action
 and requests

On Fri, Nov 10 2023, Parav Pandit <parav@nvidia.com> wrote:

> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index 31c8c35..c1a08f8 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -33,9 +33,6 @@ \subsection{Virtqueues}\label{sec:Device Types / Network Device / Virtqueues}
>  controlq is optional; it only exists if VIRTIO_NET_F_CTRL_VQ is
>  negotiated.
>  
> -The flow filter virtqueues are optional; it may exists only if VIRTIO_NET_F_FLOW_FILTER
> -is negotiated and if the device reports such capability.
> -

Ok, here you remove the confusing text again -- please remove the hunk
from the first patch instead.

(...)

> @@ -1290,6 +1331,21 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
>  \hline
>  \end{tabular}
>  
> +For the \field{type} of VIRTIO_NET_FF_ETH_HDR, the match entry

s/entry/entries/

> +\field{key} and \field{mask} are in following format:
> +
> +\begin{lstlisting}
> +struct virtio_net_ff_match_eth_hdr {
> +        u8 dmac[6];
> +        u8 smac[6];
> +        le16 ether_type;
> +};
> +\end{lstlisting}
> +
> +The \field{dmac} is valid when VIRTIO_NET_FF_DST_MAC is set.
> +The \field{smac} is valid when VIRTIO_NET_FF_SRC_MAC is set.
> +The \field{ether_type} is valid when VIRTIO_NET_FF_ETHER_TYPE is set.

s/The// (x3)

> +
>  For the \field{type} of VIRTIO_NET_FF_VLAN_TAG_HDR, VLAN tag fields
>  are represented by a bitmap in \field{fields_bmap} are following:
>  
> @@ -1318,6 +1374,20 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
>  \hline
>  \end{tabular}
>  
> +For the \field{type} of VIRTIO_NET_FF_IPV4_HDR, match entry

s/match entry/the match entries/

> +\field{key} and \field{mask} are in following format:
> +
> +\begin{lstlisting}
> +struct virtio_net_ff_match_ipv4_hdr {
> +        le32 reserved[3];
> +        le32 sip;
> +        le32 dip;
> +};
> +\end{lstlisting}
> +
> +The \field{sip} is valid when VIRTIO_NET_FF_SRC_IPV4 is set.
> +The \field{dip} is valid when VIRTIO_NET_FF_DST_IPV4 is set.

s/The// (x2)

> +
>  For the \field{type} of VIRTIO_NET_FF_IPV6_HDR, header fields
>  are represented by a bitmap in \field{fields_bmap} are following:
>  
> @@ -1333,6 +1403,20 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
>  \hline
>  \end{tabular}
>  
> +For the \field{type} of VIRTIO_NET_FF_IPV4_HDR, match entry

s/match entry/the match entries/

> +\field{key} and \field{mask} are in following format:
> +
> +\begin{lstlisting}
> +struct virtio_net_ff_match_ipv6_hdr {
> +        le32 reserved[2];
> +        u8 sip[16];
> +        u8 dip[16];
> +};
> +\end{lstlisting}
> +
> +The \field{sip} is valid when VIRTIO_NET_FF_SRC_IPV6 is set.
> +The \field{dip} is valid when VIRTIO_NET_FF_DST_IPV6 is set.

s/The// (x2)

> +
>  For the \field{type} of VIRTIO_NET_FF_TCP_HDR, header fields
>  are represented by a bitmap in \field{fields_bmap} are following:
>  
> @@ -1348,6 +1432,20 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
>  \hline
>  \end{tabular}
>  
> +For the \field{type} of VIRTIO_NET_FF_TCP_HDR, match entry

s/match entry/the match entries/

> +\field{key} and \field{mask} are in following format:
> +
> +\begin{lstlisting}
> +struct virtio_ndr_ff_match_tcp_hdr {
> +        le16 sport;
> +        le16 dport;
> +        le32 reserved[4];
> +};
> +\end{lstlisting}
> +
> +The \field{sport} is valid when VIRTIO_NET_FF_SRC_TCP_PORT is set.

s/The//

> +This \field{dport} is valid when VIRTIO_NET_FF_DST_TCP_PORT is set.

s/This//

> +
>  For the \field{type} of VIRTIO_NET_FF_UDP_HDR, header fields
>  are represented by a bitmap in \field{fields_bmap} are following:
>  
> @@ -1363,6 +1461,88 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
>  \hline
>  \end{tabular}
>  
> +For the \field{type} of VIRTIO_NET_FF_UDP_HDR, match entry

s/match entry/the match entries/

> +\field{key} and \field{mask} are in following format:
> +
> +\begin{lstlisting}
> +struct virtio_ndr_ff_match_udp_hdr {
> +        le16 sport;
> +        le16 dport;
> +        le32 reserved;
> +};
> +\end{lstlisting}
> +
> +The \field{sport} is valid when VIRTIO_NET_FF_SRC_UDP_PORT is set.

s/The//

> +This \field{dport} is valid when VIRTIO_NET_FF_DST_UDP_PORT is set.

s/This//

> +
> +\paragraph{Flow Filter Request}
> +\label{sec:Device Types / Network Device / Device Operation / Flow Filter / Flow Filter Request}
> +
> +Two flow filter requests are supported by the device.
> +
> +\begin{itemize}
> +\item Add or replace a flow filter using a request \field{struct virtio_net_ff_add}.
> +
> +\item Delete an existing flow filter using a request \field{struct virtio_net_ff_del}.
> +
> +\end{itemize}
> +
> +\begin{lstlisting}
> +#define VIRTIO_NET_FF_REQ_ADD 0
> +#define VIRTIO_NET_FF_REQ_DEL 1
> +
> +struct virtio_net_ff_add {
> +        u8 request; /* VIRTIO_NET_FF_REQ_ADD */
> +        u8 priority;	/* higher the value, higher priority */
> +        u16 group_id;
> +        le32 id;
> +        struct virtio_ff_match match;
> +        struct virtio_ff_action action;
> +};
> +
> +struct virtio_net_ff_del {
> +        u8 request;  /* VIRTIO_NET_FF_REQ_DEL */
> +        u8 reserved[3];
> +        le32 id;
> +};
> +
> +struct virtio_net_ff_result {
> +        le16 status;
> +};
> +
> +#define VIRTIO_NET_FF_RESULT_OK 0
> +#define VIRTIO_NET_FF_RESULT_ERR 1
> +
> +struct virtio_net_ff_req {
> +        /* Device-readable part */
> +        union {
> +                struct virtio_net_ff_add add;
> +                struct virtio_net_ff_del del;
> +        };
> +        /* Device-writable part */
> +        struct virtio_net_ff_result result;
> +};
> +\end{lstlisting}
> +
> +When adding a flow filter entry using request \field{struct virtio_net_ff_add},
> +the \field{match.match_entries} indidates number of valid array entries \field{match.entries}.

s/the//
s/number of/the number of/

> +For each of the valid entry in \field{match.entries}, the field \field{type}

s/entry/entries/
s/field/fields/

> +and \field{key} are in the format described in
> +\ref{sec:Device Types / Network Device / Device Operation / Flow Filter / Match Types and Fields}.
> +When the \field{mask_present} is set, the field \field{mask} is present and it has

s/When the/When/
s/it has/has/

> +exact same format as \field{key}.
> +
> +The field \field{key_mask_len} represents the total length of fields
> +\field{key} and \field{mask}.
> +
> +Previously added flow filter entry can be deleted by the driver using

s/entry/entries/
s/using/using the/

> +VIRTIO_NET_FF_REQ_DEL request.
> +
> +When the device completes the request, \field{status} is updated
> +by the device; when the request is successful, \field{status} is
> +set to VIRTIO_NET_FF_RESULT_OK, on error, \field{status} is
> +set to VIRTIO_NET_FF_RESULT_ERR.
> +
>  \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue}
>  
>  The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is
> @@ -2541,6 +2721,8 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>  \item the driver can send commands VIRTIO_NET_CTRL_FF_GROUP_ADD
>  and VIRTIO_NET_CTRL_FF_GROUP_DEL for adding and deleting the
>  flow group.
> +\item the driver can send command VIRTIO_NET_CTRL_FF_REQ to

s/command/the command/

> +add or delete flow filter.
>  \end{itemize}
>  
>  \begin{lstlisting}
> @@ -2549,6 +2731,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>   #define VIRTIO_NET_CTRL_FF_MATCH_CAP_GET 1
>   #define VIRTIO_NET_CTRL_FF_GROUP_ADD 2
>   #define VIRTIO_NET_CTRL_FF_GROUP_DEL 3
> + #define VIRTIO_NET_CTRL_FF_REQ 4
>  \end{lstlisting}
>  
>  \subparagraph{Flow Filter Capabilities Get}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Capabilities Get}
> @@ -2632,6 +2815,28 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>  };
>  \end{lstlisting}
>  
> +\subparagraph{Flow Filter Requests}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Requests}
> +
> +The flow filter requests are transported using command

s/command/the/

> +VIRTIO_NET_CTRL_FF_REQ command.
> +
> +\begin{lstlisting}
> +struct virtio_net_ctrl_ff_req {
> +        union {
> +                struct virtio_net_ff_add add;
> +                struct virtio_net_ff_del del;
> +        };
> +};
> +
> +\end{lstlisting}
> +
> +The \field{command-specific-data} is in format of
> +\field{struct virtio_net_ctrl_ff_req}.
> +
> +When the flow filter request command is successful, the
> +\field{command-specific-result} is in format of
> +\field{struct virtio_net_ff_result}.
> +
>  \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
>  Types / Network Device / Legacy Interface: Framing Requirements}


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

