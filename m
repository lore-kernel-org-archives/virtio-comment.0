Return-Path: <virtio-comment-return-5125-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D641CC6FD18
	for <virtio-comment@archiver.kernel.org>; Fri, 31 Mar 2023 06:44:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2A4522A823
	for <virtio-comment@archiver.kernel.org>; Fri, 31 Mar 2023 06:44:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2198D986581
	for <virtio-comment@archiver.kernel.org>; Fri, 31 Mar 2023 06:44:10 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 16204986561; Fri, 31 Mar 2023 06:44:10 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 03A1C986563
	for <virtio-comment@lists.oasis-open.org>; Fri, 31 Mar 2023 06:44:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: KA2l4AOhPpinCbvDrOoqxQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680245041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPasKnD9VJaW+NmMT5kgUY7YfgKmC+r+0Zv0xL3nB4E=;
        b=HFuWA6H5p/EBJ5ZXI0eOosFwUuIpS2NmSHkydp8RFNIvzIL5kJt9YoS5XiK/J+AEOY
         A+m5Ly6ncE62NwoaWqnilde+aqVYjiuuCkqLC+0rg+SknoFWL4/af5yLqE0IwTnu69OZ
         cfIY3E9fuJFWD8L3quYuscFPlW6ue61HB7Oc6MHwPxOVvPSBCmXYryPR0LQxqi5MOfR6
         bQ3DYxQ6ugHFfx0/BaiIF6RoFcE2DirsxEiXxSwBJ02rx5bQbP9Bv5DcDX7+OiHvYYi+
         CGHYi+COxdPI2wvEpOQc5dasuCu3YTceVugdVp7XRFTagi7waxe2NkNBVqW6Jum7fJ4b
         wo4w==
X-Gm-Message-State: AAQBX9dc7tO3FxKn3W1VixllAw8higbGx6kGtGBPCQW2FGgMCf0HU3L7
	BhRQjFX09IzicT2Noq8O6IBDF44SPe/xDhxP5NM3pBd7qKejAYYMr0HvTEfjAVmmofX6QS8cjF2
	5ldbYps3cFqrjbtZMvuaUmXRVVyZWoIEL9Q==
X-Received: by 2002:a05:600c:cc:b0:3f0:3049:b216 with SMTP id u12-20020a05600c00cc00b003f03049b216mr5911887wmm.28.1680245041131;
        Thu, 30 Mar 2023 23:44:01 -0700 (PDT)
X-Google-Smtp-Source: AKy350amyeJhQcBG1wcA53nEMHKYLWf7uomoPLyNBzRUP3HPjTeGSHYlIXZb3v8DFw3LuV8WiDnRIQ==
X-Received: by 2002:a05:600c:cc:b0:3f0:3049:b216 with SMTP id u12-20020a05600c00cc00b003f03049b216mr5911870wmm.28.1680245040699;
        Thu, 30 Mar 2023 23:44:00 -0700 (PDT)
Date: Fri, 31 Mar 2023 02:43:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, cohuck@redhat.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com,
	Satananda Burla <sburla@marvell.com>
Message-ID: <20230331024233-mutt-send-email-mst@kernel.org>
References: <20230330225834.506969-1-parav@nvidia.com>
 <20230330225834.506969-3-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230330225834.506969-3-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH 02/11] transport-pci: Move transitional device id to
 legacy section

On Fri, Mar 31, 2023 at 01:58:25AM +0300, Parav Pandit wrote:
> Currently PCI device discovery details for the transitional device
> are documented in two different sections.
> 
> For example, PCI device and vendor ID registers are documented in
> 'Device Requirements: PCI Device Discovery' section, while PCI
> revision id is documented in 'Legacy Interfaces: A Note on PCI
> Device Discovery' section.
> 
> Transitional devices requirements should be documented in "legacy
> interfaces" section as clearly mentioned in
> 'Legacy Interface: A Note on Feature Bits'.

I already commented on this, I disagree.
Modern drivers must be able
to completely ignore legacy interface sections, but they
do bind to transitional device IDs.
This change breaks this assumption.


