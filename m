Return-Path: <virtio-comment-return-5647-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F54C77B7C
	for <virtio-comment@archiver.kernel.org>; Tue, 25 Apr 2023 21:11:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1D8EA23D41
	for <virtio-comment@archiver.kernel.org>; Tue, 25 Apr 2023 21:11:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9D52A986687
	for <virtio-comment@archiver.kernel.org>; Tue, 25 Apr 2023 21:11:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8E2D4986653; Tue, 25 Apr 2023 21:11:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 78470986485
	for <virtio-comment@lists.oasis-open.org>; Tue, 25 Apr 2023 21:11:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: OE2kdTqQNeS0NXAb5TmcEg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682457091; x=1685049091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IsgvjVQmN8fJe1/nhwr7A08wTwDOkWqrkEvNpNDpzw=;
        b=BM8WWQIP84lJI7dflXFW3mppDZBQgc33WrKZb1V998HDW4pJRA/3h1wJBtApefAARB
         zLf2acpr6GdX6eddeBgiKy0HnROcxHYQ/Rl8s7tKfEVz9JXA5GrHxB1WTSPLEmhdAfL2
         +Q3bdiadl22RssbERKGhOGADsgM7P3b/iXUSIpsU5VCXpYvEpifsaBMZ31SRRtOmNqEk
         2FGi7FXvjtYYKvX8KpPWVd/lEqM0qVQ59fo0WDknrtWQmsc5blh6yJi2RIkukXco5GR1
         bUlZbKUPRpcKsA0klIoK1fUfJqlgbD9VFiXMFbIYyre8s2j85VD/+i2f9lEmmitl75O3
         8WrA==
X-Gm-Message-State: AC+VfDxPPx58EvDdHjvts6vjjyVkKMv2qLFiA8+VAK+mF5hmqLOjLdNo
	+UEDwyORutpdJqVFJkdoP/p0hp/ncZxrxiLpXGqePdKJQ9YzTjflZiaeyRdhOAtu1KeSKbx+0b1
	yER5rLNsYE/oeHdc5Fq+H/J6px10DfWz9ng==
X-Received: by 2002:a5d:6e04:0:b0:2f7:cfe2:6507 with SMTP id h4-20020a5d6e04000000b002f7cfe26507mr123834wrz.20.1682457091390;
        Tue, 25 Apr 2023 14:11:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6L1i/9ificjEDbY7VOANQgSkNVR04QhyBA1A1bESLrtuUNzw3//QjvOGcy64r73zgW2MrWqA==
X-Received: by 2002:a5d:6e04:0:b0:2f7:cfe2:6507 with SMTP id h4-20020a5d6e04000000b002f7cfe26507mr123825wrz.20.1682457091096;
        Tue, 25 Apr 2023 14:11:31 -0700 (PDT)
Date: Tue, 25 Apr 2023 17:11:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230425170729-mutt-send-email-mst@kernel.org>
References: <20230419014639.919458-1-parav@nvidia.com>
 <20230419014639.919458-5-parav@nvidia.com>
 <20230424152919.70254ffa.pasic@linux.ibm.com>
 <PH0PR12MB5481ABEFADC3ECFD93E645FADC649@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230425150215.1c445755.pasic@linux.ibm.com>
 <20230425091058-mutt-send-email-mst@kernel.org>
 <20230425182008.707b3b56.pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20230425182008.707b3b56.pasic@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio-dev] RE: [virtio-comment] [PATCH v14 04/11]
 transport-pci: Avoid first vq index reference

On Tue, Apr 25, 2023 at 06:20:08PM +0200, Halil Pasic wrote:
> On Tue, 25 Apr 2023 09:15:14 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Tue, Apr 25, 2023 at 03:02:15PM +0200, Halil Pasic wrote:
> > > On Tue, 25 Apr 2023 04:10:00 +0000
> > > Parav Pandit <parav@nvidia.com> wrote:
> [..]
> > > > Sure. All you wrote is correct.
> > > >   
> > > 
> > > I'm happy we agree. All I say we may want to rewrite the 
> > > 
> > > "Each virtqueue is identified by a virtqueue index; virtqueue index
> > > range is from 0 to 65535 inclusive."
> > > as
> > > "Each virtqueue is uniquely identified by a virtqueue index. The number
> > > of supported virtqueues is device dependent, but can never exceed 65536.
> > > Thus 16 bit is sufficient to represent virtqueue indexes. If the number
> > > of virtqueues currently supported by some device is N, each of it is
> > > virtqueues is uniquely identified by a single index from the range
> > > [0..N-1]."  
> > 
> > Seems to be repeating same thing over and over.
> 
> Nod.
> 
> > This redundancy has cost, e.g. more places to change when we
> > talk about admin queues.
> > Yes it can not be any number 0 to 65535 but this kind of nitpicking
> > belongs in conformance statements not in general description.
> > 
> 
> I tend to agree. I would prefer to have it in some sort of conformance
> statement, but I would also prefer to have it in exactly one place (and
> not all over the place).
> 
> Regards,
> Halil
> 
> [..]

I don't feel there is much to say in one place. We did not in the past
specify what happens if drivers e.g. set queue select to a large number.
So some drivers might do just that for a variety of reasons.

In other words, given a queue there's an index
and i feel Parav's text explains what it is
pretty unambigously and also succintly.
I would even maybe drop the 0 to 65535 thing and just
say that it is 0 based.
What are the specific limitations on the index is already
explained elsewhere.


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

