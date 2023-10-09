Return-Path: <virtio-comment-return-7635-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC43CD6101
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 16:15:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D49513309B
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 16:15:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BAFF4986512
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 16:15:41 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A489D9864D3; Mon,  9 Oct 2023 16:15:41 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9628B9864F0
	for <virtio-comment@lists.oasis-open.org>; Mon,  9 Oct 2023 16:15:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 3id0sot0MCKBTJe5ycS7AA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696868136; x=1697472936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unJu2tQYVxVtpVwO3uGxXNVb1UND3EHaY7nrDnqmAuE=;
        b=W1y3NlFBVpR65DN8E9bgRKE9CbcucL73TKXff1um78KbNx7XdBt6ZIqyjUfm588JsD
         IAmawBfYQ/qalU8IEqiFqOjR7SeQTEHu4wgTQnYDB1k6YuNWvELVummpmk38/QeGWkUm
         v3zFcLHZN2t94RGmFhQEpzhDcNCLwP6Ifn0j1lhF/cCiaz6xglUl+maNvrYSNSuUj2g6
         UB35VYmQ+/A9e5BpnDr6U8/CtSXn+kaFn2oHMdy/MbY8CVsmwaiZZJXDtt31k2LDxm00
         cI2AbSQWzTBxFrkJoQOa4xxF3VL6euiNZ/kX4iwxnHBCn/px3e/UlGvt3nou8QedGfpQ
         2FgQ==
X-Gm-Message-State: AOJu0Yy6dEcoj6Wy8kR8QLrImsCwCDgSsVnEfMeeJVkGgL972KdO6cCy
	sllWRh4Q1G/J9TaPpnGErOSX76lf4msYmRRQPl4h+0B7X/ZcSLRi0h1bRVt4/FoQDnsP/nN95Mo
	jAlEzOz4mChytopcbsvI6rrR/Z0/VaLu7Vg==
X-Received: by 2002:a17:907:7f86:b0:9ae:50ec:bd81 with SMTP id qk6-20020a1709077f8600b009ae50ecbd81mr10278489ejc.21.1696868136628;
        Mon, 09 Oct 2023 09:15:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWK1hN+Xr0RAyLMqLoh3BZh3W4h9M++trSx8t6s1qOBpQAcrGn7IblRLHdBbTpxNGxFC+D/g==
X-Received: by 2002:a17:907:7f86:b0:9ae:50ec:bd81 with SMTP id qk6-20020a1709077f8600b009ae50ecbd81mr10278465ejc.21.1696868136185;
        Mon, 09 Oct 2023 09:15:36 -0700 (PDT)
Date: Mon, 9 Oct 2023 12:15:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231009115502-mutt-send-email-mst@kernel.org>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-8-parav@nvidia.com>
 <20231008074404-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818D738BCD0E634517B3ABDCCEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231009065319-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480A08A86E3FAEEAF8C962DDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM8PR12MB5480A08A86E3FAEEAF8C962DDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v1 7/8] admin: Add write recording
 commands

On Mon, Oct 09, 2023 at 11:48:46AM +0000, Parav Pandit wrote:
> 
> > From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> > open.org> On Behalf Of Michael S. Tsirkin
> > Sent: Monday, October 9, 2023 4:28 PM
> 
> > > May be we can use a different verb than record. May be tracking?
> > > Record means, device accumulates these written pages addresses, and when
> > driver queries, it returns these addresses and clears it internally within the
> > device.
> > 
> > For example, what about two writes into same address. Do you get one record
> > or two? What if the length is different?
> One record.
> Since the writes are tracked/recorded at page granularity, even if length is different, it still one entry.

what if writes cover different pages but overlap?
Don't bother answering here, I am implying this needs to be documented.

We could give devices a bit of a freeway here too, e.g. explain that
device can combine two writes into one record but does not have to -
might lead to better data structures internally.


