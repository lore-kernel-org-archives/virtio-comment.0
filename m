Return-Path: <virtio-comment-return-7969-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A38C25B48
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 05:39:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5E78A2B07D
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 05:39:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 47A7D986A4C
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 05:39:48 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2F7D3986A44; Thu, 26 Oct 2023 05:39:48 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1D9E5986A45
	for <virtio-comment@lists.oasis-open.org>; Thu, 26 Oct 2023 05:39:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: dz3dt6kPPOiPAT0ry70Nzw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698298782; x=1698903582;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rlG0vTQcz8vr3LRnzHith4cUUucykEUCpPqxpmxfj54=;
        b=n+vCQpn0hTx74gNZXmoCK8BQdSiHkNyOf/m8IdcoBRjWhx2aZgwzsyx1nmTMAdVT9J
         kw+38AzGhXec4sZZPmCe0mmichwV6QLU/K4mNDEwvcmx1B1qs6R5fKYeB6DKP1KOzQEw
         mVAxGQRGEGOy/DY9ZGreJpJ9mQtrQgQQ36gxLLAL01qEKOl6MijQmXzXXeYdkPSzBhCd
         75iAocjAXvEFUOY89dknrJT4a4hJOOpyEzfo3LKBpbYuNZhuuChFFfTtLiUreE3j8fbU
         rYvQwskoF72k85td43uM1kZzydCNRTRevPjUJdhAAPTM4vxKmhVnt6NhOYXIoazrEeq+
         JocQ==
X-Gm-Message-State: AOJu0YxNHXPtS4wdGxVrNv0BXDLjO9MGFd5b0y1HLfouvlr1cAUCC2uM
	URZ6HOtHV6OUR9JSE3pU37eEahcex8XnQfdfCuTe2Fkrw3e9Whb0tc6tlsAJtigbAgIIHUsa53v
	2Emdc77n2QwwS2JlQK+3cZqA6CQgiwrE86Q==
X-Received: by 2002:a5d:53d1:0:b0:323:36f1:c256 with SMTP id a17-20020a5d53d1000000b0032336f1c256mr10647986wrw.11.1698298782035;
        Wed, 25 Oct 2023 22:39:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE97vE/BWOYLnxDRGZejHuTDkMfWzC49gGjQSnX3/AjcLKJkLcB+h8y/1AMpbcmXb4lusZV6w==
X-Received: by 2002:a5d:53d1:0:b0:323:36f1:c256 with SMTP id a17-20020a5d53d1000000b0032336f1c256mr10647976wrw.11.1698298781670;
        Wed, 25 Oct 2023 22:39:41 -0700 (PDT)
Date: Thu, 26 Oct 2023 01:39:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20231026013059-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB5481D21AD4CD4C649C4E023FDCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87zg09bfwg.fsf@redhat.com>
 <PH0PR12MB5481A3846046A484EFE20408DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87wmvdbehg.fsf@redhat.com>
 <PH0PR12MB548172C89C0213867F765012DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87ttqhbcy7.fsf@redhat.com>
 <PH0PR12MB5481723C85AF5B80689C9084DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB548149234F6B8F894387FAAADCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231025062207-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480246A4E61D071C4C60A69DCDDA@DM8PR12MB5480.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM8PR12MB5480246A4E61D071C4C60A69DCDDA@DM8PR12MB5480.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage

