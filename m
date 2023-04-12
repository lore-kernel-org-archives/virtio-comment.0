Return-Path: <virtio-comment-return-5426-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBCAC7619A
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Apr 2023 04:55:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E8D272AC49
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Apr 2023 04:55:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DDC4B98651C
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Apr 2023 04:55:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D5CE198650F; Wed, 12 Apr 2023 04:55:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C360598650E
	for <virtio-comment@lists.oasis-open.org>; Wed, 12 Apr 2023 04:55:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 2yfTK4EJNLanp46z5F-z_A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681275351; x=1683867351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=filE9Lqtnzk1DU5Kt4NqqjI1ImBhYxDbzsA2JLSiIkc=;
        b=kRPdPVtvwC1gqtNblUSJR8UoQ0NLV7cWa6o654DOIJYnaysTRqWuor8bSUZqkPPdIV
         BUIfSCZYhlBro5Xkcj+rBbfOjnmRXB6W7obmVvEQ7aI5NPH+mr50FE0qh3ojc9wZ5wrF
         kYz+kt8S/H/n0uQPmnTFCZj3kS4oP1VSTtUFhw9iwZoTNkFS6XDthODwATOY+OqGmf8+
         Rbq6KvnwT/wIvn85nBdmAxJcePe1zjh1avy/adtliG3/abqE8fNqKJo9GLaVVXNghOyx
         99XxssMif5PsuSR4l8nUfOgUZAnPSnDZKCDW7OiTl5BPc1Ton+fB8VHWXJ1XI45abp6T
         kxSQ==
X-Gm-Message-State: AAQBX9dWlpN0Sc27w1RjAk754SLrE/CaRSKGs0Uh08wgwjR4qIN4b5dw
	T84gCvb2/npVhgQNFOJuc1XEh1p9utd0AvfxHYZjiPSRVIEg6pJ5P4t/AzEYwKWWyVId8zVSqka
	ktyesOwDZlqcLx2MvIFjHhYZHi/fhVcRYwnvfc67mmPMIyIXt5w==
X-Received: by 2002:ac8:5c85:0:b0:3bf:b9d9:675f with SMTP id r5-20020ac85c85000000b003bfb9d9675fmr6283594qta.10.1681275351429;
        Tue, 11 Apr 2023 21:55:51 -0700 (PDT)
X-Google-Smtp-Source: AKy350YgY3Fh4OE8b4SJvBZOk9J1zZ5OHAy4uJy0qdTmas7wyg6RtUE7UEe6xjc9N5o5yfe6eQmwiv7kcLHA+OlzQf4=
X-Received: by 2002:ac8:5c85:0:b0:3bf:b9d9:675f with SMTP id
 r5-20020ac85c85000000b003bfb9d9675fmr6283587qta.10.1681275351212; Tue, 11 Apr
 2023 21:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230330225834.506969-1-parav@nvidia.com> <20230330225834.506969-9-parav@nvidia.com>
 <CACGkMEtMOy4B-O-52ka+9P3OBQ_hs1KvdjWodNYg-XKLff+giw@mail.gmail.com>
 <307a9f8f-6184-0403-97ab-1b1c16d4fd3c@nvidia.com> <CACGkMEucOwwFDMqyWA+DgYV7X=9f5-P4Ba_AP=5kTsjna=n+7A@mail.gmail.com>
 <PH0PR12MB548194B46A3E32329C10D00EDC9A9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEstkFaH1rh+O-D9h=bin_09ut2_GnSZDsxrQi_ptDtBKg@mail.gmail.com> <20230412002017-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230412002017-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 12 Apr 2023 12:55:39 +0800
Message-ID: <CACGkMEvQ5NgunpgrGiOkjfL0wBVWn6uZpoOOdiV8J932UaL-Jw@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>, 
	Satananda Burla <sburla@marvell.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [virtio-dev] [PATCH 08/11] transport-pci: Introduce virtio
 extended capability

On Wed, Apr 12, 2023 at 12:21=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com=
> wrote:
>
> On Wed, Apr 12, 2023 at 12:04:45PM +0800, Jason Wang wrote:
> > On Wed, Apr 12, 2023 at 3:01=E2=80=AFAM Parav Pandit <parav@nvidia.com>=
 wrote:
> > >
> > >
> > > > From: virtio-dev@lists.oasis-open.org <virtio-dev@lists.oasis-open.=
org> On
> > > > Behalf Of Jason Wang
> > > > Sent: Monday, April 10, 2023 11:29 PM
> > >
> > > > > However, it is not backward compatible, if the device place them =
in
> > > > > extended capability, it will not work.
> > > > >
> > > >
> > > > It is kind of intended since it is only used for new PCI-E features=
:
> > > >
> > > New fields in new extended pci cap area is fine.
> > > Migrating old fields to be present in the new extended pci cap, is no=
t your intention. Right?
> >
> > Right, but what I want to say is, such migration may cause unnecessary
> > problems. And I don't see why it is a must for your legacy MMIO bar
> > proposal.
> >
> > >
> > > > "
> > > > +The location of the virtio structures that depend on the PCI Expre=
ss
> > > > +capability are specified using a vendor-specific extended capabili=
ties
> > > > +on the extended capabilities list in PCI Express extended configur=
ation
> > > > +space of the device.
> > > > "
> > > >
> > > > > To make it backward compatible, a device needs to expose existing
> > > > > structure in legacy area. And extended structure for same capabil=
ity
> > > > > in extended pci capability region.
> > > > >
> > > > > In other words, it will have to be a both places.
> > > >
> > > > Then we will run out of config space again?
> > > No.
> > > Only currently defined caps to be placed in two places.
> >
> > What's the advantage of doing this?
> >
> > New drivers should provide backward compatibility so they must scan the=
 pci cap.
>
> No, they can start with express cap. Finding one they can skip
> the old cap completely.

Then the driver can't work on the old device.

Thanks

>
> > The Old driver can only scan the pci cap.
> >
> > > New fields don=E2=80=99t need to be placed in PCI cap, because no dri=
ver is looking there.
> >
> > It would be much more simple if we forbid placing new fields in the
> > PCI cap, it is already out of space.
> >
> > Thanks
> >
> > >
> > > We probably already discussed this in previous email by now.
> > >
> > > > Otherwise we need to deal with the
> > > > case when existing structures were only placed at extended capabili=
ty. Michael
> > > > suggest to add a new feature, but the driver may not negotiate the =
feature
> > > > which requires more thought.
> > > >
> > > Not sure I understand feature bit.
> > > PCI transport fields existence is usually not dependent on upper laye=
r protocol.
> > >
> > > > > We may need it even sooner than this because the AQ patch is expa=
nding
> > > > > the structure located in legacy area.
> > > >
> > > > Just to make sure I understand this, assuming we have adminq, any r=
eason a
> > > > dedicated pcie ext cap is required?
> > > >
> > > No. it was my short sight. I responded right after above text that AQ=
 doesn=E2=80=99t need cap extension.
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

