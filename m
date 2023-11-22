Return-Path: <virtio-comment-return-8553-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE834C61D9B
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 13:37:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F252233589
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 13:37:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DBF879868A6
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 13:37:12 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CE84D986895; Wed, 22 Nov 2023 13:37:12 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C11EA986896
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 13:37:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: LXE_Y5fPOBqIj0ys4drXqw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700660229; x=1701265029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6L9djeeGJNyxTs8L+b83aATM0o8xSzvFKzg18s5Tx0=;
        b=HhopVnHx1QgshCHKs/Ogn3i10n5UuHn37uivSUrk63fX1dragyxbV1G5lzbdplDEby
         VDCt+WNA3MG34Ql6hFEZQi+/z0dbE9enUG9k0SwjG0N1k3FiR9/fbji/kafHvwXOpIwN
         zR0sObkqsZfU0HzhWFkyOLiQb3AkGNt+Ojx1g2Ic575XYARn4SHuR+f2MSoq+Rz7BHdO
         xuY1VDUY3otg3/jTgBncLVPRI+Llw/SOOG6zYIbZmSbT+fbSoTVSf8qpzfOl9Lvh9Qnh
         SGkYg66m9bpxOXp3l1q5kM2u7IvO4bMVkcdi14h0B5ckSu7m3YwFyCc4LcM9BuE9f60i
         gEtQ==
X-Gm-Message-State: AOJu0Yybt+SDh4JMZHPar3vhW7SWCvC9XQyJ2zBk5ZYvs4nYEhlmSvhu
	owm3SGd/l849hGjVq2Yy+1wUIMmslFH1f+9R8u7ZvdMPlFQrcA48sj+0RX6E/L/FZL+86LllK30
	P9MWkAqRu/q1YUdGcKY4uQ0NcbFUjBmsYJg==
X-Received: by 2002:a05:600c:3553:b0:405:34e4:14e3 with SMTP id i19-20020a05600c355300b0040534e414e3mr1547021wmq.3.1700660229175;
        Wed, 22 Nov 2023 05:37:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPMLTVIwESGhUdTaflXJF8GGii1uQ0by10Sjz/l9GwmKqBBP/TEVknoliXIUeYjfij/nf/GQ==
X-Received: by 2002:a05:600c:3553:b0:405:34e4:14e3 with SMTP id i19-20020a05600c355300b0040534e414e3mr1547004wmq.3.1700660228840;
        Wed, 22 Nov 2023 05:37:08 -0800 (PST)
Date: Wed, 22 Nov 2023 08:37:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Jason Wang <jasowang@redhat.com>, Parav Pandit <parav@nvidia.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20231122083353-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB5481577C0492D45C20CF9C62DCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvLYgnLtSqx_G=-KMuANEZ=xtAzJjV3pYqAZhA0qqW0sQ@mail.gmail.com>
 <PH0PR12MB54819A6E470D3ABE4BC1F450DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtxm8M5vKfOPOAS347JAJNeRDyPe+nif1LszuRWS0vShQ@mail.gmail.com>
 <PH0PR12MB54810EF71D0BF925F4F81A65DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtsMi9+MgDb=tTH=LrkReb3aZdB4wv-MJkxLmLhNmTDAg@mail.gmail.com>
 <20231121161218-mutt-send-email-mst@kernel.org>
 <7e440ddc-1765-406c-80b4-6a486ec2a232@intel.com>
 <20231122013133-mutt-send-email-mst@kernel.org>
 <1563eeea-9c8e-45d4-938d-048226f5b2d5@intel.com>
MIME-Version: 1.0
In-Reply-To: <1563eeea-9c8e-45d4-938d-048226f5b2d5@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] RE: [PATCH V2 3/6] virtio: dont reset vqs when
 SUSPEND

On Wed, Nov 22, 2023 at 06:03:57PM +0800, Zhu, Lingshan wrote:
> 
> 
> On 11/22/2023 2:49 PM, Michael S. Tsirkin wrote:
> > On Wed, Nov 22, 2023 at 09:51:45AM +0800, Zhu, Lingshan wrote:
> > > 
> > > On 11/22/2023 5:18 AM, Michael S. Tsirkin wrote:
> > > > On Tue, Nov 21, 2023 at 03:33:07PM +0800, Jason Wang wrote:
> > > > > > Lingshan claimed that suspending device is for live migration in commit log and in discussion he portray it as some basic facility unrelated to device migration such as debug etc.
> > > > > > Instead of claiming it as some non_device_migration facility does not make sense.
> > > > > It is used for migration for sure.
> > > > Well having a generic facility to stop device sounds like a nice thing.
> > > > However the devil is in the detail. A lot of detail here seems very much
> > > > tailored to a very specific implementation in mind.
> > > > So thinking through how it will work e.g. for power management
> > > > would be a good excercise to figure out how it should work in detail.
> > > > Parav did you indicate at some point a virtio specific SUSPEND
> > > > bit can be useful for PM? Could you share how it's better than
> > > > transport level PM and what the requirements are?
> > > > Thanks!
> > > Do you mean letting the device enter a new power state when SUSPEND,
> > > and such description in transport-pci.tex? Then resume normal
> > > state on DRIVER_OK.
> > That would be one example.
> OK, I will look into this.
> Roughly say in transport-pci.tex: When SUSPEND, the device MAY optionally
> enter a
> power-saving state.
> 
> Please allow me some time working on the details

Just this is likely not sufficient. I am not 100% sure what is wanted
here but let me try to guess - unlike normal suspend, this special
state is actually controlled by hypervisor.

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

