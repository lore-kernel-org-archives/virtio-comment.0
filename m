Return-Path: <virtio-comment-return-6982-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DB9C0015E
	for <virtio-comment@archiver.kernel.org>; Thu,  3 Aug 2023 09:44:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B829D2B04C
	for <virtio-comment@archiver.kernel.org>; Thu,  3 Aug 2023 09:44:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A9315986854
	for <virtio-comment@archiver.kernel.org>; Thu,  3 Aug 2023 09:44:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9C0CA9866C1; Thu,  3 Aug 2023 09:44:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 767869866D6
	for <virtio-comment@lists.oasis-open.org>; Thu,  3 Aug 2023 09:44:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: iGjb3jYtN7qGbwxHRp7i2g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691055868; x=1691660668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIiHESIRo12kVUBiKPiqxwZTbxAWcsqGVQsGn+NLNng=;
        b=Gxd9Ud0SEdR4JyFRnbfk7gpBKx/TymgBOPXvSCMrz7KdzR2SY8vBi1S6xoMGiGVoE9
         mmar9YI476JCxF2NfkPFlFLh6x0pIVixqPbR8NuK8Wakbnvn2bheaFC2cX6bwySdz8RC
         9KQOVhAHoIgS2OuGy5tSssqby/xpgrYsvXlwJT+8PK1OybZleW9xhGDU2PPGK6KwFQ/P
         VwqLabcKk2ahwZNb975n6+rhtKlnIuxrC9Jq/TIo9n/ZGISlWr41o+pjfdyX+VU/sqmx
         sIYhFhiDljsV18/4L1qkn/UfNx8sTY3W7GG60khXw4NFqTT9pci0BkYWtFl6jwWCo7zv
         3+fg==
X-Gm-Message-State: ABy/qLZOn3PDcSGRfJZF6Sr3BUuwFLsBaQTz3o/6YB9I8keW7iBaPC0a
	hnGH8xhzvqcff7VQ7fErrPKUuYWhTRiZXjR2r2zqzWII74HY6kB2re1lNW9TUbrZL4HPWJhLDiI
	PENufodGl4TyICf6H9vEXlZjKim3cxCQ2DA==
X-Received: by 2002:a17:907:7899:b0:993:d53b:9805 with SMTP id ku25-20020a170907789900b00993d53b9805mr7396445ejc.11.1691055867929;
        Thu, 03 Aug 2023 02:44:27 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE/yUD9Zog/RlUmtEwGsy8+S8bGcX66bJXkJ+DoBDLSeuuTfQuczgDly0wmxzZQYq5czuTBUA==
X-Received: by 2002:a17:907:7899:b0:993:d53b:9805 with SMTP id ku25-20020a170907789900b00993d53b9805mr7396432ejc.11.1691055867558;
        Thu, 03 Aug 2023 02:44:27 -0700 (PDT)
Date: Thu, 3 Aug 2023 05:44:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: virtio-dev@lists.oasis-open.org, jasowang@redhat.com,
	Parav Pandit <parav@nvidia.com>,
	virtio-comment@lists.oasis-open.org
Message-ID: <20230803054333-mutt-send-email-mst@kernel.org>
References: <20230803083150.46745-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20230803083150.46745-1-xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [RFC] virtio-net: support access and control the member devices

On Thu, Aug 03, 2023 at 04:31:50PM +0800, Xuan Zhuo wrote:
> Now we have the concept of the device group. This allows us to
> support sr-iov and siov more conveniently.
> 
> The following description uses pf, vf as an example. The scene with sf
> should be similar.
> 
> According to my understanding, the management at the level of virtqueue
> should be handled by admin queue. And the net related management is
> still managed by cvq of pf. So this patch works with the cvq of the pf.
> 
> The problem I am trying to solve is when there are multiple vf
> virtio-net devices under one pf.
> It is necessary for administrators to query the status and information
> of each vf and configure mac.
> 
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>


I think we should use admin queue for this, and not cvq.

