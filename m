Return-Path: <virtio-comment-return-8486-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE8FC5ACB3
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 04:25:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B6C5D2AEE3
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 04:25:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ACC3D98688A
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 04:25:12 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9EC0098413B; Tue, 21 Nov 2023 04:25:12 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8F719986874
	for <virtio-comment@lists.oasis-open.org>; Tue, 21 Nov 2023 04:25:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: q8qx5C5RPAqvWqFu8pLuLA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700540708; x=1701145508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQPjx0T7VzPik86d6KlUUchYxQNDUrmXa5o1oW3eXWc=;
        b=R4praUAgTlVyRKS3UZwHp6j2sFRJrjYhOaOiyvCQy4CIhOypuFDADNQnDDxLI/S8Jq
         wNwWTXb9IE7wqSls37RXZhe9FdgKq7v39thfgFby5XZ5l0LiH+aIZCJzCToGORoo81Cs
         TgwZUUjldLIhiVkCVqNE9gpLcN1+Ytn8y6gMX6Ql2NvbaPnVkIM35+9nKqAw+xC36ta4
         dXwUs2Mw2eR8DxBszswe0uKW4pDeOoKWI1pE6LiKRj3bSZ44BlhvtHc8/Ovw21+AHE4d
         AFyfG2klB7KYzQyNYIM2kcdh79bAKi0TDvNs+LTc7NXUR++yHfk1crdD+88OPZX7dMUv
         +hzg==
X-Gm-Message-State: AOJu0YzBPtg/ceE2SBO5PAXtaTihrCTAqIhNlGG2Kd+TrFgBWvgS20/U
	TVqzKSmCfSZW1XaunDY90J2FRSLGNVPyKNI9z/BtTuOYVyHtyfQ4h4srzNW7ZLhilQWQ11Izmgh
	oj2h3kK4SPR5mkh5LooYoXwB7QDWVGo4gx+62GHRLJFwW8xYYuw==
X-Received: by 2002:ac2:5296:0:b0:507:ceba:a94d with SMTP id q22-20020ac25296000000b00507cebaa94dmr6813896lfm.14.1700540708551;
        Mon, 20 Nov 2023 20:25:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+qSWVopA5OGmka1iOyJmSiHLqNn2KNW6vpEhqHQnumFiRBlF8z4usl6iZEbXByD8PT3PFVjKkMsZo85l4YOc=
X-Received: by 2002:ac2:5296:0:b0:507:ceba:a94d with SMTP id
 q22-20020ac25296000000b00507cebaa94dmr6813886lfm.14.1700540708261; Mon, 20
 Nov 2023 20:25:08 -0800 (PST)
MIME-Version: 1.0
References: <PH0PR12MB54810AFC15EAC51755CFC045DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtP+W4mdfn5PszoSHW3tNS+KPAMKXvJhpWKa_NchxVpZA@mail.gmail.com>
 <PH0PR12MB54815F616E0CF024927984C2DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116004037-mutt-send-email-mst@kernel.org> <20231116023443-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548118E76BAFD5FA470B92A1DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116064611-mutt-send-email-mst@kernel.org> <PH0PR12MB54814EC9577B1197E2A13BDBDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116121958-mutt-send-email-mst@kernel.org> <PH0PR12MB5481F4D1B07F2809AA7D7C9BDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116131303-mutt-send-email-mst@kernel.org> <PH0PR12MB54818DBAE43A566C807E1AE9DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54818DBAE43A566C807E1AE9DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 21 Nov 2023 12:24:56 +0800
Message-ID: <CACGkMEvWK65GY_U4MMa6=43wqnM8T4-ALK07d7zEHp8Aa36wGg@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>, 
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of operation for write recording commands

On Fri, Nov 17, 2023 at 11:02=E2=80=AFAM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
>
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, November 16, 2023 11:51 PM
> >
> > On Thu, Nov 16, 2023 at 05:29:49PM +0000, Parav Pandit wrote:
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Thursday, November 16, 2023 10:56 PM
> > > >
> > > > On Thu, Nov 16, 2023 at 04:26:53PM +0000, Parav Pandit wrote:
> > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > Sent: Thursday, November 16, 2023 5:18 PM
> > > > > >
> > > > > > On Thu, Nov 16, 2023 at 07:40:57AM +0000, Parav Pandit wrote:
> > > > > > >
> > > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > Sent: Thursday, November 16, 2023 1:06 PM
> > > > > > > >
> > > > > > > > On Thu, Nov 16, 2023 at 12:51:40AM -0500, Michael S. Tsirki=
n wrote:
> > > > > > > > > On Thu, Nov 16, 2023 at 05:29:54AM +0000, Parav Pandit wr=
ote:
> > > > > > > > > > We should expose a limit of the device in the proposed
> > > > > > > > WRITE_RECORD_CAP_QUERY command, that how much range it can
> > > > track.
> > > > > > > > > > So that future provisioning framework can use it.
> > > > > > > > > >
> > > > > > > > > > I will cover this in v5 early next week.
> > > > > > > > >
> > > > > > > > > I do worry about how this can even work though. If you
> > > > > > > > > want a generic device you do not get to dictate how much =
memory
> > VM has.
> > > > > > > > >
> > > > > > > > > Aren't we talking bit per page? With 1TByte of memory to
> > > > > > > > > track
> > > > > > > > > -> 256Gbit -> 32Gbit -> 8Gbyte per VF?
> > > > > > > >
> > > > > > > > Ugh. Actually of course:
> > > > > > > > With 1TByte of memory to track -> 256Mbit -> 32Mbit ->
> > > > > > > > 8Mbyte per VF
> > > > > > > >
> > > > > > > > 8Gbyte per *PF* with 1K VFs.
> > > > > > > >
> > > > > > > Device may not maintain as a bitmap.
> > > > > >
> > > > > > However you maintain it, there's 256Mega bit of information.
> > > > > There may be other data structures that device may deploy as for
> > > > > example
> > > > hash or tree or something else.
> > > >
> > > > Point being?
> > > The device may have some hashing accelerator or other improvements th=
at
> > may perform better than bitmap as many queues in parallel attempt to up=
date
> > the shared database.
> >
> > Maybe, I didn't give this thought.
> >
> > My point was that to be able to keep all combinations of dirty/non dirt=
y page
> > for each 4k page in a 1TByte guest device needs 8MBytes of on-device me=
mory
> > per VF. As designed the query also has to report it for each VF accurat=
ely even if
> > multiple VFs are accessing same guest.
> Yes.
>
> >
> > > >
> > > > > And this is runtime memory only during the short live migration
> > > > > period of
> > > > 400msec or less.
> > > > > It is not some _always_ resident memory.

When developing the spec, we should not have any assumption for the
implementation. For example, you can't just assume virtio is always
emulated in the software in the DPU.

How can you make sure you can converge in 400ms without having a
interface for the driver to set the correct parameter like dirty
rates?

Thanks

> > > >
> > > > No - write tracking is used in the live phase of migration. It can
> > > > be enabled as long as you wish - it's a question of policy.  There
> > > > actually exist solutions that utilize this phase for redundancy, pe=
rmanently
> > running in this mode.
> > >
> > > If such use case exists, one may further improve the device implement=
ation.
> >
> > Yes such use cases exist, there is no limit on how long migration takes=
.
> > So go ahead and further improve it please. Do not give us "we did not g=
et
> > requests for this feature" please.
>
> Please describe the use case more precisely.
> If there is any application or OS API etc exists, please point to it wher=
e would you like to fit this dirty page tracking beyond device migration.
> We may have to draw a line to have reasonable point and not keep discussi=
ng infinitely.
>


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

