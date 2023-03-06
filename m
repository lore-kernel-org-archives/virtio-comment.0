Return-Path: <virtio-comment-return-4721-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241FCC64EC4
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Mar 2023 21:51:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 467C52B04F
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Mar 2023 21:51:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3A7B59866BF
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Mar 2023 21:51:01 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2DCC6983C2D; Mon,  6 Mar 2023 21:51:01 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1B9C59866BE
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Mar 2023 21:51:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: X1_v9zOlPq6s5tp5AbO3oA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678139457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVAMgNWbk7fqBHrOtY31h2Kwb1eMiojdPeJ1cJvD6p4=;
        b=bTdXu19WjPCjnFMu+NxTG2BPEkasHXGBOr5SMiuV65895IoNSDJbAbXIRb9YoK9yZA
         DpAdkthJQE4g42695Pt5SQ4ITM0PgdCRhsLbq/MWtxLJbkmTVaQEIExPGmO7zWh0KPAR
         u2W0MtNzPrcYCQJ9skvTgdJeJBIKKPkKLf+C4qi5ZeIYGQhKI39RG/8u8LCK6ucI5nER
         D0HGMhFk6W2p2VmH9l1XlYTBoBBpruYJXl5UnLQ50Xcr7v+14DBk8kZAiT30FGT2BdpN
         9asKKcmnN/0eiRIAlGcrSEXrvk2clzmlSHAXR+4gB0AcMMPHBUlKwBdM45biyMYHE26V
         IKqA==
X-Gm-Message-State: AO0yUKUKStXdKVS368SngrXOp7ZXC8dZIEOJB1ML5pEBbBaMB/ql4Go/
	4nOv8QNbvYdF7ljbkoXYfZ/ikEkgVLiDjZEqFN/rRsrKzbQYECEX1H+p4CsVXftPfrkmX0EcNC3
	kZvTg8kYq7uRXFsp0Df9kEFggVxGkaKia33Y2ezVnBQ==
X-Received: by 2002:a05:600c:21d0:b0:3eb:38e6:f64d with SMTP id x16-20020a05600c21d000b003eb38e6f64dmr11419734wmj.39.1678139457706;
        Mon, 06 Mar 2023 13:50:57 -0800 (PST)
X-Google-Smtp-Source: AK7set+EHtSwNKechbx4Y0QqtpLsXbnVV48BMxpnnx+S9Znf8EM114rHnFZmZgwJN31IwoldfogsSQ==
X-Received: by 2002:a05:600c:21d0:b0:3eb:38e6:f64d with SMTP id x16-20020a05600c21d000b003eb38e6f64dmr11419723wmj.39.1678139457335;
        Mon, 06 Mar 2023 13:50:57 -0800 (PST)
Date: Mon, 6 Mar 2023 16:50:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
	"Afsa, Baptiste" <Baptiste.Afsa@harman.com>,
	Eugenio Perez Martin <eperezma@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20230306164500-mutt-send-email-mst@kernel.org>
References: <20221013074513.25141-1-baptiste.afsa@harman.com>
 <6380471.4BWXO1n1mU@silver>
 <20230301095017-mutt-send-email-mst@kernel.org>
 <2812377.Px9Efocobp@silver>
 <20230306124013-mutt-send-email-mst@kernel.org>
 <20230306204601.GC78491@fedora>
MIME-Version: 1.0
In-Reply-To: <20230306204601.GC78491@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: VIRTIO_RING_F_INDIRECT_SIZE status

