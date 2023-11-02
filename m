Return-Path: <virtio-comment-return-8126-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0980C4332F
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 13:55:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 36F482AC58
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 13:55:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1ABAE986C0B
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 13:55:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id F0167986C01; Thu,  2 Nov 2023 13:55:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DE8A4986C02
	for <virtio-comment@lists.oasis-open.org>; Thu,  2 Nov 2023 13:55:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: BYSqCv7HPa6pe4augMDDdg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698933323; x=1699538123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yb2zlEGwo3sz8sxu5gdKUeLWU263mifLd2nMVZaO84A=;
        b=fXiW7G/WF1mgumejW1G43SLwVY5hZJHrQsVN+NVDn7XoWfjwoyqqRsDiEn/ETssIkV
         SNyRe3YXCIk1epCd65V8X1y3Q+KvzrjD57ckGEkRF+7LS0G35u1SebnzxGiRIXB4hrw9
         f6y50/R1y6XEhXoPBrOxXlTs41Vandomr1bjx3deeEWxh6cZ0P1xmmRG8/5cNI5QViCI
         I1PTVBY29u/HfIw/wac2eHY/DTQQLdaB0sE2sqS+y3PV/y8ah8pkz6bDhCnBYKsUpVub
         ubKbHGpLnY+XT6UGU7WiT73gGHGLd7Gc68bN0c7ezJlfpILhTeuEzeCU0W0ca8kLvJrp
         sq5A==
X-Gm-Message-State: AOJu0YzIpX5PgzHJD4E27jCUk4di2K7hJcDVV2dtcji4YASB4IYQbfA5
	E39z9Wpl5mOLMLahdNxnQhQdEbG8jW6P+HJTbxQDuNoSTSEcw3DP7KaC8IyA3r4uxigAY+lhU5M
	NFpLaYEwRLXuHZQ8F0Besh9Oy8u/R32E0Gg==
X-Received: by 2002:a05:600c:520f:b0:3fe:d67d:5040 with SMTP id fb15-20020a05600c520f00b003fed67d5040mr6921664wmb.5.1698933323209;
        Thu, 02 Nov 2023 06:55:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERJVkcx/Yt1OPzG2X84Lv2TGQdKOYbAfVkJ2U8+gS69B82qk0JzI3vrB67CiFDJdnI8lDVEA==
X-Received: by 2002:a05:600c:520f:b0:3fe:d67d:5040 with SMTP id fb15-20020a05600c520f00b003fed67d5040mr6921641wmb.5.1698933322822;
        Thu, 02 Nov 2023 06:55:22 -0700 (PDT)
Date: Thu, 2 Nov 2023 09:55:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, cohuck@redhat.com,
	sburla@marvell.com, shahafs@nvidia.com, maorg@nvidia.com,
	yishaih@nvidia.com, lingshan.zhu@intel.com, jasowang@redhat.com
Message-ID: <20231102093540-mutt-send-email-mst@kernel.org>
References: <20231102131946.1864886-1-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20231102131946.1864886-1-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH] virtio-net: Add device migration context fields

