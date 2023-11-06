Return-Path: <virtio-comment-return-8197-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6774C4332F
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 09:43:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 44DE241F2B
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 09:43:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3D870986728
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 09:43:41 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2FDC298670A; Mon,  6 Nov 2023 09:43:41 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 22B77986712
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Nov 2023 09:43:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: nwjtkXkiNVGP24HPGvH2UQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699263816; x=1699868616;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yov6bBv78tfBW7HyRmc1snf+ve6TyHDx+3qC8bGPyOs=;
        b=Dz4QRzfIVA+eG0W5zMo2AWcqp8Gk8gVvfcNhLT5XT32Fo4IsqY3FhT/usYnu3ymOEk
         Eip1vjyda7oimdDtSnsymAApRAYQGag/WpHz0U1XPo36lCYg9tehOTSuaMU0UMFnNBr4
         XrcEY7u6SOnFvxZK2AM4BURf3DRshFQaVUeFZKZ//XMXnxJZ1aIMlXtVvih44RikpnEo
         8yiJwNF1wgkzghZguw6ugL3fwjFQoX7WWF/LV376NrVXAJOHS+KKrZacg8+zSafsWzz+
         tzYjtsVY3Sm7+R7cTLLm8w6Qx3LeUIy7ZfyHcixF97z3yH/ytwzQgQ7DcaDFfzpBc1y0
         A4cg==
X-Gm-Message-State: AOJu0YzT3jqYeHqYZy5BrR1973QDF7SW7Ub1FSAKGLUPGp6Y2Xmq8c03
	4iIr+VkXTNBhg8qh50hVg4hPen4ZJa96DYFuXQnQC+pSk+Wb5EGXMvoTgizFdl1wdQijvxfyJ+I
	ft5G8p4i0UdcvMdF3//bK6AWnibJLNTduzg==
X-Received: by 2002:a5d:6c6e:0:b0:31d:caae:982d with SMTP id r14-20020a5d6c6e000000b0031dcaae982dmr9037249wrz.12.1699263815954;
        Mon, 06 Nov 2023 01:43:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgg8dxQMvaBixjrGFHGil52stHaG3A5L2+DtNF4+3X4+FvtQXtyuQGdh4/uq23qhMLa0a66w==
X-Received: by 2002:a5d:6c6e:0:b0:31d:caae:982d with SMTP id r14-20020a5d6c6e000000b0031dcaae982dmr9037228wrz.12.1699263815537;
        Mon, 06 Nov 2023 01:43:35 -0800 (PST)
Date: Mon, 6 Nov 2023 04:43:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@intel.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
	stefanha@redhat.com, virtio-comment@lists.oasis-open.org,
	parav@nvidia.com
Message-ID: <20231106043648-mutt-send-email-mst@kernel.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-3-lingshan.zhu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20231103103437.72784-3-lingshan.zhu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH V2 2/6] virtio: introduce SUSPEND bit in device status

On Fri, Nov 03, 2023 at 06:34:33PM +0800, Zhu Lingshan wrote:
> This patch introduces a new status bit in the device status: SUSPEND.
> 
> This SUSPEND bit can be used by the driver to suspend a device,
> in order to stabilize the device states and virtqueue states.
> 
> Its main use case is live migration.
> 
> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>  content.tex | 36 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/content.tex b/content.tex
> index 76813b5..bcc9d4b 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -49,6 +49,10 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
>  
>  \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
>    an error from which it can't recover.
> +
> +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that the
> +  device has been suspended by the driver.
> +

what does this mean?

>  \end{description}
>  
>  The \field{device status} field starts out as 0, and is reinitialized to 0 by
> @@ -73,6 +77,10 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
>  recover by issuing a reset.
>  \end{note}
>  
> +The driver SHOULD NOT set SUSPEND if FEATURES_OK is not set.
> +
> +When setting SUSPEND, the driver MUST re-read \field{device status} to ensure the SUSPEND bit is set.
> +

and if it's not?

>  \devicenormative{\subsection}{Device Status Field}{Basic Facilities of a Virtio Device / Device Status Field}
>  
>  The device MUST NOT consume buffers or send any used buffer
> @@ -82,6 +90,26 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
>  that a reset is needed.  If DRIVER_OK is set, after it sets DEVICE_NEEDS_RESET, the device
>  MUST send a device configuration change notification to the driver.
>  
> +The device MUST ignore SUSPEND if FEATURES_OK is not set.
> +
> +The device MUST ignore SUSPEND if VIRTIO_F_SUSPEND is not negotiated.
> +
> +The device SHOULD allow settings to \field{device status} even when SUSPEND is set.

which settings?

> +
> +If VIRTIO_F_SUSPEND is negotiated and SUSPEND is set, the device SHOULD clear SUSPEND
> +and resumes operation upon DRIVER_OK.
> +
> +If VIRTIO_F_SUSPEND is negotiated, when the driver sets SUSPEND,
> +the device SHOULD perform the following actions before presenting SUSPEND bit in the \field{device status}:
> +
> +\begin{itemize}
> +\item Stop consuming buffers of any virtqueues and mark all finished descritors as used.

descritors? and what does finished mean?

> +\item Wait until all descriptors that being processed to finish and mark them as used.

descriptors are not marked used. buffers are.

that being -> that are being maybe?

> +\item Flush all used buffer and send used buffer notifications to the driver.

used buffers?
what does Flush mean?

> +\item Record Virtqueue State of each enabled virtqueue, see section \ref{sec:Virtqueues / Virtqueue State}

execpt that one unfortunately does not bother to say what does this mean
:(

> +\item Pause its operation except \field{device status} and preserve configurations in its Device Configuration Space, see \ref{sec:Basic Facilities of a Virtio Device / Device Configuration Space}

How do you Pause? For example, consider a link state register. You set
SUSPEND, then link goes down. What is device supposed to do?
Record this somewhere internal but do not show it to driver?
And how exactly will this hidden internal state be migrated
since it is not visible?


> +\end{itemize}
> +
>  \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature Bits}
>  
>  Each virtio device offers all the features it understands.  During
> @@ -99,10 +127,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
>  \begin{description}
>  \item[0 to 23, and 50 to 127] Feature bits for the specific device type
>  
> -\item[24 to 42] Feature bits reserved for extensions to the queue and
> +\item[24 to 43] Feature bits reserved for extensions to the queue and
>    feature negotiation mechanisms
>  
> -\item[43 to 49, and 128 and above] Feature bits reserved for future extensions.
> +\item[44 to 49, and 128 and above] Feature bits reserved for future extensions.
>  \end{description}
>  
>  \begin{note}
> @@ -875,6 +903,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>    \item[VIRTIO_F_QUEUE_STATE(42)] This feature indicates that the device allows the driver
>    to access its internal virtqueue state.
>  
> +  \item[VIRTIO_F_SUSPEND(43)] This feature indicates that the driver can
> +   SUSPEND the device.

why is SUSPEND upper-case here?

> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
> +
>  \end{description}
>  
>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
> -- 
> 2.35.3


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

