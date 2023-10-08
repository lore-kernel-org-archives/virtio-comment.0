Return-Path: <virtio-comment-return-7619-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AF2E95A67
	for <virtio-comment@archiver.kernel.org>; Sun,  8 Oct 2023 11:53:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5CC2C1CA24E
	for <virtio-comment@archiver.kernel.org>; Sun,  8 Oct 2023 11:53:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 30012986510
	for <virtio-comment@archiver.kernel.org>; Sun,  8 Oct 2023 11:53:06 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0A4C0986380; Sun,  8 Oct 2023 11:53:06 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EE85D986481
	for <virtio-comment@lists.oasis-open.org>; Sun,  8 Oct 2023 11:53:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: DmXmDsX5Me-F_q5EiH6Ycg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696765982; x=1697370782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62dOOEt4fUKA1sm+/lVTiZLz4ORKBqwr5tUoahllNEA=;
        b=CmIl0iZQST6KQV12YtyAhZUwsDvc36GdZasB1caaa/tPgR3F4jB7he0sDeakSomPkX
         0jHIYyxdvwoa9Hhie5zZpV3LATLYsIfKqjX7VRA0MA+yuFqsaid5bdTzpXCxgeX9vzww
         5YZWO4E9+gPMSCHnHXINQx2LgMvAGmEoOw+1RgpObDqjcHNydVz/s9HtW/lGhXdy/g+s
         feaDYZnmU1oTqSgJqPL+DtRSka47ATk4kta2nBikX8FNgjmvSPjWGDJ7UPmvtGeMDEEc
         tUcD/pOpp2IvubPGtmHxiURG/hq8HAzFiHblWoval/Uj8O11ES1PVY9HaHEjCLHtp5eu
         BcQg==
X-Gm-Message-State: AOJu0YwZt5PsmuqrBcXBxFJuafqGUYGtQeGkt666cdg6AnjcveIQ96Na
	97mo++8ebdat6hTGJDgjccXEjHnNtkzq+3Wxy8/6RTsL5UdwIqZPP8VlHLXXv0i5Y1umHKdPq6C
	usP7zzbNFOb/LKqhodyy+ys7SgfHAP23BJQ==
X-Received: by 2002:a17:907:78c5:b0:9b2:ffca:3890 with SMTP id kv5-20020a17090778c500b009b2ffca3890mr11355966ejc.19.1696765982044;
        Sun, 08 Oct 2023 04:53:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2aJ4FuX7xS7GlHpWifP2PyGVDLs+pbpLaXdMbLlKBh333aojK+37/VpzzKsVnb1W0z/oB+A==
X-Received: by 2002:a17:907:78c5:b0:9b2:ffca:3890 with SMTP id kv5-20020a17090778c500b009b2ffca3890mr11355961ejc.19.1696765981704;
        Sun, 08 Oct 2023 04:53:01 -0700 (PDT)
Date: Sun, 8 Oct 2023 07:52:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, cohuck@redhat.com,
	sburla@marvell.com, shahafs@nvidia.com, maorg@nvidia.com,
	yishaih@nvidia.com
Message-ID: <20231008074404-mutt-send-email-mst@kernel.org>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-8-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20231008112555.473895-8-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v1 7/8] admin: Add write recording commands

