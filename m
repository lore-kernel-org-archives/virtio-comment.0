Return-Path: <virtio-comment-return-4880-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C6EC6FD19
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Mar 2023 13:48:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4977771C84
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Mar 2023 13:48:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 37E1F986360
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Mar 2023 13:48:26 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2624198632B; Mon, 13 Mar 2023 13:48:26 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1358698633C
	for <virtio-comment@lists.oasis-open.org>; Mon, 13 Mar 2023 13:48:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 virtio-comment@lists.oasis-open.org,
 "Afsa, Baptiste" <Baptiste.Afsa@harman.com>,
 Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 13 Mar 2023 14:48:23 +0100
Message-ID: <28454255.D42MgBhrG9@silver>
In-Reply-To: <20230313090105-mutt-send-email-mst@kernel.org>
References:
 <20221013074513.25141-1-baptiste.afsa@harman.com> <2222004.mlUuFPspRX@silver>
 <20230313090105-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [virtio-comment] Re: VIRTIO_RING_F_INDIRECT_SIZE status

On Monday, March 13, 2023 2:06:00 PM CET Michael S. Tsirkin wrote:
> On Mon, Mar 13, 2023 at 12:48:11PM +0100, Christian Schoenebeck wrote:
> > On Tuesday, March 7, 2023 1:40:24 PM CET Christian Schoenebeck wrote:
> > > On Monday, March 6, 2023 10:50:53 PM CET Michael S. Tsirkin wrote:
> > > > On Mon, Mar 06, 2023 at 03:46:01PM -0500, Stefan Hajnoczi wrote:
> > > > > On Mon, Mar 06, 2023 at 12:41:25PM -0500, Michael S. Tsirkin wrote:
> > > > > > On Mon, Mar 06, 2023 at 04:00:37PM +0100, Christian Schoenebeck wrote:
> > > [...]
> > > > > > > Anyhow, as this now gets broader scope, that also means the suggested flag
> > > > > > > VIRTIO_RING_F_INDIRECT_SIZE needs to be renamed. VIRTIO_RING_F_BUFFER_SIZE?
> > > > > > > 
> > > > > > > Best regards,
> > > > > > > Christian Schoenebeck
> > > > > > 
> > > > > > 
> > > > > > Hmm that's unclear in that it might be in bytes too.
> > > > > > Given blk and scsi call these "segments" how about
> > > > > > VIRTIO_RING_F_SEG_MAX?
> > > > > 
> > > > > The VIRTIO equivalent of a "segment" is an "element".
> > > > 
> > > > Hmm true:
> > > > 	A buffer consists of zero or more device-readable physically-contiguous
> > > > 	elements followed by zero or more physically-contiguous
> > > > 	device-writable elements (each buffer has at least one element).
> > > > 
> > > > However we then need to clean this up, since
> > > > 
> > > > - At least in one place we say
> > > > 
> > > > indirect elements to mean indirect descriptors.
> > > > 
> > > > - we also say "queue elements" to mean "avail/desc/used"
> > > > - We also say "descriptor elements" - not 100% sure it's the same.
> > > > 
> > > > so we need to clean this up a bit first and maybe add
> > > > text about indirect descriptors not counting as elements.
> > > 
> > > With VIRTIO_RING_F_BUFFER_SIZE I actually had in mind that this limit was tied
> > > to per buffer/message (i.e. in contrast to a limit that would apply to the
> > > entire queue). But you are right, the name could mislead to the interpretation
> > > as if it was in bytes.
> > > 
> > > How about VIRTIO_RING_F_MAX_BUF_ELEMENTS?
> > 
> > Ping?
> > 
> > Michael, another thing: what was the rationale for your suggestion to exclude
> > the indirect descriptor itself from this limit?
> > 
> > While I agree that it makes sense to broaden the scope to the total amount of
> > all descriptors per buffer (as I wasn't aware before that it is indeed
> > permitted to mix chained direct and indirect descriptors in a split queue
> > buffer, and given that QEMU's implementation for instance just allocates them
> > on the stack), however I currently don't see why it would make sense to
> > exclude the indirect descriptor itself, as it makes things more complicated?
> > Did you have something specific in mind for that exclusion?
> > 
> > Best regards,
> > Christian Schoenebeck
> > 
> 
> It matches the requirement to limit the number of s/g elements. For
> example, both qemu and vhost need to limit this to 1K since  they are
> using the iov[1024] structure to pass buffers around.
> Indirect descriptors are just a different way to link to s/g elements
> they are not s/g elements themselves.

OK, I see, I am just wondering whether that wouldn't make phrasing this in the
spec unnecessarily more complicated and confusing. Not that I'd care much.

And what about my latest name suggestion VIRTIO_RING_F_MAX_BUF_ELEMENTS?

Best regards,
Christian Schoenebeck



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

