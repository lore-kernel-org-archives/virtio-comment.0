Return-Path: <virtio-comment-return-5806-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A29BC7EE22
	for <virtio-comment@archiver.kernel.org>; Fri,  5 May 2023 15:40:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A9EB12AC4B
	for <virtio-comment@archiver.kernel.org>; Fri,  5 May 2023 15:40:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0F2DF9867ED
	for <virtio-comment@archiver.kernel.org>; Fri,  5 May 2023 15:40:42 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9FD1A986736; Fri,  5 May 2023 15:40:41 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7BA359866F3
	for <virtio-comment@lists.oasis-open.org>; Fri,  5 May 2023 15:40:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: XXzu5DVBNTqetcjnVDDoAA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683301238; x=1685893238;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a6kXRx+rMzKLbi/W+d6MqlGV2ngGp19lRa67un33KZY=;
        b=IgSadubUiHWfeZdtP0YjHsBLj8tp/xxkDBGTBM296Ge0bkPdJCFLWg0LiLStKfG3Q+
         3RdxxidTb00m4Q8YkEbNUyiWboefQ3FZq7ncHZccq+6XTkF0xio5f5gBJ2WqI43x1n79
         Vwt+sGdXpIg0tZnpLmRYYm7CKTkuMu3ziwXG5zJCsefcr8SC7oWIgUytuuIby+XYXDl+
         yZ+1zbhfCJgrkiHcDsxQGkN5ReZo8D2LkAiN+iaLop26WPnSYuuKGOr268v27zaAs54q
         fC6qTHaR+ip3rMiJxGN5vwg47a1EqSDp8C07bBJKZLSehJLGLIA70CWp47AqOMLaejrh
         sGGw==
X-Gm-Message-State: AC+VfDw5BruGTOb9JYzsmSIddng25gLDz9eBXhLyJVcS7EBw5jr+2TTt
	Lg9Rx/hUy/xcMjWxUL5KGi/tm8ViEx219CXhxMWbpJBRJYN4COMrj9zmLRG2iZTpP18zrqQAnn1
	o2AAN9DZrEJrUcM1ecJVo1JXdVniURve8l5pnARO0VPOL+ZuAk+kCnj8+/DaaqdpEeWEKUEGyAo
	OQ06zEWaUL8lw=
X-Received: by 2002:adf:e511:0:b0:304:6715:8728 with SMTP id j17-20020adfe511000000b0030467158728mr1981338wrm.18.1683301237842;
        Fri, 05 May 2023 08:40:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Wb3pOUtoGplcUHW24yYh9cul6MsIIVkBTKJ1aLzBoIsWEFvwerqbg9QphOVTay3maiMoyzA==
X-Received: by 2002:adf:e511:0:b0:304:6715:8728 with SMTP id j17-20020adfe511000000b0030467158728mr1981302wrm.18.1683301237393;
        Fri, 05 May 2023 08:40:37 -0700 (PDT)
Date: Fri, 5 May 2023 11:40:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	jasowang@redhat.com, mst@redhat.com, cohuck@redhat.com,
	sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com,
	Piotr.Uminski@intel.com, hang.yuan@intel.com
Cc: virtio@lists.oasis-open.org, Jiri Pirko <jiri@nvidia.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>, pasic@linux.ibm.com,
	Shahaf Shuler <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <cover.1683301091.git.mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] [PATCH v13 00/10] Introduce device group and device management




Change log:

since 13:
	command specific data is u8 again
	exclude admin queues in blk's num_queues
	minor other tweaks

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

 admin.tex                        | 584 +++++++++++++++++++++++++++++++
 content.tex                      |  62 +++-
 device-types/blk/description.tex |   2 +-
 introduction.tex                 |   3 +
 transport-ccw.tex                |  14 +
 transport-mmio.tex               |  12 +
 transport-pci.tex                |  33 ++
 7 files changed, 707 insertions(+), 3 deletions(-)
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