On Sun, Oct 08, 2023 at 02:25:54PM +0300, Parav Pandit wrote:
> When migrating a virtual machine with passthrough
> virtio devices, the virtio device may write into the guest
> memory. Some systems may not be able to keep track of these
> pages efficiently.
> 
> To facilitate such a system, a device provides the record
> of pages which are written by the device. In one use case, this
> commands connect to the vfio framework at [1].
> 
> The owner driver configures the member device for list of address
> ranges for which it expects write recording and reporting by the device.
> 
> The owner driver periodically queries the written pages address record
> which gets cleared from the device upon reading it.
> 
> When the write records reduces over the time, at one point write recording
> is stopped after the device mode is set to FREEZE.
> 
> [1] https://elixir.bootlin.com/linux/v6.4-rc1/source/include/uapi/linux/vfio.h#L1207
> 
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> Signed-off-by: Satananda Burla <sburla@marvell.com>
> ---
>  admin-cmds-device-migration.tex | 146 ++++++++++++++++++++++++++++++--
>  admin.tex                       |  10 ++-
>  2 files changed, 146 insertions(+), 10 deletions(-)
> 
> diff --git a/admin-cmds-device-migration.tex b/admin-cmds-device-migration.tex
> index e98d552..49835eb 100644
> --- a/admin-cmds-device-migration.tex
> +++ b/admin-cmds-device-migration.tex
> @@ -97,15 +97,16 @@ \subsubsection{Device Migration}\label{sec:Basic Facilities of a Virtio Device /
>  During the device migration flow, a passthrough device may write data to the
>  guest virtual machine memory, a source hypervisor needs to keep track of these
>  written memory to migrate such memory to destination hypervisor.
> -Some systems may not be able to keep track of such memory write addresses at
> -hypervisor level. In such a scenario, a device records and reports these
> -written memory addresses to the owner device. Such an address is named as
> -IO virtual address (IOVA). The owner driver enables write recording for one or
> -more IOVA ranges per device during device migration flow. The owner driver
> -periodically queries these written IOVA records from the device. As the driver
> -reads the written IOVA records, the device clears those records from the device.
> -Once the device reports zero or small number of written IOVA records, the device
> -mode is set to \field{Stop} or \field{Freeze}. Once the device is set to \field{Stop}
> +Some systems may not be able to keep track of such
> +memory writes at addresses at hypervisor level. In such a scenario, a device
> +records and reports these written memory addresses to the owner device.


what does it mean to record them?

> Such an
> +address is named as IO virtual address (IOVA).

I don't know what does this have to do with IOVA. For that matter
everything would have to be "IOVA". Spec calls these physical
address and let's stick to that.


> The owner driver enables write
> +recording for one or more IOVA ranges per device during device migration
> +flow. The owner driver periodically queries these written IOVA records from
> +the device.

periodical reads without any indication are the only option then?

> As the driver reads the written IOVA records,
> +the device clears those records from the device. Once the device reports
> +zero or small number of written IOVA records, the device is set to
> +\field{Stop} or \field{Freeze} mode. Once the device is set to \field{Stop}
>  or \field{Freeze} mode, and once all the IOVA records are read, the driver stops
>  the write recording in the device.


it is not great that you are rewriting text you just wrote in patch 1
here. pls find a way not to make reviewers read everything twice.

> @@ -118,6 +119,10 @@ \subsubsection{Device Migration}\label{sec:Basic Facilities of a Virtio Device /
>  \item Device Context Read Command
>  \item Device Context Write Command
>  \item Device Context Discard Command
> +\item Device Write Record Capabilities Query Command
> +\item Device Write Records Start Command
> +\item Device Write Records Stop Command
> +\item Device Write Records Read Command
>  \end{enumerate}
>  
>  These commands are currently only defined for the SR-IOV group type.
> @@ -307,6 +312,129 @@ \subsubsection{Device Migration}\label{sec:Basic Facilities of a Virtio Device /
>  discarded, subsequent VIRTIO_ADMIN_CMD_DEV_CTX_WRITE command writes a new device
>  context.
>  
> +\paragraph{Device Write Record Capabilities Query Command}
> +\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Migration / Device Write Record Capabilities Query Command}
> +
> +This command reads the device write record capabilities.
> +For the command VIRTIO_ADMIN_CMD_DEV_WRITE_RECORD_CAP_QUERY, \field{opcode}
> +is set to 0xd.
> +The \field{group_member_id} refers to the member device to be accessed.
> +
> +\begin{lstlisting}
> +struct virtio_admin_cmd_dev_write_record_cap_result {
> +        le32 supported_iova_page_size_bitmap;
> +        le32 supported_iova_ranges;
> +};
> +\end{lstlisting}
> +
> +When the command completes successfully, \field{command_specific_result}
> +is in the format \field{struct virtio_admin_cmd_dev_write_record_cap_result}
> +returned by the device. The \field{supported_iova_page_size_bitmap} indicates
> +the granularity at which the device can record IOVA ranges. the minimum
> +granularity can be 4KB. Bit 0 corresponds to 4KB, bit 1 corresponds to 8KB, bit 31
> +corresponds to 4TB. The device supports at least one page granularity.
> +The device support one or more IOVA page granularity; for each IOVA page
> +granularity, the device sets corresponding bit in the
> +\field{supported_iova_page_size_bitmap}. The \field{supported_iova_ranges}
> +indicates how many unique (non overlapping) IOVA ranges can be recorded by
> +the device.

what role does this granularity play? i see no mention of it down the
road.


> +
> +\paragraph{Device Write Records Start Command}
> +\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Migration / Device Write Records Start Command}
> +
> +This command starts the write recording in the device for the specified IOVA
> +ranges.
> +
> +For the command VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START, \field{opcode}
> +is set to 0xe.
> +The \field{group_member_id} refers to the member device to be accessed.
> +
> +The \field{command_specific_data} is in the format
> +\field{struct virtio_admin_cmd_write_record_start_data}.
> +
> +\begin{lstlisting}
> +struct virtio_admin_cmd_write_record_start_entry {
> +        le64 iova;
> +        le64 page_count;
> +};
> +
> +struct virtio_admin_cmd_write_record_start_data {
> +        le64 page_size;
> +        le32 count;
> +        u8 reserved[4];
> +        struct virtio_admin_cmd_write_record_start_entry entries[];
> +};
> +
> +\end{lstlisting}
> +
> +The \field{count} is set to indicate number of valid \field{entries}.
> +The \field{iova} indicates the start IOVA address. The \field{page_count}
> +indicates number of pages of size \field{page_size} starting from \field{iova}
> +to record for write reporting. VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START
> +command contains unique i.e. non overlapping IOVA range entries.
> +Whenever a memory write occurs by the device in the supplied IOVA range, the
> +device records the actual IOVA and number of bytes written to the IOVA.
> +These write records can be read by the
> +the driver using VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_READ command.
> +
> +This command has no command specific result.
> +
> +\paragraph{Device Write Record Stop Command}
> +\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Migration / Device Write Record Stop Command}
> +
> +This command stops the write recording in the device for IOVA ranges
> +which were previously started using VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START
> +command.
> +
> +For the command VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_STOP, \field{opcode}
> +is set to 0xf.
> +The \field{group_member_id} refers to the member device to be accessed.
> +
> +This command does not have any command specific data.
> +This command has no command specific result.
> +
> +\paragraph{Device Write Records Read Command}
> +\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Migration / Device Write Records Read Command}
> +
> +This command reads the device write records for which the write recording is
> +previously started using VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START command.
> +
> +For the command VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_READ, \field{opcode}
> +is set to 0x10.
> +The \field{group_member_id} refers to the member device to be accessed.
> +
> +\begin{lstlisting}
> +struct virtio_admin_cmd_write_records_read_data {
> +        le64 iova;
> +        le64 length;
> +};
> +
> +struct virtio_admin_cmd_dev_write_records_cnt {
> +        le32 count;
> +};
> +
> +struct virtio_admin_cmd_dev_write_records_result {
> +        le64 iova_entries[];
> +};
> +\end{lstlisting}
> +
> +The \field{command_specific_data} is in the format
> +\field{struct virtio_admin_cmd_write_records_read_data}. The driver
> +sets the \field {iova} indicating the start IOVA address for up to the
> +\field{length} number of bytes. The supplied IOVA range same or smaller
> +than the range supplied when write recording is started by the driver
> +in VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START command.

