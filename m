Return-Path: <virtio-comment-return-6845-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92DDEB64DA
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Jul 2023 22:41:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F39442B05E
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Jul 2023 22:41:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BD8D39867C3
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Jul 2023 22:41:24 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9A3319867B5; Wed, 12 Jul 2023 22:41:24 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 84B999867B4
	for <virtio-comment@lists.oasis-open.org>; Wed, 12 Jul 2023 22:41:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: XUcC6U0vMiCm8w5Nbjdi4w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689201681; x=1691793681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCw8reFV4TCK+6VaZypPp15gOTUtOEuVN8xz1lM2+kk=;
        b=bNjTlbKLhe5qAG2C4YwZul/gg057caXYhU7sIuh2ky7lP/JI0bQXVMYQok5xAzC65N
         UeEQCn36D1mccPXM03cR8o4YBmIfkylR59ISFEp4HgqYZ6zljfZoTKHtsHw0sUE1qr3a
         hit3IZymd0SMSie3K4BVm//m4wGRA8bXf1Ph/rZYxCl0g4CcoVqxOd7MrEy2YUZjsqG/
         U4i/UY146Gxs9D2kpWyih5evwfSI36i6z835Tb9jzJ7QXwYaiqdVwGgpVKZ/adSf3/i4
         xgiROnWI2nss/hhj+q4uvnaIHT2z8vXLgsgxuOuCQWU8fvREuPhVHAEp0RAHvjSxyGy+
         RU/Q==
X-Gm-Message-State: ABy/qLbXzc52rIfl2u8WoQbXeqonboeMeHOe6gmtJbA4tcNEjTfvVmlR
	APUrCNSMMgFEFZHZViC3vs+z2272kmlSF+hhCbtghwfbYZeiaYzim69pkw0bCq3x8aVdh2mgbb6
	fLXifNX6zn4yrceBtQB3ah1zpedqOYqzYaA==
X-Received: by 2002:a5d:6d50:0:b0:313:e888:3517 with SMTP id k16-20020a5d6d50000000b00313e8883517mr13705477wri.43.1689201681375;
        Wed, 12 Jul 2023 15:41:21 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEwmzQO1e1c0cxXp03gX+0pqM/736fyb5k1cd7umTcKgUB8S25rRVe+B6ZcK9ARRQsctLbn/g==
X-Received: by 2002:a5d:6d50:0:b0:313:e888:3517 with SMTP id k16-20020a5d6d50000000b00313e8883517mr13705465wri.43.1689201681105;
        Wed, 12 Jul 2023 15:41:21 -0700 (PDT)
Date: Wed, 12 Jul 2023 18:41:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, cohuck@redhat.com,
	virtio-dev@lists.oasis-open.org, hengqi@linux.alibaba.com,
	shahafs@nvidia.com
Message-ID: <20230712184051-mutt-send-email-mst@kernel.org>
References: <20230712222405.455201-1-parav@nvidia.com>
 <20230712222405.455201-4-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230712222405.455201-4-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH 3/4] virtio-net: Use table to describe inner hash to rfc
 mapping

On Thu, Jul 13, 2023 at 01:24:04AM +0300, Parav Pandit wrote:
> hyperlinks inside the C comments do not work well.
> Until we find out a way to represent it, lets present this in table
> form.
> 
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  device-types/net/description.tex | 35 ++++++++++++++++++++++----------
>  1 file changed, 24 insertions(+), 11 deletions(-)
> 
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index 53c811f..68311ab 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -1065,17 +1065,30 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>  Hash calculation for incoming packets / Encapsulation types supported/enabled for inner header hash}
>  
>  Encapsulation types applicable for inner header hash:
> -\begin{lstlisting}
> -#define VIRTIO_NET_HASH_TUNNEL_TYPE_GRE_2784    (1 << 0) /* \hyperref[intro:gre_rfc2784]{[GRE_rfc2784]} */
> -#define VIRTIO_NET_HASH_TUNNEL_TYPE_GRE_2890    (1 << 1) /* \hyperref[intro:gre_rfc2890]{[GRE_rfc2890]} */
> -#define VIRTIO_NET_HASH_TUNNEL_TYPE_GRE_7676    (1 << 2) /* \hyperref[intro:gre_rfc7676]{[GRE_rfc7676]} */
> -#define VIRTIO_NET_HASH_TUNNEL_TYPE_GRE_UDP     (1 << 3) /* \hyperref[intro:gre_in_udp_rfc8086]{[GRE-in-UDP]} */
> -#define VIRTIO_NET_HASH_TUNNEL_TYPE_VXLAN       (1 << 4) /* \hyperref[intro:vxlan]{[VXLAN]} */
> -#define VIRTIO_NET_HASH_TUNNEL_TYPE_VXLAN_GPE   (1 << 5) /* \hyperref[intro:vxlan_gpe]{[VXLAN-GPE]} */
> -#define VIRTIO_NET_HASH_TUNNEL_TYPE_GENEVE      (1 << 6) /* \hyperref[intro:geneve]{[GENEVE]} */
> -#define VIRTIO_NET_HASH_TUNNEL_TYPE_IPIP        (1 << 7) /* \hyperref[intro:ipip]{[IPIP]} */
> -#define VIRTIO_NET_HASH_TUNNEL_TYPE_NVGRE       (1 << 8) /* \hyperref[intro:nvgre]{[NVGRE]} */
> -\end{lstlisting}

Hmm. escapechar did not work then?

> +
> +\begin{tabular}{|l|l|l|}
> +\hline
> +Inner header hash type & Value & Reference \\
> +\hline \hline
> +VIRTIO_NET_HASH_TUNNEL_TYPE_GRE_2784 & (1 << 0) & \hyperref[intro:rfc2784]{RFC2784} \\
> +\hline
> +VIRTIO_NET_HASH_TUNNEL_TYPE_GRE_2890 & (1 << 1) & \hyperref[intro:rfc2784]{RFC2784} \\
> +\hline
> +VIRTIO_NET_HASH_TUNNEL_TYPE_GRE_7676  & (1 << 2) & \hyperref[intro:rfc7676]{RFC7676} \\
> +\hline
> +VIRTIO_NET_HASH_TUNNEL_TYPE_GRE_UDP   & (1 << 3) & \hyperref[intro:rfc8086]{GRE in UDP} \\
> +\hline
> +VIRTIO_NET_HASH_TUNNEL_TYPE_VXLAN     & (1 << 4) & \hyperref[intro:vxlan]{VXLAN} \\
> +\hline
> +VIRTIO_NET_HASH_TUNNEL_TYPE_VXLAN_GPE & (1 << 5) & \hyperref[intro:vxlan gpe]{VXLAN GPE} \\
> +\hline
> +VIRTIO_NET_HASH_TUNNEL_TYPE_GENEVE    & (1 << 6) & \hyperref[intro:geneve]{GENEVE} \\
> +\hline
> +VIRTIO_NET_HASH_TUNNEL_TYPE_IPIP      & (1 << 7) & \hyperref[intro:ipip]{IPIP} \\
> +\hline
> +VIRTIO_NET_HASH_TUNNEL_TYPE_NVGRE     & (1 << 8) & \hyperref[intro:nvgre]{NVGRE} \\
> +\hline
> +\end{tabular}
>  
>  \subparagraph{Advice}
>  Example uses of the inner header hash:
> -- 
> 2.26.2


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

