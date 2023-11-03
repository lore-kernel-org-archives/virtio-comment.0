Return-Path: <virtio-comment-return-8154-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E84C4167D
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 13:33:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CF7986E6CA
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 13:33:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C0F04986C55
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 13:33:26 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B34DB986C3A; Fri,  3 Nov 2023 13:33:26 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 900F3986C3B
	for <virtio-comment@lists.oasis-open.org>; Fri,  3 Nov 2023 13:33:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Zt_qPnCGOUOdgnncxIirbA-1
From: Cornelia Huck <cohuck@redhat.com>
To: virtio@lists.oasis-open.org
Cc: virtio-comment@lists.oasis-open.org,
	Cornelia Huck <cohuck@redhat.com>
Date: Fri,  3 Nov 2023 14:32:59 +0100
Message-ID: <20231103133304.681157-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH 0/3] some editorial patches for 1.3-csd01

Incorporate some feedback, and work around a possible bug in latexdiff --
should hopefully be ready now for public review, keeping fingers crossed...

Cornelia Huck (3):
  editorial: various fixes for 1.3-csd01
  editorial: update "Computer Language Definitions" URL
  makediff: update list of cherry-picks

 REVISION         |  2 +-
 REVISION-DATE    |  2 +-
 changelog.tex    |  2 +-
 introduction.tex | 11 +++++++++--
 makediff.sh      |  3 +--
 title.tex        | 15 ++++++---------
 6 files changed, 19 insertions(+), 16 deletions(-)

-- 
2.41.0


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

