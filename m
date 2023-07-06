Return-Path: <virtio-comment-return-6756-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA45EB64DC
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Jul 2023 17:35:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 269ED71C84
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Jul 2023 17:35:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F03C6986809
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Jul 2023 17:35:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D589D986728; Thu,  6 Jul 2023 17:35:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DAFED98672A
	for <virtio-comment@lists.oasis-open.org>; Thu,  6 Jul 2023 17:34:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: fJ6GI-GxPZGvgAR55G4LLw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688664842; x=1691256842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRzRKb5moyAiHJAQ8tOibkFnjZTvQSllmW11w8EmmyE=;
        b=C2s5IfKmldWWleA/ZV1oFsXMARofrqyDLp5EcEs7mhWVUJVTBMdOKPmTfYA89zuad2
         AaS+QG7bG/M5aEIUZH6cPYs2PVYl0/hd80wnZZlD1PXb7+E3DnS6ZipC/lJ7yDLRYmK+
         0VQOMxwVQdRqJtOR1L4NjgS3CUDmMx4oFm1VsguZJludpntYPsVLUUFRQEWbVs9ud0Hw
         cqmKGseAt/wJ/wiT3NSqMebkMBxInQSYl5VvevOEXcxeum0LXapymwVUwHzcjgZtxOKS
         ZMzaP6/7VxwLXnJDzg598ddl2Y6Q856+9CTSdwuu2BWEaRisW3vQQvgE2BC1v/boCNbi
         FLrA==
X-Gm-Message-State: ABy/qLa9osu2ZqH7GDZiPH0e1F7rhlidDXUh8nJA/c072O1iBLHdywLV
	HPtAaNzFg5Q5yPgUtGaI6VWCQH7zyPRAPUOPZBsZvy+No2BZAU9ECYe83ZkN9cagzeeeOzEF9Cb
	2Xb3/GEZ60SeesBA0iSB9dd0xzXF514f1kw==
X-Received: by 2002:adf:e38e:0:b0:314:33a2:78fe with SMTP id e14-20020adfe38e000000b0031433a278femr2165652wrm.29.1688664842029;
        Thu, 06 Jul 2023 10:34:02 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGUM+ZXD75jxyt/Ca4/DtTzySD9WjqzPx6Wo2jUyEGxOV2yji3jRzLM3W+PUza9eJXABJlteg==
X-Received: by 2002:adf:e38e:0:b0:314:33a2:78fe with SMTP id e14-20020adfe38e000000b0031433a278femr2165621wrm.29.1688664841493;
        Thu, 06 Jul 2023 10:34:01 -0700 (PDT)
Date: Thu, 6 Jul 2023 13:33:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"sburla@marvell.com" <sburla@marvell.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230706132638-mutt-send-email-mst@kernel.org>
References: <20230706041714.65600-1-parav@nvidia.com>
 <20230706041714.65600-5-parav@nvidia.com>
 <87r0pluhqy.fsf@redhat.com>
 <PH0PR12MB5481ED484C57428AD3D959C5DC2CA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230706123954-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54817D2E9B0D7C5FE9EA2B0EDC2CA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54817D2E9B0D7C5FE9EA2B0EDC2CA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v10 4/4] transport-pci: Introduce group legacy group
 member config region access

On Thu, Jul 06, 2023 at 04:58:51PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, July 6, 2023 12:42 PM
> > 
> > We will need to detail how notifications work though. The reason is that the
> > legacy notifications are received by owner driver (which is not legacy!) and
> > forwarded to device.
> > We need to explain exactly how this is done for people who don't read minds
> > and did not follow 3 months of mailing list debates, and explain how this has the
> > same effect as triggering driver notification through the legacy interface.
> >
> I am not going to write driver implementation in the spec here.
> But I agree some high-level text is needed.
> With your suggestions
> 1. to merge pci and generic in one section,
> 2. add description to notification,
> 3. past rewrites provided in v9,
> 
> The draft of v11, looks like below. Please see how much more verbose to make it, if at all.
> 
> \paragraph{Legacy Driver Notification}\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / Legacy Driver Notifications}
> 
> If the group owner device or the group member device support driver
> notifications via a memory-mapped operation or I/O operation, these
> notifications are sent to the device via accessing such a notification region
> using a memory or I/O operation instead of sending the notifications through
> the administration command.

This paragraph adds very little information - just some vague hints at how things work.

> The driver of the owner device can send a driver notification to the member
> device by executing VIRTIO_ADMIN_CMD_LEGACY_COMMON_CFG_WRITE with the
> \field{offset} matching \field{Queue Notify} and the \field{data} containing
> the virtqueue index to be notified.
> 
> However, as many administration commands are used for slow path configuration,
> a separate fast path mechanism for such notifications is desired. For the
> SR-IOV group type, the optional command VIRTIO_ADMIN_CMD_LEGACY_NOTIFY_INFO
> addresses this need by returning to the driver one or more addresses which to
> be used to send such driver notifications.
> 
> In one example, the driver in the hypervisor which intercepts I/O BAR accesses
> for the \field{Queue Notify} can access the notification area directly as memory
> or I/O access (depending on what the device reported) instead of slow
> administration command.
> 
> For the command VIRTIO_ADMIN_CMD_LEGACY_NOTIFY_INFO the driver sets
> \field{opcode} to 0x6.
> The driver sets \field{group_member_id} which refers to the member device to be
> accessed. This command does not use \field{command_specific_data}.
> 
> This command is currently only defined for the SR-IOV group type. When the
> device supports VIRTIO_ADMIN_CMD_LEGACY_NOTIFY_INFO command, the group owner
> device hardwires VF BAR0 to zero in the SR-IOV Extended capability and the
> group member device does not use PCI BAR0 in all the Virtio PCI capabilities
> listed in section \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / Virtio Structure PCI Capabilities}.

After reading this I still have no clue at how these notifications work.
maybe it's in some other patch. Let's see v11.

Just making a wild guess:

it is true that
	to supply a driver notification to the device, it is possible
for the driver to write the vq index of the vq to be notified, in little
endian format, using a single 16 byte write at the address provided ?

and I am guessing that
	the write is an IO or a memory write, depending on the
	type of the BAR referred to?

then why don't we just say this?


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

