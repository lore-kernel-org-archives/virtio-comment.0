Return-Path: <virtio-comment-return-5718-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D6BC77B75
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 14:27:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 79EB586690
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 14:27:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 63F8C9866B2
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 14:27:17 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4F17898658B; Wed,  3 May 2023 14:27:17 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3CE92986594
	for <virtio-comment@lists.oasis-open.org>; Wed,  3 May 2023 14:27:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 9mMHIDGZM6uXn-iI2gcSbg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683124034; x=1685716034;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rndQTKCxLYdWXAmPijpz5zHM4f8gRqqUNAVnoWkUvEg=;
        b=jsVtZ5jAuXh0MaKEDe+3Kbrm6H/W7Nw9JsYt2qZ2Badu7tSRZQKEQW6xYmRpWT2w1B
         Yltq7bIcef3hsxQtrR+REJdw0EG150SKor8LWd5G0Lu+UCcKyPtGzm34Rop7QwMpBgTK
         phLB+bFWJcUOt2fvEGHo7jyciIzkaa8Q9zTbMdDIVL0watbpjxA9HfMq+k8KLrV8yMiB
         hA+lc1fz4sMfB2we8vNRCRXeBP9xdYkRjeYjFWxiW7qLZmBNlXjFOH/+OVl6MS7LySRQ
         Xb7OGX1a0gC9TSkfz3ZW3O47uLSXqC8wuomL0eJrK8qv25R3dabAnsRiPSEypo2zqWpf
         ERUg==
X-Gm-Message-State: AC+VfDzu8dI+N7zKcnsO4KkAcUTmy+ykI5L+gksJKF9qhNB3vhaQMriU
	9aNZr6cg03f4JLCXlXQXZz9edOJ3+bFQPYF+LQA2EFNYoA0nISoZt507nTkNSdscPxbxqw6+qCA
	B9ee9eu/qrdhRvBXMYpYmelW2i0r3oscwnA==
X-Received: by 2002:adf:ea12:0:b0:2fe:f2d1:dcab with SMTP id q18-20020adfea12000000b002fef2d1dcabmr181993wrm.58.1683124034002;
        Wed, 03 May 2023 07:27:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4w2hs331jRbLtSUD97m700RSeNLOFTsurs6a4KAjFtgsaqSMp7yGLLnC/DBJ7FSqTiiXrivQ==
X-Received: by 2002:adf:ea12:0:b0:2fe:f2d1:dcab with SMTP id q18-20020adfea12000000b002fef2d1dcabmr181982wrm.58.1683124033688;
        Wed, 03 May 2023 07:27:13 -0700 (PDT)
Date: Wed, 3 May 2023 10:27:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cyril Germond <cgermond@kalrayinc.com>
Cc: virtio-comment@lists.oasis-open.org
Message-ID: <20230503102517-mutt-send-email-mst@kernel.org>
References: <20221121090212.645-1-cgermond@kalray.eu>
 <PAZP264MB3888A224F87ABA76501F3CC8C66C9@PAZP264MB3888.FRAP264.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <PAZP264MB3888A224F87ABA76501F3CC8C66C9@PAZP264MB3888.FRAP264.PROD.OUTLOOK.COM>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] RE: [PATCH] virtio-net: Fix virtio_net_hdr
 struct size when VIRTIO_NET_F_HASH_REPORT is negotiated.

On Wed, May 03, 2023 at 01:39:59PM +0000, Cyril Germond wrote:
> Hello
> It seems this proposal has not received feedback from virtio-net folks.
> What should we do with it ?
> Thanks

Request a vote to resolve this as described at:
https://github.com/oasis-tcs/virtio-spec#use-of-github-issues

> -----Original Message-----
> From: Cyril Germond <cgermond@kalray.eu> 
> Sent: Monday, November 21, 2022 10:03 AM
> To: virtio-comment@lists.oasis-open.org
> Cc: Cyril Germond <cgermond@kalray.eu>
> Subject: [PATCH] virtio-net: Fix virtio_net_hdr struct size when VIRTIO_NET_F_HASH_REPORT is negotiated.
> 
> Hard-coded references to the size of virtio_net_hdr strut are wrong when VIRTIO_NET_HASH_REPORT feature is negotiated.
> 
> Changelog:
> v1->v2: Fixed wording syntax
> v2->v3: Rebase
> 
> Signed-off-by: Cyril Germond <cgermond@kalray.eu>
> ---
>  content.tex    | 10 ++++++----
>  split-ring.tex |  3 ++-
>  2 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/content.tex b/content.tex
> index 91ba76c..61bc09c 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -3622,8 +3622,8 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi  features are used, the maximum incoming packet  will be to 65550 bytes long (the maximum size of a  TCP or UDP packet, plus the 14 byte ethernet header), otherwise
> -1514 bytes.  The 12-byte struct virtio_net_hdr is prepended to this, -making for 65562 or 1526 bytes.
> +1514 bytes.  The struct virtio_net_hdr (the length of which depends on 
> +VIRTIO_NET_F_HASH_REPORT feature negotiation) is prepended to this.
>  
>  \drivernormative{\paragraph}{Setting Up Receive Buffers}{Device Types / Network Device / Device Operation / Setting Up Receive Buffers}
>  
> @@ -3632,9 +3632,11 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
>    \begin{itemize}
>      \item If VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6, VIRTIO_NET_F_GUEST_UFO,
>  	VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6 are negotiated, the driver SHOULD populate
> -      the receive queue(s) with buffers of at least 65562 bytes.
> +      the receive queue(s) with buffers of at least 65570 bytes
> +      if VIRTIO_NET_F_HASH_REPORT is negotiated, 65562 bytes otherwise.
>      \item Otherwise, the driver SHOULD populate the receive queue(s)
> -      with buffers of at least 1526 bytes.
> +      with buffers of at least 1534 bytes if VIRTIO_NET_F_HASH_REPORT
> +      is negotiated, 1526 bytes otherwise.
>    \end{itemize}
>  \item If VIRTIO_NET_F_MRG_RXBUF is negotiated, each buffer MUST be at  least the size of the struct virtio_net_hdr.
> diff --git a/split-ring.tex b/split-ring.tex index de94038..82e910f 100644
> --- a/split-ring.tex
> +++ b/split-ring.tex
> @@ -127,7 +127,8 @@ \subsection{Legacy Interfaces: A Note on Virtqueue Endianness}\label{sec:Basic F
>  
>  \subsection{Message Framing}\label{sec:Basic Facilities of a Virtio Device / Virtqueues / Message Framing}  The framing of messages with descriptors is -independent of the contents of the buffers. For example, a network
> +independent of the contents of the buffers. For example, if 
> +VIRTIO_NET_F_HASH_REPORT has not been negotiated, a network
>  transmit buffer consists of a 12 byte header followed by the network  packet. This could be most simply placed in the descriptor table as a
>  12 byte output descriptor followed by a 1514 byte output descriptor,
> --
> 2.25.1
> 
> 
> 
> 
> 
> 
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
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/


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

