Return-Path: <virtio-comment-return-7913-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D8AC004C0
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 11:21:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BA4EA613D7
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 11:21:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 97CD298667A
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 11:21:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 808E998666C; Mon, 23 Oct 2023 11:21:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 700E898666D
	for <virtio-comment@lists.oasis-open.org>; Mon, 23 Oct 2023 11:21:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: h2FReyP3NhSLIFItt1Ouow-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698060109; x=1698664909;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0k+n+zrZ+tBv/MuB4I65TfUJJBDLhyJ+iUBXkpy4ohM=;
        b=PBXtiHQhN7NcCYjOz1tTcEeKlFoGgOsvoDA6EWcYQJSG5Yte1N7sq1/miDcPgBHwaY
         Ea1qO9iVk4HTKYD7WON6dGli1EHoUJzHZ411kZldeLVsS2QqXpFBa7DQZF/kgL1Ck5JM
         L/fZ1eSip6obBNk3UzbXzoU+MOTgyh7d2QRoXrMWaqjAITa5cQA0SY358dURNbvt5X0u
         NgJjoiul2ZX2WaF05BjjUBnQsV+yQiqh3VeqKQWmE18HXo4/gaAXGphl7CZG3l53euSC
         h0dsLoOAF6SsASVJhWQGUZJvFYZ8EKzqSrAphbD1dEmUFVy5X0GiDgR29uB1G/tUKuIu
         fniw==
X-Gm-Message-State: AOJu0YxZgVP15ZaxY3Gy0GdJ2zDCHDNQN1DMfFl5c76OkTf3/AblfetN
	Vj6UnapSdNjyR4z07Tvrh/EDkI3/DwVAX6U7A/fQH9ZdR35Z204KREgR+3UP7cqjA71pfQsYHLz
	+EtndqTaTdUXLhEdo1wCR/pOePdF/tQEWBg==
X-Received: by 2002:adf:a151:0:b0:32d:cb04:829b with SMTP id r17-20020adfa151000000b0032dcb04829bmr10040395wrr.12.1698060109341;
        Mon, 23 Oct 2023 04:21:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmrFZly2hgf4I1aIqZTKvvFVg7tT/xO/N0KehMvsbOuQFAgzVYzJOWarIQxtYFf32kCzV2jg==
X-Received: by 2002:adf:a151:0:b0:32d:cb04:829b with SMTP id r17-20020adfa151000000b0032dcb04829bmr10040374wrr.12.1698060108935;
        Mon, 23 Oct 2023 04:21:48 -0700 (PDT)
Date: Mon, 23 Oct 2023 07:21:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jasper Haag <jasper@bedrocksystems.com>
Cc: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org,
	Awais Masood <awais@bedrocksystems.com>,
	Gordon Stewart <gordon@bedrocksystems.com>
Message-ID: <20231023071953-mutt-send-email-mst@kernel.org>
References: <CA+c=0WfFVugbBN_fTeQb0RP6U+kQNO+uuC1L2wyb2rVAWeniaQ@mail.gmail.com>
 <878r7xd1e0.fsf@redhat.com>
 <20231020070230-mutt-send-email-mst@kernel.org>
 <CA+c=0WdA6-9NQs0jESN905nyU2k+mZThwnibavegQ616sY+QoQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+c=0WdA6-9NQs0jESN905nyU2k+mZThwnibavegQ616sY+QoQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [virtio-queue] CLARIFICATION: "free
 descriptors" External

On Fri, Oct 20, 2023 at 01:35:00PM -0400, Jasper Haag wrote:
> Folks,
> 
> Thank you kindly for the thoughtful responses! From the point of view
> of formal modelling/verification I think there is a lot of benefit to be had
> from tightening the language in the VIRTIO specification. I also think
> that the formal methods work we do at BedRock Systems puts us in a
> position to contribute on this front - although I need to coordinate with
> my managers regarding the logistics of such contributions, including sponsoring
> membership(s) to the "OASIS Virtual I/O Device (VIRTIO) Technical Committee"
> <https://www.oasis-open.org/committees/membership.php?wg_abbrev=virtio>.
> 
> > Maybe we should add some text like "free entries in the
> > descriptor table, henceforth referred to as 'free descriptors'".
> This clarified text seems like an improvement, but it still leaves some
> open questions in my mind - which Michael's response helps to tease
> out.
> 
> > Yes I think descriptors means free entries in the descriptor table.
> > I don't think the MUST there is right - in theory
> > I think the same descriptor chain can be used by multiple
> > buffers, though I am not aware of any drivers that do this.
> Overall, we're interested in understanding the ownership discipline
> involved with the descriptor-entry/payload "resources" (in the sense of
> linear logic). Our operational model will need to codify this discipline in
> order to track/cede ownership of these "resources" at the appropriate
> times, and aliasing will complicate the story here. To wit:
> 1) If a Device owns two buffers which alias each other's descriptors, and
>    sends one of the buffers back to the Driver, does the Device still own
>    the other buffer it hasn't yet returned, including the buffer's descriptors?
> 2) If a Device owns two buffers which alias payload memory, and sends one
>    of the buffers back to the Driver, does the Device still own the payload
>    memory referred to by the buffer it hasn't yet returned?

I would say yes.

