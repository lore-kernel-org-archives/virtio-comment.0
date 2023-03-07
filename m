Return-Path: <virtio-comment-return-4740-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3190FC6FA99
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Mar 2023 12:40:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5724126A26
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Mar 2023 12:40:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3EDA29866C8
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Mar 2023 12:40:31 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 32C969866C2; Tue,  7 Mar 2023 12:40:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2135A9866C3
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Mar 2023 12:40:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: "Afsa, Baptiste" <Baptiste.Afsa@harman.com>,
 Eugenio Perez Martin <eperezma@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Date: Tue, 07 Mar 2023 13:40:24 +0100
Message-ID: <4500675.UJKzesTpFh@silver>
In-Reply-To: <20230306164500-mutt-send-email-mst@kernel.org>
References:
 <20221013074513.25141-1-baptiste.afsa@harman.com>
 <20230306204601.GC78491@fedora>
 <20230306164500-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: [virtio-comment] Re: VIRTIO_RING_F_INDIRECT_SIZE status

On Monday, March 6, 2023 10:50:53 PM CET Michael S. Tsirkin wrote:
> On Mon, Mar 06, 2023 at 03:46:01PM -0500, Stefan Hajnoczi wrote:
> > On Mon, Mar 06, 2023 at 12:41:25PM -0500, Michael S. Tsirkin wrote:
> > > On Mon, Mar 06, 2023 at 04:00:37PM +0100, Christian Schoenebeck wrote:
[...]
> > > > Anyhow, as this now gets broader scope, that also means the suggested flag
> > > > VIRTIO_RING_F_INDIRECT_SIZE needs to be renamed. VIRTIO_RING_F_BUFFER_SIZE?
> > > > 
> > > > Best regards,
> > > > Christian Schoenebeck
> > > 
> > > 
> > > Hmm that's unclear in that it might be in bytes too.
> > > Given blk and scsi call these "segments" how about
> > > VIRTIO_RING_F_SEG_MAX?
> > 
> > The VIRTIO equivalent of a "segment" is an "element".
> 
> Hmm true:
> 	A buffer consists of zero or more device-readable physically-contiguous
> 	elements followed by zero or more physically-contiguous
> 	device-writable elements (each buffer has at least one element).
> 
> However we then need to clean this up, since
> 
> - At least in one place we say
> 
> indirect elements to mean indirect descriptors.
> 
> - we also say "queue elements" to mean "avail/desc/used"
> - We also say "descriptor elements" - not 100% sure it's the same.
> 
> so we need to clean this up a bit first and maybe add
> text about indirect descriptors not counting as elements.

With VIRTIO_RING_F_BUFFER_SIZE I actually had in mind that this limit was tied
to per buffer/message (i.e. in contrast to a limit that would apply to the
entire queue). But you are right, the name could mislead to the interpretation
as if it was in bytes.

How about VIRTIO_RING_F_MAX_BUF_ELEMENTS?




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

