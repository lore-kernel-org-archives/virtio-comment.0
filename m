Return-Path: <virtio-comment-return-7807-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CCBCDB47E
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 10:26:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 75A801782A7
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 10:26:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6CB619868A5
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 10:26:20 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 60595986898; Wed, 18 Oct 2023 10:26:20 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 530EC986899
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 10:26:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: es4XiEvEP4yaGAGpDWyODw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697624771; x=1698229571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VsYaU861KXIRgFLv2xhHP2E43kzOT5O1P0PEoLeo2VE=;
        b=Ee9W6nTg2zPYHzE7qKHoqzWubnpTE/lIViaD3LhoDhWiYvKNzfkkPyVxJWPUfFxuNM
         kpvxe7d+SAkCy+bbwQ4skk905bLJ0U6TEe6q5Sk7+tNE7WL8FS8WtiwFr0sI9uO7mS+t
         NX0rdsRsYAbJhXTJWdrMKm/kYYNN1Qq+430TkmiuAqweHmkAa3U8Bi/pCT8F9F6nfsyi
         GxPgL6BUeS0FZkJzx+ptBde/p2HMk4Sft45Rw2cTm7UPQzaf5LauRcHm1ckcK9YQRyyV
         sjr+DWfNq7WOSgj5QG34yKZUQMrRl/2vlLrE/e6nckuwV4+vjhJrE6BmHrwn95C+g1T4
         fbFw==
X-Gm-Message-State: AOJu0YwMlMQYUH6/2wC5ZS+Y2Vt6bZ8+Eq1VFk5tJo+ICw3cQwNs7zHL
	q20Qn2uJ43FHpAkXSPq/FZ9CMkU8KkbuEdyIjdfXUdq8p4wdmCfgSFX+JO2e0T8+Juc6ISnvdce
	GtczqHl3OoX6ZnppAIP0gnNncfz+gn8enYQ==
X-Received: by 2002:a17:907:60cd:b0:9a9:f0e6:904e with SMTP id hv13-20020a17090760cd00b009a9f0e6904emr4074244ejc.16.1697624771361;
        Wed, 18 Oct 2023 03:26:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECiGo1nzb1TvQgQbxA/DWwBSdmPlLTNulbCfZWNEJ1WNFILANDYKqdIU33SomZGkIvngGdIw==
X-Received: by 2002:a17:907:60cd:b0:9a9:f0e6:904e with SMTP id hv13-20020a17090760cd00b009a9f0e6904emr4074223ejc.16.1697624770935;
        Wed, 18 Oct 2023 03:26:10 -0700 (PDT)
Date: Wed, 18 Oct 2023 06:26:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231018061958-mutt-send-email-mst@kernel.org>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-5-parav@nvidia.com>
 <20231018022502-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548141412C409813A4203DCDDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548141412C409813A4203DCDDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v1 4/8] admin: Add device migration admin commands