Seems pretty sparse. Lots of hypervisors chose to implement
a bit per page strategy.

> +
> +When the command completes successfully, \field{command_specific_result}
> +is in the format \field{struct virtio_admin_cmd_dev_write_records_result}
> +and \field{command_specific_result} is in format of
> +\field{struct virtio_admin_cmd_dev_write_records_cnt} containing number
> +of write records returned by the device.

what are these records though? 


> When the command completes
> +successfully, the write records which are returned in the result are
> +cleared from the device and same records cannot be read again. When new
> +writes occur at same IOVA range or at different once, those records can be read
> +as new write records.


this last sentence just confuses.

> +
>  \devicenormative{\paragraph}{Device Migration}{Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Migration}
>  
>  A device MUST either support all of, or none of
> diff --git a/admin.tex b/admin.tex
> index 3429c4e..cffd85e 100644
> --- a/admin.tex
> +++ b/admin.tex
> @@ -138,7 +138,15 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
>  \hline
>  0x000c & VIRTIO_ADMIN_CMD_DEV_CTX_DISCARD & Clear the device context data \\
>  \hline
> -0x000d - 0x7FFF & - & Commands using \field{struct virtio_admin_cmd}    \\
> +0x000d & VIRTIO_ADMIN_CMD_DEV_WRITE_RECORD_CAP_QUERY & Query Write recording capabilities \\
> +\hline
> +0x000e & VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START & Start Write recording in the device \\
> +\hline
> +0x000f & VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_STOP & Stop all write recording in the device \\
> +\hline
> +0x0010 & VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_READ & Read and clear write records from the device \\
> +\hline
> +0x0011 - 0x7FFF & - & Commands using \field{struct virtio_admin_cmd}    \\
>  \hline
>  0x8000 - 0xFFFF & - & Reserved for future commands (possibly using a different structure)    \\
>  \hline
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

