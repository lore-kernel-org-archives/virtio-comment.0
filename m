Return-Path: <virtio-comment-return-7618-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573CBE95A82
	for <virtio-comment@archiver.kernel.org>; Sun,  8 Oct 2023 11:41:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 98BB6190907
	for <virtio-comment@archiver.kernel.org>; Sun,  8 Oct 2023 11:41:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7FE5F9864C6
	for <virtio-comment@archiver.kernel.org>; Sun,  8 Oct 2023 11:41:50 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6E3D4986380; Sun,  8 Oct 2023 11:41:50 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5DA8C986481
	for <virtio-comment@lists.oasis-open.org>; Sun,  8 Oct 2023 11:41:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: vKYl-7hTM0ao07a-h5NuNw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696765306; x=1697370106;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=98wDZNsyuqMKeO31aOUmbE/X/lvw9UMJmENU7nfRK7c=;
        b=uRsdmNpc9Ra6Y9sR/esfZbCJhV0FPZcLMaqFHxpJAAsPIaha1KS1W/XSWAlD51lcI6
         zrvpFFvsdCsVSzgrFiKNRCPPkyGZMqgyauYFSImCfXSO4y+NjVy2v6i2m6glFEdXO8JW
         koKJlpNIUr01KD3FRxk5CwRINJk4YJlIRfE/fw63ig+yYUC86hMN3cqZ8/+nVAtK8u5v
         3g71Nv58mZAcx6OjokJySM6QX1H8KQ+WvkK5LMFvuwHgYSQ3I18/FvOK+2juMGwdhKKJ
         +VEQaRaSMGNKIgSQschvgIdt2DenO6/lZCaIGgFsNuyZrsGgg8WkiD5CAnO2fPiY8tZq
         xRjg==
X-Gm-Message-State: AOJu0YziaeqwWlChSwLD7mHMANiIx9h9Ih04VPql/Grot7cxDr4BzfPe
	k7+Elr4HBiOpEtJUJncijbV7Kd33zr9Bw0SS59kmPamTA58w8pCmtQoQ5pfTQQ623g9P2hOM2WM
	Q9c8YuFYWOcgO+EMvw1mIr8mqIBjG+llQ5Q==
X-Received: by 2002:aa7:c547:0:b0:530:d8df:afaa with SMTP id s7-20020aa7c547000000b00530d8dfafaamr11163262edr.41.1696765306221;
        Sun, 08 Oct 2023 04:41:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLLZkksq79znL03jjXfEE5P9GScPdD5xTXkN4HyRXGtJsnjJHGp5CXf2oy1TZYYlQeSmj/Ww==
X-Received: by 2002:aa7:c547:0:b0:530:d8df:afaa with SMTP id s7-20020aa7c547000000b00530d8dfafaamr11163249edr.41.1696765305817;
        Sun, 08 Oct 2023 04:41:45 -0700 (PDT)
Date: Sun, 8 Oct 2023 07:41:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, cohuck@redhat.com,
	sburla@marvell.com, shahafs@nvidia.com, maorg@nvidia.com,
	yishaih@nvidia.com
Message-ID: <20231008073912-mutt-send-email-mst@kernel.org>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-4-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20231008112555.473895-4-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the device context fields
 for device migration

