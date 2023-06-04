Return-Path: <virtio-comment-return-6101-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4DFC7EE29
	for <virtio-comment@archiver.kernel.org>; Sun,  4 Jun 2023 13:22:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 66952F3F47
	for <virtio-comment@archiver.kernel.org>; Sun,  4 Jun 2023 13:22:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5A4869863AD
	for <virtio-comment@archiver.kernel.org>; Sun,  4 Jun 2023 13:22:20 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 52B609862D0; Sun,  4 Jun 2023 13:22:20 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3E3BD986324
	for <virtio-comment@lists.oasis-open.org>; Sun,  4 Jun 2023 13:22:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: ajELuAkmOBuB-8x24gPD2g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685884931; x=1688476931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fZg8Yxp4DRTPQoaPpXUdeJ1xnNK35YK45WtyVJAl/U=;
        b=GqOoVmbYekY89ZiyqJi6+JMBxC0W8ZHtpwKn861E95YkMTwYGSwFYxhiqpcPJlPnZO
         GxD1U3QOaAp+4gVqkUXWBtuaQ6l0318mCEBSakGKeQi3WKcJZid12q4POnVnDDZTVmks
         RoQvEdBtfYW2SSTlF6VECAfCICeXiTHCShzcTkAODMP1gGnDhCV/idrTnrnzR3xwTHTB
         7Qf2v1yx3qfrhf3gjNTdOjfJSeBzirXFliYU7vJqsDEsazRVi/bDftyp5XCtn1jpXvPJ
         /zFyIFQ8FDbdhHaVK7nMaFexjXQaZh16bAoH/roFHs/JDmV9r7lxV3YgM1VD2WHH3R7G
         +/0Q==
X-Gm-Message-State: AC+VfDzN0eTt1wHQb34ConwtaUHgwb8hC12BDebKLhxa8blm+pKjFzef
	t9PoZ2FPMBA326Dx1rBZfX9q52/8MTqsMyy0yMBahLJrMn90yv7NHGJJ8MQAab8eEc6pZEXnb3V
	v+DxIS3a/Xj1GNRC61bLkkjifg6ggEcDF3g==
X-Received: by 2002:a7b:c5d5:0:b0:3f6:1141:7cc1 with SMTP id n21-20020a7bc5d5000000b003f611417cc1mr5744476wmk.26.1685884931121;
        Sun, 04 Jun 2023 06:22:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7ppAwBWCoqG3qzZbZQsZANaV2UoEbXLGR3b/7Hf7cj7qLt4tq7TOl+x9nElBOfuJIo3hMEqw==
X-Received: by 2002:a7b:c5d5:0:b0:3f6:1141:7cc1 with SMTP id n21-20020a7bc5d5000000b003f611417cc1mr5744455wmk.26.1685884930679;
        Sun, 04 Jun 2023 06:22:10 -0700 (PDT)
Date: Sun, 4 Jun 2023 09:22:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, cohuck@redhat.com,
	david.edmondson@oracle.com, sburla@marvell.com, jasowang@redhat.com,
	yishaih@nvidia.com, maorg@nvidia.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com
Message-ID: <20230604091651-mutt-send-email-mst@kernel.org>
References: <20230602203604.627661-1-parav@nvidia.com>
 <20230602203604.627661-3-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230602203604.627661-3-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v3 2/3] transport-pci: Introduce legacy registers access
 commands

On Fri, Jun 02, 2023 at 11:36:03PM +0300, Parav Pandit wrote:
> +\subsubsection{Legacy Device Registers Read Command}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / Legacy Interfaces: SR-IOV VFs Registers Access / Legacy Common Configuration Registers Read Command}
> +
> +The Legacy Device Registers Read Command follows \field{struct virtio_admin_cmd}.
> +This command reads legacy device specific registers of a member VF device.
> +The driver sets command \field{opcode} to VIRTIO_ADMIN_CMD_LD_REG_READ.
> +
> +The command VIRTIO_ADMIN_CMD_LD_REG_READ uses following listed structure for
> +\field{command_specific_data}:
> +
> +\begin{lstlisting}
> +struct virtio_admin_cmd_ld_reg_rd_data {
> +	u8 offset; /* Starting byte offset of the register to read */
> +};
> +\end{lstlisting}
> +
> +When command completes successfully, \field{command_specific_result}
> +uses following listed structure:
> +
> +\begin{lstlisting}
> +struct virtio_admin_cmd_ld_reg_rd_result {
> +	u8 registers[];
> +};
> +\end{lstlisting}
> +
> +\subsubsection{Legacy Queue Notify Offset Query Command}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / Legacy Interfaces: SR-IOV VFs Registers Access / Legacy Queue Notify Offset Query Command}
> +
> +This command returns the notify offset of the member VF for virtqueue
> +driver notifications. This command follows \field{struct virtio_admin_cmd}.
> +The driver sets command \field{opcode} to VIRTIO_ADMIN_CMD_LQ_NOTIFY_QUERY.
> +There is no command specific data for this command.
> +
> +When command completes successfully, \field{command_specific_result}
> +uses following listed structure:
> +
> +\begin{lstlisting}
> +struct virtio_admin_cmd_lq_notify_query_result {
> +	u8 bar; /* PCI BAR number of the member VF */
> +	u8 reserved[7];
> +	le64 offset; /* Byte offset within the BAR */
> +};
> +\end{lstlisting}
> +
> +The driver that may use the driver notifications region of the VF device
> +returned in this result likely attain higher performance or the drier may use
> +the VIRTIO_ADMIN_CMD_LREG_WRITE command.

Obtain I guess ... but how? There's no explanation.


> +
> +\begin{note}
> +The device and driver must encode and decode legacy device specific registers
> +using little endian format. Per PCI VF device level big endian format support
> +is left for the future.
> +\end{note}
> +
> +\begin{note}
> +The PCI VF device should not use PCI BAR 0 when it prefers to support
> +legacy interface registers access using its group owner PF. This enables
> +hypervisor software to operate with least complexities to compose a legacy
> +interface I/O space BAR and passthrough other PCI BARs and PCI device
> +capabilities to the guest virtual machine without any translation.
> +\end{note}

Is this related to this last command somehow? what does it mean
for PCI VF device to use a BAR? not use a BAR? Prefer what to what?

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

