Return-Path: <virtio-comment-return-5896-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF06C7EE22
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 09:43:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 87829190907
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 09:43:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 786859864BD
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 09:43:00 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6998198636A; Mon, 15 May 2023 09:43:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 575E0986396
	for <virtio-comment@lists.oasis-open.org>; Mon, 15 May 2023 09:43:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: qzsR5QxHMq6_h1nWQzCGmA-1
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, mst@redhat.com,
 virtio-dev@lists.oasis-open.org
Cc: sgarzare@redhat.com, pasic@linux.ibm.com, david.edmondson@oracle.com,
 virtio-comment@lists.oasis-open.org, shahafs@nvidia.com, Parav Pandit
 <parav@nvidia.com>
In-Reply-To: <20230505014614.571520-4-parav@nvidia.com>
Organization: Red Hat GmbH
References: <20230505014614.571520-1-parav@nvidia.com>
 <20230505014614.571520-4-parav@nvidia.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 15 May 2023 11:42:56 +0200
Message-ID: <87cz322an3.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: [virtio-comment] Re: [PATCH v17 03/11] content: Rename confusing queue_notify_data
 and vqn names

On Fri, May 05 2023, Parav Pandit <parav@nvidia.com> wrote:

> diff --git a/content.tex b/content.tex
> index 9cf938c..327926f 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -405,8 +405,12 @@ \section{Driver Notifications} \label{sec:Basic Facilities of a Virtio Device /
>  notification to the device.
>  
>  When VIRTIO_F_NOTIFICATION_DATA has not been negotiated,
> -this notification involves sending the
> -virtqueue index to the device (method depending on the transport).
> +this notification contains either a virtqueue index if
> +VIRTIO_F_NOTIF_CONFIG_DATA is not negotiated or device supplied virtqueue
> +notification config data if VIRTIO_F_NOTIF_CONFIG_DATA is negotiated.
> +
> +The notification method and suppling any such virtqueue notification config data
> +is transport specific.

Typo: s/suppling/supplying/ (trivial to fix on top)


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

