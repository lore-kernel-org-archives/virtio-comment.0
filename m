Return-Path: <virtio-comment-return-4879-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA4CC61DA4
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Mar 2023 13:06:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F334229FC6
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Mar 2023 13:06:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E8DF498635A
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Mar 2023 13:06:07 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DA3A5986312; Mon, 13 Mar 2023 13:06:07 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C98C998632B
	for <virtio-comment@lists.oasis-open.org>; Mon, 13 Mar 2023 13:06:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: iXGdjpG9O1Wh53wQU64HAw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678712764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emdvjjN7uQS+hGzHvQin3MPDwkwqluAMGqLAN0hvbqM=;
        b=7I6y49lKObjYeoHm+G5M2AZ9blDsnSqpd0Stpb7RZwpObcin9l+24L3mv3tLr1/Dj8
         k7epWMtSeQqLVBfwDc87UVTryTg4kdxOGNC+7u/bCkVqH6XSHsUudiGgOWN4UOF1pTYX
         4h+jlJQKxwei15Dc9ikYD1IxmKRah76kHQAJxUJu8DmqOAOHhhYht8tmIGjX/pbfabNm
         gh7HpXzCMfnRUgiy1h5qG6/tMdUANTP2ilU793Mm2H7ei19TDQf9LzudeLsUGHSziQA9
         2dILswogxvoHrCoZj3lx9kDUcKSYORbZj61Vpg949/8yrDE/xIStDHjiFPWXAAEHxN1x
         ZfTg==
X-Gm-Message-State: AO0yUKVlO9EZkOMWmaIbEzkDluni/ZkRg8TPatXamY6VDkKlTDZ7C2ZX
	I/HaQNP4hjIOTGaMfCdRRqwnT5fqgpWwBt6zWWfJbkte2YOs4mLAoOktd2O7Pk95JpS+V7BMKUj
	+ZOsQ8eDnh/PSuCb4lWqRcd6mMIkYTYPz0A==
X-Received: by 2002:a05:600c:b52:b0:3df:9858:c030 with SMTP id k18-20020a05600c0b5200b003df9858c030mr7773230wmr.5.1678712764604;
        Mon, 13 Mar 2023 06:06:04 -0700 (PDT)
X-Google-Smtp-Source: AK7set/eqaiMa3NrhAAdVH7no+bud9s6BgwCm6H/2QhnXhAmISJzy+3W1p0bh4wx22Ms3iIV1IiGXg==
X-Received: by 2002:a05:600c:b52:b0:3df:9858:c030 with SMTP id k18-20020a05600c0b5200b003df9858c030mr7773204wmr.5.1678712764298;
        Mon, 13 Mar 2023 06:06:04 -0700 (PDT)
Date: Mon, 13 Mar 2023 09:06:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
	virtio-comment@lists.oasis-open.org,
	"Afsa, Baptiste" <Baptiste.Afsa@harman.com>,
	Eugenio Perez Martin <eperezma@redhat.com>
Message-ID: <20230313090105-mutt-send-email-mst@kernel.org>
References: <20221013074513.25141-1-baptiste.afsa@harman.com>
 <20230306164500-mutt-send-email-mst@kernel.org>
 <4500675.UJKzesTpFh@silver>
 <2222004.mlUuFPspRX@silver>
MIME-Version: 1.0
In-Reply-To: <2222004.mlUuFPspRX@silver>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: VIRTIO_RING_F_INDIRECT_SIZE status

On Mon, Mar 13, 2023 at 12:48:11PM +0100, Christian Schoenebeck wrote:
> On Tuesday, March 7, 2023 1:40:24 PM CET Christian Schoenebeck wrote:
> > On Monday, March 6, 2023 10:50:53 PM CET Michael S. Tsirkin wrote:
> > > On Mon, Mar 06, 2023 at 03:46:01PM -0500, Stefan Hajnoczi wrote:
> > > > On Mon, Mar 06, 2023 at 12:41:25PM -0500, Michael S. Tsirkin wrote:
> > > > > On Mon, Mar 06, 2023 at 04:00:37PM +0100, Christian Schoenebeck wrote:
> > [...]
> > > > > > Anyhow, as this now gets broader scope, that also means the suggested flag
> > > > > > VIRTIO_RING_F_INDIRECT_SIZE needs to be renamed. VIRTIO_RING_F_BUFFER_SIZE?
> > > > > > 
> > > > > > Best regards,
> > > > > > Christian Schoenebeck
> > > > > 
> > > > > 
> > > > > Hmm that's unclear in that it might be in bytes too.
> > > > > Given blk and scsi call these "segments" how about
> > > > > VIRTIO_RING_F_SEG_MAX?
> > > > 
> > > > The VIRTIO equivalent of a "segment" is an "element".
> > > 
> > > Hmm true:
> > > 	A buffer consists of zero or more device-readable physically-contiguous
> > > 	elements followed by zero or more physically-contiguous
> > > 	device-writable elements (each buffer has at least one element).
> > > 
> > > However we then need to clean this up, since
> > > 
> > > - At least in one place we say
> > > 
> > > indirect elements to mean indirect descriptors.
> > > 
> > > - we also say "queue elements" to mean "avail/desc/used"
> > > - We also say "descriptor elements" - not 100% sure it's the same.
> > > 
> > > so we need to clean this up a bit first and maybe add
> > > text about indirect descriptors not counting as elements.
> > 
> > With VIRTIO_RING_F_BUFFER_SIZE I actually had in mind that this limit was tied
> > to per buffer/message (i.e. in contrast to a limit that would apply to the
> > entire queue). But you are right, the name could mislead to the interpretation
> > as if it was in bytes.
> > 
> > How about VIRTIO_RING_F_MAX_BUF_ELEMENTS?
> 
> Ping?
> 
> Michael, another thing: what was the rationale for your suggestion to exclude
> the indirect descriptor itself from this limit?
> 
> While I agree that it makes sense to broaden the scope to the total amount of
> all descriptors per buffer (as I wasn't aware before that it is indeed
> permitted to mix chained direct and indirect descriptors in a split queue
> buffer, and given that QEMU's implementation for instance just allocates them
> on the stack), however I currently don't see why it would make sense to
> exclude the indirect descriptor itself, as it makes things more complicated?
> Did you have something specific in mind for that exclusion?
> 
> Best regards,
> Christian Schoenebeck
> 

It matches the requirement to limit the number of s/g elements. For
example, both qemu and vhost need to limit this to 1K since  they are
using the iov[1024] structure to pass buffers around.
Indirect descriptors are just a different way to link to s/g elements
they are not s/g elements themselves.

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

