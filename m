Return-Path: <virtio-comment-return-5596-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EA5C77B61
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 16:44:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2D13D71CBA
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 16:44:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C13D4986741
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 16:44:22 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9C942986672; Mon, 24 Apr 2023 16:44:22 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 773C198642D
	for <virtio-comment@lists.oasis-open.org>; Mon, 24 Apr 2023 16:44:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: M-kC8qcKOSakggPHEhfejQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682354657; x=1684946657;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uRPHe+pV4jtcPP8Z6jVvfZdO84tz1hdh1EQZ1Z+gTJc=;
        b=GYLXuijLBZO8V8kL/0PcA597Ue4Hcq497O8/29UwfVfacTdQrgyJyuvp34eARfRux2
         zbv9N8laSQePKgRW4tX4H89cDHuha6FaC0sQ0zpaBmwYPSSOrPkoiMhBwMr/kPAENVCk
         sOB1uYEEoWqTkZS/N1uh3RNpUjUIhUdzfi9hetYUfcir59Yggv4gPds5jMlfYUw8SS0Z
         2q8xYsl4xNjdfcEst+bg2h+MD+qjGguveZ5De2P/Oj6UMzvp2KWGCxejfKml1aTGajNP
         yTYRoqviM5waHMsyXlZoLWBkvJMGHTAnK9Rs6EKUy+Wa7SwVe1GGC2Hetpb2tkPreoY6
         OxXw==
X-Gm-Message-State: AAQBX9dnUcCP0vlvZgmtGq2tQKqEYQp85ekolj4H6QJ/T0JeP1Lq6CAn
	3H/Hvlw/tXTYoU5v+RJVIkeHLiVZO53Mv536zmrkmcVfBdEE/fMgZeSLXj9KrlOyuxfIqF8Oni8
	jbzuS6TgRG3jNuDfVNDv5F6Oeqh/s1DwJHydXjwk/GNHVQHSBL0TrlZmY5isgdeojQ8jEhOdZLe
	iOLd6+IU0Q/co=
X-Received: by 2002:a05:600c:3659:b0:3f0:3ab2:a7e5 with SMTP id y25-20020a05600c365900b003f03ab2a7e5mr8649441wmq.34.1682354657010;
        Mon, 24 Apr 2023 09:44:17 -0700 (PDT)
X-Google-Smtp-Source: AKy350bBk8dJUQyWsEOHWwRWp7uQJgWfYVIhS9DgQpvLv1ecV4OCPifMiqCXFYXRMJtTMMtWcpUcSQ==
X-Received: by 2002:a05:600c:3659:b0:3f0:3ab2:a7e5 with SMTP id y25-20020a05600c365900b003f03ab2a7e5mr8649410wmq.34.1682354656523;
        Mon, 24 Apr 2023 09:44:16 -0700 (PDT)
Date: Mon, 24 Apr 2023 12:44:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	jasowang@redhat.com, mst@redhat.com, cohuck@redhat.com,
	sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com,
	Piotr.Uminski@intel.com, hang.yuan@intel.com
Cc: virtio@lists.oasis-open.org, Jiri Pirko <jiri@nvidia.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>, pasic@linux.ibm.com,
	Shahaf Shuler <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <cover.1682354275.git.mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] [PATCH v12 00/10] Introduce device group and device management

comments on previous one have all been minor, so I hope
this means we are close to merging this.

Change log:

since 11:
	addressed lots of comments, all minor. consistency with
	outstanding number->index and queue->enqueue work
	i did not intentionally drop any reviewed-by tags
	as all changes are minor - if yours is missing it is
	because I forgot to record it, sorry

	one "breaking" change in response to stefan's comment:
	in patch 5, num_queues has been specified not to include admin
	queues: just regular ones.

since v10:
	addressed lots of comments by Jiri, Stefan. Cornelia, Lngshan, Parav, Max

since v9:
	addressed comments by Parav, Max, Cornelia, David and Zhu Lingshan:
		added link to errno header from Linux
		rename _MEM to _MEMBER
		admin vq num is zero based
		clarify who sends commands where
		minor english tweaks
		clarify command length
		specify interaction with sriov capability
		correct commit log - NumVFs can be 0

	i could not decide what should happen when VFs are
	disabled. for now did not specify.

since v8:
	addressed comments by Cornelia - as we agreed on list
	
since v7:
	make high level error codes match linux, with virtio specific codes
		in a separate field
	renamed _ACCEPT to _USE since that's what it does
	clarified forward compatibility and non pci transports
	support multiple admin vqs
	conformance statements
	lots of changes all over the place to I changed author from Max
	to myself. Don't need to take credit but also don't want
	to blame Max for my mistakes.

since v6:

	- removed some extentions intended for future use.
	  We'll do them when we get there.

	- brought back command list query from v5 in a simplified form -
	  it's here to address the case where a single parent
	  can address multiple groups, such as PF addressing
	  transport vq and sriov vfs.

	- attempt to make terminology more formal.
	In particular a term for whoever controls the group.
 	I am still going back
	and forth between "parent" and "owner" - owner might
	be better after all since it will work if we ever
	have a self group. For now it's parent.

TODO (maybe?) - probably ok to defer until this part is upstream:

	Add "all members" member id.

	Add commands for MSI, feature discovery.

	Add commands for transport vq.


My intent is to try and support both SR-IOV and SIOV
usecases with the same structure and maybe even the same
VQ.

For example, it might make sense to split creating/destroying
SIOV devices from the transport passing data from the guest - the
driver would then not negotiate VIRTIO_F_SR_IOV (which
then means auto-provisioning).

More ideas for use-cases:
virtio VF features query and configuration space provisioning
virtio VF resource (queues, msix vectors count) provisioning


Future directions (shouldn't block this patch)
- aborting commands - left for later. or is vq reset enough?
- should we rename structures from admin to group admin?


Michael S. Tsirkin (10):
  virtio: document forward compatibility guarantees
  admin: introduce device group and related concepts
  admin: introduce group administration commands
  admin: introduce virtio admin virtqueues
  pci: add admin vq registers to virtio over pci
  mmio: document ADMIN_VQ as reserved
  ccw: document ADMIN_VQ as reserved
  admin: command list discovery
  admin: conformance clauses
  ccw: document more reserved features

 admin.tex        | 587 +++++++++++++++++++++++++++++++++++++++++++++++
 content.tex      | 121 +++++++++-
 introduction.tex |   3 +
 3 files changed, 709 insertions(+), 2 deletions(-)
 create mode 100644 admin.tex

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

