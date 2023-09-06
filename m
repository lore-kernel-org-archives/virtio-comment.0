Return-Path: <virtio-comment-return-7267-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B80BEB8FA5
	for <virtio-comment@archiver.kernel.org>; Wed,  6 Sep 2023 08:33:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8AF4D22368
	for <virtio-comment@archiver.kernel.org>; Wed,  6 Sep 2023 08:33:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6F4B79865E1
	for <virtio-comment@archiver.kernel.org>; Wed,  6 Sep 2023 08:33:02 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5DBE99865C9; Wed,  6 Sep 2023 08:33:02 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4850C9865CD
	for <virtio-comment@lists.oasis-open.org>; Wed,  6 Sep 2023 08:33:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: JqYH8JIvMtC4uZi0vlRJ6A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693989179; x=1694593979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVd9V+SmV/JFTP28JS1H9krvVd2JWjK1wVc/YFKRcfc=;
        b=L/7kzcMQ3y+9gN3KAaa07GCvMDSbycoEWFJOZuXfZ5Nkl3U0iM/fwcUgpERjTBQMxE
         27HppCBWwe8yLGk+uZO4arJkosKrW5GQBfEsG2k/Sj6otzE3Rd65bwKcgfsjzSAx5rbT
         4vQPK1zwRI7oQfjTa04tOjdlnVdk0Ih4v1AU4dcsSxOcWSWOQ/CVXLdjsPM5zJc9K6ks
         VNhKjQSAEV5I0q7ObaIiqN3WsUR6j0oDDyCPlVKNO7V59gnKI81jcj0q0bTGfAfdFYu+
         apAARvdktqur27Vtu+0t06A3Xcq7ns0os2HrIZ5AwXTto+fB/nfdW0OmPosJ88QOGQBZ
         RMNg==
X-Gm-Message-State: AOJu0Yy8SxSypgUHdpx3tObq8+Ju8DHGM1c62a/65zDNUVW4LcxZr3o4
	ikVDMTfxwbZ5QBwiXoNM2hNOGpVH+Q3pcNBI1ZWWYIUi9Mn8g5NeFbzdaeCTt6QVbii2t72C6sI
	gewBFpr60O5WhIAxqr7TwXy9VUgKDa+nYcg==
X-Received: by 2002:a05:6402:8c3:b0:525:6c74:5e58 with SMTP id d3-20020a05640208c300b005256c745e58mr2016849edz.23.1693989179123;
        Wed, 06 Sep 2023 01:32:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLS6Rlx7iidAJwpeV6VqURjko2gF79ZUUd/TcJW1rBErnCpzcXWxrVj/6sulx45/XtVxCFmw==
X-Received: by 2002:a05:6402:8c3:b0:525:6c74:5e58 with SMTP id d3-20020a05640208c300b005256c745e58mr2016830edz.23.1693989178796;
        Wed, 06 Sep 2023 01:32:58 -0700 (PDT)
Date: Wed, 6 Sep 2023 04:32:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@intel.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
	stefanha@redhat.com, virtio-comment@lists.oasis-open.org,
	virtio-dev@lists.oasis-open.org
Message-ID: <20230906043016-mutt-send-email-mst@kernel.org>
References: <20230906081637.32185-1-lingshan.zhu@intel.com>
 <20230906081637.32185-6-lingshan.zhu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20230906081637.32185-6-lingshan.zhu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH 5/5] virtio-pci: implement
 VIRTIO_F_QUEUE_STATE

On Wed, Sep 06, 2023 at 04:16:37PM +0800, Zhu Lingshan wrote:
> This patch adds two new le16 fields to common configuration structure
> to support VIRTIO_F_QUEUE_STATE in PCI transport layer.
> 
> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>


I do not see why this would be pci specific at all.

But besides I thought work on live migration will use
admin queue. This was explicitly one of the motivators.

Poking at the device from the driver to migrate it
is not going to work if the driver lives within guest.




> ---
>  transport-pci.tex | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/transport-pci.tex b/transport-pci.tex
> index a5c6719..3161519 100644
> --- a/transport-pci.tex
> +++ b/transport-pci.tex
> @@ -325,6 +325,10 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>          /* About the administration virtqueue. */
>          le16 admin_queue_index;         /* read-only for driver */
>          le16 admin_queue_num;         /* read-only for driver */
> +
> +	/* Virtqueue state */
> +        le16 queue_avail_state;         /* read-write */
> +        le16 queue_used_state;          /* read-write */
>  };
>  \end{lstlisting}
>  
> @@ -428,6 +432,17 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>  	The value 0 indicates no supported administration virtqueues.
>  	This field is valid only if VIRTIO_F_ADMIN_VQ has been
>  	negotiated.
> +
> +\item[\field{queue_avail_state}]
> +        This field is valid only if VIRTIO_F_QUEUE_STATE has been
> +        negotiated. The driver sets and gets the available state of
> +        the virtqueue here (see \ref{sec:Virtqueues / Virtqueue State}).
> +
> +\item[\field{queue_used_state}]
> +        This field is valid only if VIRTIO_F_QUEUE_STATE has been
> +        negotiated. The driver sets and gets the used state of the
> +        virtqueue here (see \ref{sec:Virtqueues / Virtqueue State}).
> +
>  \end{description}
>  
>  \devicenormative{\paragraph}{Common configuration structure layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}
> @@ -488,6 +503,9 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>  present either a value of 0 or a power of 2 in
>  \field{queue_size}.
>  
> +If VIRTIO_F_QUEUE_STATE has not been negotiated, the device MUST ignore
> +any accesses to \field{queue_avail_state} and \field{queue_used_state}.
> +
>  If VIRTIO_F_ADMIN_VQ has been negotiated, the value
>  \field{admin_queue_index} MUST be equal to, or bigger than
>  \field{num_queues}; also, \field{admin_queue_num} MUST be
> -- 
> 2.35.3
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

