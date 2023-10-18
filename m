Return-Path: <virtio-comment-return-7795-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EACCDB483
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 06:47:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 47403D93E5
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 06:47:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 35693986893
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 06:47:09 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 22B4898688C; Wed, 18 Oct 2023 06:47:09 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 12F4F98688D
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 06:47:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: wOBoIqs4OH2qBKp4Cc2Wjg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697611623; x=1698216423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5ihNz/Z3VYsTGzDlTAKATGdAicnTRIKJBiiGtCI+jY=;
        b=kOIimvBiTgfle39odQFhVb1GdobmqmeffqMAHcY5IBFgnF3hW1p1nCK28z1TtSEHMq
         HXUHNOFAPy2YQv+rJD9SdnMdpYCSb06nR5J9QPykmVW3X9kdQe5Pd/5sdxzyRNVqqrjV
         gfaWvJ8i/6TLnuNDoqgxEJaMwxzz9ujkrXpImQcsvSlgLHlikKAMYdQ42N/fWr9daxkv
         8bIhCtnyVN3Gi6CwbVylPosxU3DxgSNfLw8bFU8TdeOKkv/Y7gtQBeDEKEI1g79dy9Mv
         mZ7D7DLzI7x3Vcm8Bok5NVpapWKUyTJYLj5gkWo8IrlWvxai86ABdSNtUf/2xrlcUZOf
         fIAg==
X-Gm-Message-State: AOJu0Yw5SH82ZlpScXljbw10c4K99N8ZL41htBNpSKSc1qqyqVtQLpZ9
	YsMI3RBPtYrVOQDQQhgeTRUiIdNZFPS9t7p3yF30JJaO19SLNTIgfXtIz4OwKZDvSTVl+xZCvLD
	qgyIup8uY4hCS+OCplSQIIBZ07YLr4WnFBw==
X-Received: by 2002:adf:d014:0:b0:32d:a4d0:1364 with SMTP id t20-20020adfd014000000b0032da4d01364mr2901243wrh.29.1697611623483;
        Tue, 17 Oct 2023 23:47:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcgJm4yAns1OrloNYme9Ad/JP8RnB6TNetSaD+eJyTK6LoUH/ruwIZPDd/RELjaCIKB6q1HA==
X-Received: by 2002:adf:d014:0:b0:32d:a4d0:1364 with SMTP id t20-20020adfd014000000b0032da4d01364mr2901223wrh.29.1697611623032;
        Tue, 17 Oct 2023 23:47:03 -0700 (PDT)
Date: Wed, 18 Oct 2023 02:46:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, cohuck@redhat.com,
	sburla@marvell.com, shahafs@nvidia.com, maorg@nvidia.com,
	yishaih@nvidia.com
Message-ID: <20231018022502-mutt-send-email-mst@kernel.org>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-5-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20231008112555.473895-5-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v1 4/8] admin: Add device migration admin commands

On Sun, Oct 08, 2023 at 02:25:51PM +0300, Parav Pandit wrote:

...

> +\paragraph{Device Context Size Get Command}
> +\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Migration / Device Context Size Get Command}
> +
> +This command returns the remaining estimated device context size. The 
> +driver can query the remaining estimated device context size
> +for the current mode or for the \field{Freeze} mode. While
> +reading the device context using VIRTIO_ADMIN_CMD_DEV_CTX_READ command, the
> +actual device context size may differ than what is being returned by
> +this command. After reading the device context using command
> +VIRTIO_ADMIN_CMD_DEV_CTX_READ, the remaining estimated context size
> +usually reduces by amount of device context read by the driver using
> +VIRTIO_ADMIN_CMD_DEV_CTX_READ command. If the device context is updated
> +rapidly the remaining estimated context size may also increase even after
> +reading the device context using VIRTIO_ADMIN_CMD_DEV_CTX_READ command.
> +
> +For the command VIRTIO_ADMIN_CMD_DEV_CTX_SIZE_GET, \field{opcode} is set to 0x9.
> +The \field{group_member_id} refers to the member device to be accessed.
> +
> +\begin{lstlisting}
> +struct virtio_admin_cmd_dev_ctx_size_get_data {
> +        u8 freeze_mode;
> +};
> +\end{lstlisting}
> +
> +The \field{command_specific_data} is in the format
> +\field{struct virtio_admin_cmd_dev_ctx_size_get_data}.
> +When \field{freeze_mode} is set to 1, the device returns the estimated
> +device context size when the device will be in \field{Freeze} mode.
> +As the device context is read from the device, the remaining estimated
> +context size may decrease. For example, member device mode is
> +\field{Stop}, the device has estimated total device context size
> +as 12KB; the device would return 12KB for the first
> +VIRTIO_ADMIN_CMD_DEV_CTX_SIZE_GET command, once the driver has
> +already read 8KB of device context data using
> +VIRTIO_ADMIN_CMD_DEV_CTX_READ command, and the remaining data is
> +4KB, hence the device returns 4KB in the subsequent
> +VIRTIO_ADMIN_CMD_DEV_CTX_SIZE_GET command.
> +
> +\begin{lstlisting}
> +struct virtio_admin_cmd_dev_ctx_size_get_result {
> +        le64 size;
> +};
> +\end{lstlisting}

So we have a 64 bit size? How are we going to return so much?


> +
> +When the command completes successfully, \field{command_specific_result} is in
> +the format \field{struct virtio_admin_cmd_dev_ctx_size_get_result}.
> +
> +Once the device context is fully read, this command returns zero for
> +\field{size} until the new device context is generated.
> +
> +\paragraph{Device Context Read Command}
> +\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Migration / Device Context Read Command}
> +
> +This command reads the current device context.
> +For the command VIRTIO_ADMIN_CMD_DEV_CTX_READ, \field{opcode} is set to 0xa.
> +The \field{group_member_id} refers to the member device to be accessed.
> +
> +This command has no command specific data.

So I am not sure this is wise. Multi-year experience with QEMU taught us
that we are likely to make mistakes when defining migration format -
forget some fields, validate them incorrectly, and so on.
Making a somewhat safe assumption that we'll make mistakes
in the spec, too, I'd like to see some kind of idea of how
we'll support compatibility and/or graceful failure if/when we do.


> +\begin{lstlisting}
> +struct virtio_admin_cmd_dev_ctx_rd_len {
> +        le32 context_len;
> +};
> +
> +struct virtio_admin_cmd_dev_ctx_rd_result {
> +        u8 data[];
> +};
> +\end{lstlisting}

so callers needs to pin whatever device tells it to?

admin commands support truncation intentionally.

it is not clear, to me, that it's ok to have device just
save as much state as it wants to.

> +
> +When the command completes successfully, \field{command_specific_result}
> +is in the format \field{struct virtio_admin_cmd_dev_ctx_rd_result}
> +returned by the device containing the device context data and
> +\field{command_specific_output} is in format of
> +\field{struct virtio_admin_cmd_dev_ctx_rd_len} containing length of
> +context data returned by the device in the command response. When the length
> +returned is zero or when the returned context data is less the data requested by
> +the driver, the device do not have any device context data left that the device
> +can report, at this point the device context stream ends.
> +
> +The driver can read the whole device context data using one or multiple
> +commands. When the device context does not fit in the
> +\field{command_specific_result}, driver reads the subsequent remaining
> +bytes using one or more subsequent commands.

how?

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