On Thu, Oct 26, 2023 at 03:30:56AM +0000, Parav Pandit wrote:
> 
> > From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> > open.org> On Behalf Of Michael S. Tsirkin
> > Sent: Wednesday, October 25, 2023 3:54 PM
> > 
> > On Wed, Oct 25, 2023 at 09:55:20AM +0000, Parav Pandit wrote:
> > > Hi Cornelia,
> > >
> > > > From: Parav Pandit <parav@nvidia.com>
> > > > Sent: Monday, October 23, 2023 8:52 PM
> > > > To: Cornelia Huck <cohuck@redhat.com>; Michael S. Tsirkin
> > > > <mst@redhat.com>
> > > > Cc: virtio-comment@lists.oasis-open.org; hengqi@linux.alibaba.com;
> > > > xuanzhuo@linux.alibaba.com; Shahaf Shuler <shahafs@nvidia.com>
> > > > Subject: RE: [virtio-comment] RE: [PATCH v3 2/2] content: Support
> > > > enabling virtqueue after DRIVER_OK stage
> > > >
> > > >
> > > > > From: virtio-comment@lists.oasis-open.org
> > > > > <virtio-comment@lists.oasis- open.org> On Behalf Of Cornelia Huck
> > > > > Sent: Monday, October 23, 2023 8:31 PM
> > > > >
> > > > > On Mon, Oct 23 2023, Parav Pandit <parav@nvidia.com> wrote:
> > > > >
> > > > > >> From: Cornelia Huck <cohuck@redhat.com>
> > > > > >> Sent: Monday, October 23, 2023 7:58 PM
> > > > > >
> > > > > >> On Mon, Oct 23 2023, Parav Pandit <parav@nvidia.com> wrote:
> > > > > >>
> > > > > >> >> From: virtio-comment@lists.oasis-open.org
> > > > > >> >> <virtio-comment@lists.oasis- open.org> On Behalf Of Cornelia
> > > > > >> >> Huck
> > > > > >> >> Sent: Monday, October 23, 2023 7:27 PM
> > > > > >> >
> > > > > >> >> Well, there are  still comments from me here that post-date
> > > > > >> >> v4 (please wait for a bit before posting another version!),
> > > > > >> >> so I'll continue waiting for them to be addressed first.
> > > > > >> > The last one was [1].
> > > > > >> > Which I replied few days ago at [2].
> > > > > >> >
> > > > > >> > [1]
> > > > > >> > https://lists.oasis-open.org/archives/virtio-comment/202310/m
> > > > > >> > sg00
> > > > > >> > 24
> > > > > >> > 0.h
> > > > > >> > tml [2]
> > > > > >> > https://lists.oasis-open.org/archives/virtio-comment/202310/m
> > > > > >> > sg00
> > > > > >> > 24
> > > > > >> > 2.h
> > > > > >> > tml
> > > > > >>
> > > > > >> I still have some open questions from
> > > > > >> <87sf68cjn0.fsf@redhat.com> (first and last paragraph.)
> > > > > >
> > > > > > Above link is not accessible to me. ☹
> > > > >
> > > > > That's not a link, but a message id... many mail clients support
> > > > > searching by it, and you can also get it from lore:
> > > > >
> > > > > https://lore.kernel.org/all/87sf68cjn0.fsf@redhat.com/
> > > > >
> > > > > > I addressed your comments/questions in v4.
> > > > > > Can you please check v4 if they are addressed? I rewrote as you
> > > > > > suggested in
> > > > > v3.
> > > > >
> > > > > This was for points you did not agree with. (Again, it might be
> > > > > helpful to wait with posting a new version until discussion has
> > > > > somewhat
> > > > > concluded.)
> > > > Sure, will wait next time.
> > > >
> > > > Your comment was,
> > > > =====
> > > > This is not really clear to me just from this text, especially if
> > > > you just wrote above that enabling or re-enabling is something
> > > > different... my understanding would be:
> > > >
> > > > - if neither dynamic vqs nor queue reset are supported or negotiated,
> > > >   the only way to enable a vq is before DRIVER_OK, during setup
> > > > - both of these features rely on the transport supporting enabling
> > > >   individual queues (either a queue that has not been enabled before, or
> > > >   a queue that has been reset)
> > > > - the transport is supposed to use the same mechanism for either
> > > >
> > > > Did I get it right? If so, I think we should make it a bit more clear.
> > > > =====
> > > >
> > > > Above is clarified in below wording without complicating the queue_reset
> > here.
> > > >
> > > > Does that look ok to you?
> > > >
> > > > +When VIRTIO_F_RING_DYNAMIC is not negotiated, the driver enables
> > > > +the virtqueues during the device initialization sequence, i.e.
> > > > +after the device sets the FEATURES_OK status bit
> > 
> > all status bits are set by driver
> >
> Well device clears it if it does not like the features.
> 
> Yes. I will rewrite it as, 
> 
> i.e. after the driver has verified that FEATURES_OK bit is set and before the driver sets DRIVER_OK bit.

shorter: i.e. after FEATURES_OK is set and before DRIVER_OK is set.

> > > and before the driver setting the
> > 
> > 
> > setting -> sets
> > 
> > > > DRIVER_OK status bit.
> > > > +
> > > > +When VIRTIO_F_RING_DYNAMIC is negotiated, the driver is not
> > > > +required to
> > 
> > try to avoid "required" outside conformance sections though pls.
> > And when used, we upper-case it.
> > 
> Ok.
> How about a rewrite as,
> 
> When VIRTIO_F_RING_DYNAMIC is negotiated, the driver may not enable every virtqueue, which the driver wants to use before setting the DRIVER_OK...

This repetition does not buy us much - verbose and "when" is confusing too, you just mean "if". So simply:

If VIRTIO_F_RING_DYNAMIC is negotiated,
the driver can choose to enable some virtqueues
after DRIVER_OK is set.


> 
> > > > +enable every virtqueue it wants to use before setting the DRIVER_OK
> > > > +status bit; the driver can choose to enable a virtqueue even after
> > > > +the driver has set the DRIVER_OK status bit.




>> The virtqueue enable
> > > > +mechanism is
> > > > transport specific.




I still feel there is no real explanation in a transport agnostic
manner what does it mean to "enable" virtqueue. Do you maybe just mean
"configure virtqueue"?


Can we just avoid talking about "enabling"?
Is it true that you can basically change anything you want about the vq
not just the enable bit? If so talking about enabling is just
confusing I think.

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