> Hence,
> 1. Move transitional device requirements to its designated Legacy
>    interface section
> 2. Describe regular device requirements without quoting it as "non
>    transitional device"
> 
> While at it, write the description using a singular object definition.
> 
> Reviewed-by: Satananda Burla <sburla@marvell.com>
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  transport-pci.tex | 70 ++++++++++++++++++++++++-----------------------
>  1 file changed, 36 insertions(+), 34 deletions(-)
> 
> diff --git a/transport-pci.tex b/transport-pci.tex
> index 7f27107..1f74c6f 100644
> --- a/transport-pci.tex
> +++ b/transport-pci.tex
> @@ -28,46 +28,24 @@ \subsection{PCI Device Discovery}\label{sec:Virtio Transport Options / Virtio Ov
>  
>  \devicenormative{\subsubsection}{PCI Device Discovery}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Discovery}
>  
> -Devices MUST have the PCI Vendor ID 0x1af4.
> -Devices MUST either have the PCI Device ID calculated by adding 0x1040
> +The device MUST have the PCI Vendor ID 0x1af4.
> +The device MUST calculate PCI Device ID by adding 0x1040
>  to the Virtio Device ID, as indicated in section \ref{sec:Device
> -Types} or have the Transitional PCI Device ID depending on the device type,
> -as follows:
> -
> -\begin{tabular}{|l|c|}
> -\hline
> -Transitional PCI Device ID  &  Virtio Device    \\
> -\hline \hline
> -0x1000      &   network device     \\
> -\hline
> -0x1001     &   block device     \\
> -\hline
> -0x1002     & memory ballooning (traditional)  \\
> -\hline
> -0x1003     &      console       \\
> -\hline
> -0x1004     &     SCSI host      \\
> -\hline
> -0x1005     &  entropy source    \\
> -\hline
> -0x1009     &   9P transport     \\
> -\hline
> -\end{tabular}
> +Types}.
>  
>  For example, the network device with the Virtio Device ID 1
> -has the PCI Device ID 0x1041 or the Transitional PCI Device ID 0x1000.
> -
> -The PCI Subsystem Vendor ID and the PCI Subsystem Device ID MAY reflect
> -the PCI Vendor and Device ID of the environment (for informational purposes by the driver).
> +has the PCI Device ID 0x1041.
>  
> -Non-transitional devices SHOULD have a PCI Device ID in the range
> -0x1040 to 0x107f.
> -Non-transitional devices SHOULD have a PCI Revision ID of 1 or higher.
> -Non-transitional devices SHOULD have a PCI Subsystem Device ID of 0x40 or higher.
> +The device SHOULD have a PCI Device ID in the range 0x1040 to 0x107f.
> +The device SHOULD have a PCI Revision ID of 1 or higher.
> +The device SHOULD have a PCI Subsystem Device ID of 0x40 or higher.
>  
>  This is to reduce the chance of a legacy driver attempting
>  to drive the device.
>  
> +The PCI Subsystem Vendor ID and the PCI Subsystem Device ID MAY reflect
> +the PCI Vendor and Device ID of the environment (for informational purposes by the driver).
> +
>  \drivernormative{\subsubsection}{PCI Device Discovery}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Discovery}
>  Drivers MUST match devices with the PCI Vendor ID 0x1af4 and
>  the PCI Device ID in the range 0x1040 to 0x107f,
> @@ -85,8 +63,32 @@ \subsection{PCI Device Discovery}\label{sec:Virtio Transport Options / Virtio Ov
>  PCI Subsystem Device ID value.
>  
>  \subsubsection{Legacy Interfaces: A Note on PCI Device Discovery}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Discovery / Legacy Interfaces: A Note on PCI Device Discovery}
> -Transitional devices MUST have a PCI Revision ID of 0.
> -Transitional devices MUST have the PCI Subsystem Device ID
> +
> +The transitional device has one of the following PCI Device ID
> +depending on the device type:
> +
> +\begin{tabular}{|l|c|}
> +\hline
> +Transitional PCI Device ID  &  Virtio Device    \\
> +\hline \hline
> +0x1000      &   network device     \\
> +\hline
> +0x1001     &   block device     \\
> +\hline
> +0x1002     & memory ballooning (traditional)  \\
> +\hline
> +0x1003     &      console       \\
> +\hline
> +0x1004     &     SCSI host      \\
> +\hline
> +0x1005     &  entropy source    \\
> +\hline
> +0x1009     &   9P transport     \\
> +\hline
> +\end{tabular}
> +
> +The transitional device MUST have a PCI Revision ID of 0.
> +The transitional device MUST have the PCI Subsystem Device ID
>  matching the Virtio Device ID, as indicated in section \ref{sec:Device Types}.
>  Transitional devices MUST have the Transitional PCI Device ID in
>  the range 0x1000 to 0x103f.
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