> ---
>  device-types/net/description.tex        | 72 +++++++++++++++++++++++--
>  device-types/net/device-conformance.tex |  1 +
>  2 files changed, 70 insertions(+), 3 deletions(-)
> 
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index 76585b0..1494a18 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -88,6 +88,9 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
>  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
>      channel.
>  
> +\item[VIRTIO_NET_F_ACCESS_MEMBER_DEVICE(51)] Device can access and control the
> +    member devices.
> +
>  \item[VIRTIO_NET_F_HASH_TUNNEL(51)] Device supports inner header hash for encapsulated packets.
>  
>  \item[VIRTIO_NET_F_VQ_NOTF_COAL(52)] Device supports virtqueue notification coalescing.
> @@ -1156,6 +1159,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>          u8 command;
>          u8 command-specific-data[];
>          u8 ack;
> +        u8 command-specific-data-reply[];
>  };
>  
>  /* ack values */
> @@ -1164,9 +1168,11 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>  \end{lstlisting}
>  
>  The \field{class}, \field{command} and command-specific-data are set by the
> -driver, and the device sets the \field{ack} byte. There is little it can
> -do except issue a diagnostic if \field{ack} is not
> -VIRTIO_NET_OK.
> +driver, and the device sets the \field{ack} byte and optionally
> +\field{command-specific-data-reply}. There is little the driver can
> +do except issue a diagnostic if \field{ack} is not VIRTIO_NET_OK.
> +
> +The command VIRTIO_NET_CTRL_MEMBER_GET_INFO contains \field{command-specific-data-reply}.
>  
>  \paragraph{Packet Receive Filtering}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Packet Receive Filtering}
>  \label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Setting Promiscuous Mode}%old label for latexdiff
> @@ -1805,6 +1811,66 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>  
>  Upon reset, a device MUST initialize all coalescing parameters to 0.
>  
> +\paragraph{Member Device}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Member Info}
> +
> +If a deivce is the own deivce inside one device group and the feature
> +VIRTIO_NET_F_ACCESS_MEMBER_DEVICE is negotiated, the own driver can obtain
> +the info and change the configuration of the member devices of this device
> +group.
> +
> +\begin{lstlisting}
> +struct virtio_net_ctrl_member {
> +        le64 group_member_id;
> +};
> +
> +struct virtio_net_ctrl_member_info_reply {
> +        u8 mac[6];
> +        le16 status;
> +        le16 max_virtqueue_pairs;
> +        le16 mtu;
> +        le32 speed;
> +        u8 duplex;
> +        u8 driver_ok;
> +        le16 current_virtqueue_pairs;
> +};
> +
> +struct virtio_net_ctrl_member_set_mac {
> +        le64 group_member_id;
> +        u8 mac[6];
> +};
> +
> +#define VIRTIO_NET_CTRL_MEMBER 7
> + #define VIRTIO_NET_CTRL_MEMBER_GET_INFO  0
> + #define VIRTIO_NET_CTRL_MEMBER_SET_MAC   1
> +\end{lstlisting}
> +
> +\devicenormative{\subparagraph}{Member Device}{Device Types / Network Device / Device Operation / Control Virtqueue / Member Device}
> +
> +The device only offers the feature VIRTIO_NET_F_ACCESS_MEMBER_DEVICE when it is
> +the own device.
> +
> +If the \field{group_member_id} is not within the range of the member device id,
> +the own device MUST respond with VIRTIO_NET_ERR.
> +
> +struct virtio_net_ctrl_member_info_reply is used to reply the command
> +VIRTIO_NET_CTRL_MEMBER_GET_INFO via \field{command-specific-data-reply}.
> +
> +If the member device specified by the \field{group_member_id} is in the
> +DRIVER_OK status, the own device MUST set the \field{driver_ok} to 1 and set the
> +\field{current_virtqueue_pairs} to the number of virtqueue pairs that are being
> +used by the member device. Otherwise, both \field{driver_ok} and
> +\field{current_virtqueue_pairs} MUST be set to zero.
> +
> +All other fields of the struct virtio_net_ctrl_member_info_reply MUST be equal
> +to the values in the struct virtio_net_config of the member device.
> +
> +If the member device specified by the \field{group_member_id} supports
> +VIRTIO_NET_F_MAC and its status is not DRIVER_OK, the own device MUST reply to
> +VIRTIO_NET_CTRL_MEMBER_SET_MAC with VIRTIO_NET_OK, and the member device MUST
> +offer the \field{mac} to the member driver via the struct virtio_net_config.
> +Otherwise, the own device MUST reply to the command
> +VIRTIO_NET_CTRL_MEMBER_SET_MAC with VIRTIO_NET_ERR.
> +
>  \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
>  Types / Network Device / Legacy Interface: Framing Requirements}
>  
> diff --git a/device-types/net/device-conformance.tex b/device-types/net/device-conformance.tex
> index f88f48b..9af3293 100644
> --- a/device-types/net/device-conformance.tex
> +++ b/device-types/net/device-conformance.tex
> @@ -15,4 +15,5 @@
>  \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS) / RSS processing}
>  \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing}
>  \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Inner Header Hash}
> +\item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Member Device}
>  \end{itemize}
> -- 
> 2.32.0.3.g01195cf9f


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