On Sun, Oct 08, 2023 at 02:25:50PM +0300, Parav Pandit wrote:
> Define the device context and its fields for purpose of device
> migration. The device context is read and written by the owner driver
> on source and destination hypervisor respectively.
> 
> Device context fields will experience a rapid growth post this initial
> version to cover many details of the device.
> 
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> Signed-off-by: Satananda Burla <sburla@marvell.com>
> ---
> changelog:
> v0->v1:
> - enrich device context to cover feature bits, device configuration
>   fields
> - corrected alignment of device context fields
> ---
>  content.tex        |   1 +
>  device-context.tex | 142 +++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 143 insertions(+)
>  create mode 100644 device-context.tex
> 
> diff --git a/content.tex b/content.tex
> index 0a62dce..2698931 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -503,6 +503,7 @@ \section{Exporting Objects}\label{sec:Basic Facilities of a Virtio Device / Expo
>  UUIDs as specified by \hyperref[intro:rfc4122]{[RFC4122]}.
>  
>  \input{admin.tex}
> +\input{device-context.tex}
>  
>  \chapter{General Initialization And Device Operation}\label{sec:General Initialization And Device Operation}
>  
> diff --git a/device-context.tex b/device-context.tex
> new file mode 100644
> index 0000000..5611382
> --- /dev/null
> +++ b/device-context.tex
> @@ -0,0 +1,142 @@
> +\section{Device Context}\label{sec:Basic Facilities of a Virtio Device / Device Context}
> +
> +The device context holds the information that a owner driver can use
> +to setup a member device and resume its operation. The device context
> +of a member device is read or written by the owner driver using
> +administration commands.
> +
> +\begin{lstlisting}
> +struct virtio_dev_ctx_field_tlv {
> +        le32 type;
> +        le32 reserved;
> +        le64 length;
> +        u8 value[];
> +};
> +
> +struct virtio_dev_ctx {
> +        le32 field_count;
> +        struct virtio_dev_ctx_field_tlv fields[];
> +};
> +
> +\end{lstlisting}
> +
> +The \field{struct virtio_dev_ctx} is the device context of a member device.
> +The \field{field_count} indicates how many instances of
> +\field{struct virtio_dev_ctx_field_tlv} are present.
> +
> +The \field{struct virtio_dev_ctx_field_tlv} consist of \field{type} indicating
> +what data is contained in the \field{value} of length \field{length}.
> +The valid values for \field{type} can be found in the following table:
> +
> +\begin{tabularx}{\textwidth}{ |l||l|X| }
> +\hline
> +type & Name & Description \\
> +\hline \hline
> +0x0 & VIRTIO_DEV_CTX_PCI_COMMON_RUNTIME_CFG & Provides common configuration space of device for PCI transport \\
> +\hline
> +0x1 & VIRTIO_DEV_CTX_DEV_CFG_LAYOUT & Provides device specific configuration layout \\
> +\hline
> +0x2 & VIRTIO_DEV_CTX_DEV_FEATURES & Provides device features \\
> +\hline
> +0x3 & VIRTIO_DEV_CTX_PCI_VQ_CFG & Provides Virtqueue configuration for PCI transport \\
> +\hline
> +0x4 & VIRTIO_DEV_CTX_VQ_SPLIT_RUNTIME_CFG & Provides Queue run time state \\
> +\hline
> +0x5 & VIRTIO_DEV_CTX_VQ_SPLIT_DEV_OWN_DESC & Provides list of virtqueue descriptors owned by device  \\
> +\hline
> +0x6 - 0xFFFFFFFF & - & Reserved for future types \\
> +\hline
> +\end{tabularx}


I don't think this is enough, e.g. virtio net has internal state
controlled thought CVQ commands. how do you intend to address/migrate
these?

> +\subsubsection{Device Context Fields}\label{sec:Basic Facilities of a Virtio Device / Device Context / Device Context Fields}
> +
> +\paragraph{PCI Common Configuration Context}
> +\label{par:Basic Facilities of a Virtio Device / Device Context / Device Context Fields/ PCI Common Configuration Context}
> +
> +For the field VIRTIO_DEV_CTX_PCI_COMMON_RUNTIME_CFG, \field{type} is set to 0x0.
> +The \field{value} is in format of \field{struct virtio_pci_common_cfg}.
> +The \field{length} is the length of \field{struct virtio_pci_common_cfg}.
> +
> +\paragraph{Device Configuration Layout Context}
> +\label{par:Basic Facilities of a Virtio Device / Device Context / Device Context Fields/ Device Configuration Layout Context}
> +
> +For the field VIRTIO_DEV_CTX_DEV_CFG_LAYOUT, \field{type} is set to 0x1.
> +The \field{value} is in format of device specific configuration layout listed
> +in each of the device's device configuration layout section.
> +The \field{length} is the length of the device configuration layout data.

Unclear. I am guessing it's doing things like setting up RO
fields? This needs to be specified per device really.
Also how some fields behave might depend on features.

> +
> +\paragraph{Device Features Context}
> +\label{par:Basic Facilities of a Virtio Device / Device Context / Device Context Fields/ Device Features Context}
> +
> +For the field VIRTIO_DEV_CTX_DEV_FEATURES, \field{type} is set to 0x2.
> +The \field{value} is in format of device feature bits listed in
> +\ref{sec:Basic Facilities of a Virtio Device / Feature Bits} in the format of \field{struct virtio_dev_ctx_features}.
> +The \field{length} is the length of the device features.
> +
> +\begin{lstlisting}
> +struct virtio_dev_ctx_pci_vq_cfg {
> +        le64 feature_bits[];
> +};
> +\end{lstlisting}
> +
> +\paragraph{PCI Virtqueue Configuration Context}
> +\label{par:Basic Facilities of a Virtio Device / Device Context / Device Context Fields/ PCI Virtqueue Configuration Context}
> +
> +For the field VIRTIO_DEV_CTX_PCI_VQ_CFG, \field{type} is set to 0x3.
> +The \field{value} is in format of \field{struct virtio_dev_ctx_pci_vq_cfg}.
> +The \field{length} is the length of \field{struct virtio_dev_ctx_pci_vq_cfg}.
> +
> +\begin{lstlisting}
> +struct virtio_dev_ctx_pci_vq_cfg {
> +        le16 vq_index;
> +        le16 queue_size;
> +        le16 queue_msix_vector;
> +        le64 queue_desc;
> +        le64 queue_driver;
> +        le64 queue_device;
> +};
> +\end{lstlisting}
> +
> +One or multiple entries of PCI Virtqueue Configuration Context may exist, each such
> +entry corresponds to a unique virtqueue identified by the \field{vq_index}.
> +
> +\paragraph{Virtqueue Split Mode Runtime Context}
> +\label{par:Basic Facilities of a Virtio Device / Device Context / Device Context Fields/ Virtqueue Split Mode Runtime Context}
> +
> +For the field VIRTIO_DEV_CTX_VQ_SPLIT_RUNTIME_CFG, \field{type} is set to 0x4.
> +The \field{value} is in format of \field{struct virtio_dev_ctx_vq_split_runtime}.
> +The \field{length} is the length of \field{struct virtio_dev_ctx_vq_split_runtime}.
> +
> +\begin{lstlisting}
> +struct virtio_dev_ctx_vq_split_runtime {
> +        le16 vq_index;
> +        le16 dev_avail_idx;
> +        u8 enabled;
> +};
> +\end{lstlisting}
> +
> +The \field{dev_avail_idx} indicates the next available index of the virtqueue from which
> +the device must start processing the available ring.
> +
> +One or multiple entries of Virtqueue Split Mode Runtime Context may exist, each such
> +entry corresponds to a unique virtqueue identified by the \field{vq_index}.
> +
> +\paragraph{Virtqueue Split Mode Device owned Descriptors Context}
> +
> +For the field VIRTIO_DEV_CTX_VQ_SPLIT_DEV_OWN_DESC, \field{type} is set to 0x5.
> +The \field{value} is in format of \field{struct virtio_dev_ctx_vq_split_runtime}.
> +The \field{length} is the length of \field{struct virtio_dev_ctx_vq_split_dev_descs}.
> +
> +\begin{lstlisting}
> +struct virtio_dev_ctx_vq_split_dev_descs {
> +        le16 vq_index;
> +        le16 desc_count;
> +        le16 desc_idx[];
> +};
> +\end{lstlisting}
> +
> +The \field{desc_idx} contains indices of the descriptors in \field{desc_count} of a
> +virtqueue identified by \field{vq_index} which is owned by the device.
> +
> +One or multiple entries of Virtqueue Split Mode Device owned Descriptors Context may exist, each such
> +entry corresponds to a unique virtqueue identified by the \field{vq_index}.
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

