Return-Path: <virtio-comment-return-7958-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035C7C25B47
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 10:24:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 62ECA2A8DF
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 10:24:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 306399869E6
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 10:24:45 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 17EDF9869E3; Wed, 25 Oct 2023 10:24:45 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 065559869E4
	for <virtio-comment@lists.oasis-open.org>; Wed, 25 Oct 2023 10:24:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 0szQsQvPNxSsruysIKAWSA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698229470; x=1698834270;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BD3FTaThBhVKtZm0jdP6E+NbHGMT5ee4hiuL5VDP6qM=;
        b=enwA6xwDMmVwa5NoStEObrpr/cEsdAiLSG9vIFBvln5htbXQBLgm7G/9540jJLliEA
         ClwXGC5dBm5XhPN4YqV0FhLcOW2rm1ErHRavPXxX0LXGSlJzTWMa9KovQYwHjfwg/CVS
         /pcIja0T6DH7C+h5YSOtHmjqJCKdER4YNxdrynYqey1mgjJtnJjIdX8CpVxvQeZmfStw
         K+XBNR8UTARxLTDN/H97A3lK3Yx3Gvf43L0aPB8n7+VSkWnJbsvUbkBn1fADd3MOYPaZ
         pSsScI/mHDIrUSNbuaKWxKb2vODnNem37r6UvVxjdwZo/03o+NA9924Gk2pAU3nMe0Aa
         VKhg==
X-Gm-Message-State: AOJu0YznODaveMVpdcSH6bsXlzz6zoGtHLUeO8lWNe0mgcztvC0ckw5W
	ZrC+F9NwSjRvIx0jD3RFpVHaqgVvur0GmLOx+q7smYeLeXuGXGR6nV4ste9XPn7IyTocKyjeAi2
	UITjzHCbl6OMQ+yITDCt5EfMSK1p7FdFAsw==
X-Received: by 2002:a05:6512:62:b0:503:385c:4319 with SMTP id i2-20020a056512006200b00503385c4319mr10843932lfo.19.1698229470606;
        Wed, 25 Oct 2023 03:24:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHomO03kywl5yN/If6iIbP8tFCRl7SlkHHdbEPa9UcL7uytVBEuDTE74TrmGvvqHURqj+BSUw==
X-Received: by 2002:a05:6512:62:b0:503:385c:4319 with SMTP id i2-20020a056512006200b00503385c4319mr10843912lfo.19.1698229470259;
        Wed, 25 Oct 2023 03:24:30 -0700 (PDT)
Date: Wed, 25 Oct 2023 06:24:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20231025062207-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB5481DB9D38E58522F0B15EEFDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB548188345E2CF3B8AA5E2DEDDCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB5481D21AD4CD4C649C4E023FDCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87zg09bfwg.fsf@redhat.com>
 <PH0PR12MB5481A3846046A484EFE20408DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87wmvdbehg.fsf@redhat.com>
 <PH0PR12MB548172C89C0213867F765012DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87ttqhbcy7.fsf@redhat.com>
 <PH0PR12MB5481723C85AF5B80689C9084DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB548149234F6B8F894387FAAADCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548149234F6B8F894387FAAADCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage

On Wed, Oct 25, 2023 at 09:55:20AM +0000, Parav Pandit wrote:
> Hi Cornelia,
> 
> > From: Parav Pandit <parav@nvidia.com>
> > Sent: Monday, October 23, 2023 8:52 PM
> > To: Cornelia Huck <cohuck@redhat.com>; Michael S. Tsirkin
> > <mst@redhat.com>
> > Cc: virtio-comment@lists.oasis-open.org; hengqi@linux.alibaba.com;
> > xuanzhuo@linux.alibaba.com; Shahaf Shuler <shahafs@nvidia.com>
> > Subject: RE: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
> > virtqueue after DRIVER_OK stage
> > 
> > 
> > > From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> > > open.org> On Behalf Of Cornelia Huck
> > > Sent: Monday, October 23, 2023 8:31 PM
> > >
> > > On Mon, Oct 23 2023, Parav Pandit <parav@nvidia.com> wrote:
> > >
> > > >> From: Cornelia Huck <cohuck@redhat.com>
> > > >> Sent: Monday, October 23, 2023 7:58 PM
> > > >
> > > >> On Mon, Oct 23 2023, Parav Pandit <parav@nvidia.com> wrote:
> > > >>
> > > >> >> From: virtio-comment@lists.oasis-open.org
> > > >> >> <virtio-comment@lists.oasis- open.org> On Behalf Of Cornelia
> > > >> >> Huck
> > > >> >> Sent: Monday, October 23, 2023 7:27 PM
> > > >> >
> > > >> >> Well, there are  still comments from me here that post-date v4
> > > >> >> (please wait for a bit before posting another version!), so I'll
> > > >> >> continue waiting for them to be addressed first.
> > > >> > The last one was [1].
> > > >> > Which I replied few days ago at [2].
> > > >> >
> > > >> > [1]
> > > >> > https://lists.oasis-open.org/archives/virtio-comment/202310/msg00
> > > >> > 24
> > > >> > 0.h
> > > >> > tml [2]
> > > >> > https://lists.oasis-open.org/archives/virtio-comment/202310/msg00
> > > >> > 24
> > > >> > 2.h
> > > >> > tml
> > > >>
> > > >> I still have some open questions from <87sf68cjn0.fsf@redhat.com>
> > > >> (first and last paragraph.)
> > > >
> > > > Above link is not accessible to me. ☹
> > >
> > > That's not a link, but a message id... many mail clients support
> > > searching by it, and you can also get it from lore:
> > >
> > > https://lore.kernel.org/all/87sf68cjn0.fsf@redhat.com/
> > >
> > > > I addressed your comments/questions in v4.
> > > > Can you please check v4 if they are addressed? I rewrote as you
> > > > suggested in
> > > v3.
> > >
> > > This was for points you did not agree with. (Again, it might be
> > > helpful to wait with posting a new version until discussion has
> > > somewhat
> > > concluded.)
> > Sure, will wait next time.
> > 
> > Your comment was,
> > =====
> > This is not really clear to me just from this text, especially if you just wrote
> > above that enabling or re-enabling is something different... my understanding
> > would be:
> > 
> > - if neither dynamic vqs nor queue reset are supported or negotiated,
> >   the only way to enable a vq is before DRIVER_OK, during setup
> > - both of these features rely on the transport supporting enabling
> >   individual queues (either a queue that has not been enabled before, or
> >   a queue that has been reset)
> > - the transport is supposed to use the same mechanism for either
> > 
> > Did I get it right? If so, I think we should make it a bit more clear.
> > =====
> > 
> > Above is clarified in below wording without complicating the queue_reset here.
> > 
> > Does that look ok to you?
> > 
> > +When VIRTIO_F_RING_DYNAMIC is not negotiated, the driver enables the
> > +virtqueues during the device initialization sequence, i.e. after the
> > +device sets the FEATURES_OK status bit

all status bits are set by driver

> and before the driver setting the


setting -> sets

> > DRIVER_OK status bit.
> > +
> > +When VIRTIO_F_RING_DYNAMIC is negotiated, the driver is not required to

try to avoid "required" outside conformance sections though pls.
And when used, we upper-case it.

> > +enable every virtqueue it wants to use before setting the DRIVER_OK
> > +status bit; the driver can choose to enable a virtqueue even after the
> > +driver has set the DRIVER_OK status bit. The virtqueue enable mechanism is
> > transport specific.
> > +
> 
> Can you please respond?
> We must make progress with this and the flow filters which are depending on this for a long time now.


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