> Along these lines, a few clarifications:
> i)   Are Drivers allowed to alias descriptor chain suffixes, or only complete
>      descriptor chains?
> ii)  May a Driver /simultaneously expose/ multiple buffers which share
> descriptor
>      chain (suffixes)?
> iii) May a Driver /simultaneously expose/ multiple buffers which (partially)
> alias
>      the same payload memory?

Nothing seems to disallow this. iii actually happens sometimes.

> 
> I look forward to continuing this discussion.
> 
> ~Jasper
> 
> On Fri, Oct 20, 2023 at 7:12 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> 
>     On Fri, Oct 20, 2023 at 12:38:47PM +0200, Cornelia Huck wrote:
>     > On Thu, Oct 12 2023, Jasper Haag <jasper@bedrocksystems.com> wrote:
>     >
>     > > To whom it may concern,
>     > >
>     > > BedRock Systems is working to formally model VIRTIO Queues and formally
>     > > verify our implementation of VIRTIO Queues <
>     > > https://github.com/bedrocksystems/vml/tree/main/devices/virtio_base>.
>     One
>     > > question which we've been unable to answer solely using the Standard
>     text
>     > > relates to "free descriptors" - as referred to within "2.7.13 -
>     Supplying
>     > > Buffers to The Device" <
>     > > https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/
>     virtio-v1.2-csd01.html#x1-6400013>.
>     > > In particular, the text states:
>     > >
>     > > | 2.7.13 - Supplying Buffers to The Device
>     > > | The driver offers buffers to one of the device’s virtqueues as
>     follows:
>     > > |     1. The driver places the buffer into free descriptor(s) in the
>     > > descriptor table, chaining as necessary (see 2.7.5 The Virtqueue
>     Descriptor
>     > > Table).
>     > > |      .....
>     > > |
>     > > | 2.7.13.1 - Placing Buffers Into The Descriptor Table
>     > > | A buffer consists of zero or more device-readable
>     physically-contiguous
>     > > elements followed by zero or more physically-contiguous device-writable
>     > > elements (each has at least one element).
>     > > | This algorithm maps it into the descriptor table to form a descriptor
>     > > chain:
>     > > | for each buffer element, b:
>     > > |     1. Get the next free descriptor table entry, d
>     > > |     2. Set d.addr to the physical address of the start of b
>     > > |     3. Set d.len to the length of b.
>     > > |     4. If b is device-writable, set d.flags to VIRTQ_DESC_F_WRITE,
>     > > otherwise 0.
>     > > |     5. If there is a buffer element after this:
>     > > |         a. Set d.next to the index of the next free descriptor
>     element.
>     > > |         b. Set the VIRTQ_DESC_F_NEXT bit in d.flags.
>     > > | In practice, d.next is usually used to chain free descriptors, and a
>     > > separate count kept to check there are enough free descriptors before
>     > > beginning the mappings.
>     > >
>     > > However, the term "free descriptor" doesn't appear to be defined
>     anywhere
>     > > within the Standard text. What characterizes such a "free descriptor",
>     and
>     > > does the use of the term "free descriptor" imply that the Driver MUST
>     NOT <
>     > > https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/
>     virtio-v1.2-csd01.html#x1-50003>
>     > > use the same descriptor within multiple chains?
>     > >
>     > > I look forward to hearing your clarification.
>     >
>     > My guess is that this is mostly a case of a bit of sloppyness in a very
>     > old part of the spec. A better term might be "free entries in the
>     > descriptor table" (or even "unused entries..."), although that would be
>     > a bit unwieldy. Maybe we should add some text like "free entries in the
>     > descriptor table, henceforth referred to as 'free descriptors'".
>     >
>     > Michael, what do you think?
> 
>     Yes I think descriptors means free entries in the descriptor table.
>     I don't think the MUST there is right - in theory
>     I think the same descriptor chain can be used by multiple
>     buffers, though I am not aware of any drivers that do this.
>     So I feel "free" here merely means "not used for some other
>     purpose". E.g. entries not referenced by any chains can be used
>     by driver to keep some data for its internal purposes
>     (and sometimes is) - if an entry is used like this and the driver
>     needs the data there then I guess it should not be used for
>     descriptors.
> 
>     We do say:
>             A driver MUST NOT alter virtqueue entries for exposed buffers,
>             i.e., buffers which have been
>             made available to the device (and not been used by the device)
>             of a live virtqueue.
>     So such chains must not be modified while available to device.
> 
> 
> 
> 
> 
> 
>     I also think we still need a lot of cleanup in the buffer/descriptor/entry
>     area. And I feel we should just bite the bullet and talk about entries
>     here though - descriptors are widely used to mean valid/available
>     entries.
> 
> 
>     --
>     MST
> 
> 
>     This publicly archived list offers a means to provide input to the
>     OASIS Virtual I/O Device (VIRTIO) TC.
> 
>     In order to verify user consent to the Feedback License terms and
>     to minimize spam in the list archive, subscription is required
>     before posting.
> 
>     Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>     Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>     List help: virtio-comment-help@lists.oasis-open.org
>     List archive: https://lists.oasis-open.org/archives/virtio-comment/
>     Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
>     List Guidelines: https://www.oasis-open.org/policies-guidelines/
>     mailing-lists
>     Committee: https://www.oasis-open.org/committees/virtio/
>     Join OASIS: https://www.oasis-open.org/join/
> 
> 


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