On Mon, Mar 06, 2023 at 03:46:01PM -0500, Stefan Hajnoczi wrote:
> On Mon, Mar 06, 2023 at 12:41:25PM -0500, Michael S. Tsirkin wrote:
> > On Mon, Mar 06, 2023 at 04:00:37PM +0100, Christian Schoenebeck wrote:
> > > On Wednesday, March 1, 2023 3:55:57 PM CET Michael S. Tsirkin wrote:
> > > > On Wed, Mar 01, 2023 at 01:55:14PM +0100, Christian Schoenebeck wrote:
> > > > >   2.8 Packed Virtqueues
> > > > >   ...
> > > > >   2.8.5 Scatter-Gather Support [1]
> > > > >   ...
> > > > >   While unusual (most implementations either create all lists solely using   
> > > > >   non-indirect descriptors, or always use a single indirect element), if both 
> > > > >   features have been negotiated, mixing indirect and non-indirect descriptors 
> > > > >   in a ring is valid, as long as each list only contains descriptors of a 
> > > > >   given type.
> > > > > 
> > > > >   [1] https://docs.oasis-open.org/virtio/virtio/v1.2/cs01/virtio-v1.2-cs01.html#x1-770005
> > > > > 
> > > > > To avoid misapprehensions: the way I understand it, same restrictions apply to
> > > > > packed queues as split queues, in the sense that you may neither chain several
> > > > > tables in a single message, nor multi-level nest tables, nor mix a list of
> > > > > direct descriptors and indirect descriptors on the same level within one
> > > > > message. So the explicit exception described here, only means you may use
> > > > > *one* indirect table in one message, while using chained direct descriptors in
> > > > > another message. But that's it, right?
> > > > 
> > > > 
> > > > That's my understanding.
> > > > 
> > > > > > 2. Given this is a lot of work I am trying to find a way to
> > > > > > make the impact bigger. In particular to cover the use-case
> > > > > > of limiting s/g to 1k while making queues deeper (with
> > > > > > or without indirect). For this I proposed:
> > > > > > 
> > > > > > 	So I think that given this, we can limit the total number
> > > > > > 	of non-indirect descriptors, including non-indirect ones
> > > > > > 	in a chain + all the ones in indirect pointer table if any,
> > > > > > 	and excluding the indirect descriptor itself, and this
> > > > > > 	will address the issue you are describing here, right?
> > > > > > 
> > > > > > people seemed to be ok with this idea?
> > > > > 
> > > > > IIUIC it would not make a difference from design perspective from what I
> > > > > proposed, as virtio currently neither allows to mix, chain or mult-level nest
> > > > > indirect descriptor tables within a single message), and hence it would just
> > > > > boil down to adjusting the wording. So yes, it would therefore cover my
> > > > > intended use case.
> > > > > 
> > > > > Best regards,
> > > > > Christian Schoenebeck
> > > > 
> > > > 
> > > > Sounds good to me. One interesting case is scsi and blk which have
> > > > a seg_max field. This is defined as
> > > > 
> > > > \item[\field{seg_max}] is the maximum number of segments that can be in a
> > > >     command. A bidirectional command can include \field{seg_max} input
> > > >     segments and \field{seg_max} output segments.
> > > > 
> > > > it is never explained what *are* the segments, or how does it
> > > > interact with VQ depth. Current drivers interpret this
> > > > strictly and assume that this limits the s/g length but does not
> > > > allow you to exceed vq size.
> > > > 
> > > > Do we thus want two limits (for read and write descriptors)?
> > > 
> > > No opinion on that, as my intended use case was just extending the buffer size
> > > beyond queue size, not limiting it below queue size. Either way is fine with
> > > me.
> > > 
> > > Anyhow, as this now gets broader scope, that also means the suggested flag
> > > VIRTIO_RING_F_INDIRECT_SIZE needs to be renamed. VIRTIO_RING_F_BUFFER_SIZE?
> > > 
> > > Best regards,
> > > Christian Schoenebeck
> > 
> > 
> > Hmm that's unclear in that it might be in bytes too.
> > Given blk and scsi call these "segments" how about
> > VIRTIO_RING_F_SEG_MAX?
> 
> The VIRTIO equivalent of a "segment" is an "element".

Hmm true:
	A buffer consists of zero or more device-readable physically-contiguous
	elements followed by zero or more physically-contiguous
	device-writable elements (each buffer has at least one element).

However we then need to clean this up, since

- At least in one place we say

indirect elements to mean indirect descriptors.

- we also say "queue elements" to mean "avail/desc/used"
- We also say "descriptor elements" - not 100% sure it's the same.

so we need to clean this up a bit first and maybe add
text about indirect descriptors not counting as elements.




> I don't think the
> term "segment" is needed at the VIRTIO device model level since there is
> already a word for it.
> 
> I'm confused because VIRTIO_RING_F_BUFFER_SIZE and VIRTIO_RING_F_SEG_MAX
> mean different things to me and have different units (bytes vs number of
> segments).

What was requested was number of segments/elements.

> I wouldn't worry about virtio-blk/scsi seg_max. Although the segments
> map to virtqueue elements, seg_max has a specific SCSI/block level
> meaning related to data transfer and is not about constraints that apply
> to all virtqueue requests. I/O requests have headers/footers, so they
> can actually consume more elements than seg_max. Also, there could be
> non-data transfer requests that happen to consume more than seg_max and
> the storage controller would be happy with that (e.g. because VIRTIO
> mandates flexible framing so you could break a request into 1-byte
> elements). It's confusing the talk about seg_max at the VIRTIO device
> model level - it's not about virtqueues at all.
> 
> Stefan

OK thanks for the clarification.




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

