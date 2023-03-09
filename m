Return-Path: <virtio-comment-return-4839-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62703C61DA4
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Mar 2023 13:55:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 917962B14F
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Mar 2023 13:55:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8A0C798671D
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Mar 2023 13:55:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 82CE99866FC; Thu,  9 Mar 2023 13:55:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 72DF4986705
	for <virtio-comment@lists.oasis-open.org>; Thu,  9 Mar 2023 13:55:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: RYqm3eUyNMiWQ56wPYNQFA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678370121;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypWQ3MqWDxaGQlJbf1BaO9jqW6vlCO7UiRw+dgYV524=;
        b=LnhhVFO6T89iltmft/3bMdfZ4MoqNAOdI9ZZNjwJNA2JMVKIInow/gffwoTcff+nPR
         UAAEJsQ2BVV2OWzxphpE6V+npxMMiKYxAuPEH8pocKN+cRFSltp5F6eV+UAQ0S3Wqc8H
         EC49VQfeOxNmVIwb5rSpBAFBgfPz0qRsoO4YKuAx0Mr3+GZHQWd4Gk88BEtzjB1AwPpM
         zs+xjyw/vA+epIlfw2gzWoUF+ei9gfPlM5M7q6A3qS97Cyau20QRf9s+HupfI5tRkOWy
         z4E2nOM3dD1iMg9YujS1XVz/NmFiWiwvvGuB0SGxMkBmfq3u23px2i7Q2xEBX4b0pfSH
         eR+w==
X-Gm-Message-State: AO0yUKX4JEA82772rc5D9sSGjVSbfOmxkjqPv1siKTwaSwD9GX7p3vNW
	tL1r095lSXLE/lio3yfrASIVgAQ0mP5cEtTuxHtwdl5h+M5EMuG8nBQ6yGJUhla7YDia9fJ/4sJ
	COSk0QUrsJYxh2uRvqV4UMtDuzEzUCawIrg==
X-Received: by 2002:a17:907:a094:b0:8aa:c143:ffe1 with SMTP id hu20-20020a170907a09400b008aac143ffe1mr22985585ejc.48.1678370121616;
        Thu, 09 Mar 2023 05:55:21 -0800 (PST)
X-Google-Smtp-Source: AK7set/uRSmgg4uTO7E+ffkuc6kjQ0pieg3LE/QGTM1EXcmtJeEsjrPyoveQbgsQF9aUeVR2xLBZfA==
X-Received: by 2002:a17:907:a094:b0:8aa:c143:ffe1 with SMTP id hu20-20020a170907a09400b008aac143ffe1mr22985516ejc.48.1678370120394;
        Thu, 09 Mar 2023 05:55:20 -0800 (PST)
Date: Thu, 9 Mar 2023 08:55:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>,
	virtio-comment@lists.oasis-open.org,
	virtio-dev@lists.oasis-open.org, cohuck@redhat.com,
	sgarzare@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com,
	hang.yuan@intel.com, virtio@lists.oasis-open.org,
	pasic@linux.ibm.com, Shahaf Shuler <shahafs@nvidia.com>,
	Parav Pandit <parav@nvidia.com>
Message-ID: <20230309085432-mutt-send-email-mst@kernel.org>
References: <7f63fa0a-7deb-5875-6c6b-bfc651681653@redhat.com>
 <20230306112030.GB35392@fedora>
 <853c78d0-f752-05e9-d79d-811e82801627@nvidia.com>
 <20230306162538.GA56760@fedora>
 <e74483a4-38fa-99b5-86b8-785f0b98d029@nvidia.com>
 <20230308141317.GC299426@fedora>
 <18ddbf69-19a6-3c6b-9e42-aaae66e20bcf@nvidia.com>
 <20230308171523.GA320810@fedora>
 <20230308122017-mutt-send-email-mst@kernel.org>
 <20230309123542.GC370169@fedora>
MIME-Version: 1.0
In-Reply-To: <20230309123542.GC370169@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [virtio] Re: [PATCH v10 04/10] admin:
 introduce virtio admin virtqueues

On Thu, Mar 09, 2023 at 07:35:42AM -0500, Stefan Hajnoczi wrote:
> On Wed, Mar 08, 2023 at 12:21:46PM -0500, Michael S. Tsirkin wrote:
> > On Wed, Mar 08, 2023 at 12:15:23PM -0500, Stefan Hajnoczi wrote:
> > > > > > > Or we could say that admin commands must complete within bounded time,
> > > > > > > but I'm not sure that is implementable for some device types like
> > > > > > > virtio-blk, virtio-scsi, and virtiofs.
> > > > > > 
> > > > > > No we can't.
> > > > > > Some commands, for example FW upgrade can take 10 minutes and it's perfectly
> > > > > > fine. Other commands like setting feature bit will take 1 millisec.
> > > > > > Each device implements commands in a different internal logic so we can't
> > > > > > expect to complete after X time.
> > > > > 
> > > > > When I say bounded time, I mean that it finishes in a finite amount of
> > > > > time. I'm not saying there is a specific time X that all device
> > > > > implementations must satisfy. Unbounded means it might never finish.
> > > > 
> > > > There might be a chance that any command for any virtio device type will
> > > > never finish. Nothing new here in the adminq.
> > > > 
> > > > what one can do is to set a timeout for himself and if this timeout expire -
> > > > check the device status. If it needs_reset - do a reset. if status is ok,
> > > > then wait some more time.
> > > > After X retries, unmap buffers or reset the adminq.
> > > 
> > > Michael: What effect does resetting the group owner device have on group
> > > member devices?
> > 
> > virtio level reset? It's a good question. I'd expect them all to be
> > reset no?
> > 
> > > I'm concerned that this approach disrupts all group member devices. For
> > > example, you try to add a new device but the command hangs. In order to
> > > recover you now have to reset the group owner device and this breaks all
> > > the group member devices.
> > 
> > 
> > I agree. How about a VQ level reset though? Seems like exactly
> > what's needed here?
> 
> Yes, a new virtqueue-level reset feature would take care of this case.
> 
> Stefan

Why would we need a new one? We already have VIRTIO_F_RING_RESET.

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

