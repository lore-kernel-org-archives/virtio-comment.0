Return-Path: <virtio-comment-return-8613-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A3BEC61DF4
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 11:33:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5CB512AEE7
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 11:33:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 32BF19868AC
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 11:33:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1B8E69862D9; Fri, 24 Nov 2023 11:33:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0D2969868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 11:33:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: p1a5z2eaOR-fIDULbY3MUQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700825632; x=1701430432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fV2vRG8+h9JyvgRMLk5TXL+PAyfBNH0DP29eAqePi/c=;
        b=CqEof3/ojaATp4wkGr5J779bmER4v8CEVmOEsBDFWR5vMaFu1lOc+3Z5W1Df+QBF/j
         N0Pve2mzYqigPo0Gg5kbjULVa5g5JBG6wafvwXcGMe4cPYZXjW6t0rsLmVKN+M3KFkfa
         YguX9ooNAjM3v93QmvGpN4LDWh8iB+PIshCg++jgNYejy/hm1oyrxQoD12nNTircbZa+
         WAIZzkcIeVoAVWbr1q3TWXI71rZzcQxI/7ckc0Z4s6VDpY1sIrjVGIyRy8TSDAj3sZ+9
         tiaddRGq//5VcwyQQXoKHMHegtJM0E7qtyrHfdQrdKnD96/iLxqPxJDAGGy12kPcQC/+
         2XnQ==
X-Gm-Message-State: AOJu0YwH5k16ZdJjRBKzm80SLAoHHN3qJtOte/vA5behJznnxMS5jyMZ
	UYGoBU3XZvwjLyQy+OkNRamnRIGnPrtJyy2q4WdcU895UwF4bALQAoG2uiHxe3YhG5rj44JcXbh
	bQ5lpbeMRQT/lPAAL/sBNdfx+fc1EJ/Trrg==
X-Received: by 2002:a17:906:3a10:b0:9e7:76cc:92db with SMTP id z16-20020a1709063a1000b009e776cc92dbmr1692240eje.65.1700825632533;
        Fri, 24 Nov 2023 03:33:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpDveJMfEYt+lovNqoaeXZ7pyGX8Nd3YFPvXVEZU7V1ZUj8b24RwKBiCBmMAaH9uE2Esm6Sg==
X-Received: by 2002:a17:906:3a10:b0:9e7:76cc:92db with SMTP id z16-20020a1709063a1000b009e776cc92dbmr1692224eje.65.1700825632211;
        Fri, 24 Nov 2023 03:33:52 -0800 (PST)
Date: Fri, 24 Nov 2023 06:33:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	"si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	Heng Qi <hengqi@linux.alibaba.com>
Message-ID: <20231124062907-mutt-send-email-mst@kernel.org>
References: <20231110123853.2093309-3-parav@nvidia.com>
 <20231122084105-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481FF2A00B58060D9D69812DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231122094431-mutt-send-email-mst@kernel.org>
 <CACGkMEuEFsByRwTf_hAAZ+7-UuyYz-1wCP4vTpMAW6DbHQzVag@mail.gmail.com>
 <PH0PR12MB5481592754EE68E6F6A79EEEDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124002357-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54812482A68AC708A4E0764BDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124011125-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481437B4AA6C4CD4F1CED5BDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481437B4AA6C4CD4F1CED5BDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands

On Fri, Nov 24, 2023 at 06:31:03AM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Friday, November 24, 2023 11:48 AM
> > 
> > On Fri, Nov 24, 2023 at 05:40:26AM +0000, Parav Pandit wrote:
> > > > we
> > > > strongly suggest that *drivers* support both old and new mechanism,
> > > > and then *devices* will only implement what's required.
> > > There are other examples in the same document that makes things worst
> > with old and new.
> > >
> > > Also there is literally no way to enforce that driver supports both
> > > and new. It is just sounds like an excuse to force infinite config
> > > space.
> > 
> > There is a very simple method though.  We allow devices to expose a subset of
> > features when DMA is not used. So drivers that want maximum features will
> > always opt for DMA. We can also strongly recommend that all drivers support
> > DMA if available.
> Yeah, don't see how this is elegant at all with all mixed bits.

It's elegant because simple low end devices can cheaply implement MMIO
and not worry about DMA.

> Nor do I see any enforcement, single method via cvq still holds strong.

You don't need to enforce things, if people want to put a lot of
RAM on device and put it in a register let them.

> 
> > 
> > 
> > 
> > > The method proposed here is elegant and clearly promote one way to do
> > things for driver and device with predictability.
> > >
> > 
> > I don't see it as elegant at all. What is elegant is *a single tag* that describes
> > each property of the device. And this single tag should be good for everything:
> > driver, provisioning, migration. And config space offset serves as such.
> The single tag is the set of structures.

I have no idea how this will work. If migration format i started
reviewing is anything to go by then there will be a huge elaborate
structure nothing single or simple. By comparison there's already
a proposal how provisioning can work by supplying config space.
it is just a clean model to grasp.

> Provisioning access them via owner device.
> Member driver access them via CVQ or 1.2 legacy config space.


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

