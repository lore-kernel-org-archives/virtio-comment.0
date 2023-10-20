Return-Path: <virtio-comment-return-7874-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F6ECDB474
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 11:12:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 76B0D774E7
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 11:12:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 66F6098692F
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 11:12:03 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 550A898692A; Fri, 20 Oct 2023 11:12:03 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 45A5A98692B
	for <virtio-comment@lists.oasis-open.org>; Fri, 20 Oct 2023 11:12:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: yBhRrO5UOgGfB1ZJk6xDLQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697800313; x=1698405113;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TotQWnoOAHHykuppLoOMkoqRNKqAe5gKOa7POD9UBUo=;
        b=okAjq03Vg50VcfNdorfXwTYlBXhmmcdNidstVlmGZ7fi4RH/6edzrkZ4ceyKgY+nx3
         /r0mfrL2FZRL5nopbbqPf4Efcm2E2LaOcx2D9u3TMVyv6s6/klvq8m6a+N3viMoMknDd
         f1rRhaTDdajzxCKkmOYPuBQ0fXDpH4YWeDdqOo/kTMnSKkHuox7WOaa+DvXP7VCneuwK
         Oq54hdRTS3jGlGt1FbZ6UPQAdKGa+z+L4TXjMeWrCR8MfQ1Ia5b+z9A9LwDQmlCeMTrx
         SFBqO5h9hAQfueWHnS7vdOHhi0bOrQJyPRZdasUq1sVyHFkna35n5vMXYDqqm1/pFdVu
         t3aQ==
X-Gm-Message-State: AOJu0YzA2egEAxQ+fT85Mw9+U7AJCgqSdZBaVXInEvWJx1svwYAMdbr/
	xNe4Jr9S1SItvFdeDN1dZZy3qZttY8DobEVQvASpsKuSdm0q0bddoVrm+FfdxpSkkBvv20w7jW8
	wEOz/oK9ViRA7URBwAzAw9azoPgXSHnKGLA==
X-Received: by 2002:a5d:5911:0:b0:329:2649:ced5 with SMTP id v17-20020a5d5911000000b003292649ced5mr1510296wrd.32.1697800313512;
        Fri, 20 Oct 2023 04:11:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlcW5Y7i+9c2+YLWhZ1mcGAcSWzPbxHGZj7yBShfS2C/GxhnTT8l+19AET+zzkToMmB7xfTg==
X-Received: by 2002:a5d:5911:0:b0:329:2649:ced5 with SMTP id v17-20020a5d5911000000b003292649ced5mr1510270wrd.32.1697800313099;
        Fri, 20 Oct 2023 04:11:53 -0700 (PDT)
Date: Fri, 20 Oct 2023 07:11:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Jasper Haag <jasper@bedrocksystems.com>,
	virtio-comment@lists.oasis-open.org,
	Awais Masood <awais@bedrocksystems.com>,
	Gordon Stewart <gordon@bedrocksystems.com>
Message-ID: <20231020070230-mutt-send-email-mst@kernel.org>
References: <CA+c=0WfFVugbBN_fTeQb0RP6U+kQNO+uuC1L2wyb2rVAWeniaQ@mail.gmail.com>
 <878r7xd1e0.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <878r7xd1e0.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [virtio-queue] CLARIFICATION: "free
 descriptors" External

On Fri, Oct 20, 2023 at 12:38:47PM +0200, Cornelia Huck wrote:
> On Thu, Oct 12 2023, Jasper Haag <jasper@bedrocksystems.com> wrote:
> 
> > To whom it may concern,
> >
> > BedRock Systems is working to formally model VIRTIO Queues and formally
> > verify our implementation of VIRTIO Queues <
> > https://github.com/bedrocksystems/vml/tree/main/devices/virtio_base>. One
> > question which we've been unable to answer solely using the Standard text
> > relates to "free descriptors" - as referred to within "2.7.13 - Supplying
> > Buffers to The Device" <
> > https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.html#x1-6400013>.
> > In particular, the text states:
> >
> > | 2.7.13 - Supplying Buffers to The Device
> > | The driver offers buffers to one of the device’s virtqueues as follows:
> > |     1. The driver places the buffer into free descriptor(s) in the
> > descriptor table, chaining as necessary (see 2.7.5 The Virtqueue Descriptor
> > Table).
> > |      .....
> > |
> > | 2.7.13.1 - Placing Buffers Into The Descriptor Table
> > | A buffer consists of zero or more device-readable physically-contiguous
> > elements followed by zero or more physically-contiguous device-writable
> > elements (each has at least one element).
> > | This algorithm maps it into the descriptor table to form a descriptor
> > chain:
> > | for each buffer element, b:
> > |     1. Get the next free descriptor table entry, d
> > |     2. Set d.addr to the physical address of the start of b
> > |     3. Set d.len to the length of b.
> > |     4. If b is device-writable, set d.flags to VIRTQ_DESC_F_WRITE,
> > otherwise 0.
> > |     5. If there is a buffer element after this:
> > |         a. Set d.next to the index of the next free descriptor element.
> > |         b. Set the VIRTQ_DESC_F_NEXT bit in d.flags.
> > | In practice, d.next is usually used to chain free descriptors, and a
> > separate count kept to check there are enough free descriptors before
> > beginning the mappings.
> >
> > However, the term "free descriptor" doesn't appear to be defined anywhere
> > within the Standard text. What characterizes such a "free descriptor", and
> > does the use of the term "free descriptor" imply that the Driver MUST NOT <
> > https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.html#x1-50003>
> > use the same descriptor within multiple chains?
> >
> > I look forward to hearing your clarification.
> 
> My guess is that this is mostly a case of a bit of sloppyness in a very
> old part of the spec. A better term might be "free entries in the
> descriptor table" (or even "unused entries..."), although that would be
> a bit unwieldy. Maybe we should add some text like "free entries in the
> descriptor table, henceforth referred to as 'free descriptors'".
> 
> Michael, what do you think?

Yes I think descriptors means free entries in the descriptor table.
I don't think the MUST there is right - in theory
I think the same descriptor chain can be used by multiple
buffers, though I am not aware of any drivers that do this.
So I feel "free" here merely means "not used for some other
purpose". E.g. entries not referenced by any chains can be used
by driver to keep some data for its internal purposes
(and sometimes is) - if an entry is used like this and the driver
needs the data there then I guess it should not be used for
descriptors.

We do say:
	A driver MUST NOT alter virtqueue entries for exposed buffers,
	i.e., buffers which have been
	made available to the device (and not been used by the device)
	of a live virtqueue.
So such chains must not be modified while available to device.






I also think we still need a lot of cleanup in the buffer/descriptor/entry
area. And I feel we should just bite the bullet and talk about entries
here though - descriptors are widely used to mean valid/available
entries.


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