> > 
> > 
> > > > > Such an
> > > > > +address is named as IO virtual address (IOVA).
> > > >
> > > > I don't know what does this have to do with IOVA. For that matter
> > > > everything would have to be "IOVA". Spec calls these physical
> > > > address and let's stick to that.
> > > >
> > > Make sense.
> > > At device level it does not have knowledge of IOVA.
> > > I will rename it.
> > >
> > > >
> > > > > The owner driver enables write
> > > > > +recording for one or more IOVA ranges per device during device
> > > > > +migration flow. The owner driver periodically queries these
> > > > > +written IOVA records from the device.
> > > >
> > > > periodical reads without any indication are the only option then?
> > > >
> > > At least for now, this is starting point. Software stack such as QEMU does it
> > periodically.
> > 
> > So for CPU kvm switched to PML and this seems to work better - it guarantees
> > there's convergence.
> > 
> My guess that PML is better because write protection related faults are removed now.
> The approach here is similar, but there is no PML kind of queue.
> It is relatively manageable to slow down cpu on VMEXIT or other ways, compare to external network.
> 
> And secondly, it is driven by the hypervisor cpu availability for capacity planning etc.
> So its periodic in nature that share similar scheme like PML.

With PML the entries are recorded into two places: dirty bit in PTE+log.
If log fills up there's an exit. I don't exactly get where do you expect
the device to record this apparently unbounded log.

