Return-Path: <virtio-comment-return-8600-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EE6C61D97
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 06:20:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F397D42A6D
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 06:20:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C77419868B3
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 06:20:49 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AFE2F9862D9; Fri, 24 Nov 2023 06:20:49 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A0C709868A8
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 06:20:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 3NBmpw1WP5i-zZ28q8x6QA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700806844; x=1701411644;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R2FARY4+/dNVQ/FAmUm2evpritv9nGXS5MejhevkSwc=;
        b=bVlm7QP92WmKzmq3kviLIXcj+cl7zZ4jesZGwxozQxFivRDJmYi9nHFacII1S5FsWW
         U018dgbyyikaKm3uciffCtpxXl8FDsgmMN5CFT57+/2MLH/FMG41qOVFXLenn7SENP40
         YnZGhQEFz4g7CQ5hX2l6Q2mA3wH8YDSre/ZONV2fqdyFzPsPu98yIZao4n3cTn/lPqtT
         syc7T2BFg5xvLPIMXPoRhKARy+OHmrqI6IslmDHLT+7U2r4J9K5v5bKMg94zfoJtAqgX
         LdaB4eYuhkFNJmtweOUiOIqdnxBTYCwP88f+UpoDZM/HSsqRgApokifz0MkSOlv8lH2F
         y/+Q==
X-Gm-Message-State: AOJu0YyKMDPyqUjrlEYc0R9Z5aBpaXcxoTMDshcgzUI5ASE9ELB28kPw
	2r4Be7xvSSbMvkdyTd8d+POdR6txqJwSTGjxiczw/AjsGmjUT13TM5v8CoS5cI5FK+bPvNLenLP
	sytwzAV6NNlcoKc92QOmViywZpdcUUD0Ulg==
X-Received: by 2002:a05:6512:34c7:b0:505:8075:7c10 with SMTP id w7-20020a05651234c700b0050580757c10mr892826lfr.25.1700806844061;
        Thu, 23 Nov 2023 22:20:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqvj37Aw/gYzMtjtvUbnzKN6GzHKgVqqQmf+aR9DUq+p6IqHd4jTpkAB/ia+AqNvYPBT0srg==
X-Received: by 2002:a05:6512:34c7:b0:505:8075:7c10 with SMTP id w7-20020a05651234c700b0050580757c10mr892821lfr.25.1700806843711;
        Thu, 23 Nov 2023 22:20:43 -0800 (PST)
Date: Fri, 24 Nov 2023 01:20:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20231124011846-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB5481577C0492D45C20CF9C62DCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvLYgnLtSqx_G=-KMuANEZ=xtAzJjV3pYqAZhA0qqW0sQ@mail.gmail.com>
 <PH0PR12MB54819A6E470D3ABE4BC1F450DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtxm8M5vKfOPOAS347JAJNeRDyPe+nif1LszuRWS0vShQ@mail.gmail.com>
 <PH0PR12MB54810EF71D0BF925F4F81A65DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtsMi9+MgDb=tTH=LrkReb3aZdB4wv-MJkxLmLhNmTDAg@mail.gmail.com>
 <20231121161218-mutt-send-email-mst@kernel.org>
 <CACGkMEuLFxsAZ6W0SdJSEHw4gtgM-aehfC+oTLxH4zHxjMw3vw@mail.gmail.com>
 <PH0PR12MB5481CCD71A032A6590F14D8FDCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsqasttUGjOJwogPoU2+HFurFK+gxY1gO9Pg8+s4JReZQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEsqasttUGjOJwogPoU2+HFurFK+gxY1gO9Pg8+s4JReZQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] RE: [PATCH V2 3/6] virtio: dont reset vqs when
 SUSPEND

On Fri, Nov 24, 2023 at 11:25:41AM +0800, Jason Wang wrote:
> On Wed, Nov 22, 2023 at 2:32 PM Parav Pandit <parav@nvidia.com> wrote:
> >
> >
> > > From: Jason Wang <jasowang@redhat.com>
> > > Sent: Wednesday, November 22, 2023 10:59 AM
> > >
> > > On Wed, Nov 22, 2023 at 5:18 AM Michael S. Tsirkin <mst@redhat.com>
> > > wrote:
> > > >
> > > > On Tue, Nov 21, 2023 at 03:33:07PM +0800, Jason Wang wrote:
> > > > > > Lingshan claimed that suspending device is for live migration in commit
> > > log and in discussion he portray it as some basic facility unrelated to device
> > > migration such as debug etc.
> > > > > > Instead of claiming it as some non_device_migration facility does not
> > > make sense.
> > > > >
> > > > > It is used for migration for sure.
> > > >
> > > > Well having a generic facility to stop device sounds like a nice thing.
> > > > However the devil is in the detail. A lot of detail here seems very
> > > > much tailored to a very specific implementation in mind.
> > > > So thinking through how it will work e.g. for power management would
> > > > be a good excercise to figure out how it should work in detail.
> > >
> > > It might work in the case where there's no PM support in the transport. E.g for
> > > MMIO devices.
> > >
> > MMIO should implement PM like other transport. That brings the equivalency principle.
> >
> 
> MMIO are usually platform devices. I don't see the point.
> 
> Thanks

I don't understand what you are saying. Why does it make sense to
suspend individual platform devices when they are suspended
with the whole platform?

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

