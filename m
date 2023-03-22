Return-Path: <virtio-comment-return-4966-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB5BC6FD1C
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Mar 2023 03:53:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 82AFC2A81F
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Mar 2023 03:53:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7086198644E
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Mar 2023 03:53:14 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 64C0B98643D; Wed, 22 Mar 2023 03:53:14 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5328898643E
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Mar 2023 03:53:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: vpODBP9eNAir6te5hECoLg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679457191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRQEQsn9pksMXilj7dr3jDwK+wTJ6zkeFSo5WiuIq40=;
        b=X98SkpZU0Jp38TjB1LN8WJIlSW9UlYNMQquXJ/mA6v5EI4qvwVHjlbvoGC531UlZki
         fPrxPmYVjkrNJlzADweeJ4HCQTGyQDB/moDIsrk3rYtC+frrwqSJLkr1GQ4hIrPNsoTZ
         73BEL6d57jRLQ+lGfOPjW9FwBMQXshoYr46eWbCPLNh9vZDNzQzuDdJPF8N+ysH7bZ/1
         kdU7PlBhtIDLJ9wrn0WYInzUWC1067AytfNtVur4RTqjnuZm+j4wuyZ6k95s3sD+cq9G
         x6M0XKixOQn1l5Hmm4+eL37XWRx5ZGF1vjayFVke1qG5jAnAcV98XwrJo+pY31BrGjlb
         oWaA==
X-Gm-Message-State: AO0yUKVYgsDyiAUF7TBRIks8NS+044pbeSfNUYouRw4nWCDf+y1sfccs
	VhXqPw5DCFj8DD/YgGLkLrMIAFEBCU+XSCfCnLw8Uhjy59+Dbz/6NoYUTr4VSWGVYL4kuSClGAg
	CoX0n11yz3qufpTl0y3YJc/kHuEtn5fn5Wg==
X-Received: by 2002:a7b:cbc8:0:b0:3ed:ce6f:e86e with SMTP id n8-20020a7bcbc8000000b003edce6fe86emr4439656wmi.23.1679457191109;
        Tue, 21 Mar 2023 20:53:11 -0700 (PDT)
X-Google-Smtp-Source: AK7set/pklFHJPK1s3H7Nj/36hubkKNHp6iiF9YEUAS5PXVuqL6eNBcwQypgDh4at+q64Y2v3mZ9eQ==
X-Received: by 2002:a7b:cbc8:0:b0:3ed:ce6f:e86e with SMTP id n8-20020a7bcbc8000000b003edce6fe86emr4439644wmi.23.1679457190823;
        Tue, 21 Mar 2023 20:53:10 -0700 (PDT)
Date: Tue, 21 Mar 2023 23:53:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"pasic@linux.ibm.com" <pasic@linux.ibm.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230321234626-mutt-send-email-mst@kernel.org>
References: <20230321215834.225856-1-parav@nvidia.com>
 <20230321215834.225856-7-parav@nvidia.com>
 <20230321181704-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D1A39CACD02A2BBD4721DC869@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481D1A39CACD02A2BBD4721DC869@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v3 6/8] transport-ccw: Refer to the vq by its number

On Wed, Mar 22, 2023 at 02:45:00AM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, March 21, 2023 6:22 PM
> 
> > > +\begin{note}
> > > +\field{queue_select} was previously named as index.
> > 
> > sounds a bit strange, and \field{} is missing. If you insist I'd say
> > 	in previous versions of this specification,
> > 	field{queue_select} was also called queue \field{index}
> > 
> The field is missing because field index is no longer there.

But it was there. Look what it does, it formats in italics so
it stands out from rest of text, making it clear it is
field name (former one) and not the word "index" in english.

> > 
> > e.g. in blk we have this:
> >   In the legacy interface, VIRTIO_BLK_F_FLUSH was also
> >   called VIRTIO_BLK_F_WCE.
> > 
> > 
> > but I really feel this misses the point, the compat is needed
> > in the struct definition, not split out after usage
> > is described. This is why I proposed just making this a comment in the
> > struct. Why not?
> > 
> Sure comment is good to me too.
> In v0 you specifically asked to add note with example.
> You said "like "Note: this was previously known as QueueNumMax""
> It is hard to guess to write a comment when you mean "Note". :)

That referred to MMIO where it's a table not a listing.
I did not check the generated PDF the point is to make
the note appear near the field and also not damage the layout.
Pls take a look at how it looks in PDF - another option is
a footnote though it's a bit harder for readers to find these
and bad for accessibility. Again I don't think these work in listings,
there we are kind of limited to code comments.

> I will change to comment format.


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