On Wed, Oct 18, 2023 at 08:24:56AM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, October 18, 2023 12:17 PM
> > 
> > On Sun, Oct 08, 2023 at 02:25:51PM +0300, Parav Pandit wrote:
> > 
> > ...
> > 
> > > +\paragraph{Device Context Size Get Command} \label{par:Basic
> > > +Facilities of a Virtio Device / Device groups / Group administration
> > > +commands / Device Migration / Device Context Size Get Command}
> > > +
> > > +This command returns the remaining estimated device context size. The
> > > +driver can query the remaining estimated device context size for the
> > > +current mode or for the \field{Freeze} mode. While reading the device
> > > +context using VIRTIO_ADMIN_CMD_DEV_CTX_READ command, the actual
> > > +device context size may differ than what is being returned by this
> > > +command. After reading the device context using command
> > > +VIRTIO_ADMIN_CMD_DEV_CTX_READ, the remaining estimated context
> > size
> > > +usually reduces by amount of device context read by the driver using
> > > +VIRTIO_ADMIN_CMD_DEV_CTX_READ command. If the device context is
> > > +updated rapidly the remaining estimated context size may also
> > > +increase even after reading the device context using
> > VIRTIO_ADMIN_CMD_DEV_CTX_READ command.
> > > +
> > > +For the command VIRTIO_ADMIN_CMD_DEV_CTX_SIZE_GET, \field{opcode}
> > is set to 0x9.
> > > +The \field{group_member_id} refers to the member device to be accessed.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_admin_cmd_dev_ctx_size_get_data {
> > > +        u8 freeze_mode;
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +The \field{command_specific_data} is in the format \field{struct
> > > +virtio_admin_cmd_dev_ctx_size_get_data}.
> > > +When \field{freeze_mode} is set to 1, the device returns the
> > > +estimated device context size when the device will be in \field{Freeze} mode.
> > > +As the device context is read from the device, the remaining
> > > +estimated context size may decrease. For example, member device mode
> > > +is \field{Stop}, the device has estimated total device context size
> > > +as 12KB; the device would return 12KB for the first
> > > +VIRTIO_ADMIN_CMD_DEV_CTX_SIZE_GET command, once the driver has
> > > +already read 8KB of device context data using
> > > +VIRTIO_ADMIN_CMD_DEV_CTX_READ command, and the remaining data is
> > 4KB,
> > > +hence the device returns 4KB in the subsequent
> > > +VIRTIO_ADMIN_CMD_DEV_CTX_SIZE_GET command.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_admin_cmd_dev_ctx_size_get_result {
> > > +        le64 size;
> > > +};
> > > +\end{lstlisting}
> > 
> > So we have a 64 bit size? How are we going to return so much?
> > 
> I agree it is a lot.
> But this is the case because one has defined struct virtio_pci_cap64.

Good point.

That's there so we can define 64 bit resources.

But if you have them and you want to migrate then you need change
tracking and incremental state save, you can not do it in
one shot with device context.


> > 
> > > +
> > > +When the command completes successfully,
> > > +\field{command_specific_result} is in the format \field{struct
> > virtio_admin_cmd_dev_ctx_size_get_result}.
> > > +
> > > +Once the device context is fully read, this command returns zero for
> > > +\field{size} until the new device context is generated.
> > > +
> > > +\paragraph{Device Context Read Command} \label{par:Basic Facilities
> > > +of a Virtio Device / Device groups / Group administration commands /
> > > +Device Migration / Device Context Read Command}
> > > +
> > > +This command reads the current device context.
> > > +For the command VIRTIO_ADMIN_CMD_DEV_CTX_READ, \field{opcode} is
> > set to 0xa.
> > > +The \field{group_member_id} refers to the member device to be accessed.
> > > +
> > > +This command has no command specific data.
> > 
> > So I am not sure this is wise. Multi-year experience with QEMU taught us that
> > we are likely to make mistakes when defining migration format - forget some
> > fields, validate them incorrectly, and so on.
> > Making a somewhat safe assumption that we'll make mistakes in the spec, too,
> > I'd like to see some kind of idea of how we'll support compatibility and/or
> > graceful failure if/when we do.
> > 
> Very valid point. In v2 I added the compatibility command at [1] as "Device Context Supported Fields Query Command"
> 
> [1] https://lists.oasis-open.org/archives/virtio-comment/202310/msg00195.html
> > 
> > > +\begin{lstlisting}
> > > +struct virtio_admin_cmd_dev_ctx_rd_len {
> > > +        le32 context_len;
> > > +};
> > > +
> > > +struct virtio_admin_cmd_dev_ctx_rd_result {
> > > +        u8 data[];
> > > +};
> > > +\end{lstlisting}
> > 
> > so callers needs to pin whatever device tells it to?
> > 
> How much memory to pin is driver choice, it can pin 4K and keep reading 1MB memory by 1MB/4K size calls.
> Or it can pin 1MB and read full.
> 
> > admin commands support truncation intentionally.
> > 
> > it is not clear, to me, that it's ok to have device just save as much state as it
> > wants to.
> Why would device store some unreasonable amount of state?

Because I know how hardware vendor minds work: oh we can request
a bunch of memory, let's do that just in case ;)

> > 
> > > +
> > > +When the command completes successfully,
> > > +\field{command_specific_result} is in the format \field{struct
> > > +virtio_admin_cmd_dev_ctx_rd_result}
> > > +returned by the device containing the device context data and
> > > +\field{command_specific_output} is in format of \field{struct
> > > +virtio_admin_cmd_dev_ctx_rd_len} containing length of context data
> > > +returned by the device in the command response. When the length
> > > +returned is zero or when the returned context data is less the data
> > > +requested by the driver, the device do not have any device context
> > > +data left that the device can report, at this point the device context stream
> > ends.
> > > +
> > > +The driver can read the whole device context data using one or
> > > +multiple commands. When the device context does not fit in the
> > > +\field{command_specific_result}, driver reads the subsequent
> > > +remaining bytes using one or more subsequent commands.
> > 
> > how?
> For example, driver requested 100 bytes.
> a. Device returned 40 bytes. So the whole context fit, nothing more to be done.
> Or
> b. Device returned 100 bytes, so driver does not know if there is more or not.
> Hence, driver request again for additional 100 bytes in 2nd call.
> If there is nothing, device returns success with zero bytes.
> If the device has 30 bytes more it returns 30 bytes. The returned bytes < requested bytes hence the read stream ends.

do you then expect device to maintain all data in some internal buffer,
then keep an offset internally and each following command returns a
different chunk?  all this sounds rather fragile, not to mention
wasteful wrt using memory for that internal buffer.

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

