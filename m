Return-Path: <virtio-comment-return-4713-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C58DC64EC4
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Mar 2023 17:41:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 310D92CAD1
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Mar 2023 17:41:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 15BA69866C4
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Mar 2023 17:41:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 011999866BA; Mon,  6 Mar 2023 17:41:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-Id: <virtio-comment.lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E446E9866BD
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Mar 2023 17:41:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: D4UMG4HcPYO4Lwcmgoj_Pw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678124489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ck9Q9iygVAFuHD7YFCNOMOrGMoVTrUBa+PF80HVkSrg=;
        b=IInBgZZcrEGz1cPZ9VPaOp8FwTC9g6dFGgRy7ibE18a5FmsxFQ7V4fIWPOX/6EyxBj
         j2GPDX8bwETdbVmQ3btwWLnbYMGGqhwugUpJGSfyJfIMoS+OyqWNUDOghpmB7Q68r/Da
         dMEcxIxB8EwqQSiKezUQjnuO7EuTEZlAQZ6C0NETeg4NYUfZS0nQ3yKoD0E+BFAMMB5g
         rV4EjBtQ8Dzd2NOoB/gIsqU0juQYReQ+seiyWTBA2fUpknO3UY0I9GouHTiJJGhwODqN
         cZ3GrEcg5shSJXzFTj3+YoW2V83xvscM3S3UrB1/7hdTzKvbHd7elDOqJDmKN23lDwoO
         Fu2A==
X-Gm-Message-State: AO0yUKUo14KJRy9uBck4WZFp+OPi7oenpLE2/BKwxPo4mFZMi0wTUuAq
	U0zZczUU4wRhrNbhXePFzPCeTZ3nBKyef6lsI/PAxIym/aSBI2SdS2i5Gt3DRBRws3b6y1Iqhwr
	TmTSq5rM+k7CklSvnxaIpthXFu3ws29DEww==
X-Received: by 2002:adf:db8d:0:b0:2c7:7af:9ae1 with SMTP id u13-20020adfdb8d000000b002c707af9ae1mr7436638wri.46.1678124489146;
        Mon, 06 Mar 2023 09:41:29 -0800 (PST)
X-Google-Smtp-Source: AK7set/CFRj0tVi+X8frZ327EJw4s9mmVUsl6/z8lDUMg3zsBvEaHjC5BmImfRCXa+dA7DOVtMyyvg==
X-Received: by 2002:adf:db8d:0:b0:2c7:7af:9ae1 with SMTP id u13-20020adfdb8d000000b002c707af9ae1mr7436620wri.46.1678124488752;
        Mon, 06 Mar 2023 09:41:28 -0800 (PST)
Date: Mon, 6 Mar 2023 12:41:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: "Afsa, Baptiste" <Baptiste.Afsa@harman.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Eugenio Perez Martin <eperezma@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20230306124013-mutt-send-email-mst@kernel.org>
References: <20221013074513.25141-1-baptiste.afsa@harman.com>
 <6380471.4BWXO1n1mU@silver>
 <20230301095017-mutt-send-email-mst@kernel.org>
 <2812377.Px9Efocobp@silver>
MIME-Version: 1.0
In-Reply-To: <2812377.Px9Efocobp@silver>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: VIRTIO_RING_F_INDIRECT_SIZE status

On Mon, Mar 06, 2023 at 04:00:37PM +0100, Christian Schoenebeck wrote:
> On Wednesday, March 1, 2023 3:55:57 PM CET Michael S. Tsirkin wrote:
> > On Wed, Mar 01, 2023 at 01:55:14PM +0100, Christian Schoenebeck wrote:
> > >   2.8 Packed Virtqueues
> > >   ...
> > >   2.8.5 Scatter-Gather Support [1]
> > >   ...
> > >   While unusual (most implementations either create all lists solely using   
> > >   non-indirect descriptors, or always use a single indirect element), if both 
> > >   features have been negotiated, mixing indirect and non-indirect descriptors 
> > >   in a ring is valid, as long as each list only contains descriptors of a 
> > >   given type.
> > > 
> > >   [1] https://docs.oasis-open.org/virtio/virtio/v1.2/cs01/virtio-v1.2-cs01.html#x1-770005
> > > 
> > > To avoid misapprehensions: the way I understand it, same restrictions apply to
> > > packed queues as split queues, in the sense that you may neither chain several
> > > tables in a single message, nor multi-level nest tables, nor mix a list of
> > > direct descriptors and indirect descriptors on the same level within one
> > > message. So the explicit exception described here, only means you may use
> > > *one* indirect table in one message, while using chained direct descriptors in
> > > another message. But that's it, right?
> > 
> > 
> > That's my understanding.
> > 
> > > > 2. Given this is a lot of work I am trying to find a way to
> > > > make the impact bigger. In particular to cover the use-case
> > > > of limiting s/g to 1k while making queues deeper (with
> > > > or without indirect). For this I proposed:
> > > > 
> > > > 	So I think that given this, we can limit the total number
> > > > 	of non-indirect descriptors, including non-indirect ones
> > > > 	in a chain + all the ones in indirect pointer table if any,
> > > > 	and excluding the indirect descriptor itself, and this
> > > > 	will address the issue you are describing here, right?
> > > > 
> > > > people seemed to be ok with this idea?
> > > 
> > > IIUIC it would not make a difference from design perspective from what I
> > > proposed, as virtio currently neither allows to mix, chain or mult-level nest
> > > indirect descriptor tables within a single message), and hence it would just
> > > boil down to adjusting the wording. So yes, it would therefore cover my
> > > intended use case.
> > > 
> > > Best regards,
> > > Christian Schoenebeck
> > 
> > 
> > Sounds good to me. One interesting case is scsi and blk which have
> > a seg_max field. This is defined as
> > 
> > \item[\field{seg_max}] is the maximum number of segments that can be in a
> >     command. A bidirectional command can include \field{seg_max} input
> >     segments and \field{seg_max} output segments.
> > 
> > it is never explained what *are* the segments, or how does it
> > interact with VQ depth. Current drivers interpret this
> > strictly and assume that this limits the s/g length but does not
> > allow you to exceed vq size.
> > 
> > Do we thus want two limits (for read and write descriptors)?
> 
> No opinion on that, as my intended use case was just extending the buffer size
> beyond queue size, not limiting it below queue size. Either way is fine with
> me.
> 
> Anyhow, as this now gets broader scope, that also means the suggested flag
> VIRTIO_RING_F_INDIRECT_SIZE needs to be renamed. VIRTIO_RING_F_BUFFER_SIZE?
> 
> Best regards,
> Christian Schoenebeck


Hmm that's unclear in that it might be in bytes too.
Given blk and scsi call these "segments" how about
VIRTIO_RING_F_SEG_MAX?


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

