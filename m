Return-Path: <virtio-comment-return-5357-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19892C7619A
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Apr 2023 07:00:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2FA5D23D45
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Apr 2023 07:00:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 19D529863A4
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Apr 2023 07:00:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0C271983DFF; Tue, 11 Apr 2023 07:00:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E96E7986366
	for <virtio-comment@lists.oasis-open.org>; Tue, 11 Apr 2023 07:00:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: g0Bq7PkrMLmBfEw3Avut9Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681196432;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JMVgY4VRjTJb4UX3kMavmbHIS6GYCnYJDz3z99rbLD4=;
        b=PBP84xHnaf444c8l6Er89DAGYE5Mn4lT6uEg9YTrn/ajjL5uS+3P+DrnSJExQz7pLy
         twuGzVdC21cS6+sktoSgWW8XCbOs/eo29eceXPGXfAics2M7WOys9L90ZNiOsuMiGPy7
         0bmaIYzlRcwzfcOtHvIwN/g0PzzM5McdDc83aNSXgIIhTv/3df6hTUi3UMwsE536iyPm
         khNu4T4QeV9rS7yKYEXJPbrEfJdedRNJZPaeDdrFLqj5vHoxrpgR0sQaUDBwiAOF9WaR
         FsZsYjmVAVTY75Ry1A0FR2WBJq/Lea9nmAbUzC650VpL+Mvd2vFkoFoz6YqSTHZLUNjy
         2Ejw==
X-Gm-Message-State: AAQBX9colym8ZTVmMZVBEoXAFzjG6YCmnXkRWy2wFh1KXUUZwd7w//Dg
	w5v6XYc2YyivMiCzYl3fWFo+mXSpBMD2GopYi4C3edsGScdcxvuuk2ld80NgjupIKIhQi0GPsc+
	5FntrBuj2y28RqSwLhT68u7zFensQwZsS9A==
X-Received: by 2002:adf:f2d0:0:b0:2f0:58a:db85 with SMTP id d16-20020adff2d0000000b002f0058adb85mr4785564wrp.22.1681196432494;
        Tue, 11 Apr 2023 00:00:32 -0700 (PDT)
X-Google-Smtp-Source: AKy350YOeOWDYdCZYYQI8vZJIhaNUufAmPvKBBHjSlGx+qrmFpwSCQC+O3bHbWWaJExuVCACr0BXPA==
X-Received: by 2002:adf:f2d0:0:b0:2f0:58a:db85 with SMTP id d16-20020adff2d0000000b002f0058adb85mr4785549wrp.22.1681196432169;
        Tue, 11 Apr 2023 00:00:32 -0700 (PDT)
Date: Tue, 11 Apr 2023 03:00:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, virtio-dev@lists.oasis-open.org,
	cohuck@redhat.com, virtio-comment@lists.oasis-open.org,
	shahafs@nvidia.com, Satananda Burla <sburla@marvell.com>
Message-ID: <20230411025646-mutt-send-email-mst@kernel.org>
References: <20230330225834.506969-1-parav@nvidia.com>
 <20230330225834.506969-9-parav@nvidia.com>
 <CACGkMEtMOy4B-O-52ka+9P3OBQ_hs1KvdjWodNYg-XKLff+giw@mail.gmail.com>
 <20230410021619-mutt-send-email-mst@kernel.org>
 <CACGkMEsZXozY7iC7L3L9FC+o8dQGY9+Hhbag2Z-G-nxr9BvDdw@mail.gmail.com>
 <20230410055947-mutt-send-email-mst@kernel.org>
 <CACGkMEsKLeJ1q3Vh8h2JYM=-RcrGd+31yR1Zsw0U=SRd1JZugg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEsKLeJ1q3Vh8h2JYM=-RcrGd+31yR1Zsw0U=SRd1JZugg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [virtio-dev] [PATCH 08/11] transport-pci: Introduce virtio
 extended capability

On Tue, Apr 11, 2023 at 10:19:39AM +0800, Jason Wang wrote:
> On Mon, Apr 10, 2023 at 6:04 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Apr 10, 2023 at 03:16:46PM +0800, Jason Wang wrote:
> > > On Mon, Apr 10, 2023 at 2:24 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Mon, Apr 10, 2023 at 09:36:17AM +0800, Jason Wang wrote:
> > > > > On Fri, Mar 31, 2023 at 7:00 AM Parav Pandit <parav@nvidia.com> wrote:
> > > > > >
> > > > > > PCI device configuration space for capabilities is limited to only 192
> > > > > > bytes shared by many PCI capabilities of generic PCI device and virtio
> > > > > > specific.
> > > > > >
> > > > > > Hence, introduce virtio extended capability that uses PCI Express
> > > > > > extended capability.
> > > > > > Subsequent patch uses this virtio extended capability.
> > > > > >
> > > > > > Co-developed-by: Satananda Burla <sburla@marvell.com>
> > > > > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > > >
> > > > > Can you explain the differences compared to what I've used to propose?
> > > > >
> > > > > https://www.mail-archive.com/virtio-dev@lists.oasis-open.org/msg08078.html
> > > > >
> > > > > This can save time for everybody.
> > > > >
> > > > > Thanks
> > > >
> > > > BTW another advantage of extended capabilities is - these are actually
> > > > cheaper to access from a VM than classic config space.
> > >
> > > Config space/BAR is allowed by both of the proposals or anything I missed?
> > >
> > > >
> > > >
> > > > Several points
> > > > - I don't like it that yours is 32 bit. We do not need 2 variants just
> > > >   make it all 64 bit
> > >
> > > That's fine.
> > >
> > > > - We need to document that if driver does not scan extended capbilities it will not find them.
> > >
> > > This is implicit since I remember we don't have such documentation for
> > > pci capability, anything makes pcie special?
> >
> > yes - the fact that there are tons of existing drivers expecting
> > everything in standard space.
> >
> >
> > > >   And existing drivers do not scan them. So what is safe
> > > >   to put there? vendor specific? extra access types?
> > >
> > > For PASID at least, since it's a PCI-E feature, vendor specific should
> > > be fine. Not sure about legacy MMIO then.
> > >
> > > >   Can we make scanning these mandatory in future drivers? future devices?
> > > >   I guess we can add a feature bit to flag that.
> > >
> > > For PASID, it doesn't need this, otherwise we may duplicate transport
> > > specific features.
> >
> > i don't get it. what does PASID have to do with it?
> 
> My proposal is to allow PASID capability to be placed on top.

Assuming you mean a patch applied on top of this one.

> So what
> I meant is:
> 
> if the driver needs to use PASID, it needs to scan extend capability
> 
> So it is only used for future drivers. I think this applies to legacy
> MMIO as well.

sure

> > A new feature will allow clean split at least:
> > we make any new features and new devices that expect
> > express capability depend on this new feature bit.
> >
> > > >   Is accessing these possible from bios?
> > >
> > > Not at least for the two use cases now PASID or legacy MMIO.
> >
> > can't parse english here. what does this mean?
> 
> I meant, it depends on the capability semantics. Both PASID and legacy
> MMIO don't need to be accessed by BIOS. We can't change legacy BIOS to
> use legacy MMIO bars.
> 
> Thanks

makes sense.


now, imagine someone building a new device. if existing drivers are not
a concern, it is possible to move capabilities all to extended space. is
that possible while keeping the bios working?

> >
> >
> > > >
> > > > So I like this one better as a basis - care reviewing it and adding
> > > > stuff?
> > >
> > > There are very few differences and I will have a look.
> > >
> > > Thanks
> > >
> > > >
> > > > --
> > > > MST
> > > >
> >


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

