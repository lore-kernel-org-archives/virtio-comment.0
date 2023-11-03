Return-Path: <virtio-comment-return-8151-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3B4C4332F
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 13:33:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 810DD26A4D
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 13:33:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6D930986C48
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 13:33:13 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 61D11986C39; Fri,  3 Nov 2023 13:33:13 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 418B2986C3A
	for <virtio-comment@lists.oasis-open.org>; Fri,  3 Nov 2023 13:33:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: _wHm4QgGN-6-Dnvl8YQCkw-1
From: Cornelia Huck <cohuck@redhat.com>
To: virtio@lists.oasis-open.org
Cc: virtio-comment@lists.oasis-open.org,
	Cornelia Huck <cohuck@redhat.com>
Date: Fri,  3 Nov 2023 14:33:02 +0100
Message-ID: <20231103133304.681157-4-cohuck@redhat.com>
In-Reply-To: <20231103133304.681157-1-cohuck@redhat.com>
References: <20231103133304.681157-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH 3/3] makediff: update list of cherry-picks

We don't need to apply the old commits anymore, but we have to apply
the URL update to work around a not-yet-debugged latexdiff problem.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 makediff.sh | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/makediff.sh b/makediff.sh
index f65a2b43676a..897eeaded83e 100755
--- a/makediff.sh
+++ b/makediff.sh
@@ -20,8 +20,7 @@ while read -r rev; do
 	echo "Applying $rev"
 	git cherry-pick --keep-redundant-commits --allow-empty `git rev-list -1 -F --grep "$rev" $newrev` || exit 1
 done << 'EOF'
-headerfile: rename virtio_ring to virtio queue
-edit: drop obsolete commands related to cs02
+editorial: update "Computer Language Definitions" URL
 EOF
 
 #mv specvars.tex specvars-orig.tex
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

