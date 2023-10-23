Return-Path: <virtio-comment-return-7914-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40BBC004C0
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 11:32:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 20DAF71C87
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 11:32:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0AE49986677
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 11:32:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id ECCBE98666C; Mon, 23 Oct 2023 11:32:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DD31B98666D
	for <virtio-comment@lists.oasis-open.org>; Mon, 23 Oct 2023 11:32:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: XHhQP7CEO_C-HV1VkP7dJw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698060745; x=1698665545;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOePFfyNeA8XnsiqE6aE7GnMYLCoggoKbVxJyDlxAOU=;
        b=W41PHZr5xFp3TmAwBcfwICJTsfOsxA5Xto+ttk78toraH+7MmjBUYVLlGPLiToXlZf
         6kXWi6QDiCOOml3fHpn9ICLU1P9nUpb7n5CGKcdpZ1tvuS9UNB4nCXyNlF6Z5ZB4KBmZ
         NSDWY66EVRHQhfD4vpHrH6Ixlsf47OlIbbN+1c8wvfvc2Hzq83rbJjJW7WHWY0I/Tt+c
         orNhY3XZfoG4y3uQudXVNt1fdHPv41R9PVYfjQD+wfLw3TYU1G69t9cgb3S9o1d1+vpB
         ZYl8hazqiOmsR9ZhNY7pXo1IYwQimvUwdqVHYNQ8E5K2N0MLcxYy10JUSRRSht5nNRrj
         V9kw==
X-Gm-Message-State: AOJu0Yx+cuqWNf8K/WTYVmKyXbcG5AXNc53OZB2sQ2FrNZsdMsXWBtQP
	sGndTU8AJCgVhb97WRc3vir5oV3kQ+a29spfGt+WSeTrJv0eNO2/3xHg4vu1ZghjHkKHY0Vb2og
	LQCplpH+xRd44I55ZlBZ3nHMtcdZz9a4Cfg==
X-Received: by 2002:adf:fd45:0:b0:32d:857c:d51d with SMTP id h5-20020adffd45000000b0032d857cd51dmr6298913wrs.60.1698060745152;
        Mon, 23 Oct 2023 04:32:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDUHjXzMYj2uRDWS1n39J89Eo9KWEcTNMo4e6ouP6fRRXywKhlNxTpN+JOI95jLWEFJVCiTQ==
X-Received: by 2002:adf:fd45:0:b0:32d:857c:d51d with SMTP id h5-20020adffd45000000b0032d857cd51dmr6298889wrs.60.1698060744787;
        Mon, 23 Oct 2023 04:32:24 -0700 (PDT)
Date: Mon, 23 Oct 2023 07:32:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231023072519-mutt-send-email-mst@kernel.org>
References: <7bc82c01-19ad-4180-914b-9304e10ef7c3@intel.com>
 <PH0PR12MB5481E858791CA8FD97C7F35EDCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019051406-mutt-send-email-mst@kernel.org>
 <daea1f54-1c85-4a4a-ac3a-c5ae97180e03@intel.com>
 <PH0PR12MB5481BE51210D429FA12EAB45DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fb012148-a71e-4856-95fe-6e75f011f3fb@intel.com>
 <20231020053534-mutt-send-email-mst@kernel.org>
 <3932dd54-f43a-40b6-8dba-962f997f7122@intel.com>
 <20231021112420-mutt-send-email-mst@kernel.org>
 <2cc0d8fc-8ed5-4b98-b5e7-3a86d3da80b0@intel.com>
MIME-Version: 1.0
In-Reply-To: <2cc0d8fc-8ed5-4b98-b5e7-3a86d3da80b0@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Mon, Oct 23, 2023 at 06:03:10PM +0800, Zhu, Lingshan wrote:
> config space, MMIO, registers work for years, what is wrong with them?

Nothing as such. They don't seem to be appropriate for all use-case
where people want to utilize virtio. I think a new transport
will be needed to address these.


> > 
> > > Config space is control path, DMA is data-path, let's better not mix them,
> > > we never expect to use config space to transfer data.
> > > 
> > > So we need DMA to transfer data, for example I take advantages of device DMA
> > > to logging dirty pages, This also applies to in-flight descriptors.
> > As long as you do, I personally see little benefit to retrieve parts of
> > state with memory mapped accesses.
> registers only control, and I personally believe a single register is much
> better
> than processing admin commands, more light-weight, more reliable, working
> for years.

Yea. It would be, if we could do everything through that register.
But we can't really. Migration has too much data to pass around
for that to be reasonable.

> Config space interfaces are fundamental for virtio-pci.


They are in fact fundamental to virtio. Multiple transports to
use config space are also fundamental.


> > 
> > > And we are implementing virito live migration, not only for PCI.
> > > 
> > > So both me and Jason keep repeating: We are implementing basic facilities,
> > > and the implementation is transport specific.
> > But the register based facilities you proposed are extremely limited and
> > seem to only work for migration. For example, it seems mostly useless for
> > debugging because retrieving state is rather complex and would
> > interfere with normal working of the device.
> If you want to prove the register controlling interfaces are extremely
> limited than admin vq or admin cmds,
> you are also proving config space registers are extremely limited than
> admin vq.

Yes. Migration needs ability to pass large amounts of data around, and
is too complex a functionality to work reliably without ability to
report errors.

> So the question still here: do you want to replace current virtio-pci common
> cfg
> with admin vq or admin cmds?

I think we need to add a new transport that will use admin commands.
Which one to use would be up to a specific device.


> And debug what? If you want to introduce more functionalities, we should
> discuss
> case by case.
> 
> If debugging vq state, it is as easy as read queue_size, I don't see the
> limitations
> as queue_size work for years.

No one reads queue_size. In fact for years we didn't have any debugging
functionality and we are fine. If we are adding it, it really needs to
be accessible when driver and device are wedged.


> I still believe our goal is to do our best, with our capabilities, to build
> the most optimal virtio spec
> as we can do. Not other goals.
> 
> Thanks
> Zhu Lingshan
> > 
> > 
> > > We have proposed to build admin vq based on our register solution, this can
> > > somehow even help tp resolve the nested issue.
> > > 
> > > But I see the proposed has been rejected.
> > > 
> > > I still believe the goal is to build a best spec, not "just can work" with
> > > limitations.
> > > 
> > > 
> > > 
> > > > 


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

