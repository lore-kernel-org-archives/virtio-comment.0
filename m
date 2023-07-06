Return-Path: <virtio-comment-return-6744-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4759FEB64D9
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Jul 2023 16:12:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B167488E09
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Jul 2023 16:12:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A7594986811
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Jul 2023 16:12:31 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9D113986728; Thu,  6 Jul 2023 16:12:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 82DFC986729
	for <virtio-comment@lists.oasis-open.org>; Thu,  6 Jul 2023 16:12:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: nAHzpUjONRm5zFsViXvJVw-1
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, virtio-comment@lists.oasis-open.org,
 mst@redhat.com, david.edmondson@oracle.com
Cc: virtio-dev@lists.oasis-open.org, sburla@marvell.com,
 jasowang@redhat.com, yishaih@nvidia.com, maorg@nvidia.com,
 shahafs@nvidia.com, Parav Pandit <parav@nvidia.com>
In-Reply-To: <20230706041714.65600-4-parav@nvidia.com>
Organization: Red Hat GmbH
References: <20230706041714.65600-1-parav@nvidia.com>
 <20230706041714.65600-4-parav@nvidia.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Thu, 06 Jul 2023 18:12:00 +0200
Message-ID: <87ttuhuii7.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: [virtio-comment] Re: [PATCH v10 3/4] admin: Add group member legacy register access
 commands

On Thu, Jul 06 2023, Parav Pandit <parav@nvidia.com> wrote:

> diff --git a/admin-cmds-legacy-interface.tex b/admin-cmds-legacy-interface.tex
> new file mode 100644
> index 0000000..dd01c0a
> --- /dev/null
> +++ b/admin-cmds-legacy-interface.tex
> @@ -0,0 +1,261 @@
> +\subsubsection{Legacy Interfaces}\label{sec:Basic Facilities of a Virtio Device / Device groups / Group
> +administration commands / Legacy Interface}
> +
> +In some systems, there is a need to support utilizing the legacy driver with
> +the device that do not directly support the legacy interface. In such scenarios,

Please use either Michael's or my suggestion from v9 here, using
definite articles here isn't a good idea.

> +a group owner device can provide the legacy interface functionality for the
> +group member devices. The driver of an owner device can then access the legacy
> +interface of a member device on behalf of the legacy member device driver.


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

