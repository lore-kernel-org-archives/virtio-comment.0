Return-Path: <virtio-comment-return-7630-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB44E95A8E
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 10:57:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9F9A42118C
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 10:57:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 883A3986512
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 10:57:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 714019864CE; Mon,  9 Oct 2023 10:57:47 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 613959864D3
	for <virtio-comment@lists.oasis-open.org>; Mon,  9 Oct 2023 10:57:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: d1O9HMW_NFCEsngOtqGh5g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696849063; x=1697453863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTe7hdpn3ToN7vTlqLNIfED/+sg1pq2sFlzoWyVmXi4=;
        b=umo698XO+DJAnlAUFWO+3mCWW2J9aJAnqr3WwmnPfcQ9+7hnlpdmdCOKvhIyx8SOIy
         e+qhG9jWczl8DFpbbkEvbtTxtc0ejsXQdKkCIiW2qmNude9+g00gVHYPhe731+2uAdug
         3O/2805g/0XpUamMXAjFyZlndiKVuyMnoQ2OcUK6bjM47RbA/Z/47xQffYjpCHtX96tG
         8B1d/CNUQNMWC+keTrFQKGGConZCJHt7Xvdt5sGPevadbtzIzfYS7t5+BqcoUgd26Zqh
         fru2DyqP09/k1XkmL37fIadtjFhy/QMzvfIqy+pfsymTkOTPcgW115hY3+WUngkJo0UU
         t84A==
X-Gm-Message-State: AOJu0YxeNI2lMjSI+30BlsmV8DdKreXjfbFZJX3j8DJhpxQ4cKXg5jH5
	vPMFGANGjFkuOo65Npa/bxbv5KTfRL9djJe5BPBWO0CV48HnbODXJj69PDUG2SXk64tNW3LsLBF
	HibR7xCL3PV5qEI5xkrDVXJdgmoiLkwHVhA==
X-Received: by 2002:a17:906:5a66:b0:9ae:5120:5141 with SMTP id my38-20020a1709065a6600b009ae51205141mr12901516ejc.37.1696849063206;
        Mon, 09 Oct 2023 03:57:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkMhWblHW/4IWUcCgEAlDdFoibufkFAq/B9FJaNzhbWTZAmao+34GaCxEPfjdcq78ebFji1w==
X-Received: by 2002:a17:906:5a66:b0:9ae:5120:5141 with SMTP id my38-20020a1709065a6600b009ae51205141mr12901495ejc.37.1696849062681;
        Mon, 09 Oct 2023 03:57:42 -0700 (PDT)
Date: Mon, 9 Oct 2023 06:57:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231009065319-mutt-send-email-mst@kernel.org>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-8-parav@nvidia.com>
 <20231008074404-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818D738BCD0E634517B3ABDCCEA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54818D738BCD0E634517B3ABDCCEA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v1 7/8] admin: Add write recording commands

