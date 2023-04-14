Return-Path: <virtio-comment-return-5476-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81831C77B70
	for <virtio-comment@archiver.kernel.org>; Fri, 14 Apr 2023 03:38:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 43C593364A
	for <virtio-comment@archiver.kernel.org>; Fri, 14 Apr 2023 03:38:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 18BB798679B
	for <virtio-comment@archiver.kernel.org>; Fri, 14 Apr 2023 03:38:13 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A403C986669; Fri, 14 Apr 2023 03:38:12 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7696A98661F
	for <virtio-comment@lists.oasis-open.org>; Fri, 14 Apr 2023 03:38:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: kNyQj7RTPN2s-Y2pyJON4Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681443487; x=1684035487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BbrjxtYmi5csHprGIVOohMPJp/xBCOlfsq9ni3Vy7Lg=;
        b=ctta6t+0jh/or47pFmVUkho4jnJT8J7aV5T4LFnsMkFVxUwpWF5r2aN1UdNsEtZh04
         ceAzO+INbmxdGspL8gFh90QBh8GGlEYpX+Ncx+KqXCsSOaT34FlSI11ic1R0y2iOaXbS
         K6zj9Zi5pcwfGiE3T5sF3VH82BZ0VlW85q3a0AhfY5FMPGhA0HVfe+B3e4mou8uOC2jy
         nTyCUYMF8J+wk8ZGT4pBeS0kpX9tNnZVurl3gydD1Fxt58g0v0wYgm1Q7TCES5pN4qk3
         oceVXB5tIcdKXHaZWh3oPiAEKkLWPyWBaC5zRonUwIvPVR4fsw3KRf9bOd2dRqcTe6Sd
         QDWQ==
X-Gm-Message-State: AAQBX9dDBWuEnze0TA2+s+3vbFnsCjBb5iRuZgnw2rQ1SjxjqCK7cmMk
	0AKlPOT0yca1s4ylNMMuk7b/OEcND6xLIO9TokhqE5yXlYlL9sso6auKxhUZE/DnMxs77MaEmcW
	Cc+9bU4Gxe/51oyHVgAyWaPTuH456gChMA+T/1jnyEJzwot32Tw==
X-Received: by 2002:a05:6808:1ce:b0:389:86c3:b1fb with SMTP id x14-20020a05680801ce00b0038986c3b1fbmr989494oic.9.1681443487354;
        Thu, 13 Apr 2023 20:38:07 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZVUs8C4eyMF/yzLJf2jvPN4UmGzTmAXYfLNJpJzRiTqv3KmkRUnVA2Ty/SW3M4CRcukRz0RBlU1ljhAYcpQ5E=
X-Received: by 2002:a05:6808:1ce:b0:389:86c3:b1fb with SMTP id
 x14-20020a05680801ce00b0038986c3b1fbmr989489oic.9.1681443487139; Thu, 13 Apr
 2023 20:38:07 -0700 (PDT)
MIME-Version: 1.0
References: <PH0PR12MB548118F57BB4B4A4F8DC9D7ADC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvYsz1fSPG+fKpRaZ05Ut7ffKwvMPvR8xbRBsXA_6vGQw@mail.gmail.com>
 <PH0PR12MB548137D7A25C99EAA42B4D12DC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEshW82qztmGw8YJWJ8=QCoRd6cPxQ+ySazxsO_o+U6c4Q@mail.gmail.com>
 <PH0PR12MB548147CF939CB9C2A0586310DC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu2B_GogDR9HUwB7mT8fkGh+Q_buPLz4nhwhK7h9k6BQQ@mail.gmail.com>
 <PH0PR12MB5481F0CF5A555A6BB2CE856CDC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuNOYOxvcSzrs0UFEyk+xOkGUpOfhK8rOy_Mebz5b5wdg@mail.gmail.com>
 <a74d3107-d38c-df15-e2ff-f848635f24bd@nvidia.com> <CACGkMEt+bGN7UYEopXPj0+deAnYm1VUNp05VvGHcJnkd8LzbGg@mail.gmail.com>
 <20230413130326-mutt-send-email-mst@kernel.org> <PH0PR12MB54819A5D8FCEC6375D80897DDC989@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvSSXyXQnRs=OiaSJnSEYHP83chL6-B5ZPCGx6TeW9W5Q@mail.gmail.com> <PH0PR12MB548135CF5268D979A6D8EDE8DC999@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB548135CF5268D979A6D8EDE8DC999@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 14 Apr 2023 11:37:56 +0800
Message-ID: <CACGkMEsHtC99kTTa0TrfeJuhV+F7e-WF7XRgbLJkCBQeAxW8pA@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>, 
	Satananda Burla <sburla@marvell.com>, Maxime Coquelin <maxime.coquelin@redhat.com>, 
	Yan Vugenfirer <yan@daynix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH 09/11] transport-pci: Describe PCI
 MMR dev config registers

On Fri, Apr 14, 2023 at 11:18=E2=80=AFAM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Thursday, April 13, 2023 11:10 PM
>
> > > We have two options to satisfy the requirements.
> > > (partly taken/repeated from Jason's yday email).
> > >
> > > 1. AQ (solves reset) + notification for building non transitional
> > > device that support perform well and it is both backward and forward
> > > compat
> > > Pros:
> > > a. efficient device reset.
> > > b. efficient notifications from OS to device c. device vendor doesn't
> > > need to build transitional configuration space.
> > > d. works without any mediation in hv for 1.x and non 1.x for all non-=
legacy
> > interfaces (vqs, config space, cvq, and future features).
> >
> > Without mediation, how could you forward guest config access to admin
> > virtqueue? Or you mean:
> >
> > 1) hypervisor medate for legacy
> > 2) otherwise the modern BARs are assigned to the guest
> >
> Right.
>
> > For 2) as we discussed, we can't have such an assumption as
> >
> > 1) spec doesn't enforce the size of a specific structure
> Spec will be extended in coming time.

It's too late to do any new restriction without introducing a flag.
Mandating size may easily end up with a architecte specific solution.

>
> > 2) bing vendor locked thus a blocker for live migration as it mandate t=
he layout
> > for the guest, mediation layer is a must in this case to maintain cross=
 vendor
> > compatibility
> >
> With PCI VF will have compatibility check and also vendor recommendations=
.

I'm not sure what type of recommendations you want.

We've already had:

1) features
2) config

And what you proposed is to allow the management to know the exact
hardware layout in order to check the compatibility? And the
management needs to evolve as new structures are added. This
complicates the work of management's furtherly which I'm not sure it
can work.

>
> > Hypervisor needs to start from a mediation method and do BAR assignment
> > only when possible.
> >
> Not necessarily.
>
> > > Cons:
> > > a. More AQ commands work in sw
> >
> > Note that this needs to be done on top of the transport virtqueue. And =
we
> > need to carefully design the command sets since they could be mutually
> > exclusive.
> >
> Not sure what more to expect out of transport virtqueue compared to AQ.
> I didn=E2=80=99t follow, which part could be mutually exclusive?

Transport VQ allows a modern device to be transported via adminq.

And you want to add commands to transport for legacy devices.

Can a driver use both the modern transport commands as well as the
legacy transport commands?

Thanks


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

