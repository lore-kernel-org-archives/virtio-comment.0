Return-Path: <virtio-comment-return-6519-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D174DEB64D7
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 09:32:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3472D33992
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 09:32:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 23E7B986394
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 09:32:58 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 161C098636F; Mon, 26 Jun 2023 09:32:58 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 038F5986382
	for <virtio-comment@lists.oasis-open.org>; Mon, 26 Jun 2023 09:32:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: UQi47icmPc-9qT9RO_Zjxw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687771973; x=1690363973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qO8FTPE5QO+YMIqZNbs7uMRrliKhjUq7TL5sMeoiYS4=;
        b=izdtluRP0c2o7OB0kuaD36mV/byi90uvUOwGU7bBD0EHQKwZyRDN5489oF6+1RMWnh
         FfjEMCxrz2lk0tSNQT+IGOC+7IHGasVfK7e2Bi2eVhwoZJU4TlgeeL76nbMRFjk0XqE8
         KIhxcdQqqiC5I8H0vqdHNyTevVZ0SXb5lvlro1K5zJZLzcjGNIKym6k4mcPu44ebGw67
         FdWDwSBV1wRhLUzQYFDZVkVkq+2EhQ7pAM1J3SfNsPWJqI4rZTlhc7wWS19yDgObqwCr
         mehzB4K1goBlFYkKr1iTPOvMnBDEPLy9kWJfx8/US5ZoVDpv+1neE6ZmnfCkmYSCbD5/
         OSOw==
X-Gm-Message-State: AC+VfDxOyGgzHsaEzVC8Ce0txb5gRBaicbbeTG00KzRqXaJenmCO8X8k
	8EEchU5kSVzZhgXdqcwn5SO9SzuU8r9i2XO1MXQp4B8dKtgtZJSdWRteHdXQ9SjYJyUfHz5uvfT
	l332gHFbRVq0Wg1RhexAAlKquN/oHCUCDTA==
X-Received: by 2002:a05:600c:2182:b0:3fa:79af:15c8 with SMTP id e2-20020a05600c218200b003fa79af15c8mr7295101wme.23.1687771972994;
        Mon, 26 Jun 2023 02:32:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6ukfPtR44+aTHIYmNzYIK5aNWQU5ToR4gRDp56tlcihhpaBFQqteTxbCbPEiSg/FvtcrxNTQ==
X-Received: by 2002:a05:600c:2182:b0:3fa:79af:15c8 with SMTP id e2-20020a05600c218200b003fa79af15c8mr7295091wme.23.1687771972577;
        Mon, 26 Jun 2023 02:32:52 -0700 (PDT)
Date: Mon, 26 Jun 2023 05:32:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	parav@nvidia.com
Message-ID: <20230626031704-mutt-send-email-mst@kernel.org>
References: <20230626062210.49020-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20230626062210.49020-1-xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [RFC PATCH] admin-queue: bind the group member to the device

On Mon, Jun 26, 2023 at 02:22:10PM +0800, Xuan Zhuo wrote:
> The VFs of the SR-IOV are created by the user inside the guest OS, so the virtio
> devices don't know about these VFs. Because each VF may be assigned a different role
> by the user, the virtio device can not choose one VF to bind random.
> So only the user knows how to bind the virtio devices to the VFs.
> On the other hand, generally the virtio devices are not created by the user
> inside the guest OS. This requires some management platform to participate.
> 
> So the usage of this command:
> 1. The user purchases a virtio network card on the management platform,
>    and sets the ip, queue number, etc. The user obtains the identity of
>    the network card.
> 2. The user creates a VF with echo 8 > sriov_numvfs

this one is unlikely, as this requires PF access and affects all VFs.

> 3. The user binds the net crad to a VF with identity through the command
>    of the patch
> 
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>




> ---
>  admin.tex | 41 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/admin.tex b/admin.tex
> index 2efd4d7..64d0667 100644
> --- a/admin.tex
> +++ b/admin.tex
> @@ -115,7 +115,8 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
>  \hline \hline
>  0x0000 & VIRTIO_ADMIN_CMD_LIST_QUERY & Provides to driver list of commands supported for this group type    \\
>  0x0001 & VIRTIO_ADMIN_CMD_LIST_USE & Provides to device list of commands used for this group type \\
> -0x0002 - 0x7FFF & - & Commands using \field{struct virtio_admin_cmd}    \\
> +0x0002 & VIRTIO_ADMIN_CMD_BIND_DEVICE & Bind the device to one group member \\
> +0x0003 - 0x7FFF & - & Commands using \field{struct virtio_admin_cmd}    \\
>  \hline
>  0x8000 - 0xFFFF & - & Reserved for future commands (possibly using a different structure)    \\
>  \hline
> @@ -429,6 +430,44 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
>  \field{VF Enable} refer to registers within the SR-IOV Extended
>  Capability as specified by \hyperref[intro:PCIe]{[PCIe]}.
>  
> +\subsubsection{Bind the device for member}
> +
> +The VFs of the SR-IOV are created by the user inside the guest OS, so the virtio
> +devices don't know about these VFs.

I don't really get how.

> Because each VF may be assigned a different role
> +by the user, the virtio device can not choose one VF to bind random.
> +So only the user knows how to bind the virtio devices to the VFs.
> +On the other hand, generally the virtio devices are not created by the user
> +inside the guest OS. This requires some management platform to participate.
> +
> +So we introduce a new admin queue command to bind the VFs and the virtio
> +devices.

This description needs a complete rewrite, but to try to help you I'd
need to figure out what is being said. My guess is that this is an
attempt to introduce some kind of identity to VFs.  OK but what is this
identity and how is it better than using VF#?  You want it to persist
when NumVFs in the SR-IOV capability changes?

> +\begin{lstlisting}
> +struct virtio_admin_cmd_bind {
> +    u64 identity;
> +};
> +\end{lstlisting}
> +
> +The user got the \field{identity} from the management platform, that is not
> +included by this spec.

Without even understanding the above, what I don't like about this
proposal, is that it assumes some out of band interface to either
specify or discover these IDs. With admin commands we now have
ability to fully specify a management interface, and I'd rather
we had a complete proposal covering all aspects of it.
If some platform does not want to use the management aspects,
that's ok.

> +
> +\drivernormative{\paragraph}{Group administration commands}{Basic Facilities of a Virtio Device / Device groups / Group administration commands / Bind the device for member}
> +
> +VIRTIO_ADMIN_CMD_BIND_DEVICE requires that the \field{group_member_id} MUST be set.
> +
> +The \field{identity} is passed by the user. It is the identity of the virtio
> +device.
> +
> +\devicenormative{\paragraph}{Group administration commands}{Basic Facilities of a Virtio Device / Device groups / Group administration commands / Bind the device for member}
> +
> +Every device MUST have one unique \field{identity} in the host.
> +
> +If the PF device can not find the device by the \field{identity},
> +the \field{status} MUST be set to VIRTIO_ADMIN_STATUS_EINVAL.
> +
> +If the device is found by the \field{identity}, the device MUST work as the
> +device of this group member specified by the \field{group_member_id}.
> +
>  \section{Administration Virtqueues}\label{sec:Basic Facilities of a Virtio Device / Administration Virtqueues}
>  
>  An administration virtqueue of an owner device is used to submit

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

