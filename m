Return-Path: <virtio-comment-return-6741-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D123CEB64DD
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Jul 2023 11:54:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0FD9F2B139
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Jul 2023 11:54:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0390B98680E
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Jul 2023 11:54:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id ECEE4986727; Thu,  6 Jul 2023 11:54:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D9F4B98672A
	for <virtio-comment@lists.oasis-open.org>; Thu,  6 Jul 2023 11:54:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: tOviUnxrPu-p73kFbhMyDg-1
Date: Thu, 6 Jul 2023 13:54:23 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>, 
	Robert Beckett <bob.beckett@collabora.com>, virtio-comment@lists.oasis-open.org, 
	virtio-dev@lists.oasis-open.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Alex Deucher <Alexander.Deucher@amd.com>, 
	Christian Koenig <Christian.Koenig@amd.com>, Stewart Hildebrand <Stewart.Hildebrand@amd.com>, 
	Xenia Ragiadakou <burzalodowa@gmail.com>, Honglei Huang <Honglei1.Huang@amd.com>, 
	Julia Zhang <Julia.Zhang@amd.com>, Huang Rui <Ray.Huang@amd.com>
Message-ID: <haz6sjtqvuzmyorb2v4pzgfkau3xudzkttosmpheov5slqox37@wdtafkzirhvi>
References: <20230630092138.855107-1-Jiqian.Chen@amd.com>
 <20230630092138.855107-2-Jiqian.Chen@amd.com>
MIME-Version: 1.0
In-Reply-To: <20230630092138.855107-2-Jiqian.Chen@amd.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [VIRTIO GPU PATCH 1/1] virtio-gpu: Add new feature flag
 VIRTIO_GPU_F_FREEZING

  Hi,

> +\item[VIRTIO_GPU_CMD_STATUS_FREEZING]
> +Notify freezing status through controlq.
> +Request data is \field{struct virtio_gpu_status_freezing}.
> +Response type is VIRTIO_GPU_RESP_OK_NODATA.
> +
> +Guest notifies QEMU if virtio-gpu is in freezing status or not in \field{freezing}.
> +zero means it is not in freezing status, none-zero is the opposite.
> +When guest is in freezing status, QEMU will not destroy resources.

This should be more clear which resources are meant here.  Just
resources created by VIRTIO_GPU_CMD_RESOURCE_CREATE_* commands?
Or all objects (including cursors, scanouts, 3D contexts, ...)?
Or some other set?

I've seen on the (code) patch discussion the topic of different
suspend modes (s3/s4) came up.
What was the conclusion there?
Should a note about this be added to the spec too?

take care,
  Gerd


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

