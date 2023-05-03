Return-Path: <virtio-comment-return-5711-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95952C77B75
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 05:48:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id EAA9C190906
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 05:48:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D6E0598658B
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 05:48:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C398D983EB6; Wed,  3 May 2023 05:48:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B199098657E
	for <virtio-comment@lists.oasis-open.org>; Wed,  3 May 2023 05:48:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: tnDvfEU_My-9C0-UOkXsKg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683092915; x=1685684915;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYZE8ckgH+3ek6iI+MkKxdHjDTn+63UC+te7BQvKrco=;
        b=kPiL5pQBGFfmY306VqQsMA9Rv0OsKgi7VdU1YAL+LqyBO4CGWIj3/+4YqhofsFe+5W
         pT8uuP+lcLy3IYrhBStV9d0CLSMzNi7qk+jbR2VaS4JKYVGoYWR43b74IV1mIS3anG6U
         kKhCEx2BWgrLh+g0BwTpW1xJMp+Ui4pAY3DmY973ps8Timc8YqGKPp3RkfyLfpG9Qv4v
         2TI8oPQpGTQzgaMh0fS3UUfyz/Ni4sBdkGTjKEg5Gu4vS5AT8OctU3W5h22oo8y1J23V
         ojKlraZqemdgVq5T2il3vWjd4XFJ0fZ+E8J2g438pKqfIEkcxaAzgroWCfgjU1Cnn4BR
         flfg==
X-Gm-Message-State: AC+VfDw7l4tq4xfiMVSQzp5n6V8KCrVx9xEMql32NZhaH48wkx7Ceb4B
	iuiiLnptOPt+8PGtisogKazSJa1TWN+a13DXFo5gfSdFvyyiWX5+W5z7weKUHp5eqImLlO28FvU
	gkB8UefEvBGcaJOsuMdS3zo+hNTK4ZuBZWA==
X-Received: by 2002:a5d:540c:0:b0:306:2c5e:2311 with SMTP id g12-20020a5d540c000000b003062c5e2311mr7654056wrv.40.1683092915207;
        Tue, 02 May 2023 22:48:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7ytsXznlBZBJdlfkmsBT1nPrGhXGSKYeMlOWtT8sepfDU/ZySm/q1v+q0Dx7k0HSUKpzxC8g==
X-Received: by 2002:a5d:540c:0:b0:306:2c5e:2311 with SMTP id g12-20020a5d540c000000b003062c5e2311mr7654044wrv.40.1683092914893;
        Tue, 02 May 2023 22:48:34 -0700 (PDT)
Date: Wed, 3 May 2023 01:48:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, cohuck@redhat.com,
	david.edmondson@oracle.com, sburla@marvell.com, jasowang@redhat.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com
Message-ID: <20230503014259-mutt-send-email-mst@kernel.org>
References: <20230503032659.530330-1-parav@nvidia.com>
 <20230503032659.530330-3-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230503032659.530330-3-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v1 2/2] transport-pci: Add legacy register access
 conformance section

On Wed, May 03, 2023 at 06:26:59AM +0300, Parav Pandit wrote:
> Add device and driver conformanace section for legacy registers access
> commands interface.
> 
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/167
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  conformance.tex           |  2 ++
>  transport-pci-vf-regs.tex | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/conformance.tex b/conformance.tex
> index 01ccd69..dbd8cd6 100644
> --- a/conformance.tex
> +++ b/conformance.tex
> @@ -109,6 +109,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \item \ref{drivernormative:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / PCI configuration access capability}
>  \item \ref{drivernormative:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Device Initialization / MSI-X Vector Configuration}
>  \item \ref{drivernormative:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Notification of Device Configuration Changes}
> +\item \ref{drivernormative:Virtio Transport Options / Virtio Over PCI Bus / SR-IOV Legacy Registers Access}
>  \end{itemize}
>  
>  \conformance{\subsection}{MMIO Driver Conformance}\label{sec:Conformance / Driver Conformance / MMIO Driver Conformance}
> @@ -194,6 +195,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \item \ref{devicenormative:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Device Initialization / MSI-X Vector Configuration}
>  \item \ref{devicenormative:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Used Buffer Notifications}
>  \item \ref{devicenormative:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Notification of Device Configuration Changes}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio Over PCI Bus / SR-IOV Legacy Registers Access}
>  \end{itemize}
>  
>  \conformance{\subsection}{MMIO Device Conformance}\label{sec:Conformance / Device Conformance / MMIO Device Conformance}
> diff --git a/transport-pci-vf-regs.tex b/transport-pci-vf-regs.tex
> index 16ced32..7d0574b 100644
> --- a/transport-pci-vf-regs.tex
> +++ b/transport-pci-vf-regs.tex
> @@ -82,3 +82,34 @@ \subsubsection{Legacy Queue Notify Offset Query}\label{sec:Virtio Transport Opti
>  	le64 offset; /* Byte offset within the BAR */
>  };
>  \end{lstlisting}
> +
> +\devicenormative{\paragraph}{SR-IOV VFs Legacy Registers Access}{Virtio Transport Options / Virtio Over PCI Bus / SR-IOV Legacy Registers Access}
> +
> +If the PCI PF device supports legacy registers access, it SHOULD set
> +corresponding bits for commands VIRTIO_ADMIN_CMD_LREG_WRITE,
> +VIRTIO_ADMIN_CMD_LREG_READ and VIRTIO_ADMIN_CMD_LQ_NOTIFY_QUERY in 
> +command result of VIRTIO_ADMIN_CMD_LIST_QUERY in
> +\field{device_admin_cmd_opcodes}.

Don't repeat documentation of VIRTIO_ADMIN_CMD_LIST_QUERY please.
just say all these must be supported.
In fact what are you saying here? That all 3 are supported
or none at all? What about just
VIRTIO_ADMIN_CMD_LREG_READ/VIRTIO_ADMIN_CMD_LREG_WRITE?
Looks like a slower but working way to do notifications
is through a common config write, no?

> +
> +The device MUST support legacy configuration registers to its defined width.

what is this?

> +
> +The device MAY fail legacy configuration registers access when either the 
> +access is for an incorrct register width or if the register offset is incorrect.

with which error code?

> +
> +The device MUST allow access of one or multiple bytes of the registers when
> +such register is defined as byte array, for example \field{mac} of \field{struct
> +virtio_net_config} of the Network Device.

so which accesses need to be supported then?

> +
> +\drivernormative{\paragraph}{SR-IOV VFs Legacy Registers Access}{Virtio Transport Options / Virtio Over PCI Bus / SR-IOV Legacy Registers Access}
> +
> +The driver MUST access legacy configuration registers to its defined width.
> +
> +The driver MUST access device specific registers to its defined width
> +
> +The driver MAY access one or multiple bytes of the device specific registers
> +which are defined as byte array, for example \field{mac} of \field{struct
> +virtio_net_config} of the Network Device.
> +
> +The driver SHOULD access all the bytes of a device specific registers in a
> +single access when accessing a byte array, for example \field{mac} of
> +\field{struct virtio_net_config} of the Network Device.
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