On Mon, Oct 09, 2023 at 04:14:22AM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Sunday, October 8, 2023 5:23 PM
> > 
> > On Sun, Oct 08, 2023 at 02:25:54PM +0300, Parav Pandit wrote:
> > > When migrating a virtual machine with passthrough virtio devices, the
> > > virtio device may write into the guest memory. Some systems may not be
> > > able to keep track of these pages efficiently.
> > >
> > > To facilitate such a system, a device provides the record of pages
> > > which are written by the device. In one use case, this commands
> > > connect to the vfio framework at [1].
> > >
> > > The owner driver configures the member device for list of address
> > > ranges for which it expects write recording and reporting by the device.
> > >
> > > The owner driver periodically queries the written pages address record
> > > which gets cleared from the device upon reading it.
> > >
> > > When the write records reduces over the time, at one point write
> > > recording is stopped after the device mode is set to FREEZE.
> > >
> > > [1]
> > > https://elixir.bootlin.com/linux/v6.4-rc1/source/include/uapi/linux/vf
> > > io.h#L1207
> > >
> > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
> > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > Signed-off-by: Satananda Burla <sburla@marvell.com>
> > > ---
> > >  admin-cmds-device-migration.tex | 146
> > ++++++++++++++++++++++++++++++--
> > >  admin.tex                       |  10 ++-
> > >  2 files changed, 146 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/admin-cmds-device-migration.tex
> > > b/admin-cmds-device-migration.tex index e98d552..49835eb 100644
> > > --- a/admin-cmds-device-migration.tex
> > > +++ b/admin-cmds-device-migration.tex
> > > @@ -97,15 +97,16 @@ \subsubsection{Device Migration}\label{sec:Basic
> > > Facilities of a Virtio Device /  During the device migration flow, a
> > > passthrough device may write data to the  guest virtual machine
> > > memory, a source hypervisor needs to keep track of these  written memory to
> > migrate such memory to destination hypervisor.
> > > -Some systems may not be able to keep track of such memory write
> > > addresses at -hypervisor level. In such a scenario, a device records
> > > and reports these -written memory addresses to the owner device. Such
> > > an address is named as -IO virtual address (IOVA). The owner driver
> > > enables write recording for one or -more IOVA ranges per device during
> > > device migration flow. The owner driver -periodically queries these
> > > written IOVA records from the device. As the driver -reads the written IOVA
> > records, the device clears those records from the device.
> > > -Once the device reports zero or small number of written IOVA records,
> > > the device -mode is set to \field{Stop} or \field{Freeze}. Once the
> > > device is set to \field{Stop}
> > > +Some systems may not be able to keep track of such memory writes at
> > > +addresses at hypervisor level. In such a scenario, a device records
> > > +and reports these written memory addresses to the owner device.
> > 
> > 
> > what does it mean to record them?
> >
> May be we can use a different verb than record. May be tracking?
> Record means, device accumulates these written pages addresses, and when driver queries, it returns these addresses and clears it internally within the device.

For example, what about two writes into same address. Do you get one
record or two? What if the length is different?


> > > Such an
> > > +address is named as IO virtual address (IOVA).
> > 
> > I don't know what does this have to do with IOVA. For that matter everything
> > would have to be "IOVA". Spec calls these physical address and let's stick to
> > that.
> > 
> Make sense.
> At device level it does not have knowledge of IOVA.
> I will rename it.
> 
> > 
> > > The owner driver enables write
> > > +recording for one or more IOVA ranges per device during device
> > > +migration flow. The owner driver periodically queries these written
> > > +IOVA records from the device.
> > 
> > periodical reads without any indication are the only option then?
> >
> At least for now, this is starting point. Software stack such as QEMU does it periodically.

So for CPU kvm switched to PML and this seems to work better -
it guarantees there's convergence.

> When new use case arise, may be it can be extended.
>  
> > > As the driver reads the written IOVA records,
> > > +the device clears those records from the device. Once the device
> > > +reports zero or small number of written IOVA records, the device is
> > > +set to \field{Stop} or \field{Freeze} mode. Once the device is set to
> > > +\field{Stop}
> > >  or \field{Freeze} mode, and once all the IOVA records are read, the
> > > driver stops  the write recording in the device.
> > 
> > 
> > it is not great that you are rewriting text you just wrote in patch 1 here. pls find
> > a way not to make reviewers read everything twice.
> > 
> There is small duplication of one line explaining mode change, rest is contextual to the write recording.
> Merging with text of patch_1 was slightly complicated to read, so one sentence is duplicated.
> 
> I will again check if patch_1 text extension is easier to read.

this is latex, space is ignored. if you are only changing one word just
don't move the rest and diff will look sane

> > > @@ -118,6 +119,10 @@ \subsubsection{Device Migration}\label{sec:Basic
> > > Facilities of a Virtio Device /  \item Device Context Read Command
> > > \item Device Context Write Command  \item Device Context Discard
> > > Command
> > > +\item Device Write Record Capabilities Query Command \item Device
> > > +Write Records Start Command \item Device Write Records Stop Command
> > > +\item Device Write Records Read Command
> > >  \end{enumerate}
> > >
> > >  These commands are currently only defined for the SR-IOV group type.
> > > @@ -307,6 +312,129 @@ \subsubsection{Device Migration}\label{sec:Basic
> > > Facilities of a Virtio Device /  discarded, subsequent
> > > VIRTIO_ADMIN_CMD_DEV_CTX_WRITE command writes a new device
> > context.
> > >
> > > +\paragraph{Device Write Record Capabilities Query Command}
> > > +\label{par:Basic Facilities of a Virtio Device / Device groups /
> > > +Group administration commands / Device Migration / Device Write
> > > +Record Capabilities Query Command}
> > > +
> > > +This command reads the device write record capabilities.
> > > +For the command VIRTIO_ADMIN_CMD_DEV_WRITE_RECORD_CAP_QUERY,
> > > +\field{opcode} is set to 0xd.
> > > +The \field{group_member_id} refers to the member device to be accessed.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_admin_cmd_dev_write_record_cap_result {
> > > +        le32 supported_iova_page_size_bitmap;
> > > +        le32 supported_iova_ranges;
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +When the command completes successfully,
> > > +\field{command_specific_result} is in the format \field{struct
> > > +virtio_admin_cmd_dev_write_record_cap_result}
> > > +returned by the device. The \field{supported_iova_page_size_bitmap}
> > > +indicates the granularity at which the device can record IOVA ranges.
> > > +the minimum granularity can be 4KB. Bit 0 corresponds to 4KB, bit 1
> > > +corresponds to 8KB, bit 31 corresponds to 4TB. The device supports at least
> > one page granularity.
> > > +The device support one or more IOVA page granularity; for each IOVA
> > > +page granularity, the device sets corresponding bit in the
> > > +\field{supported_iova_page_size_bitmap}. The
> > > +\field{supported_iova_ranges} indicates how many unique (non
> > > +overlapping) IOVA ranges can be recorded by the device.
> > 
> > what role does this granularity play? i see no mention of it down the road.
> > 
> The page_size in struct virtio_admin_cmd_write_record_start_data must match to the granularity supplied above.
> I missed it. Will add in v2.
> This is very useful comment.

Not that it's very clear what does page_size do.

> > 
> > > +
> > > +\paragraph{Device Write Records Start Command} \label{par:Basic
> > > +Facilities of a Virtio Device / Device groups / Group administration
> > > +commands / Device Migration / Device Write Records Start Command}
> > > +
> > > +This command starts the write recording in the device for the
> > > +specified IOVA ranges.
> > > +
> > > +For the command VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START,
> > > +\field{opcode} is set to 0xe.
> > > +The \field{group_member_id} refers to the member device to be accessed.
> > > +
> > > +The \field{command_specific_data} is in the format \field{struct
> > > +virtio_admin_cmd_write_record_start_data}.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_admin_cmd_write_record_start_entry {
> > > +        le64 iova;
> > > +        le64 page_count;
> > > +};
> > > +
> > > +struct virtio_admin_cmd_write_record_start_data {
> > > +        le64 page_size;
> > > +        le32 count;
> > > +        u8 reserved[4];
> > > +        struct virtio_admin_cmd_write_record_start_entry entries[];
> > > +};
> > > +
> > > +\end{lstlisting}
> > > +
> > > +The \field{count} is set to indicate number of valid \field{entries}.
> > > +The \field{iova} indicates the start IOVA address. The
> > > +\field{page_count} indicates number of pages of size
> > > +\field{page_size} starting from \field{iova} to record for write
> > > +reporting. VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START
> > > +command contains unique i.e. non overlapping IOVA range entries.
> > > +Whenever a memory write occurs by the device in the supplied IOVA
> > > +range, the device records the actual IOVA and number of bytes written to the
> > IOVA.
> > > +These write records can be read by the the driver using
> > > +VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_READ command.
> > > +
> > > +This command has no command specific result.
> > > +
> > > +\paragraph{Device Write Record Stop Command} \label{par:Basic
> > > +Facilities of a Virtio Device / Device groups / Group administration
> > > +commands / Device Migration / Device Write Record Stop Command}
> > > +
> > > +This command stops the write recording in the device for IOVA ranges
> > > +which were previously started using
> > > +VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START
> > > +command.
> > > +
> > > +For the command VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_STOP,
> > > +\field{opcode} is set to 0xf.
> > > +The \field{group_member_id} refers to the member device to be accessed.
> > > +
> > > +This command does not have any command specific data.
> > > +This command has no command specific result.
> > > +
> > > +\paragraph{Device Write Records Read Command} \label{par:Basic
> > > +Facilities of a Virtio Device / Device groups / Group administration
> > > +commands / Device Migration / Device Write Records Read Command}
> > > +
> > > +This command reads the device write records for which the write
> > > +recording is previously started using
> > VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START command.
> > > +
> > > +For the command VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_READ,
> > > +\field{opcode} is set to 0x10.
> > > +The \field{group_member_id} refers to the member device to be accessed.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_admin_cmd_write_records_read_data {
> > > +        le64 iova;
> > > +        le64 length;
> > > +};
> > > +
> > > +struct virtio_admin_cmd_dev_write_records_cnt {
> > > +        le32 count;
> > > +};
> > > +
> > > +struct virtio_admin_cmd_dev_write_records_result {
> > > +        le64 iova_entries[];
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +The \field{command_specific_data} is in the format \field{struct
> > > +virtio_admin_cmd_write_records_read_data}. The driver sets the \field
> > > +{iova} indicating the start IOVA address for up to the \field{length}
> > > +number of bytes. The supplied IOVA range same or smaller than the
> > > +range supplied when write recording is started by the driver in
> > > +VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START command.
> > 
> > Seems pretty sparse. Lots of hypervisors chose to implement a bit per page
> > strategy.
> This command result addresses will feed into such bit.

Do we want to return it in this format then?

> > 
> > > +
> > > +When the command completes successfully,
> > > +\field{command_specific_result} is in the format \field{struct
> > > +virtio_admin_cmd_dev_write_records_result}
> > > +and \field{command_specific_result} is in format of \field{struct
> > > +virtio_admin_cmd_dev_write_records_cnt} containing number of write
> > > +records returned by the device.
> > 
> > what are these records though?
> > 
> It is struct virtio_admin_cmd_dev_write_records_result.
> I will rephrase it to link to struct virtio_admin_cmd_dev_write_records_result.
> 
> > 
> > > When the command completes
> > > +successfully, the write records which are returned in the result are
> > > +cleared from the device and same records cannot be read again. When
> > > +new writes occur at same IOVA range or at different once, those
> > > +records can be read as new write records.
> > 
> > 
> > this last sentence just confuses.
> > 
> How about just keeping below text rewrite?
> When the command completes successfully, the write records returned in the result are cleared from the device.

I think we need to explain in more detail what exactly is expected
to be recorded and when.

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

