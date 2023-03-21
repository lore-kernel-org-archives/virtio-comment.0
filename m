Return-Path: <virtio-comment-return-4936-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E17C761AF
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Mar 2023 08:47:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1E1ED67067
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Mar 2023 08:47:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 18E93986452
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Mar 2023 08:47:08 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0EFA0983DFC; Tue, 21 Mar 2023 08:47:08 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EEFE89863AC
	for <virtio-comment@lists.oasis-open.org>; Tue, 21 Mar 2023 08:47:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: MhUjmTAOP8OHpbfTY_IJUg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679388420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4Kv+v5AGPo+t8NwLXR718+5GT8uyb916qGatEOsvMI=;
        b=K9ZKpO0esc8Hfx7H1gg+mFVDxLU/I3hsyWinV4lkC1oRrUTbK5D+DMSKDr12+Hp+vc
         3tvWYGAHKybxCEo8s10GisQ6dHX5c2HTnohrKWA8cOUykxFzLMCPsN6lMXIP3lv04fEn
         jIrACjPIwW+EUxlZfbQvqcl+2JsCwQsBj5Pr0e7+u9sB3xgPfC/QuJTI3i5zozpkPmYk
         a/N4zHVKDbH+4BGTmLU79fRpwby/oqt33CdyTIz+TAB78wm9PWZb1VvCq1W/gFcn7sWQ
         tt7ALi0maZwL98VLh6XMgZtS5oPFKPpKJ76KQULPeX8Q20LdFJxd5a9TY+Ks6Jbin3IA
         aEhg==
X-Gm-Message-State: AO0yUKU4PQtGSuJYqYO40BTITwA0vcgUdAImcm8b9uZ96whgPLNOIaX2
	EngfS7FJdXFO7BErPel47GXPc/LP3QGqHUDQcyYh75wzOeTJA97rF/fFMtuSWZTxq7W3tpMeJC0
	cd8K9OxSYCpjyclTvIKu5cTK6LWBzfsVzNw==
X-Received: by 2002:a5d:6ace:0:b0:2d8:908c:8fa0 with SMTP id u14-20020a5d6ace000000b002d8908c8fa0mr1672144wrw.9.1679388420441;
        Tue, 21 Mar 2023 01:47:00 -0700 (PDT)
X-Google-Smtp-Source: AK7set8FiOpchgTrqXc6ebRmCnKXDIn4Yoj92NXLSGSmYSqsvnuBKWK1BK5o2c/w9IEaij6lx9oQ/w==
X-Received: by 2002:a5d:6ace:0:b0:2d8:908c:8fa0 with SMTP id u14-20020a5d6ace000000b002d8908c8fa0mr1672125wrw.9.1679388420146;
        Tue, 21 Mar 2023 01:47:00 -0700 (PDT)
Date: Tue, 21 Mar 2023 04:46:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, pasic@linux.ibm.com, cohuck@redhat.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com
Message-ID: <20230321044539-mutt-send-email-mst@kernel.org>
References: <20230321041036.201439-1-parav@nvidia.com>
 <20230321041036.201439-6-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230321041036.201439-6-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v2 5/7] transport-ccw: Refer to the vq by its number

On Tue, Mar 21, 2023 at 06:10:34AM +0200, Parav Pandit wrote:
> Currently specification uses virtqueue index and
> number interchangeably to refer to the virtqueue.
> 
> Instead refer to it by its number.
> 
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/163
> Signed-off-by: Parav Pandit <parav@nvidia.com>

OK, but I'd say it's worth referring to the old name here, too.

> ---
> changelog:
> v0->v1:
> - new patch
> ---
>  transport-ccw.tex | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/transport-ccw.tex b/transport-ccw.tex
> index c2e60b6..b8ba0b7 100644
> --- a/transport-ccw.tex
> +++ b/transport-ccw.tex
> @@ -236,12 +236,12 @@ \subsubsection{Configuring a Virtqueue}\label{sec:Virtio Transport Options / Vir
>  
>  \begin{lstlisting}
>  struct vq_config_block {
> -        be16 index;
> +        be16 queue_select;
>          be16 max_queue_size;
>  };
>  \end{lstlisting}
>  
> -The requested number of buffers for queue \field{index} is returned in
> +The requested number of buffers for queue \field{queue_select} is returned in
>  \field{max_queue_size}.
>  
>  \begin{note}
> @@ -256,7 +256,7 @@ \subsubsection{Configuring a Virtqueue}\label{sec:Virtio Transport Options / Vir
>  struct vq_info_block {
>          be64 desc;
>          be32 res0;
> -        be16 index;
> +        be16 queue_select;

/* Previously known as index */

>          be16 size;
>          be64 driver;
>          be64 device;
> @@ -265,7 +265,7 @@ \subsubsection{Configuring a Virtqueue}\label{sec:Virtio Transport Options / Vir
>  
>  \field{desc}, \field{driver} and \field{device} contain the guest
>  addresses for the descriptor area,
> -available area and used area for queue \field{index}, respectively. The actual
> +available area and used area for queue number \field{queue_select}, respectively. The actual
>  virtqueue size (number of allocated buffers) is transmitted in
>  \field{size}.
>  
> @@ -286,12 +286,13 @@ \subsubsection{Configuring a Virtqueue}\label{sec:Virtio Transport Options / Vir
>  struct vq_info_block_legacy {
>          be64 queue;
>          be32 align;
> -        be16 index;
> +        be16 queue_select;

/* Previously known as index */

>          be16 size;
>  };
>  \end{lstlisting}
>  
> -\field{queue} contains the guest address for queue \field{index},
> +\field{queue} contains the guest address for queue number
> +\field{queue_select},
>  \field{size} the number of buffers
>  and \field{align} the alignment. The queue layout follows \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Legacy Interfaces: A Note on Virtqueue Layout}~\nameref{sec:Basic Facilities of a Virtio Device / Virtqueues / Legacy Interfaces: A Note on Virtqueue Layout}.
>  
> @@ -583,7 +584,7 @@ \subsubsection{Guest->Host Notification}\label{sec:Virtio Transport Options / Vi
>  For example:
>  \begin{lstlisting}
>  info->cookie = do_notify(schid,
> -                         virtqueue_get_queue_index(vq),
> +                         virtqueue_get_queue_number(vq),
>                           info->cookie);
>  \end{lstlisting}
>  \end{note}
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

