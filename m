Return-Path: <virtio-comment-return-6387-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5836EEB64D9
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 16:37:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D3FB919231D
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 16:37:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4F5FC9864EE
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 16:37:48 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 458A19863A6; Mon, 19 Jun 2023 16:37:48 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 28FB69868AF
	for <virtio-comment@lists.oasis-open.org>; Mon, 19 Jun 2023 16:37:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Qk6Y8IU_NOakZkYIL89dzg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687192664; x=1689784664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+n8n57WG9+U7TLqIgh/Chvy0opVLo3B0cSG6RjN/9k=;
        b=AyZ/hf9vYI3g+bUyucLYXtcQ4+o0WVjnUk7GrbNvozBf7EbcxVSiaF2BHQ71duza6L
         nxAfXNTqmJbOQTtAWYsy9IWcFveL0HjfzRuFpGtFM/kRAlXodUi8b9fiDpXG7yIMTI0b
         MBeLNKfA+90dMF+3c0v/QN1yPs7Uwkt6B8gcTCf0JNbPtqKq7Nq8c/5dds3SKAapho9z
         rqZLkK1fvjwcQiWpO8X+yIVVFL9j1tQcoMNDcQfM5vRFh6Cs+2Djr0vfs45ePr5rhCfp
         YsIYVrUZU9pHTNn2mJT7z+o18NROp6RvxqPTqf6NecwwwQNJ7HB0cEm1YKfi8peMgPdM
         q7hQ==
X-Gm-Message-State: AC+VfDypk4VUrZmAzfm45VA0Lo1+Ol+8sE7UdbW1c+BDkyUWlaZKSw3A
	5zby2AgtzzBzOuuVP7+BDjiPWlptyZmr25yIfT2nhKmDJnQlMRr9jqq7Pn31nwvegeEGwji/aD0
	JfBUePNGi35k8pmxDNw6IrxcvDgvjq93Gdg==
X-Received: by 2002:a5d:4c49:0:b0:307:9702:dfc8 with SMTP id n9-20020a5d4c49000000b003079702dfc8mr8738094wrt.48.1687192663706;
        Mon, 19 Jun 2023 09:37:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ674ZmS4VN/RwcNBGEh3a01b/dUyA9DYgrUky92L/oSrvtFKjJ7CDHc9ru2deB8GeXQvUJZEA==
X-Received: by 2002:a5d:4c49:0:b0:307:9702:dfc8 with SMTP id n9-20020a5d4c49000000b003079702dfc8mr8738082wrt.48.1687192663264;
        Mon, 19 Jun 2023 09:37:43 -0700 (PDT)
Date: Mon, 19 Jun 2023 12:37:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, cohuck@redhat.com,
	david.edmondson@oracle.com, virtio-dev@lists.oasis-open.org,
	sburla@marvell.com, jasowang@redhat.com, yishaih@nvidia.com,
	maorg@nvidia.com, shahafs@nvidia.com
Message-ID: <20230619122836-mutt-send-email-mst@kernel.org>
References: <20230613173015.1244486-1-parav@nvidia.com>
 <20230613173015.1244486-5-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230613173015.1244486-5-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v6 4/4] transport-pci: Introduce group legacy group
 member config region access

On Tue, Jun 13, 2023 at 08:30:15PM +0300, Parav Pandit wrote:
> --- a/transport-pci.tex
> +++ b/transport-pci.tex
> @@ -541,6 +541,8 @@ \subsubsection{Notification structure layout}\label{sec:Virtio Transport Options
>  struct virtio_pci_notify_cap {
>          struct virtio_pci_cap cap;
>          le32 notify_off_multiplier; /* Multiplier for queue_notify_off. */
> +        u8 legacy_q_notify_supported;
> +	u8 reserved[3];
>  };
>  \end{lstlisting}
>  
> @@ -560,6 +562,14 @@ \subsubsection{Notification structure layout}\label{sec:Virtio Transport Options
>  the same Queue Notify address for all queues.
>  \end{note}
>  
> +\field{legacy_q_notify_supported} when set to 1, indicates that the device
> +supports legacy queue notifications at this notification location. Legacy Queue
> +Notification address is derived within a BAR for a virtqueue:
> +
> +\begin{lstlisting}
> +        cap.offset
> +\end{lstlisting}
> +
>  \devicenormative{\paragraph}{Notification capability}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Notification capability}
>  The device MUST present at least one notification capability.
>  

I was hoping that we can avoid touching transport-pci.tex completely,
this is why I wanted to reuse VIRTIO_PCI_CAP_NOTIFY_CFG.



-- 
MST


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

