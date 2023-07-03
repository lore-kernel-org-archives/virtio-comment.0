Return-Path: <virtio-comment-return-6688-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60121EB64DC
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Jul 2023 12:41:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A9A7816DD8C
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Jul 2023 12:41:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 99E4A986595
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Jul 2023 12:41:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 909FA986471; Mon,  3 Jul 2023 12:41:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7E75D98644C
	for <virtio-comment@lists.oasis-open.org>; Mon,  3 Jul 2023 12:41:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: hrgMTwnZMv6G1PhvSbrnPA-1
From: Cornelia Huck <cohuck@redhat.com>
To: virtio@lists.oasis-open.org
Cc: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org
Organization: Red Hat GmbH
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 03 Jul 2023 14:41:32 +0200
Message-ID: <874jml2mmb.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: [virtio-comment] [virtio 1.3] Feature freeze has started

As outlined in
https://lists.oasis-open.org/archives/virtio/202304/msg00036.html ff.,
as part of the release process for the 1.3 version of the virtio spec,
we have now entered feature freeze. This means:

***
By July 1st[3rd], all not yet integrated features that are targeting 1.3 need
to have at least a github issue open that is pointing to a patch (set)
on the list.
***

AFAICS, the list of features matching these criteria is the following:

https://github.com/oasis-tcs/virtio-spec/issues/173 ("virtio-net:
support inner header hash")
  * this looks very close, with voting likely to start in the next
    couple of days

https://github.com/oasis-tcs/virtio-spec/issues/167 ("Support
transitional device for PCIe VF")
  * I have not followed that one in detail, but it has been stated that
    this one should also be ready soon -- can people please confirm that
    this will be ready for inclusion in July?

https://github.com/oasis-tcs/virtio-spec/issues/170 ("The size of
virtio_net_hdr struct are wrong when VIRTIO_NET_HASH_REPORT feature is
negotiated.")
 * Can someone please check the status of this? Looks like a patch is
   available, but no progress for a long time? Is this maybe interacting
   with the inner header hash feature?

Any others that I have missed?

I'd like to wrap this up in July; not a real problem if we spill over
a couple of days into August, but I'd really like to avoid delaying the
process for too much (it will take long enough already.)

virtio 1.3 timeline:

Development

July 3rd: feature freeze (github issue                   <-- we are here
and change on list)

August 1st: change freeze (all voted
upon)

virtio-next development branch opens

August: prepare draft

August 31st (latest): draft voted upon by TC

September: public review period

October: addtl public review period, if needed

October (November): 1.3 released

merge virtio-next development branch


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