On Thu, Nov 02, 2023 at 03:19:46PM +0200, Parav Pandit wrote:
> Expand device migration context for fields such as
> mac table, vlan table, mq config, rss config.
> 
> All of them utilizes already defined infrastructure.
> 
> This patch is on top of [1].
> 
> [1] https://lists.oasis-open.org/archives/virtio-comment/202310/msg00469.html
> 
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  device-context.tex                  |  2 +-
>  device-types/net/description.tex    |  2 +
>  device-types/net/device-context.tex | 58 +++++++++++++++++++++++++++++
>  3 files changed, 61 insertions(+), 1 deletion(-)
>  create mode 100644 device-types/net/device-context.tex
> 
> diff --git a/device-context.tex b/device-context.tex
> index ab19fc9..348bb25 100644
> --- a/device-context.tex
> +++ b/device-context.tex
> @@ -57,7 +57,7 @@ \section{Device Context}\label{sec:Basic Facilities of a Virtio Device / Device
>  \hline
>  0x1000 & VIRTIO_DEV_CTX_DEV_CFG & Provides device specific configuration \\
>  \hline
> -0x1001 - 0x1FFF & - & Device type specific range reserved for future \\
> +0x1001 - 0x1FFF & - & Device type specific range defined by the specific device type \\
>  \hline
>  \hline
>  0x2000 - 0xFFFF & - & Reserved for future \\
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index 76585b0..13490ec 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -1805,6 +1805,8 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>  
>  Upon reset, a device MUST initialize all coalescing parameters to 0.
>  
> +\input{device-types/net/device-context.tex}
> +

I don't think we need to split this to a separate file.

>  \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
>  Types / Network Device / Legacy Interface: Framing Requirements}
>  
> diff --git a/device-types/net/device-context.tex b/device-types/net/device-context.tex
> new file mode 100644
> index 0000000..b78cf37
> --- /dev/null
> +++ b/device-types/net/device-context.tex
> @@ -0,0 +1,58 @@
> +\subsection{Device Context}\label{sec:Device Types / Network Device / Device Operation / Device Context}
> +
> +\begin{table}
> +\caption{\label{tab:Network Device Context Fields} Network Device Context Fields}
> +\begin{tabularx}{\textwidth}{ |l||l|X| }
> +\hline
> +Type & Name & Description \\
> +\hline \hline
> +\hline
> +0x1001 & VIRTIO_DEV_CTX_NET_MAC_ADDR_FILTER_TABLE & Provides MAC Address filter table \\
> +\hline
> +0x1002 & VIRTIO_DEV_CTX_NET_VLAN_FILTER_TABLE & Provides VLAN filter table \\
> +\hline
> +0x1003 & VIRTIO_DEV_CTX_NET_MQ_PAIRS & Provides multi queue configuration \\
> +\hline
> +0x1004 & VIRTIO_DEV_CTX_NET_RSS_CONFIG & Provides RSS configuration \\
> +\hline
> +0x1005 - 0x1FFF & - & reserved for future \\
> +\hline
> +\hline

Where are these 0x1XXX values coming from?


> +\end{tabularx}
> +\end{table}
> +
> +\subsubsection{MAC Address Filter Table Context}\label{sec:Device Types / Network Device / Device Operation / Device Context / MAC Address Filter Table Context}
> +
> +For the field VIRTIO_DEV_CTX_NET_MAC_TABLE, \field{type} is set to 0x1001.
> +The \field{value} is in format of \field{struct virtio_net_ctrl_mac} as listed
> +in section
> +\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Setting MAC Address Filtering}.
> +The \field{length} is the length of \field{struct virtio_net_ctrl_mac}.
> +
> +\subsubsection{VLAN Filter Table Context}\label{sec:Device Types / Network Device / Device Operation / Device Context / VLAN Filter Table Context}
> +
> +For the field VIRTIO_DEV_CTX_NET_VLAN_FILTER_TABLE, \field{type} is set to 0x1002.
> +The \field{value} is in format of \field{struct virtio_dev_ctx_net_vlan_table}.
> +The \field{length} is the length of \field{struct virtio_dev_ctx_net_vlan_table}.

in bytes?

> +
> +\begin{lstlisting}
> +struct virtio_dev_ctx_net_vlan_table {
> +        le16 vlan[];
> +};
> +\end{lstlisting}


are you going to document this or do you think this is self-explanatory?

> +
> +\subsubsection{Multiqueue Pairs Context}\label{sec:Device Types / Network Device / Device Operation / Device Context / Multiqueue Pairs Context}
> +
> +For the field VIRTIO_DEV_CTX_NET_MQ_PAIRS, \field{type} is set to 0x1003.
> +The \field{value} is in format of \field{struct virtio_net_ctrl_mq_pairs_set} as listed
> +in section
> +\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Automatic receive steering in multiqueue mode}.
> +The \field{length} is the length of \field{struct virtio_net_ctrl_mq_pairs_set}.
> +
> +\subsubsection{Receive Side Scaling Context}\label{sec:Device Types / Network Device / Device Operation / Device Context / Receive Side Scaling Context}
> +
> +For the field VIRTIO_DEV_CTX_NET_RSS_CONFIG, \field{type} is set to 0x1004.
> +The \field{value} is in format of \field{struct virtio_net_rss_config} as listed
> +in section
> +\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS) / Setting RSS parameters}.
> +The \field{length} is the length of \field{struct virtio_net_rss_config}.




> -- 
> 2.34.1


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