> 
> > > When new use case arise, may be it can be extended.
> > >
> > > > > As the driver reads the written IOVA records,
> > > > > +the device clears those records from the device. Once the device
> > > > > +reports zero or small number of written IOVA records, the device
> > > > > +is set to \field{Stop} or \field{Freeze} mode. Once the device is
> > > > > +set to \field{Stop}
> > > > >  or \field{Freeze} mode, and once all the IOVA records are read,
> > > > > the driver stops  the write recording in the device.
> > > >
> > > >
> > > > it is not great that you are rewriting text you just wrote in patch
> > > > 1 here. pls find a way not to make reviewers read everything twice.
> > > >
> > > There is small duplication of one line explaining mode change, rest is
> > contextual to the write recording.
> > > Merging with text of patch_1 was slightly complicated to read, so one
> > sentence is duplicated.
> > >
> > > I will again check if patch_1 text extension is easier to read.
> > 
> > this is latex, space is ignored. if you are only changing one word just don't move
> > the rest and diff will look sane
> > 
> Yeah, right. I will fix this.
> 
> > > > > @@ -118,6 +119,10 @@ \subsubsection{Device
> > > > > Migration}\label{sec:Basic Facilities of a Virtio Device /  \item
> > > > > Device Context Read Command \item Device Context Write Command
> > > > > \item Device Context Discard Command
> > > > > +\item Device Write Record Capabilities Query Command \item Device
> > > > > +Write Records Start Command \item Device Write Records Stop
> > > > > +Command \item Device Write Records Read Command
> > > > >  \end{enumerate}
> > > > >
> > > > >  These commands are currently only defined for the SR-IOV group type.
> > > > > @@ -307,6 +312,129 @@ \subsubsection{Device
> > > > > Migration}\label{sec:Basic Facilities of a Virtio Device /
> > > > > discarded, subsequent VIRTIO_ADMIN_CMD_DEV_CTX_WRITE command
> > > > > writes a new device
> > > > context.
> > > > >
> > > > > +\paragraph{Device Write Record Capabilities Query Command}
> > > > > +\label{par:Basic Facilities of a Virtio Device / Device groups /
> > > > > +Group administration commands / Device Migration / Device Write
> > > > > +Record Capabilities Query Command}
> > > > > +
> > > > > +This command reads the device write record capabilities.
> > > > > +For the command
> > VIRTIO_ADMIN_CMD_DEV_WRITE_RECORD_CAP_QUERY,
> > > > > +\field{opcode} is set to 0xd.
> > > > > +The \field{group_member_id} refers to the member device to be
> > accessed.
> > > > > +
> > > > > +\begin{lstlisting}
> > > > > +struct virtio_admin_cmd_dev_write_record_cap_result {
> > > > > +        le32 supported_iova_page_size_bitmap;
> > > > > +        le32 supported_iova_ranges; }; \end{lstlisting}
> > > > > +
> > > > > +When the command completes successfully,
> > > > > +\field{command_specific_result} is in the format \field{struct
> > > > > +virtio_admin_cmd_dev_write_record_cap_result}
> > > > > +returned by the device. The
> > > > > +\field{supported_iova_page_size_bitmap}
> > > > > +indicates the granularity at which the device can record IOVA ranges.
> > > > > +the minimum granularity can be 4KB. Bit 0 corresponds to 4KB, bit
> > > > > +1 corresponds to 8KB, bit 31 corresponds to 4TB. The device
> > > > > +supports at least
> > > > one page granularity.
> > > > > +The device support one or more IOVA page granularity; for each
> > > > > +IOVA page granularity, the device sets corresponding bit in the
> > > > > +\field{supported_iova_page_size_bitmap}. The
> > > > > +\field{supported_iova_ranges} indicates how many unique (non
> > > > > +overlapping) IOVA ranges can be recorded by the device.
> > > >
> > > > what role does this granularity play? i see no mention of it down the road.
> > > >
> > > The page_size in struct virtio_admin_cmd_write_record_start_data must
> > match to the granularity supplied above.
> > > I missed it. Will add in v2.
> > > This is very useful comment.
> > 
> > Not that it's very clear what does page_size do.
> > 
> Page_size is the granularity on which to record the writes.
> For example, when page_size = 2MB, any writes are aligned to 2MB page boundary.
> If 8KB data is written, only single write record entry reported.
> 
> If the page_size = 4K, two write record entries reported.
> ( I assumed 4K aligned address to keep the example simple).


But you also said internally device maintains a bitmap.
So it will have to work hard to find a set bit in the map then?
Do we want to maybe give device an option to just return
a bitmap and have driver worry about it?

To me this looks like an optimization for when when devices keep writing
to the same page all the time?  Do you have data to show that's commonly
the case?  Instrumenting a driver would be one way to find out.

> > > >
> > > > > +
> > > > > +\paragraph{Device Write Records Start Command} \label{par:Basic
> > > > > +Facilities of a Virtio Device / Device groups / Group
> > > > > +administration commands / Device Migration / Device Write Records
> > > > > +Start Command}
> > > > > +
> > > > > +This command starts the write recording in the device for the
> > > > > +specified IOVA ranges.
> > > > > +
> > > > > +For the command VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START,
> > > > > +\field{opcode} is set to 0xe.
> > > > > +The \field{group_member_id} refers to the member device to be
> > accessed.
> > > > > +
> > > > > +The \field{command_specific_data} is in the format \field{struct
> > > > > +virtio_admin_cmd_write_record_start_data}.
> > > > > +
> > > > > +\begin{lstlisting}
> > > > > +struct virtio_admin_cmd_write_record_start_entry {
> > > > > +        le64 iova;
> > > > > +        le64 page_count;
> > > > > +};
> > > > > +
> > > > > +struct virtio_admin_cmd_write_record_start_data {
> > > > > +        le64 page_size;
> > > > > +        le32 count;
> > > > > +        u8 reserved[4];
> > > > > +        struct virtio_admin_cmd_write_record_start_entry
> > > > > +entries[]; };
> > > > > +
> > > > > +\end{lstlisting}
> > > > > +
> > > > > +The \field{count} is set to indicate number of valid \field{entries}.
> > > > > +The \field{iova} indicates the start IOVA address. The
> > > > > +\field{page_count} indicates number of pages of size
> > > > > +\field{page_size} starting from \field{iova} to record for write
> > > > > +reporting. VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START
> > > > > +command contains unique i.e. non overlapping IOVA range entries.
> > > > > +Whenever a memory write occurs by the device in the supplied IOVA
> > > > > +range, the device records the actual IOVA and number of bytes
> > > > > +written to the
> > > > IOVA.
> > > > > +These write records can be read by the the driver using
> > > > > +VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_READ command.
> > > > > +
> > > > > +This command has no command specific result.
> > > > > +
> > > > > +\paragraph{Device Write Record Stop Command} \label{par:Basic
> > > > > +Facilities of a Virtio Device / Device groups / Group
> > > > > +administration commands / Device Migration / Device Write Record
> > > > > +Stop Command}
> > > > > +
> > > > > +This command stops the write recording in the device for IOVA
> > > > > +ranges which were previously started using
> > > > > +VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START
> > > > > +command.
> > > > > +
> > > > > +For the command VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_STOP,
> > > > > +\field{opcode} is set to 0xf.
> > > > > +The \field{group_member_id} refers to the member device to be
> > accessed.
> > > > > +
> > > > > +This command does not have any command specific data.
> > > > > +This command has no command specific result.
> > > > > +
> > > > > +\paragraph{Device Write Records Read Command} \label{par:Basic
> > > > > +Facilities of a Virtio Device / Device groups / Group
> > > > > +administration commands / Device Migration / Device Write Records
> > > > > +Read Command}
> > > > > +
> > > > > +This command reads the device write records for which the write
> > > > > +recording is previously started using
> > > > VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START command.
> > > > > +
> > > > > +For the command VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_READ,
> > > > > +\field{opcode} is set to 0x10.
> > > > > +The \field{group_member_id} refers to the member device to be
> > accessed.
> > > > > +
> > > > > +\begin{lstlisting}
> > > > > +struct virtio_admin_cmd_write_records_read_data {
> > > > > +        le64 iova;
> > > > > +        le64 length;
> > > > > +};
> > > > > +
> > > > > +struct virtio_admin_cmd_dev_write_records_cnt {
> > > > > +        le32 count;
> > > > > +};
> > > > > +
> > > > > +struct virtio_admin_cmd_dev_write_records_result {
> > > > > +        le64 iova_entries[];
> > > > > +};
> > > > > +\end{lstlisting}
> > > > > +
> > > > > +The \field{command_specific_data} is in the format \field{struct
> > > > > +virtio_admin_cmd_write_records_read_data}. The driver sets the
> > > > > +\field {iova} indicating the start IOVA address for up to the
> > > > > +\field{length} number of bytes. The supplied IOVA range same or
> > > > > +smaller than the range supplied when write recording is started
> > > > > +by the driver in VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START
> > command.
> > > >
> > > > Seems pretty sparse. Lots of hypervisors chose to implement a bit
> > > > per page strategy.
> > > This command result addresses will feed into such bit.
> > 
> > Do we want to return it in this format then?
> I think yes, because converting to the bit is easy.
> Reporting bit requires bitmap being function of VM memory and not based on amount of written pages.

So, you are optimizing for when small # of bits are set.
Do you have data to show it's common?

I would maybe structure it like this:

- bitmap used at all times
- log is maintained as long as it's not full
- when log fills up just bitmap is used.

and at this point, we can maybe start with just a bitmap
and add the log optimization separate, and optional?




> > 
> > > >
> > > > > +
> > > > > +When the command completes successfully,
> > > > > +\field{command_specific_result} is in the format \field{struct
> > > > > +virtio_admin_cmd_dev_write_records_result}
> > > > > +and \field{command_specific_result} is in format of \field{struct
> > > > > +virtio_admin_cmd_dev_write_records_cnt} containing number of
> > > > > +write records returned by the device.
> > > >
> > > > what are these records though?
> > > >
> > > It is struct virtio_admin_cmd_dev_write_records_result.
> > > I will rephrase it to link to struct virtio_admin_cmd_dev_write_records_result.
> > >
> > > >
> > > > > When the command completes
> > > > > +successfully, the write records which are returned in the result
> > > > > +are cleared from the device and same records cannot be read
> > > > > +again. When new writes occur at same IOVA range or at different
> > > > > +once, those records can be read as new write records.
> > > >
> > > >
> > > > this last sentence just confuses.
> > > >
> > > How about just keeping below text rewrite?
> > > When the command completes successfully, the write records returned in the
> > result are cleared from the device.
> > 
> > I think we need to explain in more detail what exactly is expected to be
> > recorded and when.
> > 
> Ok. I will give second look now to improve this description.


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

