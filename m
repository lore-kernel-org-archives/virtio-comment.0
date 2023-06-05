Return-Path: <virtio-comment-return-6142-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E76C7EE23
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 17:09:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 342AF120D51
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 17:09:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2CB319864C1
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 17:09:41 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 23E94986461; Mon,  5 Jun 2023 17:09:41 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 13040986479
	for <virtio-comment@lists.oasis-open.org>; Mon,  5 Jun 2023 17:09:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 077TK2oyNFuZNPLAAArkWg-1
From: Cornelia Huck <cohuck@redhat.com>
To: virtio@lists.oasis-open.org
Cc: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org
Organization: Red Hat GmbH
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 05 Jun 2023 19:09:31 +0200
Message-ID: <87edmp4z04.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: [virtio-comment] [virtio 1.3] Reminder: Feature freeze coming up on July 1st

As outlined in
https://lists.oasis-open.org/archives/virtio/202304/msg00036.html ff.,
we'll soon start the process of getting version 1.3 of the virtio spec
released. As a first step, we'll enter feature freeze on July 1st. This
means:

***
By July 1st, all not yet integrated features that are targeting 1.3 need
to have at least a github issue open that is pointing to a patch (set)
on the list.
***

This should hopefully give us enough time to conclude voting for those
features before we enter change freeze on August 1st.

virtio 1.3 timeline:

Development                                         <-- we are here

July 1st: feature freeze (github issue
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

